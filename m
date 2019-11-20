From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 21:16:36 +0100
Subject: [Buildroot] [next] package/rpcbind: add systemd dependency when
 cfg for systemd
In-Reply-To: <CANQCQpYebv2PrZOtt9RjKuzvvXJ_Vf8T_xfx2ZwEuzweDPmsZA@mail.gmail.com>
References: <20191120150015.54771-1-matthew.weber@rockwellcollins.com>
 <20191120175923.1fe3f67a@windsurf.home>
 <CANQCQpYebv2PrZOtt9RjKuzvvXJ_Vf8T_xfx2ZwEuzweDPmsZA@mail.gmail.com>
Message-ID: <20191120211636.606fa121@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 11:13:11 -0600
Matthew Weber <matthew.weber@collins.com> wrote:

> > The commit log is too short. Does it fix a build issue? Why does it
> > need to have systemd built before? Is it using a library provided by
> > systemd?  
> 
> When building using top level parallel build and the init system is
> set to systemd, it is possible for the rpcbind package to build before
> systemd.  This is an issue as rpcbind sets a library dependency
> conditionally on systemd when "RPCBIND_CONF_OPTS +=
> --with-systemdsystemunitdir=/usr/lib/systemd/system" is set.

So, this is really a bug, and should be fixed in master, and not in
next. Do you agree?

Without top-level parallel build, you should be able to reproduce the
same bug by running "make rpcbind" from a completely clean tree. Is it
the case ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
