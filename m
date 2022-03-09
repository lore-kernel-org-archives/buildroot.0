Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F300C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 17:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E60D611B6;
	Wed,  9 Mar 2022 17:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7-2i_bq17Ak; Wed,  9 Mar 2022 17:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A862060FD7;
	Wed,  9 Mar 2022 17:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14CC21BF25B
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 106C960FD7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObPyk5duWtnH for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 17:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE8C60FAE
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 17:35:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t11so4205555wrm.5
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 09:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hsAu71xlG6otf80roab25W/RrG7PBpapeaqke17GcKo=;
 b=cN1hpgnimoWwsqxRJmOgTDWrq56c63O2DTeJVU+XV29HZxr/Tsp2/duBz9nIWmV9aE
 WtjnZDe3Z8CiM6xyi8ikbFJ/3E6Orxv07orCS3DsChcCfihxLwYsiGU99l008n83jJZU
 4YFpyPAxKgsrATneTi+U3ZNAEFRyl7FHrxZRZtxbX1XMu9jaw/zrx4l/oBSak9ulBj6u
 kiBv2f2wLVE/RaKEr6xeJcG0BwSzPZbniiIhIqqt5J02LI65OM1jIlAxFgDU6kIAkJ0s
 LW9DWK/keGESRpB56cTXuQrAmHazsCsxz9Bd8gqR/CKCnDh79O7iOYIHmc+ERX5UAlGB
 EpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hsAu71xlG6otf80roab25W/RrG7PBpapeaqke17GcKo=;
 b=sf/DosU+jLZCcabD9LJnrfXC6SsbrRBJbbMVf27+TB8VIitORN/RBmSdyV2nfkoddc
 9L0dABSl01Vzvq9opb7APOSl+t5vkVrqs3aj7e4DNPwKgyLmPPkakBYUZMmiXKEl89am
 d0IzUtnIwVZnqM8aP1lxSR96SjYpbxjB5iqSAyiWhev/5SeLwcfEMRHzqBFLKWMCxstp
 XbPxUQ51bLIosJnTRL/0E5Be1P6fmRWtxs0/MHa4bne5ZnZZpPwKd9AHWoZmDNEm+G7z
 w3ZnCm1pZuZW9dj8I3QYYqK9dIAzhxLfHrrcz7duBApX386dwuOp7tKqzsHNWnvHJLRs
 Um0A==
X-Gm-Message-State: AOAM532vhhUdSNVQRRHeh4XCiDP34Ocjq1VAH909abe5sPWFLM6jVRCE
 m2RhFm8Nmxh1pAndUBdYOQbvtbbx9jI=
X-Google-Smtp-Source: ABdhPJwF2jWTf3kleCBMshPV7sXjGpgpoq0q8o+i7Xd8zr0NcPIC0buEg2N/hCiRDAZDE7arRcpf1Q==
X-Received: by 2002:adf:ea0f:0:b0:1f0:61f6:c3df with SMTP id
 q15-20020adfea0f000000b001f061f6c3dfmr525304wrm.543.1646847352601; 
 Wed, 09 Mar 2022 09:35:52 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003897e440047sm6007817wmq.28.2022.03.09.09.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 09:35:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 18:35:03 +0100
Message-Id: <20220309173503.527227-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnutls: fix build without threads
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 3.7.3 in commit 212b020bb43f13121d6cde464f871d5d1cf6cfbe:

kx.c: In function '_gnutls_nss_keylog_write':
kx.c:164:33: error: 'keylog_mutex' undeclared (first use in this function); did you mean 'keylog_once'?
  164 |   if (gnutls_static_mutex_lock(&keylog_mutex) < 0) {
      |                                 ^~~~~~~~~~~~
      |                                 keylog_once

Fixes:
 - http://autobuild.buildroot.org/results/e092bc11ce4b5908cb6285aa77a3594b8626eeec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...cks-define-lock-functions-as-a-macro.patch | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch

diff --git a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
new file mode 100644
index 0000000000..52965c051d
--- /dev/null
+++ b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
@@ -0,0 +1,179 @@
+From 5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Wed, 9 Mar 2022 08:07:58 +0100
+Subject: [PATCH] locks: define lock functions as a macro
+
+When threads are not supported, glthread_* functions are defined as
+no-op and thus dereferencing lock variables in inline functions will
+cause compilation error.  This change fixes it by redefining our lock
+functions as a macro so it will also be compiled out.
+
+Reported by Fabrice Fontaine in:
+https://gitlab.com/gnutls/gnutls/-/issues/1330
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+[Retrieved from:
+https://gitlab.com/gnutls/gnutls/-/commit/5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/locks.c       | 54 -----------------------------------------------
+ lib/locks.h       | 28 ++++++++++++++++++------
+ lib/pkcs11.c      |  2 +-
+ lib/priority.c    |  2 +-
+ lib/verify-tofu.c |  2 +-
+ 5 files changed, 25 insertions(+), 63 deletions(-)
+
+diff --git a/lib/locks.c b/lib/locks.c
+index d61504e077..8888ed6b12 100644
+--- a/lib/locks.c
++++ b/lib/locks.c
+@@ -63,57 +63,3 @@ gnutls_global_set_mutex(mutex_init_func init, mutex_deinit_func deinit,
+ 	gnutls_mutex_lock = lock;
+ 	gnutls_mutex_unlock = unlock;
+ }
+-
+-int
+-gnutls_static_mutex_lock(gnutls_static_mutex_t lock)
+-{
+-	if (unlikely(glthread_lock_lock(lock))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+-
+-int
+-gnutls_static_mutex_unlock(gnutls_static_mutex_t lock)
+-{
+-	if (unlikely(glthread_lock_unlock(lock))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+-
+-int
+-gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock)
+-{
+-	if (unlikely(glthread_rwlock_rdlock(rwlock))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+-
+-int
+-gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock)
+-{
+-	if (unlikely(glthread_rwlock_wrlock(rwlock))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+-
+-int
+-gnutls_rwlock_unlock(gnutls_rwlock_t rwlock)
+-{
+-	if (unlikely(glthread_rwlock_unlock(rwlock))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+-
+-int
+-gnutls_once(gnutls_once_t once, void (*init_func) (void))
+-{
+-	if (unlikely(glthread_once(once, init_func))) {
+-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
+-	}
+-	return 0;
+-}
+diff --git a/lib/locks.h b/lib/locks.h
+index a1ff0fa9d7..907adfc134 100644
+--- a/lib/locks.h
++++ b/lib/locks.h
+@@ -40,8 +40,14 @@ extern mutex_unlock_func gnutls_mutex_unlock;
+  */
+ #define GNUTLS_STATIC_MUTEX(lock) gl_lock_define_initialized(static, lock)
+ typedef gl_lock_t *gnutls_static_mutex_t;
+-int gnutls_static_mutex_lock(gnutls_static_mutex_t lock);
+-int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
++
++#define gnutls_static_mutex_lock(LOCK)			\
++	(unlikely(glthread_lock_lock(LOCK)) ?		\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
++
++#define gnutls_static_mutex_unlock(LOCK)		\
++	(unlikely(glthread_lock_unlock(LOCK)) ?		\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
+ 
+ /* Unlike static mutexes, static rwlocks can be locked/unlocked with
+  * the functions defined below, because there is no way to replace
+@@ -50,13 +56,23 @@ int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
+ #define GNUTLS_RWLOCK(rwlock) gl_rwlock_define_initialized(static, rwlock)
+ typedef gl_rwlock_t *gnutls_rwlock_t;
+ 
+-int gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock);
+-int gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock);
+-int gnutls_rwlock_unlock(gnutls_rwlock_t rwlock);
++#define gnutls_rwlock_rdlock(RWLOCK)			\
++	(unlikely(glthread_rwlock_rdlock(RWLOCK)) ?	\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
++
++#define gnutls_rwlock_wrlock(RWLOCK)			\
++	(unlikely(glthread_rwlock_wrlock(RWLOCK)) ?	\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
++
++#define gnutls_rwlock_unlock(RWLOCK)			\
++	(unlikely(glthread_rwlock_unlock(RWLOCK)) ?	\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
+ 
+ #define GNUTLS_ONCE(once) gl_once_define(static, once)
+ typedef gl_once_t *gnutls_once_t;
+ 
+-int gnutls_once(gnutls_once_t once, void (*init_func) (void));
++#define gnutls_once(ONCE, INIT_FUNC)			\
++	(unlikely(glthread_once(ONCE, INIT_FUNC)) ?	\
++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
+ 
+ #endif /* GNUTLS_LIB_LOCKS_H */
+diff --git a/lib/pkcs11.c b/lib/pkcs11.c
+index 8dda0f07c9..ba8ac0c375 100644
+--- a/lib/pkcs11.c
++++ b/lib/pkcs11.c
+@@ -351,7 +351,7 @@ int _gnutls_pkcs11_check_init(init_level_t req_level, void *priv, pkcs11_reinit_
+ 	ret = sret;
+ 
+  cleanup:
+-	gnutls_static_mutex_unlock(&pkcs11_mutex);
++	(void)gnutls_static_mutex_unlock(&pkcs11_mutex);
+ 
+ 	return ret;
+ }
+diff --git a/lib/priority.c b/lib/priority.c
+index d17a923318..55ae185c1f 100644
+--- a/lib/priority.c
++++ b/lib/priority.c
+@@ -2505,7 +2505,7 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
+ 	}
+ 
+  out:
+-	gnutls_rwlock_unlock(&system_wide_config_rwlock);
++	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
+ 	return ret;
+ }
+ 
+diff --git a/lib/verify-tofu.c b/lib/verify-tofu.c
+index 40b7acdc8a..97f47385e6 100644
+--- a/lib/verify-tofu.c
++++ b/lib/verify-tofu.c
+@@ -434,7 +434,7 @@ int store_pubkey(const char *db_name, const char *host,
+ 	if (fp != NULL)
+ 		fclose(fp);
+ 
+-	gnutls_static_mutex_unlock(&file_mutex);
++	(void)gnutls_static_mutex_unlock(&file_mutex);
+ 	gnutls_free(b64key.data);
+ 
+ 	return ret;
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
