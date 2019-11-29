From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Fri, 29 Nov 2019 20:56:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/openvmtools: vmware disk
 timeout udev rules fix
In-Reply-To: <20191129142256.6104-1-p.debruijn@unilogic.nl>
References: <20191129142256.6104-1-p.debruijn@unilogic.nl>
Message-ID: <CAFvCimU0hxmNWq976GHXc-n-yh7ugqmqmWtfTnF=sfLqcrjnjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Le ven. 29 nov. 2019 ? 15:23, Pascal de Bruijn <p.debruijn@unilogic.nl> a
?crit :

> Fixes: Invalid value "/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'"
> for RUN (char 27: invalid substitution type), ignoring, but please fix
>
> Source: https://github.com/vmware/open-vm-tools/pull/376
>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  .../0010-Change-DEVPATH-to-devpath.patch           | 25
> ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644
> package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
>
> diff --git a/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
> b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
> new file mode 100644
> index 0000000..5af694d
> --- /dev/null
> +++ b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
> @@ -0,0 +1,25 @@
> +From 22f5d198b3b2f7e4debed83948ba1baf70d4749a Mon Sep 17 00:00:00 2001
> +From: puneetse <22071208+puneetse@users.noreply.github.com>
> +Date: Wed, 16 Oct 2019 10:04:41 -0700
> +Subject: [PATCH] Change $DEVPATH to $devpath
> +
> +$DEVPATH throws a warning by udev.
> +
> +Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> +---
> + udev/99-vmware-scsi-udev.rules | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/udev/99-vmware-scsi-udev.rules
> b/udev/99-vmware-scsi-udev.rules
> +index 053b59706..a605d80ef 100644
> +--- a/udev/99-vmware-scsi-udev.rules
> ++++ b/udev/99-vmware-scsi-udev.rules
> +@@ -2,6 +2,6 @@
> + #
> + # This file is part of open-vm-tools
> +
> +-ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*",
> ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo
> 180 >/sys$DEVPATH/device/timeout'"
> +-ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*",
> ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c
> 'echo 180 >/sys$DEVPATH/device/timeout'"
> ++ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*",
> ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo
> 180 >/sys/$devpath/device/timeout'"
> ++ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*",
> ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c
> 'echo 180 >/sys/$devpath/device/timeout'"
> +
> --
> 2.7.4
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191129/72c67a66/attachment-0001.html>
