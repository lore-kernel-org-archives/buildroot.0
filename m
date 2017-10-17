From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Oct 2017 15:25:39 +0300
Subject: [Buildroot] [PATCH v2] ghostscript: bump version to 9.22
In-Reply-To: <20171017121837.18309-1-olivier.schonken@gmail.com>
References: <20171017121837.18309-1-olivier.schonken@gmail.com>
Message-ID: <20171017122539.hknljtqdq7ftzadz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier,

On Tue, Oct 17, 2017 at 02:18:37PM +0200, Olivier Schonken wrote:
> Remove patches that has been merged/updated upstream
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
> v1 -> v2 : The sha1 hash for ghostpdl was mistakenly put in the
>            hash file.  v2 fixes this issue.

Since you mention the hash...

> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index ade17f9de8..e2156d36c0 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/MD5SUMS
> -md5 631beea7aa1f70f2cdca14e0308b8801  ghostscript-9.21.tar.xz
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/SHA1SUMS
> -sha1 a93b456a0e18d5c925d26b0b13e961c8e8140f62  ghostscript-9.21.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/MD5SUMS
> +md5 684c5371e52215f7289d2c32737e4def  ghostscript-9.22.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA1SUMS
> +sha1 9dcd527e9bcc636a6a947251a6195f58dd00006b  ghostscript-9.22.tar.xz

When upstream only provide weak hashes like MD5 or SHA1, we usually add a 
secure hash like SHA256. But in this case upstream does provide SHA256 and 
SHA512. Please use them.

https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA256SUMS
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA512SUMS

baruch

> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index c28cd06723..aa3f63b26e 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 9.21
> -GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921
> +GHOSTSCRIPT_VERSION = 9.22
> +GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
>  GHOSTSCRIPT_LICENSE_FILES = LICENSE

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
