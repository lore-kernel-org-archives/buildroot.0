From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Nov 2019 11:13:11 -0600
Subject: [Buildroot] [next] package/rpcbind: add systemd dependency when
 cfg for systemd
In-Reply-To: <20191120175923.1fe3f67a@windsurf.home>
References: <20191120150015.54771-1-matthew.weber@rockwellcollins.com>
 <20191120175923.1fe3f67a@windsurf.home>
Message-ID: <CANQCQpYebv2PrZOtt9RjKuzvvXJ_Vf8T_xfx2ZwEuzweDPmsZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Wed, Nov 20, 2019 at 10:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 20 Nov 2019 09:00:15 -0600
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> The commit log is too short. Does it fix a build issue? Why does it
> need to have systemd built before? Is it using a library provided by
> systemd?

When building using top level parallel build and the init system is
set to systemd, it is possible for the rpcbind package to build before
systemd.  This is an issue as rpcbind sets a library dependency
conditionally on systemd when "RPCBIND_CONF_OPTS +=
--with-systemdsystemunitdir=/usr/lib/systemd/system" is set.

Matt
