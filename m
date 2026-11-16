Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720A606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OapqIgf8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y62wL5yb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 398448107F;
	Mon, 16 Nov 2026 21:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq7a8vuQ6j5L; Mon, 16 Nov 2026 21:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C92AA8108A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864569;
	b=OS2mMWFiHtudJCYD1ry9kHeontvCtzxwjjS9e/oIRp0SY1JX6vzkRQ8L8Nauon2n8Xkm
	 bWOD6DmJTUqJLWL/mesle9IUHjTqQwMwX8KRFaPLshmSVIoFXz5EGWfCJpO6uUdCbp/B2
	 Ub+y9hpi1n0CSCc8IVBswflkrVB9E/qjV209C9Dxy6isg7E/2s+opFmYxgYZcip3B5MJe
	 rdzemezf0gJir2uNXZ/P4p2d/cr1VYvepK0lGWZl4CQofes7rmG26Ddyiy/E/XmhKhw6b
	 5AWRRGhUufn4R69aGYY8LdVYbL/DmdM8BBuio5vGUAehiPjNxg61bYrHUhAvAdg4bNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X3vEZNQ0nMCRTQiTi9OraonkPCHGyor69UUsGDVsJvc=;
	b=OjF63TVckRY/9Z5qSAAP+G0pDG/keblvrm/MzVXfustyYxLddYMzNbmbU0Pn8Og1LDhL
	 IYlUQ3fix5/2MBhZnip9ge1VmTYOZ1wyzfTRaaTJNDwhAb9rqCK3zRl+PnPLRmar0iPN6
	 jGJsZpEYJGWpum01CjCXtnpFbXuuqxUCefdKXtqa8K2Ps4+g8Nqqq0ZTjBXxo3+3Giraa
	 f0zmmzY+ugiOjnGrgnd6aCchfc8e78nah9etw+Inreed9oh9d7YKWTWoTDYt5RTzqWRpT
	 TXffC+X74V3oIXq37P4o7dDz0NTn1fY1JOlqyurjhWybmQ+5ublTJslo82ncza12nNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864569;
	bh=X3vEZNQ0nMCRTQiTi9OraonkPCHGyor69UUsGDVsJvc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OapqIgf8PPBdv7Xe8ZYGTEHJnLTEwentStMsmvrysYn44oyA9A+0bQQiJG1jJNFy2
	 VBzxvWna1ffB2O/gwIPyvnFtWAcCibL3txfWEkqQp6aa/HUEvv3ITm5u3jBP66WDzl
	 DakcIUZx95KFHu+/EmNypzJQjDIz2cBtUPMAXILdO/zIXls9QfBsNtPAKf98hyCyM7
	 p1KGjz4Yn9q16+lNcgHKPHk5/yEzR3FhE+bOHJ+WkP1zjymVYIZseQu9rRdIQ22eHL
	 txeyIo3mTK3MyGNSxf9Ue2Io6jnfHbltedMh+HDR+QGtNTApZ5ej0lCVB5fHDXrfcT
	 CsY6ECHpLTViw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92AA8108A;
	Mon, 16 Nov 2026 21:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82D621A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74128402CA
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGVN8ipC7bwr for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 497B9402CD
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Y62wL5yb
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 497B9402CD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso32820655e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864562; x=1795469362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KI3fZq70Vb5vvmPP9zBQACWD8Wsj2jSHhmAM5xxezv8=;
 b=Y62wL5ybDkdS7z2V05qjfoxt7fgbmp9exnapmZgZU0+PUKOrJZouncQyR552OUDn/j
 nY+qNaeGNw/3m60GhRXb/jBczlg35nVnJDF7bZ5Td0LwHsJ4tr23qi6Fh3IQDzICc35q
 l+VkTdKd378TAjXWR5LRK7uc4xwKv8fT7wt0W4+/Ldz3PdeTy7vBZrs+c+qnJy7gLYXd
 Gcvxz5EgP8j9eGMZTRaqUN5v7FvOLcCrCR7pDiQo9+c39CFE4Syu0qawaM4cVQB0o3aL
 hsCESKIefzFcI8q8rled5UD78JLZ+M6ZErk3C+MJSc+luIvRPoD2OS7RsMZQaDRf+lgz
 f7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864562; x=1795469362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KI3fZq70Vb5vvmPP9zBQACWD8Wsj2jSHhmAM5xxezv8=;
 b=EI7cVDOuldSUmCudRzNmlum3jYW7kytosjSeV+G7MwRebNXO/BnJhmlDH61VF2D39W
 ZMt57Ih8TF3HN4xYmkb3qlwxRzt20D9AmbLiWsZhmR33lLbM1QG09w+2HnUCwrBLLuMg
 obwlWeWQkSz/0b4VvBKCmIw/pa7egRSowsGQiYv+d/vKttjlTUAt5kcZ0KyIoCwuuAbi
 UM8NAn4MKaSu+xb3Ifd/NHeO+XH3d0iifCZ6HebdXwtbquw+9HeIVVqSm5gC0cdiVV7Y
 r2NuQKak4lZn28bUsPpBOdTb9UWhDErlA4cuHVmMhVtvVj5kT9hdrxDIoDDtikhy2bjU
 X/Xg==
X-Gm-Message-State: APuU4Z9VkK+9GodyX8sH5mRJvgSy9lveqoVrhMmljHgCWEhTESJADhCC
 CHrGncEMM4cesBTYLKMabB7rWuoELZ+JUFotC7IVwlvUUImWP5h4ag8W8PIxf53P
X-Gm-Gg: AYBFou16VHQAScs+RuCC2JhgDsdoAVTB93QjPN/RN7LoA/N60ffZ3OykfD1cuBYMtPq
 Fae8KL8w9A01fdCOZmpt7TGIVKf5zPn2L0tLxKB+nqblN66jhZDRg/8s+dOYY2ZxxpCq2pvAVEF
 nahgR7RapVrnPZCyrMIkCZCpKInWQuPYq35wSmmz5uE0kjos75C7Xeas/HGDpNCj+DtUmV27Grf
 LYMDTk5T3YiHFE90HcxWgFGr99aVS1JxbA8vv+Rio4CzdksDB2qXEcUg3gh7g16XJhqC7LnJ/Yh
 1kT66LLn3QAjqnLfpeR0IO5p9eDPi3k/FEUXYr8QY04opUu56MsJpOaT0vsumxP/EPjF6P2ZCOW
 3S28kTX5QctVRel7ByRP6pcyG9mRiSrO7Dshly8BfNvVcTF/JCeH+nd+tiYSv76X+zlLCPTAeB+
 Qr8ShVQbPeaa6ESl5pbI0GsggJMOH6aongOyLKGH2UQT629MpU4/jYFWLkf47AYBQC4dP4+fG6w
 nfmxDHNnnbeXwFabR5CDNc1gsRpFLChG9rVM5w/0K74O0X0GrfnZck58Tw/y/K6TxKw+ISgYS+W
 CPOfRi93lTyltJewBieqHBet9nraqAZhr8S33zBsZVDP+0yGI/fE
X-Received: by 2002:a05:600c:3b93:b0:4bb:6f67:ca0b with SMTP id
 5b1f17b1804b1-4bb6f67caf0mr135095655e9.29.1794864561773; 
 Mon, 16 Nov 2026 13:29:21 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:21 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:11 +0100
Message-ID: <20261116212913.863975-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/5] support/testing: add python-pyside6
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
