From: Martin Hicks <mort@bork.org>
Date: Mon, 7 Feb 2011 09:17:15 -0500
Subject: [Buildroot] [PATCH] V2: Add cryptsetup package
In-Reply-To: <1297087782-25029-1-git-send-email-mort@bork.org>
References: <20110201220306.5f8ea962@surf>
	<1297087782-25029-1-git-send-email-mort@bork.org>
Message-ID: <AANLkTin379wp0-sJxRwpM_-i1ce6YHVUN2yGVewXY2Jh@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignore this.  I forgot the change for package/Config.in

On Mon, Feb 7, 2011 at 9:09 AM, Martin Hicks <mort@bork.org> wrote:
> This adds the cryptsetup package to buildroot. ?Includes e2fsprogs
> dependency in Config.in
>
> Signed-off-by: Martin Hicks <mort@bork.org>
> ---
> ?package/cryptsetup/Config.in ? ? | ? 11 +++++++++++
> ?package/cryptsetup/cryptsetup.mk | ? ?9 +++++++++
> ?2 files changed, 20 insertions(+), 0 deletions(-)
> ?create mode 100644 package/cryptsetup/Config.in
> ?create mode 100644 package/cryptsetup/cryptsetup.mk
>
> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> new file mode 100644
> index 0000000..9cd9ba4
> --- /dev/null
> +++ b/package/cryptsetup/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_CRYPTSETUP
> + ? ? ? bool "cryptsetup"
> + ? ? ? select BR2_PACKAGE_LIBGCRYPT
> + ? ? ? select BR2_PACKAGE_POPT
> + ? ? ? select BR2_PACKAGE_LVM2
> + ? ? ? select BR2_PACKAGE_E2FSPROGS
> + ? ? ? help
> + ? ? ? ? This tool helps manipulate dm-crypt and luks partitions for on-disk
> + ? ? ? ? encryption.
> +
> + ? ? ? ? http://www.saout.de/misc/dm-crypt/
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> new file mode 100644
> index 0000000..8390710
> --- /dev/null
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -0,0 +1,9 @@
> +#
> +# cryptsetup
> +#
> +CRYPTSETUP_VERSION = 1.2.0
> +CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
> +CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
> +CRYPTSETUP_DEPENDENCIES = lvm2 libgcrypt popt e2fsprogs
> +
> +$(eval $(call AUTOTARGETS,package,cryptsetup))
> --
> 1.5.6.5
>
>



-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
