From: Allan Nielsen <a@awn.dk>
Date: Mon, 11 Apr 2011 12:45:21 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile.package.in: Makes it possible
 to override the default extract commands
In-Reply-To: <BANLkTi=HUgE-1uNPhVsoRTYF2BsaA2oOYw@mail.gmail.com>
References: <1302180737-18612-1-git-send-email-a@awn.dk>
	<1302180737-18612-2-git-send-email-a@awn.dk>
	<BANLkTi=HUgE-1uNPhVsoRTYF2BsaA2oOYw@mail.gmail.com>
Message-ID: <BANLkTikUky2g=9VYGANfq4S=C2TC67enCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey

The removal of $(Q) was not on purpose, I guess I should be more
careful when "git add -i".

I will post a new commit with out the missing $(Q), and with an
example in the commit message.

2011/4/11 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> Hi Allan!
>
> Interesting patch. Would you mind describing a common use case in the
> longer commit message?
>
>> @@ -261,7 +271,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(NOHOSTPKG)_NAME)-$($(PKG)_VERSION)
>> ?$(BUILD_DIR)/%/.stamp_patched:
>> ? ? ? ?@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
>> ? ? ? ?$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
>> - ? ? ? $(Q)( \
>> + ? ? ? ( \
>> ? ? ? ?if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME); then \
>> ? ? ? ? ?if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER)*.patch*)"; then \
>> ? ? ? ? ? ?toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
>
> How does this removal of $(Q) relate to the new feature?
>
