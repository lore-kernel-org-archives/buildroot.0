From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:10:27 +0200
Subject: [Buildroot] [PATCH 1/1] libffi: minor corrections in post
 install hooks
In-Reply-To: <1541068056.5590214.1377606409099.JavaMail.root@openwide.fr>
References: <1541068056.5590214.1377606409099.JavaMail.root@openwide.fr>
Message-ID: <20130827191027.3add3cc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas M?n?gale,

This looks good, but:

 * Your patch subject should have mentioned it's the second version.
   See --subject-prefix when generating/sending your patches.

 * The commit log could be a little bit more verbose on what the commit
   is doing. Basically, all the details you wrote after the "---"
   should in this case be part of the commit log itself. What is after
   the "---" marker are changelog informations, i.e things that changed
   between revisions of the patches. The real description of what the
   patch is doing should be part of the commit log.

Thanks,

Thomas

On Tue, 27 Aug 2013 14:26:49 +0200 (CEST), Nicolas M?n?gale wrote:
> Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
> ---
> v1: second commit
> In order to be sure that we just deal with the includes related with
> the actual package described into libffi.mk it is better to explicitly
> specify the version of the libffi we deal with into the post install
> hook.
> As dev files are deprecated in target rootfs target post install
> hook was also deleted.
> ---
>  package/libffi/libffi.mk |   11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
> index 0ad5c84..8c84924 100644
> --- a/package/libffi/libffi.mk
> +++ b/package/libffi/libffi.mk
> @@ -14,7 +14,7 @@ LIBFFI_AUTORECONF = YES
>  # Move the headers to the usual location, and adjust the .pc file
>  # accordingly.
>  define LIBFFI_MOVE_STAGING_HEADERS
> -	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
> +	mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
>  	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
>  	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
> @@ -22,15 +22,6 @@ endef
>  
>  LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
>  
> -# Similar for target headers
> -define LIBFFI_MOVE_TARGET_HEADERS
> -	install -d $(TARGET_DIR)/usr/include/
> -	mv $(TARGET_DIR)/usr/lib/libffi-*/include/*.h $(TARGET_DIR)/usr/include/
> -	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
> -endef
> -
> -LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
> -
>  HOST_LIBFFI_AUTORECONF = YES
>  
>  $(eval $(autotools-package))



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
