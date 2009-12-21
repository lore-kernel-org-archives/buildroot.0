From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Dec 2009 10:02:39 +0100
Subject: [Buildroot] [PATCH 1/1] Install uuid.h into staging a some
	other apps like xfsprogs need it
In-Reply-To: <66db896cdd0b2ec3310eec09ee314137c50e7d8d.1261379909.git.nkukard@lbsd.net>
	(Nigel Kukard's message of "Mon, 21 Dec 2009 07:18:32 +0000")
References: <cover.1261379909.git.nkukard@lbsd.net>
	<cover.1261379909.git.nkukard@lbsd.net>
	<66db896cdd0b2ec3310eec09ee314137c50e7d8d.1261379909.git.nkukard@lbsd.net>
Message-ID: <87y6kwzols.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 
 Nigel> +E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
 Nigel> +

AUTOTARGETS already defines <package>_SRCDIR that we can use.

 Nigel>  E2FSPROGS_AUTORECONF = NO
 Nigel>  E2FSPROGS_LIBTOOL_PATCH = NO
 
 Nigel> @@ -91,5 +93,7 @@ endif
 Nigel>  ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 Nigel>  	ln -sf e2label ${TARGET_DIR}/usr/sbin/findfs
 Nigel>  endif
 Nigel> +	mkdir -p ${STAGING_DIR}/usr/include/uuid
 Nigel> +	install ${E2FSPROGS_DIR}/lib/uuid/uuid.h ${STAGING_DIR}/usr/include/uuid/uuid.h
 Nigel>  	touch $@

This should only be done if the libuuid library is installed into
target.

I've fixed those issues and committed, thanks.

-- 
Bye, Peter Korsgaard
