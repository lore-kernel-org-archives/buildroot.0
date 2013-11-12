From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 23:20:16 +0100
Subject: [Buildroot] [PATCH] tstools: fix build (link) error
In-Reply-To: <1384208964-29099-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Mon, 11 Nov 2013 14:29:24 -0800")
References: <20131109191543.414f5694@skate>
 <1384208964-29099-1-git-send-email-tjlee@ambarella.com>
Message-ID: <8738n145zz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tzu-Jung" == Tzu-Jung Lee <roylee17@gmail.com> writes:

> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
> ---
>  ...x-a-build-error-linking-of-shared-library.patch | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch

> diff --git a/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch b/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch
> new file mode 100644
> index 0000000..e87413f
> --- /dev/null
> +++ b/package/tstools/tstools-003-build-fix-a-build-error-linking-of-shared-library.patch
> @@ -0,0 +1,23 @@
> +From 1f83d1aa7f3abc75faeb31f169f1162e11168e16 Mon Sep 17 00:00:00 2001
> +From: Tzu-Jung Lee <tjlee@ambarella.com>
> +Date: Mon, 11 Nov 2013 14:16:11 -0800
> +Subject: [PATCH] build: fix a build error (linking of shared library)

It would be good to explain in more detail (and/or add a link to an
autobuild failure).

For this kind of issue we normally just pass LD="$(TARGET_CC)" to make
instead of patching the Makefile, so I've committed a fix doing that,
thanks.

-- 
Bye, Peter Korsgaard
