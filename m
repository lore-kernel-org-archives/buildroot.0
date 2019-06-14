From: Fragkiskos Sigalas <frasigal@gmail.com>
Date: Fri, 14 Jun 2019 10:22:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add disable
 pivot_root option
In-Reply-To: <87imt8hcb1.fsf@dell.be.48ers.dk>
References: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
 <14308_1560493044_5D033BF4_14308_222_1_20190614061722.GA2485@r-lnx-nyma7486-2>
 <87imt8hcb1.fsf@dell.be.48ers.dk>
Message-ID: <CAL+Nh7PxfvhP5ynR=bnJMT9WX5c548zo3vkae8rTOFoXdHySLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Your suggestion would work indeed, thank you! Therefore I agree that this
patch is not needed.

Regards,
Frank

On Fri, Jun 14, 2019 at 10:10 AM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>>   <yann.morin@orange.com> writes:
>
>  > Frank, All,
>  > On 2019-06-13 23:47 +0300, Frank Sigalas spake thusly:
>  >> Sets the environment variable DOCKER_RAMDISK before starting dockerd.
>
>  > [--SNIP--]
>  >> diff --git a/package/docker-engine/S60dockerd-ramdisk
> b/package/docker-engine/S60dockerd-ramdisk
>  >> new file mode 100644
>  >> index 0000000..a1092b6
>  >> --- /dev/null
>  >> +++ b/package/docker-engine/S60dockerd-ramdisk
>  >> @@ -0,0 +1,38 @@
>  >> +#!/bin/sh
>  >> +
>  >> +NAME=dockerd
>  >> +DAEMON=/usr/bin/$NAME
>  >> +PIDFILE=/var/run/$NAME.pid
>  >> +DAEMON_ARGS=""
>  >> +
>  >> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1
>
>  > The existing package/docker-engine/S60dockerd script also parses
>  > similarly named file, so why can't you provide (e.g. in an overlay) this
>  > configuraiton file taht would just contain:
>
>  >     export DOCKER_RAMDISK=1
>
>  > The config files in /etc/default/ are the place where such local
>  > customisations mustr be done.
>
>  > Besides, your solution does not cover the systemd case anyway (for which
>  > Christian alrady provided an example). But that is not even needed
>  > either, because this is still a local customisation.
>
> Yes, I wonder if running dockerd from an initramfs is really such a
> common setup that we want a dedicated option for it rather than just
> letting people add such customization in their overlay?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190614/3c2ee1ef/attachment.html>
