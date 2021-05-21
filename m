From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:34:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mutt: security bump to version
 2.0.7
In-Reply-To: <20210521185729.295695-1-fontaine.fabrice@gmail.com>
References: <20210521185729.295695-1-fontaine.fabrice@gmail.com>
Message-ID: <20210521203419.GS3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-21 20:57 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2021-32055: Mutt 1.11.0 through 2.0.x before 2.0.7 (and NeoMutt
> 2019-10-25 through 2021-05-04) has a $imap_qresync issue in which
> imap/util.c has an out-of-bounds read in situations where an IMAP
> sequence set ends with a comma. NOTE: the $imap_qresync setting for
> QRESYNC is not enabled by default.
> 
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-0-7-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index 8fccbd3709..6e1ca32851 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  81e31c45895fd624747f19106aa2697d2aa135049ff2e9e9db0a6ed876bcb598  mutt-2.0.6.tar.gz
> +sha256  957688c6a521561992d4f2f27cf9feb239c7c6c0042c6061c0e474a7dd26cc91  mutt-2.0.7.tar.gz
>  sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 004a88d0b3..d7fcc01ad2 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUTT_VERSION = 2.0.6
> +MUTT_VERSION = 2.0.7
>  MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
>  MUTT_LICENSE = GPL-2.0+
>  MUTT_LICENSE_FILES = GPL
> -- 
> 2.30.2
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
