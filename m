Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEBB4610B9;
	Tue, 12 Apr 2022 18:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViufihReiQYR; Tue, 12 Apr 2022 18:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD29610B4;
	Tue, 12 Apr 2022 18:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9D191BF9C8
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99EE383F97
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Y37VfklZmFh for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:01:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BE1083F2A
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:01:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so1958083wmq.0
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pK3RN2oEI/h7isaHRmPJjcNfm77ugwzhsefMYp9HMRI=;
 b=R18yG4zzXpKMHGd9hxttCeenaXZKnK2FSdQIe5d6gfQ8EkH8eNR6jCUe01FEFd/pYD
 VJui+lieO9m+9tfX47alTBsnvcNi91OPRP2ysV0iT8T7/mOHELzmsNLDnWcdR6PS8nGZ
 m/4kN8hTtCw5stBxEWyTLy9Nc48mkM6vQYVQ7SlzjOKehhqDMtRD1lQXvkz1KRU1EMUm
 hBACaXgNV6ErCDGJAmftzrUPKtMZ910ls08eztajI4/ppNWPMGnREWyhWYXcLDXNuCXg
 LZnBgbHgol2CH2YkaV6mceCDjA9bjbfaRkuXoQNEY9HyO2evfJqFtoySmhC3my4BOLrf
 aAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pK3RN2oEI/h7isaHRmPJjcNfm77ugwzhsefMYp9HMRI=;
 b=hsTVP3/L3rQKdskY8LF91OSpm+1Bn+2nvoXcPySY3FH5y9SoX8kqQ2V42BTbqLEbe6
 LdsiIY+IQOMZsfmkvaHbrTi6mJtqyI7BbiHywC4+PxqP3tjzSWvBLLehS4K0i9w2caDk
 k4gHWaAuP/lkyi5VvCPD6UnJ/2ZqoIEQ07dCCzpbVAUYnMVhRiR+S0tE4mBdCx5zIGZ6
 VoqI7S2VGB6N0fSsVO1x00WQgNXJDfZTo0EhjkdWGbGFIOpR4YBSKb3oWWECGR4J95KE
 pxDWi4vaArc5u1Sts1MEWrCXifVIO8IXUMH8dWcKZn6yUzsTrVWoJfjvBc6J8+iBGknl
 azKQ==
X-Gm-Message-State: AOAM530IkgUsliQY7uiW47Y3GE2EHtGtPzHAguN/Q7+en2+VZreG0kn2
 YL0tU/W7ans8wS9tiP6NR21h3aT8Pec=
X-Google-Smtp-Source: ABdhPJwq3m2fzVWkV3sBD3YISzsUWeH5ZYhk51JZsdOXURlzDx7u9aV8Y3c92yeVpd4Do3m9N6HJUA==
X-Received: by 2002:a1c:f605:0:b0:37b:b5de:89a0 with SMTP id
 w5-20020a1cf605000000b0037bb5de89a0mr5011482wmc.88.1649786490330; 
 Tue, 12 Apr 2022 11:01:30 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm151439wmq.36.2022.04.12.11.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:01:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:01:17 +0200
Message-Id: <20220412180117.2709569-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...cks-define-lock-functions-as-a-macro.patch | 179 ------------------
 package/gnutls/gnutls.hash                    |   4 +-
 package/gnutls/gnutls.mk                      |   2 +-
 3 files changed, 3 insertions(+), 182 deletions(-)
 delete mode 100644 package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch

diff --git a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
deleted file mode 100644
index 52965c051..000000000
--- a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From 5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Wed, 9 Mar 2022 08:07:58 +0100
-Subject: [PATCH] locks: define lock functions as a macro
-
-When threads are not supported, glthread_* functions are defined as
-no-op and thus dereferencing lock variables in inline functions will
-cause compilation error.  This change fixes it by redefining our lock
-functions as a macro so it will also be compiled out.
-
-Reported by Fabrice Fontaine in:
-https://gitlab.com/gnutls/gnutls/-/issues/1330
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-
-[Retrieved from:
-https://gitlab.com/gnutls/gnutls/-/commit/5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/locks.c       | 54 -----------------------------------------------
- lib/locks.h       | 28 ++++++++++++++++++------
- lib/pkcs11.c      |  2 +-
- lib/priority.c    |  2 +-
- lib/verify-tofu.c |  2 +-
- 5 files changed, 25 insertions(+), 63 deletions(-)
-
-diff --git a/lib/locks.c b/lib/locks.c
-index d61504e077..8888ed6b12 100644
---- a/lib/locks.c
-+++ b/lib/locks.c
-@@ -63,57 +63,3 @@ gnutls_global_set_mutex(mutex_init_func init, mutex_deinit_func deinit,
- 	gnutls_mutex_lock = lock;
- 	gnutls_mutex_unlock = unlock;
- }
--
--int
--gnutls_static_mutex_lock(gnutls_static_mutex_t lock)
--{
--	if (unlikely(glthread_lock_lock(lock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_static_mutex_unlock(gnutls_static_mutex_t lock)
--{
--	if (unlikely(glthread_lock_unlock(lock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_rdlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_wrlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_unlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_unlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_once(gnutls_once_t once, void (*init_func) (void))
--{
--	if (unlikely(glthread_once(once, init_func))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
-diff --git a/lib/locks.h b/lib/locks.h
-index a1ff0fa9d7..907adfc134 100644
---- a/lib/locks.h
-+++ b/lib/locks.h
-@@ -40,8 +40,14 @@ extern mutex_unlock_func gnutls_mutex_unlock;
-  */
- #define GNUTLS_STATIC_MUTEX(lock) gl_lock_define_initialized(static, lock)
- typedef gl_lock_t *gnutls_static_mutex_t;
--int gnutls_static_mutex_lock(gnutls_static_mutex_t lock);
--int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
-+
-+#define gnutls_static_mutex_lock(LOCK)			\
-+	(unlikely(glthread_lock_lock(LOCK)) ?		\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_static_mutex_unlock(LOCK)		\
-+	(unlikely(glthread_lock_unlock(LOCK)) ?		\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- /* Unlike static mutexes, static rwlocks can be locked/unlocked with
-  * the functions defined below, because there is no way to replace
-@@ -50,13 +56,23 @@ int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
- #define GNUTLS_RWLOCK(rwlock) gl_rwlock_define_initialized(static, rwlock)
- typedef gl_rwlock_t *gnutls_rwlock_t;
- 
--int gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock);
--int gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock);
--int gnutls_rwlock_unlock(gnutls_rwlock_t rwlock);
-+#define gnutls_rwlock_rdlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_rdlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_rwlock_wrlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_wrlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_rwlock_unlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_unlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- #define GNUTLS_ONCE(once) gl_once_define(static, once)
- typedef gl_once_t *gnutls_once_t;
- 
--int gnutls_once(gnutls_once_t once, void (*init_func) (void));
-+#define gnutls_once(ONCE, INIT_FUNC)			\
-+	(unlikely(glthread_once(ONCE, INIT_FUNC)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- #endif /* GNUTLS_LIB_LOCKS_H */
-diff --git a/lib/pkcs11.c b/lib/pkcs11.c
-index 8dda0f07c9..ba8ac0c375 100644
---- a/lib/pkcs11.c
-+++ b/lib/pkcs11.c
-@@ -351,7 +351,7 @@ int _gnutls_pkcs11_check_init(init_level_t req_level, void *priv, pkcs11_reinit_
- 	ret = sret;
- 
-  cleanup:
--	gnutls_static_mutex_unlock(&pkcs11_mutex);
-+	(void)gnutls_static_mutex_unlock(&pkcs11_mutex);
- 
- 	return ret;
- }
-diff --git a/lib/priority.c b/lib/priority.c
-index d17a923318..55ae185c1f 100644
---- a/lib/priority.c
-+++ b/lib/priority.c
-@@ -2505,7 +2505,7 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 	}
- 
-  out:
--	gnutls_rwlock_unlock(&system_wide_config_rwlock);
-+	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
- 	return ret;
- }
- 
-diff --git a/lib/verify-tofu.c b/lib/verify-tofu.c
-index 40b7acdc8a..97f47385e6 100644
---- a/lib/verify-tofu.c
-+++ b/lib/verify-tofu.c
-@@ -434,7 +434,7 @@ int store_pubkey(const char *db_name, const char *host,
- 	if (fp != NULL)
- 		fclose(fp);
- 
--	gnutls_static_mutex_unlock(&file_mutex);
-+	(void)gnutls_static_mutex_unlock(&file_mutex);
- 	gnutls_free(b64key.data);
- 
- 	return ret;
--- 
-GitLab
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 2ffc6c1b4..c09e4665e 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.3.tar.xz.sig
-sha256  fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a  gnutls-3.7.3.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
+sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 7317a3bb1..0e461cd44 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
