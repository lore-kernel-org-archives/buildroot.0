From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Sep 2020 12:59:55 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/fakeroot: bump version to
 1.25.1
In-Reply-To: <20200924095241.210229-1-nolange79@gmail.com>
References: <20200924095241.210229-1-nolange79@gmail.com>
Message-ID: <87y2kz8pgk.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Norbert,

On Thu, Sep 24 2020, Norbert Lange wrote:
> This version adds wrappers for getgroups and statx,
> the latter is used by coreutils 8.32.
>
> Removed patches that are now in upstream.
>
> Added a patch to fix failure when installing.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---

[...]

> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 1be99071bf..ed96fea2ae 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -FAKEROOT_VERSION = 1.20.2
> -FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
> -FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
> +FAKEROOT_VERSION = 1.25.1
> +FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
> +FAKEROOT_SITE = http://deb.debian.org/debian/pool/main/f/fakeroot

We prefer links to snapshot.debian.org because source files tend to
disappear from debian archives when distro versions are updated and
removed.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
