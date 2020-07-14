From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Jul 2020 14:53:29 -0500
Subject: [Buildroot] [git commit] package/gnutls: security bump to 3.6.14
In-Reply-To: <20200621213110.6D70F815D3@busybox.osuosl.org>
References: <20200621213110.6D70F815D3@busybox.osuosl.org>
Message-ID: <CANQCQpY3YGDz_-0uQYx0CFtE=ytbGa6VNqGnr6E9eWu=tW9VQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one would also be a good candidate for 2020.02.x

On Sun, Jun 21, 2020 at 4:34 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=16ea3ee784c5203b33c086f84474b1dba6a3e54a
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fixes the following security issue:
>
>  * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
>    regression in the TLS protocol implementation. This caused the TLS
>    server to not securely construct a session ticket encryption key
>    considering the application supplied secret, allowing a MitM
>    attacker to bypass authentication in TLS 1.3 and recover previous
>    conversations in TLS 1.2
>
> Release announcement:
>  https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html
>
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> [yann.morin.1998 at free.fr: two spaces in hash file]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/gnutls/gnutls.hash | 8 ++++----
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index 99279bfb6b..6a4203f3a2 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz.sig
> -sha256
> <https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz.sig-sha256>
> 32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38
> gnutls-3.6.13.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz.sig
> +sha256
> <https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz.sig+sha256>
> 5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63
> gnutls-3.6.14.tar.xz
>  # Locally calculated
> -sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
>       doc/COPYING
> -sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3
>       doc/COPYING.LESSER
> +sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
> doc/COPYING
> +sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3
> doc/COPYING.LESSER
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index a1dfce62a2..34878e97b4 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -5,7 +5,7 @@
>
>  ################################################################################
>
>  GNUTLS_VERSION_MAJOR = 3.6
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE =
> https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 

*Matthew Weber | Associate Director Software Engineer | Commercial Avionics*

*COLLINS AEROSPACE*

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

*Tel:* +1 319 295 7349 | *FAX:* +1 319 263 6099

*matthew.weber at collins.com <matthew.weber@collins.com>* | *collinsaerospace.com
<http://collinsaerospace.com>*



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated companies.
If you are not the intended recipient, please 1) Do not disclose, copy,
distribute or use this message or its contents. 2) Advise the sender by
return email. 3) Delete all copies (including all attachments) from your
computer. Your cooperation is greatly appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.


ALPHA BRAVO COLLINS | Aerospace Redefined

         __ l __

 \- - - -o-(_)-o- - - -/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200714/f077b643/attachment.html>
