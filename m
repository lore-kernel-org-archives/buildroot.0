From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:36:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <20210426101021.2418145-2-romain.naour@gmail.com>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
Message-ID: <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/04/2021 12:10, Romain Naour wrote:
[snip]
>  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)

 Now you're messing with these packages, maybe you can take the opportunity to
get rid of the versioned subdirectory. That's a leftover from when we had
version selection for glibc.

[snip]

> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index f84f670fc0..e94df73bfe 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
>  # Until 2.33 is released, just use master
>  GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99

 Since 2.33 is released now, can we use master for riscv32 please?

 Marked as Changes Requested.


 Regards,
 Arnout


>  else
> -GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
> +GLIBC_VERSION = 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
