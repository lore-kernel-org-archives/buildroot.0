From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 29 Jan 2014 21:45:55 +0100
Subject: [Buildroot] [PATCH] Config: default BR2_PACKAGE_OVERRIDE_FILE
	to $(CONFIG_DIR)/local.mk
In-Reply-To: <1391020967-19043-1-git-send-email-yann.morin.1998@free.fr>
References: <1391020967-19043-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUBuatdDGREG1xKXE0XVdjJ067tNfXC+=_-O9g2fTD5OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 29-jan.-2014 19:43 schreef "Yann E. MORIN" <yann.morin.1998@free.fr>:
>
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
>     $(TOPDIR)/local.mk
>
> This works well for in-tree builds, but is not very useful for
> out-of-tree builds, when the Buildroot source tree may be shared for
> different concurrent builds.
>
> Also, it seems to be more sensible to have local.mk alognside
> the .config file.
>
> Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
>     $(CONFIG_DIR)/local.mk

... which in the default case equals TOPDIR, right? (Would be nice to
clarify in the commit message)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140129/80ac9d1a/attachment.html>
