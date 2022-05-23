Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7055C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 22:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153AF61129;
	Mon, 23 May 2022 22:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQ968Krb9YtY; Mon, 23 May 2022 22:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 844BE60C01;
	Mon, 23 May 2022 22:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1E6F1BF337
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B042E81419
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9Kb5LayA3nz for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 22:46:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4573E8140B
 for <buildroot@buildroot.org>; Mon, 23 May 2022 22:46:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so582855pjq.2
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktehdeNBM+ULht2WpqGCLFvhb9yofGdRl7Q5vM31UqI=;
 b=hW+NJpqYg3aAebaHalLoyhCgo+QaiPD6y+HckszfBnJSeclg/86Wl7J0Pg6o0HjB8U
 YMeOwU/65Jv4HUfjVOZsfhFoEPor2fV9qXPJzaWqfDdDLEbWx4ze7bjVKjxDwAuYN659
 GFSXAviu2WeyTlKUsd4Kao9Kg234SCNvJBn5Ve0mqRGyFZqSRq50aoCtbRi//DbCzMXK
 e758tzKno6ZaT09+MgWmJs0Ch6RIhO+1Lm+yAlhF0VdIRAm5c7i1aE5MtyV0n2qOXcTQ
 u1VsEVC7PCo+cK9yeWWTRHs4MfH7m9GUfyxvVBsaHm03RULKjKYcnMBYNCvEazOitR1a
 5n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktehdeNBM+ULht2WpqGCLFvhb9yofGdRl7Q5vM31UqI=;
 b=y9wKsOYuR9bCCCvwsazzKW6/HIWk49Eu7FGM2U/ZigHFURAARyB0PSZFT3HnwhEhD+
 NZh4YMxWHfDGNeodg3arOU3ERFZ6/LL8fVoLx3tAHOCiQj60Zs9767YFQGUwhrt/eWeI
 nfXyJWX4AZxSDDyw0ME9cOXxU2hSVX0xxOaJV9hDW+pQRlubt5efeAOwKn7xdVWWdO19
 0YXQs4JIDpwYhdGHak3xflNsAWcxh8lSg4XR4uI8UCmyoZHNtgFSC7XXqG/JiNOuaXZ9
 4AucPWNxe9NINvYGFm/ke6B0RHzxR5zKYgJ0wcwleb7QkVAfYieHZZjh7D+vz4DXUb4e
 twyg==
X-Gm-Message-State: AOAM531l5bCibrjLjZMvlmbfdqG3CgzEWUKwCVOltdVklQ5vRonUh4XT
 HzTMs6kPDGo475EQNxeSf5NlysQeWmg=
X-Google-Smtp-Source: ABdhPJyHDljo7Pj1RIMSvh+auUKB98ADytOmxPuXIDO1JTalJuw3+r9FeneXQCzDWkSKat3Ve+TlPA==
X-Received: by 2002:a17:902:d091:b0:162:ad7:772e with SMTP id
 v17-20020a170902d09100b001620ad7772emr12051916plv.36.1653346011208; 
 Mon, 23 May 2022 15:46:51 -0700 (PDT)
Received: from adam-workstation.rai.com ([47.153.95.92])
 by smtp.gmail.com with ESMTPSA id
 p9-20020aa78609000000b0051878e8cc13sm6166676pfn.116.2022.05.23.15.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 15:46:50 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 15:46:46 -0700
Message-Id: <20220523224646.2151739-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523224646.2151739-1-aduskett@gmail.com>
References: <20220523224646.2151739-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pyqt5: bump to version 5.15.6
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
Cc: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Adam Duskett <aduskett@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Change the site from sourceforge to pypi.
- Remove upstream or uneeded patches.
- Change qtdetail.out to qtcore, as the qtdetail.out file is now QtCore.out
- Remove the QtWebEngineCore module, as the module has been moved to a separat
  PyQtWebEngine package.
- Add the --assume-shared option as Buildroot forces QT5 to be built as a shared
  library.
- Parallel install is not supported, as some install targets depend on
  previously installed targets first.

Tested with test-pkg -p python-pyqt5 -a in an ubuntu 20.04 container.
45 builds, 10 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-configure-skip-qtdetail.patch        | 37 +++++++++------
 .../0002-fix-QtCoremod.sip-syntax-error.patch | 29 ++++++++++++
 package/python-pyqt5/0002-fix-qt-5.6.2.patch  | 28 -----------
 ...uttonHint-and-WindowCancelButtonHint.patch | 27 -----------
 ...drop-qttest-qtestmouse-waitforevents.patch | 32 -------------
 package/python-pyqt5/python-pyqt5.hash        | 10 ++--
 package/python-pyqt5/python-pyqt5.mk          | 47 +++++++++----------
 7 files changed, 78 insertions(+), 132 deletions(-)
 create mode 100644 package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch
 delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
 delete mode 100644 package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
 delete mode 100644 package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch

diff --git a/package/python-pyqt5/0001-configure-skip-qtdetail.patch b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
index 2e7b331ed6..b82f89e004 100644
--- a/package/python-pyqt5/0001-configure-skip-qtdetail.patch
+++ b/package/python-pyqt5/0001-configure-skip-qtdetail.patch
@@ -1,4 +1,8 @@
-Do not run qtdetail
+From 7ed5e15f2de747e383ba7eee66b646a7a66e6654 Mon Sep 17 00:00:00 2001
+From: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
+Date: Wed, 29 Dec 2021 12:30:12 -0800
+Subject: [PATCH] Do not run qtdetail
+
 
 qtdetail is a tool that generates qtdetail.out. Since this program is
 cross-compiled, it's not possible to run it on the host.
@@ -11,19 +15,24 @@ file is kept, and that qtdetail is not executed.
 
 Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
----
-Index: PyQt5_gpl-5.7/configure.py
-===================================================================
---- PyQt5_gpl-5.7.orig/configure.py
-+++ PyQt5_gpl-5.7/configure.py
-@@ -672,10 +672,6 @@ int main(int argc, char **argv)
-         if cmd is None:
-             error("Failed to determine the detail of your Qt installation. Try again using the --verbose flag to see more detail about the problem.")
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 5.15.6
+
+diff --git a/configure.py b/configure.py
+index daa0f94..32f5b21 100644
+--- a/configure.py
++++ b/configure.py
+@@ -2455,10 +2455,6 @@ def run_test_program(mname, test, verbose):
  
--        # Create the output file, first making sure it doesn't exist.
--        remove_file(out_file)
--        run_command(cmd, verbose)
+     out_file = 'cfgtest_' + mname + '.out'
+ 
+-    # Create the output file, first making sure it doesn't exist.
+-    remove_file(out_file)
+-    run_command(test + ' ' + out_file, verbose)
 -
-         if not os.access(out_file, os.F_OK):
-             error("%s failed to create %s. Make sure your Qt installation is correct." % (cmd, out_file))
+     if not os.access(out_file, os.F_OK):
+         error("%s failed to create %s. Make sure your Qt installation is correct." % (test, out_file))
  
+-- 
+2.33.1
+
diff --git a/package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch b/package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch
new file mode 100644
index 0000000000..d83c5e525a
--- /dev/null
+++ b/package/python-pyqt5/0002-fix-QtCoremod.sip-syntax-error.patch
@@ -0,0 +1,29 @@
+From d004e17cd92f660cb386d91e14729a03cab087d4 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Sun, 22 May 2022 13:23:27 -0700
+Subject: [PATCH] fix QtCoremod.sip syntax error
+
+Fixes PyQt5/bindings/QtCore/QtCoremod.sip:23: syntax error from the
+python-sip-4 package.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ sip/QtCore/QtCoremod.sip | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sip/QtCore/QtCoremod.sip b/sip/QtCore/QtCoremod.sip
+index b525bc5..1e2b8ba 100644
+--- a/sip/QtCore/QtCoremod.sip
++++ b/sip/QtCore/QtCoremod.sip
+@@ -20,7 +20,7 @@
+ // WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+ 
+ 
+-%Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", use_limited_api=True, py_ssize_t_clean=True)
++%Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", use_limited_api=True)
+ 
+ %Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_6_3 Qt_5_6_4 Qt_5_6_5 Qt_5_6_6 Qt_5_6_7 Qt_5_6_8 Qt_5_6_9 Qt_5_7_0 Qt_5_7_1 Qt_5_8_0 Qt_5_8_1 Qt_5_9_0 Qt_5_9_1 Qt_5_9_2 Qt_5_9_3 Qt_5_9_4 Qt_5_9_5 Qt_5_9_6 Qt_5_9_7 Qt_5_9_8 Qt_5_9_9 Qt_5_10_0 Qt_5_10_1 Qt_5_11_0 Qt_5_11_1 Qt_5_11_2 Qt_5_11_3 Qt_5_12_0 Qt_5_12_1 Qt_5_12_2 Qt_5_12_3 Qt_5_12_4 Qt_5_13_0 Qt_5_14_0 Qt_5_15_0}
+ 
+-- 
+2.36.1
+
diff --git a/package/python-pyqt5/0002-fix-qt-5.6.2.patch b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
deleted file mode 100644
index fd2f9d9069..0000000000
--- a/package/python-pyqt5/0002-fix-qt-5.6.2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix the build with Qt 5.6.{2,3}
-
-Building PyQt 5.7 with versions of Qt older than Qt 5.7 is supposed to
-work, but currently fails in practice. In fact, this is due to the
-fact that the %Timeline variable in QtCoremod.sip didn't contain the
-5.6.{2,3} Qt versions, so if this version was used, PyQt was assuming it
-was the later version 5.7, and therefore started enabling APIs only
-available in Qt 5.7, causing build failures when building against Qt
-5.6.{2,3}.
-
-Adding Qt_5_6_2 and Qt_5_6_3 to the timeline fixes this problem. This
-fix was suggested by Phil Thompson <phil@riverbankcomputing.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip
-===================================================================
---- PyQt5_gpl-5.7.orig/sip/QtCore/QtCoremod.sip	2016-07-25 15:55:37.000000000 +0200
-+++ PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip	2016-10-26 15:45:43.577153825 +0200
-@@ -22,7 +22,7 @@
- 
- %Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", version=1)
- 
--%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_7_0}
-+%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_6_3 Qt_5_7_0}
- 
- %Platforms {WS_X11 WS_WIN WS_MACX}
- 
diff --git a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch b/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
deleted file mode 100644
index 146cce0348..0000000000
--- a/package/python-pyqt5/0003-remove-WindowOkButtonHint-and-WindowCancelButtonHint.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bb7cbdede46f72468bbb1b9bbefd43a1dbad21c0 Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Mon, 30 Jan 2017 18:28:15 +0100
-Subject: [PATCH] remove WindowOkButtonHint and WindowCancelButtonHint from
- qnamespace.sip as they are removed from qt5.8
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- sip/QtCore/qnamespace.sip | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/sip/QtCore/qnamespace.sip b/sip/QtCore/qnamespace.sip
-index 2db83b7..559f410 100644
---- a/sip/QtCore/qnamespace.sip
-+++ b/sip/QtCore/qnamespace.sip
-@@ -209,8 +209,6 @@ namespace Qt
-         WindowContextHelpButtonHint,
-         WindowShadeButtonHint,
-         WindowStaysOnTopHint,
--        WindowOkButtonHint,
--        WindowCancelButtonHint,
-         WindowStaysOnBottomHint,
-         WindowCloseButtonHint,
-         MacWindowToolBarButtonHint,
--- 
-2.7.4
-
diff --git a/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch b/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch
deleted file mode 100644
index 352be9aee0..0000000000
--- a/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Drop waitForEvents() method from qtestmouse
-
-This method was dropped in Qt 5.11:
-
-  https://github.com/qt/qtbase/commit/75e583b3fcbdbbb999633eb5f2267720dd695cfa
-
-However, Python PyQt5 still generates a wrapper for it, causing a
-build failure. The upstream PyQt5 maintainers have not kept
-waitForEvents() support for older Qt versions, and instead entirely
-dropped it unconditionally. This can be verified by diffing PyQt 5.10
-and PyQt 5.11. We take the same approach, and drop waitForEvents()
-unconditionally, even when PyQt5 is built against the older Qt 5.6.
-
-Fedora is using a similar solution:
-https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master.
-
-This patch can be dropped when PyQt5 is bumped to its 5.11 version.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-
-Index: b/sip/QtTest/qtestmouse.sip
-===================================================================
---- a/sip/QtTest/qtestmouse.sip
-+++ b/sip/QtTest/qtestmouse.sip
-@@ -41,7 +41,6 @@
-     void mousePress(QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier = 0, QPoint pos = QPoint(), int delay = -1);
-     void mouseRelease(QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier = 0, QPoint pos = QPoint(), int delay = -1);
-     void mouseEvent(QTest::MouseAction action, QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier, QPoint pos, int delay = -1);
--    void waitForEvents() /ReleaseGIL/;
-     void mouseEvent(QTest::MouseAction action, QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier, QPoint pos, int delay = -1);
-     void mousePress(QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier = Qt::KeyboardModifiers(), QPoint pos = QPoint(), int delay = -1);
-     void mouseRelease(QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier = Qt::KeyboardModifiers(), QPoint pos = QPoint(), int delay = -1);
diff --git a/package/python-pyqt5/python-pyqt5.hash b/package/python-pyqt5/python-pyqt5.hash
index 8ef467a27b..d1b7adf8c1 100644
--- a/package/python-pyqt5/python-pyqt5.hash
+++ b/package/python-pyqt5/python-pyqt5.hash
@@ -1,6 +1,6 @@
-# md5 from http://http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.7, sha256 locally computed
-md5	e3dc21f31fd714659f0688e1eb31bacf  PyQt5_gpl-5.7.tar.gz
-sha256	892693ba5f79989abb2061dad2d5c4e6f127e9dd3240f73f8220c7152cd35b05  PyQt5_gpl-5.7.tar.gz
+# From https://pypi.org/pypi/PyQt5/json
+md5  0c7fca60aa6ee13c235f68576d9c7bed  PyQt5-5.15.6.tar.gz
 
-# Hash for license file
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
+# Locally calculated
+sha256  80343bcab95ffba619f2ed2467fd828ffeb0a251ad7225be5fc06dcc333af452  PyQt5-5.15.6.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index af32f63796..54b7f201b8 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYQT5_VERSION = 5.7
-PYTHON_PYQT5_SOURCE = PyQt5_gpl-$(PYTHON_PYQT5_VERSION).tar.gz
-PYTHON_PYQT5_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt5/PyQt-$(PYTHON_PYQT5_VERSION)
+PYTHON_PYQT5_VERSION = 5.15.6
+PYTHON_PYQT5_SOURCE = PyQt5-$(PYTHON_PYQT5_VERSION).tar.gz
+PYTHON_PYQT5_SITE = https://files.pythonhosted.org/packages/3b/27/fd81188a35f37be9b3b4c2db1654d9439d1418823916fe702ac3658c9c41
 PYTHON_PYQT5_LICENSE = GPL-3.0
 PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
@@ -91,13 +91,6 @@ PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
 PYTHON_PYQT5_MODULES += QtWebChannel
 endif
 
-ifeq ($(BR2_PACKAGE_QT5WEBENGINE),y)
-PYTHON_PYQT5_DEPENDENCIES += qt5webengine
-PYTHON_PYQT5_MODULES += \
-	QtWebEngineCore \
-	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebEngineWidgets)
-endif
-
 ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
 PYTHON_PYQT5_DEPENDENCIES += qt5webkit
 PYTHON_PYQT5_MODULES += \
@@ -120,27 +113,27 @@ PYTHON_PYQT5_DEPENDENCIES += qt5xmlpatterns
 PYTHON_PYQT5_MODULES += QtXmlPatterns
 endif
 
-PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
+PYTHON_PYQT5_QTCORE_LICENSE = Open Source
 
-PYTHON_PYQT5_QTDETAIL_TYPE = shared
+PYTHON_PYQT5_QTCORE_TYPE = shared
 
 # Turn off features that aren't available in current qt configuration
-PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
-PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
-PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
+PYTHON_PYQT5_QTCORE_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
+PYTHON_PYQT5_QTCORE_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
+PYTHON_PYQT5_QTCORE_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
 
-define PYTHON_PYQT5_QTDETAIL
-	echo $(1) >> $(2)/qtdetail.out
+define PYTHON_PYQT5_QTCORE
+	echo $(1) >> $(2)/cfgtest_QtCore.out
 endef
 
-# Since we can't run generate qtdetail.out by running qtdetail on target device
+# Since we can't run generate cfgtest_QtCore.out by running qtdetail on target device
 # we must generate the configuration.
-define PYTHON_PYQT5_GENERATE_QTDETAIL
-	$(RM) -f $(1)/qtdetail.out
-	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_LICENSE),$(1))
-	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_TYPE),$(1))
-	$(foreach f,$(PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES),
-		$(call PYTHON_PYQT5_QTDETAIL,$(f),$(1)) \
+define PYTHON_PYQT5_GENERATE_QTCORE
+	$(RM) -f $(1)/cfgtest_QtCore.out
+	$(call PYTHON_PYQT5_QTCORE,$(PYTHON_PYQT5_QTCORE_LICENSE),$(1))
+	$(call PYTHON_PYQT5_QTCORE,$(PYTHON_PYQT5_QTCORE_TYPE),$(1))
+	$(foreach f,$(PYTHON_PYQT5_QTCORE_DISABLE_FEATURES),
+		$(call PYTHON_PYQT5_QTCORE,$(f),$(1)) \
 	)
 endef
 
@@ -158,10 +151,11 @@ PYTHON_PYQT5_CONF_OPTS = \
 	--no-designer-plugin \
 	--no-docstrings \
 	--no-sip-files \
+	--assume-shared \
 	$(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
 
 define PYTHON_PYQT5_CONFIGURE_CMDS
-	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
+	$(call PYTHON_PYQT5_GENERATE_QTCORE,$(@D))
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -177,7 +171,8 @@ endef
 # __init__.py is needed to import PyQt5
 # __init__.pyc is needed if BR2_PACKAGE_PYTHON_PYC_ONLY is set
 define PYTHON_PYQT5_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
+	# Parallel install is not supported.
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) install
 	touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/__init__.py
 	$(RM) -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/uic/port_v2
 endef
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
