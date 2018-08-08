From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 8 Aug 2018 15:24:40 -0500
Subject: [Buildroot] [PATCH] package/strongswan: add pid dir support for
 netns
In-Reply-To: <1533649282-62006-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1533649282-62006-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbnon2TCQc0o86__p4Yn=kzVeS3HxXd4G250rG6XLdNRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Tue, Aug 7, 2018 at 8:41 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
>
> This patch adds BR2_PACKAGE_STRONGSWAN_PID_DIR support to build
> strongswan with --with-piddir option.
>
> By default 'charon' and starter daemons create their PID files
> and UNIX sockets in '/var/run' directory and that would
> conflict if multiple instances would use it.
> (ie a network-namespaced or multi-vpn configuration)
>
> This patch provides an option to use custom pid directory to
> avoid issue with multiple instances.
>
> For more information, Please visit
> https://wiki.strongswan.org/projects/strongswan/wiki/Netns
>

Rejecting this patch because the problem was better solved with a full
container instead (ie filesystem binds to create unique tmp space).

Matt
