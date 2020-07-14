From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Jul 2020 14:42:16 -0500
Subject: [Buildroot] [2020.02.x] package/pcre: security bump to 8.44
In-Reply-To: <20200714194008.63423-1-matthew.weber@rockwellcollins.com>
References: <20200714194008.63423-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbN4eVZYS0Nxjr9eXd+ES+467binOnF6SR-T_OLaWe1Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Ignore this patch. It looks like master already
has a92e06c352a838a4ee72069aeee7ba5ffea6c32b which can be picked over to
2020.02.x.

On Tue, Jul 14, 2020 at 2:40 PM Matt Weber <
matthew.weber@rockwellcollins.com> wrote:

>  * 0001-Kill-compatibility-bits.patch had a bugfix for the lcc
>    compiler (
> https://vcs.pcre.org/pcre/code/trunk/pcrecpp.cc?r1=1735&r2=1752&pathrev=1763
> )
>  * License file updated copyright date
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/pcre/0001-Kill-compatibility-bits.patch | 5 +++--
>  package/pcre/pcre.hash                          | 6 +++---
>  package/pcre/pcre.mk                            | 2 +-
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/package/pcre/0001-Kill-compatibility-bits.patch
> b/package/pcre/0001-Kill-compatibility-bits.patch
> index 3563e4b714..00eff692c4 100644
> --- a/package/pcre/0001-Kill-compatibility-bits.patch
> +++ b/package/pcre/0001-Kill-compatibility-bits.patch
> @@ -15,7 +15,7 @@ diff --git a/pcrecpp.cc b/pcrecpp.cc
>  index d09c9ab..6910db0 100644
>  --- a/pcrecpp.cc
>  +++ b/pcrecpp.cc
> -@@ -58,22 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  //
> results + PCRE workspace
> +@@ -58,23 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  //
> results + PCRE workspace
>   // Special object that stands-in for no argument
>   Arg RE::no_arg((void*)NULL);
>
> @@ -27,7 +27,8 @@ index d09c9ab..6910db0 100644
>  -// inclusive test if we ever needed it.  (Note that not only the
>  -// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
>  -// gnu-specific.)
> --#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) &&
> !defined(__INTEL_COMPILER)
> +-#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) \
> +-       && !defined(__INTEL_COMPILER) && !defined(__LCC__)
>  -# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
>  -# define ULP_AS_STRING_INTERNAL(x)   #x
>  -# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
> diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
> index 7513d5f198..6dea2a0987 100644
> --- a/package/pcre/pcre.hash
> +++ b/package/pcre/pcre.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking pgp signature
> -sha256 91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b
> pcre-8.43.tar.bz2
>  # License files, locally calculated
> -sha256 a5fce68baf797e0918463a4437ef75984c41118f43850ddeabda1b5a90154309
> LICENCE
> +sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3
> LICENCE
> +# Locally calculated
> +sha256  19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d
> pcre-8.44.tar.bz2
> diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
> index 595cda8a53..3c280e593f 100644
> --- a/package/pcre/pcre.mk
> +++ b/package/pcre/pcre.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -PCRE_VERSION = 8.43
> +PCRE_VERSION = 8.44
>  PCRE_SITE = https://ftp.pcre.org/pub/pcre
>  PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
>  PCRE_LICENSE = BSD-3-Clause
> --
> 2.17.1
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200714/8efa40d6/attachment.html>
