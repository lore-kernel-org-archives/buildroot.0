Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B50606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lzCh7xi4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCSNSz4s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90521810D6;
	Mon, 16 Nov 2026 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF5i2FHuOX1U; Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF3B181097
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864986;
	b=rH8ZrCFFvlXusek2fZ2KUEiykX87hLz3d8MucikeQ0ujiL82pIABLiQ+ocfINgA6LORP
	 y6ftLrGairoDsp+ND3qk/dGru3PFBc+BrR4kjPDmyr/l7N2uDfqUOutsi9KnLIdZSzpHm
	 WJoEqN13KlSSi/Qj4BX26PpkWo1/1SO/BvYPijxhKVruSDbHLwPr1AwWa50S0dL6Z1RST
	 Po2/D9TguhOh+WPsZqW5t8wvvYFHBxRBXND0cuHQpk4tfJZsLfR6r0pdJ3wfih/qJJIS1
	 O6EDs443RYQILuX9ZAr0buY/tI8dRazEgY+8WSj40JlrK2+nw8mSLBqRgFBmoTeuNmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bexCT6I1Te9i4YMxpH/5bQj4RyCpNYdJOBkpDfBOlj8=;
	b=eNBF3CALoTGd7fCdg6THwFkaelU0Z0j2lPtYgxgsaOzrSrHymSOEgB6IA0ucstxUdNLG
	 W8Wkmztq8qQSNi/LY+HhSqppHAAtjrzDU4a8BOmyw+RwhU75yaTcj4UvqQ0lqO9HWoqps
	 /AtJzMetLqGaHtvahXxg+Rk0NTJfX7nv00ffVHJm7zfibu72Q0cCIEzqBUBeUqpyVfICy
	 V9BpsYmJlWz3aJ4lxNPOVhZaaER1tdl0iReX5Rh5kcUi+Tp6sxrXZGYJsXFl3dC42o2CC
	 FRYLndbd20hsKtx2nASmUgy+GXvpxn3J7sl0pM6uzhHqdjbGbpx5iXKvJHdRXG7Zw1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCSNSz4s;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864986;
	bh=bexCT6I1Te9i4YMxpH/5bQj4RyCpNYdJOBkpDfBOlj8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lzCh7xi4Qjcfrobjx5r4kr0ccTO5ly1D7XMwK5g+SMlm11+1JNAEq98w4ZQuVD/8g
	 V8qNA46c7qL/tDKaCxMErIIVGt6v63UGm5CyLaNAuwJkCqN72rzmjhCuqm6sX8zMP1
	 wyr+Yl/i4TGVuXZjEIrDWhmCL5iLoRkgLzfcclGneH71tR4CPhH3EZc2R+4QkbDyzU
	 1v9Mh089B9efkMLRZ8rqT76RgN4P8eboLu82nkUzKElHXj81pModaEQ43W/rGlmlM5
	 dBEtaCkbOaxtUl+W28gLmedRpDsBesdMDRgvbwm5haWmtENWOY+W9HUki7ai2neOaa
	 Q8nhi/jGHV8tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3B181097;
	Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BD631A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714218109F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 844y3p9vfvba for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EB4E78101A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BCSNSz4s
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB4E78101A
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so1580706f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864982; x=1795469782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K8zmeSgxAcVDORLUK6HIP4m2LUyRUSBVQ7mJwnb1mmw=;
 b=BCSNSz4sqByUFwMZmZTn6x7CSS8P3ETgbvyBQDYsjNyBGGuOBd0YRLdkv/3xgMNaPn
 QfMhbwBJgnU40MD1hEWsP2e1D7YEFZSIRz30nYT6X3GZjD3LNtoYD4rVtgoMQ6+V0uqJ
 Aa/IpLNvHc1NBl6e3GQD33JxgAHv9HWgemlj3+UWXbdyTiWhdcZZLuEOjavc83vSOpCp
 rcfqs/AefQqgNAEAYomeai0e4d66Vl+tE5zdDYHu2Ifc2Ug4cy1rv3qL3ptcq2BriiyL
 TDN/Zsp8aOBey7r1JVY4rZ6P+YqJjaGRwYU+bBeDdh3WSlJyHtPmLkDshsot79KZl+D2
 jQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864982; x=1795469782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K8zmeSgxAcVDORLUK6HIP4m2LUyRUSBVQ7mJwnb1mmw=;
 b=k5aQqpceRwAoH6EV3UuaObPoMd61KFAV2P0GBoS5yB12eUopQ8SejIVpH9nvmkg0ik
 J8zo6ZVxlvHatLsJ1RfH8CmMUPSoGsQCn959+jZDvIU4vrkCri4Ou/wnfVZ0OwbRBszg
 CPxpjT5uxrmWvNP03dzSp9ntHSEtLQ2HwvP5b4Zur9q74nBs27UZWHntBMJPajGDZcxy
 6g7NYlz36ye3I5h4orTc9iT6yUqbbQ7VK6hKL3nuvmevZSE4oRKBmwkgWITqAwyXZ2JT
 LS3u3gb/ipkXFSf4KZ4hH5zPBsv6UoS/t+QykRf9WV5HpRRLJKxffQ5i3BSvn5ajF2aA
 m7lA==
X-Gm-Message-State: APuU4Z9YA1s/PCeEpI/IPacizF/Vv5KMfLfQXyZVEf+rDywBmCkNKDBz
 F/67VKEhmsHflPTfSgXCLHiQ5PEDBwQoNK4NwbTTOLd8UsUQHuuFO+JVkYujowIC
X-Gm-Gg: AZFdTZcaoP0Dt1k1GlID3oR5DHMFTO5GK1OIgq5kLnjOXKh5vUxg/XMt116qYCveDJS
 Lbd1nZ5XliDarCFPVyq1HQ0lTnJ06it6I3mIsKb07GSaCYXAMJWgNWnBs2hb4UyB9OBARqJIF5j
 rYd/fPVJylXoZ+WFgJA3umxazY893QDFLOpYPP/tItELYbhif+MNP4pqLytdrmfXE0eown59wSO
 YV/46fKQsyjoGw43GEG2zDml039NlejofRmHPbmpsPCFMTVRe7X5Z6NkLrXw/BqZUKXGrYgkn4D
 k9XmbenkqdSAvzfczA89mYFfMKi+mXurTMK1yUhiYfOjW0bNSYSQ+IgyrRoOaWURQRvGpAHgd2b
 aOGwKxU4afcHAk8pSrgYAGDhTR47d0iujJEtO0NDLoMdoXbb+0cCVEc8OKEHBdVw/HENltBjW4M
 syp/xWRJMiS+mwWYeTSF9rDaGdNhk997BP3qdBhQmfEcgvlajo1ZJfPktDjHiJETSYrecVthK0H
 tapO9TA16peNGSaFETjA15w3fQf+IKcHR3mkUSfSQFrOeFRjW94Ww3S4SozAm7l6ELsQWgWQouz
 sL3b8BX0QVhNod66rpWJNHuRccT5g49vZxPO2Dp6iJZuEZYVHjjE9krR80FUUouiwZEnF6YTdw=
 =
X-Received: by 2002:a05:6000:4305:b0:4a4:368:409d with SMTP id
 ffacd0b85a97d-4a403684316mr52343f8f.3.1794864981463; 
 Mon, 16 Nov 2026 13:36:21 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:20 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:10 +0100
Message-ID: <20261116213612.873856-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
 <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/5] support/testing: add python-pyside6
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dylan Bespalko <dylan.bespalko@gmail.com>

The test imports the PySide6 modules, and uses a class of each one.

It runs with the offscreen Qt platform plugin, so it needs no display.

Signed-off-by: Dylan Bespalko <dylan.bespalko@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v4 -> v5:
  - No change

Changes v3 -> v4:
  - Split from the package patch
  - Use the current mesa3d options and an ext4 root filesystem
  - Look up the QML files with QLibraryInfo
  - Write the asserts as statements, for flake8
  - DEVELOPERS: v3 had the test files in a new entry for Dylan. v4 has
    them in my entry. Dylan, tell me if you want to be listed

 DEVELOPERS                                    |   2 +
 .../tests/package/sample_python_pyside6.py    | 165 ++++++++++++++++++
 .../tests/package/test_python_pyside6.py      |  63 +++++++
 3 files changed, 230 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pyside6.py
 create mode 100644 support/testing/tests/package/test_python_pyside6.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..14aac54303 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -265,6 +265,8 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/package/sample_python_pyside6.py
+F:	support/testing/tests/package/test_python_pyside6.py
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/support/testing/tests/package/sample_python_pyside6.py b/support/testing/tests/package/sample_python_pyside6.py
new file mode 100644
index 0000000000..f2677c6286
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyside6.py
@@ -0,0 +1,165 @@
+import os
+
+
+def qml_file(name):
+    from PySide6.QtCore import QLibraryInfo
+    qml_dir = QLibraryInfo.path(QLibraryInfo.LibraryPath.QmlImportsPath)
+    return os.path.join(qml_dir, name)
+
+
+# The essential modules: ALL_ESSENTIAL_MODULES in PySideHelpers.cmake
+def test_python_pyside6_qt():
+    from PySide6.QtCore import Qt
+    enum = Qt.white
+    assert str(enum) == 'GlobalColor.white'
+
+
+def test_python_pyside6_qtcore():
+    from PySide6 import QtCore
+    obj = QtCore.QObject()
+    obj.setObjectName('MyObject')
+    assert obj.objectName() == 'MyObject'
+
+
+def test_python_pyside6_qtgui():
+    from PySide6 import QtGui
+    color = QtGui.QColor.fromRgb(255, 255, 255, 255)
+    assert color.name(QtGui.QColor.HexArgb) == "#ffffffff"
+
+
+def test_python_pyside6_qtwidgets():
+    from PySide6 import QtWidgets
+    app = QtWidgets.QApplication()
+    label = QtWidgets.QLabel('Hello World')
+    assert label.text() == 'Hello World'
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtprintsupport():
+    from PySide6 import QtWidgets
+    from PySide6 import QtPrintSupport
+    app = QtWidgets.QApplication()
+    p = QtPrintSupport.QPrinter()
+    assert p.creator() == ''
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtsql():
+    from PySide6 import QtSql
+    db = QtSql.QSqlDatabase()
+    assert db.hostName() == ''
+
+
+def test_python_pyside6_qtnetwork():
+    from PySide6 import QtNetwork
+    host_info = QtNetwork.QHostInfo()
+    assert host_info.localHostName() == 'buildroot'
+
+
+def test_python_pyside6_qttest():
+    from PySide6 import QtTest
+    text = QtTest.QTest.toPrettyCString('hello there', 5)
+    assert text == '"hello"'
+
+
+def test_python_pyside6_qtconcurrent():
+    from PySide6 import QtConcurrent
+    future = QtConcurrent.QFutureQString()
+    assert future.isRunning() is False
+
+
+# The optional modules: ALL_OPTIONAL_MODULES in PySideHelpers.cmake
+def test_python_pyside6_qtdbus():
+    from PySide6 import QtDBus
+    message = QtDBus.QDBusMessage()
+    assert message.errorMessage() == ''
+
+
+def test_python_pyside6_qtxml():
+    from PySide6 import QtXml
+    doc = QtXml.QDomDocument('temp.xml')
+    assert doc.toString() == ''
+
+
+def test_python_pyside6_qtopengl():
+    from PySide6 import QtOpenGL
+    log = QtOpenGL.QOpenGLDebugLogger()
+    assert log.isLogging() is False
+
+
+def test_python_pyside6_qtopenglwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtOpenGLWidgets
+    app = QtWidgets.QApplication()
+    _ = QtOpenGLWidgets.QOpenGLWidget()
+    # QOpenGLWidget is not supported on this platform: only create it.
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtquickcontrols():
+    from PySide6 import QtWidgets
+    from PySide6 import QtQuick
+    app = QtWidgets.QApplication()
+    view = QtQuick.QQuickView()
+    assert str(view.status()) == 'Status.Null'
+    view.setSource(qml_file('QtQuick/Controls/Universal/Label.qml'))
+    assert str(view.status()) == 'Status.Ready'
+    view.close()
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtquickwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtQuickWidgets
+    app = QtWidgets.QApplication()
+    view = QtQuickWidgets.QQuickWidget()
+    assert str(view.status()) == 'Status.Null'
+    view.setSource(qml_file('QtQuick/Controls/Universal/Label.qml'))
+    assert str(view.status()) == 'Status.Ready'
+    QtWidgets.QApplication.shutdown(app)
+
+
+def test_python_pyside6_qtserialport():
+    # The port does not need to exist: the test never opens it.
+    from PySide6 import QtSerialPort
+    ser = QtSerialPort.QSerialPort()
+    ser.setPortName('/dev/tty')
+    assert ser.portName() == 'tty'
+
+
+def test_python_pyside6_qtsvg():
+    from PySide6 import QtSvg
+    renderer = QtSvg.QSvgRenderer()
+    renderer.setFramesPerSecond(30)
+    assert renderer.framesPerSecond() == 30
+
+
+def test_python_pyside6_qtsvgwidgets():
+    from PySide6 import QtWidgets
+    from PySide6 import QtSvgWidgets
+    app = QtWidgets.QApplication()
+    widget = QtSvgWidgets.QSvgWidget()
+    widget.setObjectName('MyObject')
+    assert widget.objectName() == 'MyObject'
+    QtWidgets.QApplication.shutdown(app)
+
+
+if __name__ == "__main__":
+    test_python_pyside6_qt()
+    test_python_pyside6_qtcore()
+    test_python_pyside6_qtgui()
+    test_python_pyside6_qtwidgets()
+    test_python_pyside6_qtprintsupport()
+    test_python_pyside6_qtsql()
+    test_python_pyside6_qtnetwork()
+    test_python_pyside6_qttest()
+    test_python_pyside6_qtconcurrent()
+    test_python_pyside6_qtdbus()
+    test_python_pyside6_qtxml()
+    test_python_pyside6_qtopengl()
+    test_python_pyside6_qtopenglwidgets()
+    test_python_pyside6_qtquickcontrols()
+    test_python_pyside6_qtquickwidgets()
+    test_python_pyside6_qtserialport()
+    test_python_pyside6_qtsvg()
+    test_python_pyside6_qtsvgwidgets()
diff --git a/support/testing/tests/package/test_python_pyside6.py b/support/testing/tests/package/test_python_pyside6.py
new file mode 100644
index 0000000000..d93be0bb26
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyside6.py
@@ -0,0 +1,63 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+# gitlab-runner: 2xlarge
+class TestPythonPy3PySide6(TestPythonPackageBase):
+    __test__ = True
+    # This test needs its own configuration:
+    # - Aarch64, to have more than 256 MB of memory;
+    # - an ext4 root filesystem on a virtio disk, not a cpio initrd.
+    #   The image is big, and this saves memory.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_PACKAGE_QT6=y
+        BR2_PACKAGE_QT6BASE_GUI=y
+        BR2_PACKAGE_QT6BASE_WIDGETS=y
+        BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
+        BR2_PACKAGE_QT6BASE_SQL=y
+        BR2_PACKAGE_QT6BASE_SQLITE=y
+        BR2_PACKAGE_QT6BASE_NETWORK=y
+        BR2_PACKAGE_QT6BASE_TEST=y
+        BR2_PACKAGE_QT6BASE_CONCURRENT=y
+        BR2_PACKAGE_QT6BASE_DBUS=y
+        BR2_PACKAGE_QT6BASE_XML=y
+        BR2_PACKAGE_QT6BASE_OPENGL=y
+        BR2_PACKAGE_QT6BASE_DEFAULT_QPA="offscreen"
+        BR2_PACKAGE_QT6DECLARATIVE=y
+        BR2_PACKAGE_QT6DECLARATIVE_QUICK=y
+        BR2_PACKAGE_QT6SERIALPORT=y
+        BR2_PACKAGE_QT6SERIALBUS=y
+        BR2_PACKAGE_QT6SVG=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYSIDE6=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pyside6.py"]
+    timeout = 60
+
+    def login(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
