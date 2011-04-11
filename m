From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 11 Apr 2011 07:56:50 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile.package.in: Makes it possible
 to override the default extract commands
In-Reply-To: <1302180737-18612-2-git-send-email-a@awn.dk>
References: <1302180737-18612-1-git-send-email-a@awn.dk>
	<1302180737-18612-2-git-send-email-a@awn.dk>
Message-ID: <BANLkTi=HUgE-1uNPhVsoRTYF2BsaA2oOYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Allan!

Interesting patch. Would you mind describing a common use case in the
longer commit message?

> @@ -261,7 +271,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(NOHOSTPKG)_NAME)-$($(PKG)_VERSION)
> ?$(BUILD_DIR)/%/.stamp_patched:
> ? ? ? ?@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
> ? ? ? ?$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
> - ? ? ? $(Q)( \
> + ? ? ? ( \
> ? ? ? ?if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME); then \
> ? ? ? ? ?if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER)*.patch*)"; then \
> ? ? ? ? ? ?toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \

How does this removal of $(Q) relate to the new feature?
