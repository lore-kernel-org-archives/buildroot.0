From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 12:02:22 +0000
Subject: [Buildroot] [PATCH 1/1] Update xfsprogs
In-Reply-To: <87tyvkzoec.fsf@macbook.be.48ers.dk>
References: <cover.1261379989.git.nkukard@lbsd.net>	<cover.1261379989.git.nkukard@lbsd.net>	<dee3a736226f0c4a4df412fc48fbe0eabca4df9e.1261379989.git.nkukard@lbsd.net>
	<87tyvkzoec.fsf@macbook.be.48ers.dk>
Message-ID: <4B2F63CE.1000801@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
>>>>>>             
>  Nigel> Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
>  Nigel> ---
>  Nigel>  package/xfsprogs/Config.in      |   10 +++---
>  Nigel>  package/xfsprogs/xfsprogs.mk    |    9 ++---
>  Nigel>  package/xfsprogs/xfsprogs.patch |   59 ---------------------------------------
>  Nigel>  3 files changed, 9 insertions(+), 69 deletions(-)
>  Nigel>  delete mode 100644 package/xfsprogs/xfsprogs.patch
>
>  Nigel> diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
>  Nigel> index 2f462cb..77e4d61 100644
>  Nigel> --- a/package/xfsprogs/Config.in
>  Nigel> +++ b/package/xfsprogs/Config.in
>  Nigel> @@ -1,6 +1,9 @@
>   
>  Nigel> -comment "xfssprogs requires a toolchain with LARGEFILE support"
>  Nigel> -	depends on !BR2_LARGEFILE
>  Nigel> -
>
> I don't see any references to the e2fsprogs libuuid?
>   

I'll change it to be auto selected just like BR2_PACKAGE_E2FSPROGS is

>  Nigel> diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
>  Nigel> index 89db6c1..e87485e 100644
>  Nigel> --- a/package/xfsprogs/xfsprogs.mk
>  Nigel> +++ b/package/xfsprogs/xfsprogs.mk
>  Nigel>  	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
>  Nigel>  	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
>  
>  Nigel> -xfsprogs: e2fsprogs libtool-cross $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
>  Nigel> +xfsprogs: e2fsprogs libtool $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
>
> You need to select e2fsprogs in kconfig.

        select BR2_PACKAGE_E2FSPROGS

its already there. I have now added libuuid aswell.


>  Why do you need libtool for the
> target?
>   

I didn't add libtool-cross, I was told to use "libtool" instead in
future. Maybe the original author of xfsprogs.mk can answer why it was
there?

When I have tested it without libtool I'll send another pull request.
