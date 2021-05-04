From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 22:37:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.94.2
In-Reply-To: <20210504202159.740520-1-bernd.kuhls@t-online.de>
References: <20210504202159.740520-1-bernd.kuhls@t-online.de>
Message-ID: <20210504203724.GT2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-04 22:21 +0200, Bernd Kuhls spake thusly:
> Release announcement:
> https://lists.exim.org/lurker/message/20210421.123632.08bb711a.en.html
> 
> According to
> http://www.exim.org/static/doc/security/CVE-2020-qualys/21nails.txt
> this version bump fixes
> 
> Local vulnerabilities
> - CVE-2020-28007: Link attack in Exim's log directory
> - CVE-2020-28008: Assorted attacks in Exim's spool directory
> - CVE-2020-28014: Arbitrary file creation and clobbering
> - CVE-2021-27216: Arbitrary file deletion
> - CVE-2020-28011: Heap buffer overflow in queue_run()
> - CVE-2020-28010: Heap out-of-bounds write in main()
> - CVE-2020-28013: Heap buffer overflow in parse_fix_phrase()
> - CVE-2020-28016: Heap out-of-bounds write in parse_fix_phrase()
> - CVE-2020-28015: New-line injection into spool header file (local)
> - CVE-2020-28012: Missing close-on-exec flag for privileged pipe
> - CVE-2020-28009: Integer overflow in get_stdinput()
> 
> Remote vulnerabilities
> - CVE-2020-28017: Integer overflow in receive_add_recipient()
> - CVE-2020-28020: Integer overflow in receive_msg()
> - CVE-2020-28023: Out-of-bounds read in smtp_setup_msg()
> - CVE-2020-28021: New-line injection into spool header file (remote)
> - CVE-2020-28022: Heap out-of-bounds read and write in extract_option()
> - CVE-2020-28026: Line truncation and injection in spool_read_header()
> - CVE-2020-28019: Failure to reset function pointer after BDAT error
> - CVE-2020-28024: Heap buffer underflow in smtp_ungetc()
> - CVE-2020-28018: Use-after-free in tls-openssl.c
> - CVE-2020-28025: Heap out-of-bounds read in pdkim_finish_bodyhash()
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index 265a95c6f5..201f09ebd6 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  f77ee8faf04f5db793243c3ae81c1f4e452cd6ad7dd515a80edf755c4b144bdb  exim-4.94.tar.xz
> +sha256  051861fc89f06205162f12129fb7ebfe473383bb6194bf8642952bfd50329274  exim-4.94.2.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  3bf95ade30902327403e7308089a3e423761da5b0745397dace7c7fd15ba3838d93e0ee418f1fed57606f79e57b793c7c7407e5c0d526146f0036126d5d95316  exim-4.94.tar.xz
> +sha512  5334c236221ed4e03dbc33e6a79d939b06037fa2f4b71971607a360b67af5c85a89681ee13a5eeaf0184382c55a160cf2e89ed7afb2949f025a54f1e88f9e3fc  exim-4.94.2.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 53185c4bb8..dd39208469 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.94
> +EXIM_VERSION = 4.94.2
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
