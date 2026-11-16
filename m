Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFC606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hfj8LJSZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfO8iUo6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51B240836;
	Mon, 16 Nov 2026 15:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo_Lcs-Gi3pa; Mon, 16 Nov 2026 15:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2C7840849
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794844627;
	b=Il7H2rq4/761ymu0+vy3+DplyiTJcxgEqufNeT86tILgbK1UVGFa8NCJnU0pWHN2OGOi
	 zIQxcIzGAGqJXmPndCzB20IHMyXPptLVHKK8gSWTcOfdM2CPQCC0b8NbuQ0DXD+tCl7wm
	 44q6BuT0cBAcGTwYUmmXAluESZFyccVvqLgFyVP8mjfzuIA65tDzu2N7AEXKgJRMOsRvT
	 8+A0ikFli1i3ocRo9FEEdKXEe4HmOyQEZISyjyd9qAt/FiDbgWhHeO5VaAF63+Ir/khI1
	 JpAVv/ugpKY4+wfBF57zLxlBQlZ/3L84ewvOimYDG0FPr/bqiYPuwV58UYgPiXOYb7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844627;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X3vEZNQ0nMCRTQiTi9OraonkPCHGyor69UUsGDVsJvc=;
	b=YcN9G3IcKpIvqkZpG6A+sReCsSCghRU5UXAIeQjwdn4pMUg6b3gQAUKwfsKvblMCIOFr
	 ksybTvKlc08snesItVMvYiSf3XVB1VL//M73mIh3qq13PhItWE2MKkCeuB6UlgEZIZo/o
	 /YCGT4egF3wIlC8aZ9u9ag21Nrseel14MpPv0nx9235Rn30jEstcgb5iHWhTG8O9yv+Yf
	 Hz1r7aNf+nfmRJs9r6lr63hh+2lOsgBoXLNedc92n0JL5F+s95knK5ZOKbtdc7lw7Gi22
	 bAV4+MXwGFScuJBpAZ0mZ0xvn8gAxjF3sV56eWs2CNxcnCzaPnbhyCg8gNW4CiBBQPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794844627;
	bh=X3vEZNQ0nMCRTQiTi9OraonkPCHGyor69UUsGDVsJvc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hfj8LJSZkcor9pqsxZpsddo9jdJarzZ7lu5YjUA0vneg5M4cCwip6FwVMVVmwQh+X
	 d1kqBxonTBYEbe5OrWd+Lz0kn8vd7BMHZUfOoUqXVFgX+l2D85URQkp2y6B82dUYSM
	 mMsueSgnPsWG3Mie7AIwhKC9A6iu6EEVuzykmQ4TgPMlG2E9FytBJTjBzH30OLYlqt
	 x/juGuMP5Xl/Z9gUUHwWCd5uITVpPlxF7hZIq6sdzWLxqncFnGjUFSqRmRUo4Zkeky
	 OEx57dx3HYycwbz7d20Qk0zdtcCi5GInX66MQ85y0BZ0MCKox6mncCr+nJ+2C5d1Yv
	 XGnOjHaI91q8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C7840849;
	Mon, 16 Nov 2026 15:57:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D49A2FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AE9840282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBrt86eqFkft for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E28B4009E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=YfO8iUo6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E28B4009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4a34ffd3e39so21074f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794844620; x=1795449420; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KI3fZq70Vb5vvmPP9zBQACWD8Wsj2jSHhmAM5xxezv8=;
 b=YfO8iUo637K+pCs87vIX8xCwsySjoscMt67vOjAoAgbdCz0YZYEaEoVlJjHsP4N0Ic
 45gy2wx2sprj9ZQ0igXsDH9iNMJ4AH/pv0rIPc6R5nOz5LfPgaznzJCARC1c5nYh/U0V
 KlpOyrLDjyVasLXc1y2MyZQYcy5xmACgqFRH1+3YGq8qu80p8DcS+oAEKUyKlwTXJ2yQ
 AShvEkY0iCLlKQIsfWI4C1vBx3XWuJxIR4fLNafgRPvzty0jOFcq8WkMJUPsWk+h1B06
 jmVWquSSnvT+nLveAh1oaA41ykUVhzNuoXh5LapADrSt2uk+ofVcc2ULQPNfvILkNQiU
 x6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794844620; x=1795449420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KI3fZq70Vb5vvmPP9zBQACWD8Wsj2jSHhmAM5xxezv8=;
 b=qJyCVMFS43ZPD2lr23b18ikRCHZo188xvpVv0egRKbLUZL8mwA+lwHzNLG7QlzHa4X
 oA4i9Ij0fcRyeVRssvSbSB2Zzh5ElkKVrNeyM9NvoSdhnBbO1yeZ38n5w278KmZ5DBQ0
 5M7JcBrEBdsgBYundK6eHny1TsnNo5in5UoB44xuvKu8EzgtEwt+NLKLPHjtTziQenP3
 j9iDGEVnb3dh6zHIu0Tnjdp+Q5bVjiN6AZU3XWOqWQyVCtWmHZS8w64Lil+U6r2IcTim
 tVjzmFz1K2kNNCQlTmh3HWCTrpSDgZrHVa0RtNcB9YTSwdSN5clPvBcUC/hix5BLUxrO
 dSsA==
X-Gm-Message-State: APuU4Z/asrpArvdgY7MniRSc8vfs5h1DVLa2KMix2LrU8DvvWU8sAPpZ
 dHNXUHQZee1ftzrQd+cLP1r4eGwZdjt8Ds34qbSqfeN+NX2oClFEqj5SWI+LQ4J/
X-Gm-Gg: AZFdTZeMMqbmbSUy8iAlcUrsXVaMopile5WaSXHbKOh+96fZjDqCpdiqyaDFHCTMsew
 sY0tzvE3KQv/UxdFPuz4HExDUBlSodzbM1rONDQbvCL7WP0I0E1+T7o3ZHkqitii6LOsDkV4BBK
 BxC1ssvmgHvBViZwBVEfCh+PCjyksFpmulUmUmiepXeEc6G6c4wzTwEKIErXed7z4XZ4fujGhIn
 +Yldu087whbQKTupqIkZKo/dHArujMxn5NODIPBgDwTsjlqxkXPPLHXcEXKhGCQ3zYUzuAL1B8b
 bqtJSVQUHFNj2jHXS0OnGX6TntCrxmNV3/XtjEV7iCKenF3bvp89FsjKZ1g5Yxq/ret16Gq8eEq
 I7QD/m9Ci7htfk1fkcdO4glhjsZ3xMAcOAcHyb0Xv/shgtmjJzPH5lvCGhAz+fr2ojyl+8HPKPO
 uqonWHaYLXD8Qrm4E0Ql6eNw8iApfvjOiS4RsSww9mYHeY3sUC0rUfy8oH1h34JrjIlUNqBGlV7
 dU7aDbDyrNVz7+NxtE8w7MAjHYGC2nWqUHGNJTAEok9VrfqSwWXpGnm+QSgLPknBzKogp8V+JKP
 0GjjCaccJ2iLh0va5oXLctuDFCCDJLpu5fxw7ig8mgSsC4KEivDJYLtn2BNnKXQW4Og77Vm/+w=
 =
X-Received: by 2002:a5d:5e01:0:b0:488:8ab9:f74c with SMTP id
 ffacd0b85a97d-49c6fc9dbd2mr25048254f8f.3.1794844619809; 
 Mon, 16 Nov 2026 07:56:59 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm23357063f8f.10.2026.11.16.07.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:56:59 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dylan Bespalko <dylan.bespalko@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Nov 2026 16:56:52 +0100
Message-ID: <20261116155652.4181839-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/3] support/testing: add python-pyside6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dylan Bespalko <dylan.bespalko@gmail.com>

The test imports the PySide6 modules, and uses a class of each one.

It runs with the offscreen Qt platform plugin, so it needs no display.

Signed-off-by: Dylan Bespalko <dylan.bespalko@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
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
