Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31625C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E195F82846;
	Wed,  9 Feb 2022 17:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIjrKIeUelEJ; Wed,  9 Feb 2022 17:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C291683065;
	Wed,  9 Feb 2022 17:05:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7F41BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8629B40146
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLzqVqPbg7EX for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FE79403F8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC493240007;
 Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDO-0001QP-8L; Wed, 09 Feb 2022 17:53:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:00 +0100
Message-Id: <20220209165213.4498-95-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 094/107] package/python-pam: drop python2
 specific package
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                              |   6 +
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 package/python-pam/0001-dealloc.patch         |  25 ----
 package/python-pam/0002-nofree.patch          |  68 ---------
 .../0003-memory-errors-CVE2012-1502.patch     | 136 ------------------
 package/python-pam/Config.in                  |  16 ---
 package/python-pam/python-pam.hash            |   3 -
 package/python-pam/python-pam.mk              |  16 ---
 9 files changed, 6 insertions(+), 266 deletions(-)
 delete mode 100644 package/python-pam/0001-dealloc.patch
 delete mode 100644 package/python-pam/0002-nofree.patch
 delete mode 100644 package/python-pam/0003-memory-errors-CVE2012-1502.patch
 delete mode 100644 package/python-pam/Config.in
 delete mode 100644 package/python-pam/python-pam.hash
 delete mode 100644 package/python-pam/python-pam.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 80adf521f8..386f94e72b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PAM
+	bool "python-pam removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 7b38d3c0f7..a6ea3793ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2248,7 +2248,6 @@ F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
 F:	package/python-functools32/
-F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/python-request-id/
 F:	package/python-semver/
diff --git a/package/Config.in b/package/Config.in
index 8dc91becb0..73e8901a1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,7 +1115,6 @@ menu "External python modules"
 	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
-	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
diff --git a/package/python-pam/0001-dealloc.patch b/package/python-pam/0001-dealloc.patch
deleted file mode 100644
index dd4f9610c7..0000000000
--- a/package/python-pam/0001-dealloc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] fix two bugs in the PAM object deallocation
-
-Fixes https://bugzilla.redhat.com/show_bug.cgi?id=658955
-
-Downloaded from:
-http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-dealloc.patch
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff -up PyPAM-0.5.0/PAMmodule.c.dealloc PyPAM-0.5.0/PAMmodule.c
---- PyPAM-0.5.0/PAMmodule.c.dealloc	2011-01-17 22:48:22.000000000 +0100
-+++ PyPAM-0.5.0/PAMmodule.c	2011-01-18 21:24:59.000000000 +0100
-@@ -538,10 +538,11 @@ static void PyPAM_dealloc(PyPAMObject *s
-     free(self->service);
-     free(self->user);
-     free(self->conv);
--    pam_end(self->pamh, PAM_SUCCESS);
-+    if (self->pamh)
-+        pam_end(self->pamh, PAM_SUCCESS);
-     dlclose(self->dlh2);
-     dlclose(self->dlh1);
--    PyMem_DEL(self);
-+    PyObject_Del(self);
- }
- 
- static PyObject * PyPAM_getattr(PyPAMObject *self, char *name)
diff --git a/package/python-pam/0002-nofree.patch b/package/python-pam/0002-nofree.patch
deleted file mode 100644
index 7de8801707..0000000000
--- a/package/python-pam/0002-nofree.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-[PATCH] deallocate the conversation response only in case of error
-
-Fixes https://bugzilla.redhat.com/show_bug.cgi?id=679714
-
-Downloaded from:
-http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-nofree.patch
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff --git a/PAMmodule.c b/PAMmodule.c
-index 03cb799..a7ff8a5 100644
---- a/PAMmodule.c
-+++ b/PAMmodule.c
-@@ -24,8 +24,6 @@ typedef struct {
-     char                *service;
-     char                *user;
-     PyObject            *callback;
--    struct pam_response *response_data;
--    int                 response_len;
-     PyObject            *user_data;
-     void                *dlh1, *dlh2;
- } PyPAMObject;
-@@ -54,15 +52,6 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
- 
-     Py_INCREF(self);
- 
--    if (NULL != self->response_data) {
--        for (int i = 0; i < self->response_len; i++) {
--            free(self->response_data[0].resp);
--        }
--        free(self->response_data);
--        self->response_data = NULL;
--        self->response_len = 0;
--    }
--
-     PyObject* msgList = PyList_New(num_msg);
-     
-     for (int i = 0; i < num_msg; i++) {
-@@ -92,6 +81,10 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
-         char* resp_text;
-         int resp_retcode = 0;
-         if (!PyArg_ParseTuple(respTuple, "si", &resp_text, &resp_retcode)) {
-+            while (i > 0) {
-+                free((--spr)->resp);
-+                --i;
-+            }
-             free(*resp);
-             Py_DECREF(respList);
-             return PAM_CONV_ERR;
-@@ -100,10 +93,6 @@ static int PyPAM_conv(int num_msg, const struct pam_message **msg,
-         spr->resp_retcode = resp_retcode;
-         Py_DECREF(respTuple);
-     }
--    
--    // Save this so we can free it later.
--    self->response_data = *resp;
--    self->response_len = PyList_Size(respList);
- 
-     Py_DECREF(respList);
-     
-@@ -144,8 +133,6 @@ static PyObject * PyPAM_pam(PyObject *self, PyObject *args)
-     p->user = NULL;
-     Py_INCREF(Py_None);
-     p->callback = Py_None;
--    p->response_data = NULL;
--    p->response_len = 0;
-     Py_INCREF(Py_None);
-     p->user_data = Py_None;
-     
diff --git a/package/python-pam/0003-memory-errors-CVE2012-1502.patch b/package/python-pam/0003-memory-errors-CVE2012-1502.patch
deleted file mode 100644
index 62405db058..0000000000
--- a/package/python-pam/0003-memory-errors-CVE2012-1502.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-[PATCH] Fix Double Free Corruption (CVE2012-1502)
-
-Downloaded from:
-http://pkgs.fedoraproject.org/cgit/PyPAM.git/plain/PyPAM-0.5.0-memory-errors.patch
-
-For details, see: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-1502
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff -up PyPAM-0.5.0/PAMmodule.c.memory PyPAM-0.5.0/PAMmodule.c
---- PyPAM-0.5.0/PAMmodule.c.memory	2012-05-07 17:22:54.503914026 +0200
-+++ PyPAM-0.5.0/PAMmodule.c	2012-05-07 17:23:15.644381942 +0200
-@@ -37,33 +37,48 @@ static void PyPAM_Err(PyPAMObject *self,
- 
-     err_msg = pam_strerror(self->pamh, result);
-     error = Py_BuildValue("(si)", err_msg, result);
--    Py_INCREF(PyPAM_Error);
-     PyErr_SetObject(PyPAM_Error, error);
-+    Py_XDECREF(error);
- }
- 
- static int PyPAM_conv(int num_msg, const struct pam_message **msg,
-     struct pam_response **resp, void *appdata_ptr)
- {
--    PyObject                *args;
--
-+    PyObject *args, *msgList, *respList, *item;
-+    struct pam_response *response, *spr;
-     PyPAMObject* self = (PyPAMObject *) appdata_ptr;
-+
-     if (self->callback == NULL)
-         return PAM_CONV_ERR;
- 
-     Py_INCREF(self);
- 
--    PyObject* msgList = PyList_New(num_msg);
--    
-+    msgList = PyList_New(num_msg);
-+    if (msgList == NULL) {
-+        Py_DECREF(self);
-+        return PAM_CONV_ERR;
-+    }
-+
-     for (int i = 0; i < num_msg; i++) {
--        PyList_SetItem(msgList, i,
--            Py_BuildValue("(si)", msg[i]->msg, msg[i]->msg_style));
-+        item = Py_BuildValue("(si)", msg[i]->msg, msg[i]->msg_style);
-+        if (item == NULL) {
-+            Py_DECREF(msgList);
-+            Py_DECREF(self);
-+            return PAM_CONV_ERR;
-+        }
-+        PyList_SetItem(msgList, i, item);
-     }
--    
-+
-     args = Py_BuildValue("(OO)", self, msgList);
--    PyObject* respList = PyEval_CallObject(self->callback, args);
-+    if (args == NULL) {
-+        Py_DECREF(self);
-+	Py_DECREF(msgList);
-+        return PAM_CONV_ERR;
-+    }
-+    respList = PyEval_CallObject(self->callback, args);
-     Py_DECREF(args);
-     Py_DECREF(self);
--    
-+
-     if (respList == NULL)
-         return PAM_CONV_ERR;
- 
-@@ -71,11 +86,15 @@ static int PyPAM_conv(int num_msg, const
-         Py_DECREF(respList);
-         return PAM_CONV_ERR;
-     }
--    
--    *resp = (struct pam_response *) malloc(
-+
-+    response = (struct pam_response *) malloc(
-         PyList_Size(respList) * sizeof(struct pam_response));
-+    if (response == NULL) {
-+        Py_DECREF(respList);
-+        return PAM_CONV_ERR;
-+    }
-+    spr = response;
- 
--    struct pam_response* spr = *resp;
-     for (int i = 0; i < PyList_Size(respList); i++, spr++) {
-         PyObject* respTuple = PyList_GetItem(respList, i);
-         char* resp_text;
-@@ -85,7 +104,7 @@ static int PyPAM_conv(int num_msg, const
-                 free((--spr)->resp);
-                 --i;
-             }
--            free(*resp);
-+            free(response);
-             Py_DECREF(respList);
-             return PAM_CONV_ERR;
-         }
-@@ -95,7 +114,8 @@ static int PyPAM_conv(int num_msg, const
-     }
- 
-     Py_DECREF(respList);
--    
-+    *resp = response;
-+
-     return PAM_SUCCESS;
- }
- 
-@@ -122,7 +142,11 @@ static PyObject * PyPAM_pam(PyObject *se
-     PyPAMObject_Type.ob_type = &PyType_Type;
-     p = (PyPAMObject *) PyObject_NEW(PyPAMObject, &PyPAMObject_Type);
- 
-+    if (p == NULL)
-+        return NULL;
-+
-     if ((spc = (struct pam_conv *) malloc(sizeof(struct pam_conv))) == NULL) {
-+        Py_DECREF((PyObject *)p);
-         PyErr_SetString(PyExc_MemoryError, "out of memory");
-         return NULL;
-     }
-@@ -455,9 +479,15 @@ static PyObject * PyPAM_getenvlist(PyObj
-     }
-     
-     retval = PyList_New(0);
-+    if (retval == NULL)
-+	return NULL;
-     
-     while ((cp = *(result++)) != NULL) {
-         entry = Py_BuildValue("s", cp);
-+        if (entry == NULL) {
-+            Py_DECREF(retval);
-+            return NULL;
-+        }
-         PyList_Append(retval, entry);
-         Py_DECREF(entry);
-     }
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
deleted file mode 100644
index 92ba105ebf..0000000000
--- a/package/python-pam/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-comment "python-pam needs a toolchain w/ wchar, locale, dynamic library"
-	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_PYTHON_PAM
-	bool "python-pam"
-	depends on BR2_PACKAGE_PYTHON # C extension not compatible with python3
-	depends on BR2_ENABLE_LOCALE # linux-pam
-	depends on BR2_USE_WCHAR # linux-pam
-	depends on BR2_USE_MMU # linux-pam
-	depends on !BR2_STATIC_LIBS # linux-pam
-	select BR2_PACKAGE_LINUX_PAM
-	help
-	  PAM (Pluggable Authentication Module) bindings for Python.
-
-	  https://admin.fedoraproject.org/pkgdb/package/PyPAM/
diff --git a/package/python-pam/python-pam.hash b/package/python-pam/python-pam.hash
deleted file mode 100644
index 303455ae2f..0000000000
--- a/package/python-pam/python-pam.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  796ac019b9ee805696d0d277d8fb912fa2391b6ac070dc6f9f1a9a0fadbc3a5a  PyPAM-0.5.0.tar.gz
-sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/python-pam/python-pam.mk b/package/python-pam/python-pam.mk
deleted file mode 100644
index 943e01dd64..0000000000
--- a/package/python-pam/python-pam.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-pam
-#
-################################################################################
-
-PYTHON_PAM_VERSION = 0.5.0
-PYTHON_PAM_SOURCE = PyPAM-$(PYTHON_PAM_VERSION).tar.gz
-# pangalactic.org gone
-PYTHON_PAM_SITE = http://pkgs.fedoraproject.org/repo/pkgs/PyPAM/PyPAM-0.5.0.tar.gz/f1e7c2c56421dda28a75ace59a3c8871
-PYTHON_PAM_SETUP_TYPE = distutils
-PYTHON_PAM_LICENSE = LGPL-2.1
-PYTHON_PAM_LICENSE_FILES = COPYING
-PYTHON_PAM_DEPENDENCIES = linux-pam
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
