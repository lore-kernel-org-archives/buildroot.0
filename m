From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Apr 2015 11:56:46 +0300
Subject: [Buildroot] [PATCH 1/1 v2] json-c;
 bump version to json-c-0.12-20140410
In-Reply-To: <1429087560-14107-1-git-send-email-sagaert.johan@proximus.be>
References: <1429087560-14107-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150415085646.GD30380@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Wed, Apr 15, 2015 at 10:46:00AM +0200, Sagaert Johan wrote:
> diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
> new file mode 100644
> index 0000000..a6f9a1f
> --- /dev/null
> +++ b/package/json-c/json-c.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	99304a4a633f1ee281d6a521155a182824dd995139d5ed6ee5c93093c281092b  json-c-json-c-0.12-20140410.tar.gz

This tar file is generated locally from a git checkout. tar generation is not 
deterministic, so the tar file may change from one checkout to another. In 
this case we do not add a hash file.

> diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
> index b8212ca..9ebd951 100644
> --- a/package/json-c/json-c.mk
> +++ b/package/json-c/json-c.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -JSON_C_VERSION = json-c-0.11-20130402
> +JSON_C_VERSION = json-c-0.12-20140410
>  JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
>  JSON_C_INSTALL_STAGING = YES
>  JSON_C_MAKE = $(MAKE1)
>  JSON_C_CONF_OPTS = --disable-oldname-compat
> +JSON_C_AUTORECONF = YES

Please add an inline comment noting that AUTORECONF is needed because of 
Makefile.am.inc patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
