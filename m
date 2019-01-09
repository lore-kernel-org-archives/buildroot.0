From: David J. Fogle <Dave@exitstrategytech.com>
Date: Wed, 9 Jan 2019 04:31:08 +0000
Subject: [Buildroot] [PATCH] package/rauc: version bump to 1.0
In-Reply-To: <87ftu3iww7.fsf@tarshish>
References: <2dcda5ba55a548c5a61cb30db7686ba9@exitstrategytech.com>,
 <87ftu3iww7.fsf@tarshish>
Message-ID: <mvnv27relwhu7j5nfbwdvsvn.1547008377136@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am not sure, tbh. I have a working rauc 1.0 system I can test on though, if need be.


Sent from Samsung Focus


-------- Original message --------
From: Baruch Siach <baruch@tkos.co.il>
Date: 1/7/19 10:39 PM (GMT-06:00)
To: "David J. Fogle" <Dave@exitstrategytech.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] package/rauc: version bump to 1.0

Hi David,

David J. Fogle writes:

> For details see [1]
>
> This bump also deleted the two patch files for the RAUC package. These
> were related to eMMC support being made optional, and workaround for
> olde kernel. Both of these patch sets have been merged into upsteam in
> the rauc git repos.
>
> Older kernel workaound:
> https://github.com/rauc/rauc/commit/993b698c48789baea51f8b7c47b1e057ba328033#diff-b3a0044e6a3b6a8b16933e72f416c8f1
>
> Make eMMC selectable:
> https://github.com/rauc/rauc/commit/f85d1cab07376c7680ef4d9e45a6baf345e24e37#diff-365367c8cde56aafd5cbad767e1c9738
>
> [1] https://github.com/rauc/rauc/releases/tag/v1.0
>
> Signed-off-by: David J Fogle dave at exitstrategytech.com

[...]

> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 36119c061d..6ca39e820e 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,12 +4,11 @@
>  #
>  ################################################################################
>
> -RAUC_VERSION = 0.4
> +RAUC_VERSION = 1.0
>  RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>  RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>  RAUC_LICENSE = LGPL-2.1
>  RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
> -# 0002-build-make-eMMC-boot-partition-support-optional.patch
>  RAUC_AUTORECONF = YES

Is autoreconf still necessary?

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190109/897044bf/attachment.html>
