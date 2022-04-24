Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8BBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B257640158;
	Sun, 24 Apr 2022 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvgkVkv2KoCD; Sun, 24 Apr 2022 20:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2684C4018F;
	Sun, 24 Apr 2022 20:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72C031BF348
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F61F41498
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5VqnZCD9iHr for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB23D41477
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:02:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id q20so8148024wmq.1
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GptTHb0XOpeOApTL74jWNYMT6tUamwQeNCQZGHUXos=;
 b=E3ezEwoOpwdwD2bTU0dUBd1ELl3dtf052VT0Wintqok+fDyTfKpxkz9B2y6c7/hRZa
 SOwv8MB5P8FuaIepNpPg8WgePpl9brynHSmWQVV1x9G0/S+r/vUh7XBfUZi8xtv8MFnD
 eer7vzOOvxvU/edYKEx77TIsYnWArYSTFR18caN/phIUJsNvEcuPRuVsw3aLv1U25fQS
 p1wxggctN91sRsoTqeSq754FZyXEyswM/eo8sFVJbfrCMpDDaMbCNOXwjCo2piWoXG7m
 BcPVd4f6fcwxu1lig2txv3HyxZl2fUKXfhNca3E4GArNP3a5xnnxUrgDblG7WB13YKEH
 0aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GptTHb0XOpeOApTL74jWNYMT6tUamwQeNCQZGHUXos=;
 b=35x1u2sZAsd7S2YUhU4ZUJorvqIFEoDIdw+WQtF2t1bNWF1HTnn1HW2UsgrAFOEEeB
 gitw+jzIfd91UQD53Xb8Pn/+dMn69a5ekh0G7Sj3ArTDQ5SEe2A1xd7GlcKqgA+Jgta1
 hbDbtHIhDf60tofsQqUdC3hYKPpDO6K6JumMcOAU57hUxStldjk0MtYv7dDfPYXxman1
 n/iKxfezxopE2bh361tu3Qp6jSCh6aw3A1Yh5VKFXAyAD4g7X+fKrmsTPmNuZfIG6wzO
 CghWBM6fac74+EG4CzBazqrJTPrvCJKAq5+tw7kVCQedMo4tpsjMInExQ2oIBM3h+64y
 vszg==
X-Gm-Message-State: AOAM533AAmM92baMhC9n41Ese8d1JDQmPa2pNqYG0k4fYnV1OWkvYH5p
 7Yf7VVPcjlguCbMIB4aOoXQwIWP+bbo=
X-Google-Smtp-Source: ABdhPJwyVmZwHUXxc0yK95oIfRXVsuDE5VnTyfCddWEay5QG0K7mDx504WCnj/zNxZ6o7MB06E6zbQ==
X-Received: by 2002:a1c:5401:0:b0:38e:bf1c:d25c with SMTP id
 i1-20020a1c5401000000b0038ebf1cd25cmr13521521wmb.119.1650830533664; 
 Sun, 24 Apr 2022 13:02:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e30-20020adf9bde000000b0020ad8ffb0f9sm2034366wrc.69.2022.04.24.13.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:02:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:00:13 +0200
Message-Id: <20220424200014.1336771-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libselinux: fix host build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following build failure is raised since commit
1745fcde740057951dcc5429f3bfabd103b764a1 because
$(HOST_PKG_PYTHON_DISTUTILS_ENV) contains $(HOST_CONFIGURE_OPTS) and so
will override LDFLAGS passed by libselinux.mk:

/usr/bin/gcc -O2 -I/nvmedata/autobuild/instance-11/output-1/host/include -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND  -L/nvmedata/autobuild/instance-11/output-1/host/lib -Wl,-rpath,/nvmedata/autobuild/instance-11/output-1/host/lib -shared -o libselinux.so.1 avc.lo avc_internal.lo avc_sidtab.lo booleans.lo callbacks.lo canonicalize_context.lo checkAccess.lo check_context.lo checkreqprot.lo compute_av.lo compute_create.lo compute_member.lo compute_relabel.lo compute_user.lo context.lo deny_unknown.lo disable.lo enabled.lo fgetfilecon.lo freecon.lo freeconary.lo fsetfilecon.lo get_context_list.lo get_default_type.lo get_initial_context.lo getenforce.lo getfilecon.lo getpeercon.lo init.lo is_customizable_type.lo label.lo label_db.lo label_file.lo label_media.lo label_support.lo label_x.lo lgetfilecon.lo load_policy.lo lsetfilecon.lo mapping.lo matchmediacon.lo matchpathcon.lo policyvers.lo procattr.lo query_user_context.lo regex.lo reject_unknown.lo selinux_check_securetty_context.l
 o selinux_config.lo selinux_restorecon.lo sestatus.lo setenforce.lo setexecfilecon.lo setfilecon.lo setrans_client.lo seusers.lo sha1.lo stringrep.lo validatetrans.lo   -ldl -Wl,-soname,libselinux.so.1,--version-script=libselinux.map,-z,defs,-z,relro
/usr/bin/ld: regex.lo: in function `regex_writef':
regex.c:(.text+0x7c): undefined reference to `pcre_fullinfo'

To fix this build failure, instead of moving LDFLAGS after
$(HOST_PKG_PYTHON_DISTUTILS_ENV), drop LDFLAGS and add host-pkgconf
dependency to retrieve pcre dependencies as pkg-config is supported
since version 3.2 and
https://github.com/SELinuxProject/selinux/commit/74093beab0c605641ec413be81e31e6b2f55d8d4

Dropping LDFLAGS will also drop -lpthread which doesn't seem to raise
any build failures with test-pkg:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED

Apply the same update to the target variant for consistancy.

Fixes:
 - http://autobuild.buildroot.org/results/d16995f0decef9c9bf58cab4fa30f7daab6918fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libselinux/libselinux.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 5790e79040..c6be8e638a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -10,7 +10,8 @@ LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
 
-LIBSELINUX_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) libsepol pcre
+LIBSELINUX_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre
 
 LIBSELINUX_INSTALL_STAGING = YES
 
@@ -52,8 +53,7 @@ endif # python3
 # when the python binding is enabled.
 LIBSELINUX_MAKE_OPTS += \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \
-	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
+	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 
 define LIBSELINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
@@ -76,13 +76,12 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-libsepol host-pcre host-swig host-python3
+	host-pkgconf host-libsepol host-pcre host-swig host-python3
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
-	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
