From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Jan 2011 11:17:43 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <1295493032-4705-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Wed, 19 Jan 2011 22:10:29 -0500")
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
Message-ID: <877hdvapq0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The new version of libpcap changed how its install targets work.  The
 Mike> main "install" target now always depends on "install-shared", so we
 Mike> need to force the DYEXT variable to "none" in order to bypass shared.

Does that then still install the shared lib for normal
(!PREFER_STATIC_LIB) builds, or should this only be passed for the
static case?

 Mike> +++ b/package/libpcap/libpcap.mk
 Mike> @@ -8,12 +8,8 @@ LIBPCAP_VERSION:=1.1.1
 Mike>  LIBPCAP_SITE:=http://www.tcpdump.org/release
 Mike>  LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz
 Mike>  LIBPCAP_INSTALL_STAGING:=YES
 Mike> -# doesn't have an install-strip
 Mike> -LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 Mike> -	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
 Mike> -LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
 Mike> -	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
 Mike>  LIBPCAP_DEPENDENCIES:=zlib
 Mike> +LIBPCAP_MAKE_OPT:=DYEXT=none

-- 
Bye, Peter Korsgaard
