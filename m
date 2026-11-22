Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF72606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WPK3mtL9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHLalfa+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CF64060E;
	Sun, 22 Nov 2026 20:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ1yICEP-4vN; Sun, 22 Nov 2026 20:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E28314060F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795378927;
	b=ZFFps4J4MXOSSySz7mZU5XKNCJ3ArziG8J3DasmcS/2HVSTruQZ+EIBVyVkJZFZwYKVe
	 SfE+a6EoM/alvQ5JRN8DslAroOOeczkDIFieTp86KgcM0lp8Bl+oHbf0t0t3jI20bcJzZ
	 EmDFuQj91OA0nU0TWla89WeROt6OcRJQa1LrZfG3DZ4RdqnG/i5CPoV8txd64RvxtpLkb
	 9LdRZUObtoqeCsPgzV6EEK6XBPiU1BQKCh9BHpe0sJtftQq4YjbScmZjZjYqwClCBHrju
	 TKD7Wz3FJ17NszOX3SjPgDy8fdznuD4wzSS2NiIkbnI8vvYufMtkH6B27LFbQclRCcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795378927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tg9Fzf/qSiD+w5u4DVLPQRfSPO4RmD9P/K9Lycn5UlY=;
	b=p+MUAqXTkeX8RQvQ0bWDCI93LN+AT5TrC1bYqhOqP3JEjPWY8rJGbkIGqZZukOFHhGUT
	 u1c+putcqI6iGzbdDVeToDNbQbslgVwR751Zrgt03h4T+zI+VvCGii8cGz1LDSIh3Cn1c
	 cak2TfEC+rC8QAlhTbJRU7s8jp9IAZyxUeW21JWUnpwgVGa7RzKFuNeyzP7+rxmlbMrzV
	 KvtC4eiiLFblcxA5RPFDpdIz4kTyAso/uWjkScRSv2LvwA5ndeeYQUM1k2xrwex+XKTwX
	 33zi0AG6PyRKy8kidHlIztBvgsFiHEoKTuX7lr6wEbbRMI++XmyeSpARpxDvz1I3z+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795378927;
	bh=tg9Fzf/qSiD+w5u4DVLPQRfSPO4RmD9P/K9Lycn5UlY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WPK3mtL9YznAkR+WbMxX9JKkGjceioOOg2i1H6y4tTnulxb8obcPaNTjmVM2GLzaX
	 eTE+1lABGz6HJPswFyp5JlwPlZVSHzN2cStInnLOSURNSCducqxNLe+CMh2j89Rl7u
	 fkHn3cJAVan3dwFGXsv7HcfdGh5fcog0jSzaVI7zTn2FIsm/6lpVv4tE9SUqXEyUzM
	 7GzK5CvlxXUQrLhWKCeKC3xL6/dlbgeZ9YaZjiAeub9vWOGBGqSrEz4nSTxZw2dtgu
	 hY8iSQkHRXII/t8IUqJtmKDYXOX6ht0R3z74YzX4DlF1aI+hSiOIVGMmtUilBr3hjO
	 VXs8FIGCKSPow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28314060F;
	Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64A2C499
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B11D80D29
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJ4MaZ9gKesh for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD50F80C77
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xHLalfa+
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD50F80C77
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso14005535e9.0
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795378920; x=1795983720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Kn8qcBJLb2aMTkK4H63YfjS45e2R2rSaryhx+AqLR7o=;
 b=xHLalfa+VSuLQ93rUMvbzoPktkwi2LyrTz1P1q1kQbZFrmkKRiBHa2+JcdHcTMTuRx
 meXkG3jXjJ5PMApxSNJX/cDtdIDM6vOSO3wKby3kkp6fpowUEUhMJR7maIvFyvvfrWu9
 k1OBf89fuYX9ia0WZDiVOPczra/yKNujdqLn7n8SRi62dM/3xHQGydBIVeb394t6dzId
 6aE7hEIuLhBcNBxEPt1RWsJ8EdWXLXgSHrZx+IndXbXsob2suypGnYZyIjlbeXDoJouV
 yi3r/3u1B63sdBsCTScMc4hNNJGEtYOLvDu7PqIUFjXVuHgU2tqRvpc2Zs90jucbP/RR
 Bsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795378920; x=1795983720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Kn8qcBJLb2aMTkK4H63YfjS45e2R2rSaryhx+AqLR7o=;
 b=AfY8EPWMSo+TijLwUwB1RgRrrIIYB613407hmdzsxTnjSyI5KjgVbzvadEEzHQUzzC
 2EhpwJ2UIIuI9QvFR7nhJ09+sKkQBZ4GRvauimjSQqBlClJ4q6m26AtT37vo/29GNT97
 tAuWllp2IhyzK0cyWhbvVaW8SG06wIelcMlKac3jPovQMhZ+ldoyvUQn6kLSMKB5DFWk
 xxSX4BP6eFBPzYufkkYWVjXZRkpbollYO3x2LCP3xbdF/5b2YuwSuQtuEub0LVO6gyk6
 liL6QEbz5C1ln+c3oCMdmNzkcynVXRpA3d8SlWeITT8tky+UzcWM78JEH4VmKwkULbRl
 PjLg==
X-Gm-Message-State: APuU4Z9fpN27KAYaR37p5CKSfPrYtBuiyENE1sc/P6MOBiUEeeyPChHM
 VbI0NQGhlk0QdRLDYMIrLwzJOEKcFqxJeqbZ/3rWjxd6LJEK3NcGbVd5faImWuD3
X-Gm-Gg: AZFdTZd6lQQPw/Cei+MnLnrp+cTij1JaoQCK/EpndhoQaj2iayaMXu9ZVlr179nS2Al
 EkgnNomZBbfTeY3iYjMxyQ67eW3bMQdPPTIKrowC/J66tJQqg/XBvnJHKYsQWswJCLfBupOSf9+
 nfNikNJYd5ORI81BwtlSBoLVu8ikinYyHw98szUQkeg6+MAJDudjPscV9ZjlLkGgTKUSkb2oGin
 T7rilFT6EIO7Mj7ztXTjW0Mk4NxnEJJ3B7agWBr+b7339pIMxcpoIL8zYnLR5oqKF3uqV+BfXXX
 A6Na94Me/TwA5Iz1kMhdtLV/xaCt9LckMOzMh8ze31mKFO0fJe/tcJnQATRBShWXh3kHRSVRg0H
 aVrvdnLGp4DzNTanZKtMfsKtZszjtcZ7mSjhywYszZUwsihliDHgZ9L5atEBOeyQ6pXMBd7QwGB
 fuAGgvevx3fyiDTaWHkZYqX5A/ObWC24BLl9mt9iayoJiQK1t1XpUk8o45/mVpmmfIy8eFtC7gi
 CCGeuMcwhPiMTBa4LTKiJl7wx5LFAyDMcREBYsCIgsix2mEuIqLR9LV+H/jpsi2uXFIK675ovIS
 euPFAv0za3dPW8RrM9KwdaLHrF2q6G8OCmAsndonSpw2x2J0qNI=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id
 5b1f17b1804b1-4bb887c29b4mr174955555e9.1.1795378920427; 
 Sun, 22 Nov 2026 12:22:00 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm319409495e9.8.2026.11.22.12.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:22:00 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:21:53 +0100
Message-ID: <20261122202154.3606582-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
References: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] support/testing: add qt6 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>
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

Run a QML file with the qml tool of qt6declarative. It checks:

- the JavaScript engine of QtQml;
- the creation of a Qt Quick object;
- XML parsing with XmlListModel, done by QXmlStreamReader of qtbase;
- a Canvas drawing from an SVG path string with Context2D.path;
- an SVG image, loaded by the image plugin of qt6svg;
- a WebSocket echo over the loopback interface (qt6websockets);
- a distance between two coordinates (qt6positioning);
- an SCXML state machine (qt6scxml);
- keyframe interpolation (qt6quicktimeline).

The test uses the software renderer of Qt Quick and the offscreen
platform, so it needs neither OpenGL nor a display. It runs on the
armv5 kernel of the test infrastructure, so no kernel is built.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_qt6.py     |  43 +++++
 .../test_qt6/rootfs-overlay/root/test_qt6.qml | 166 ++++++++++++++++++
 .../rootfs-overlay/root/test_qt6.scxml        |   9 +
 .../test_qt6/rootfs-overlay/root/test_qt6.svg |   3 +
 .../test_qt6/rootfs-overlay/root/test_qt6.xml |   5 +
 6 files changed, 228 insertions(+)
 create mode 100644 support/testing/tests/package/test_qt6.py
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.qml
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.scxml
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.svg
 create mode 100644 support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.xml

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..cea68e8fe9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -265,6 +265,8 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/package/test_qt6.py
+F:	support/testing/tests/package/test_qt6/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/support/testing/tests/package/test_qt6.py b/support/testing/tests/package/test_qt6.py
new file mode 100644
index 0000000000..4a4287cf96
--- /dev/null
+++ b/support/testing/tests/package/test_qt6.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestQt6(infra.basetest.BRTest):
+    # The QML file runs with the qml tool of qt6declarative. It uses
+    # the software renderer of Qt Quick and the offscreen platform, so
+    # no OpenGL and no display are needed.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_QT6=y
+        BR2_PACKAGE_QT6BASE_GUI=y
+        BR2_PACKAGE_QT6BASE_DEFAULT_QPA="offscreen"
+        BR2_PACKAGE_QT6DECLARATIVE=y
+        BR2_PACKAGE_QT6DECLARATIVE_QML_TOOL=y
+        BR2_PACKAGE_QT6DECLARATIVE_QUICK=y
+        BR2_PACKAGE_QT6POSITIONING=y
+        BR2_PACKAGE_QT6QUICKTIMELINE=y
+        BR2_PACKAGE_QT6SCXML=y
+        BR2_PACKAGE_QT6SVG=y
+        BR2_PACKAGE_QT6WEBSOCKETS=y
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_qt6/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", f"file={ext2_file},if=scsi,format=raw"],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()
+
+        cmd = "QT_QUICK_BACKEND=software qml /root/test_qt6.qml"
+        output, exit_code = self.emulator.run(cmd, timeout=120)
+        for check in ["js", "quick", "positioning", "timeline", "xmllistmodel",
+                      "canvas", "svg", "websockets", "scxml"]:
+            self.assertIn(f"qml: PASS {check}", output)
+        self.assertEqual(exit_code, 0, output)
diff --git a/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.qml b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.qml
new file mode 100644
index 0000000000..9c51f2fe30
--- /dev/null
+++ b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.qml
@@ -0,0 +1,166 @@
+import QtQuick
+import QtQuick.Timeline
+import QtQml.XmlListModel
+import QtPositioning
+import QtScxml
+import QtWebSockets
+
+// Each check prints "PASS <name>" or "FAIL <name>". The qml tool exits
+// with 1 when a check fails, with 0 when all of them pass.
+Window {
+    id: root
+    width: 64
+    height: 64
+    visible: true
+
+    // The asynchronous checks still running
+    property var pending: ["xmllistmodel", "canvas", "svg", "websockets", "scxml"]
+    property bool failed: false
+
+    function check(name, ok) {
+        console.log((ok ? "PASS " : "FAIL ") + name)
+        if (!ok)
+            failed = true
+    }
+
+    // End an asynchronous check: only its first result counts
+    function finish(name, ok) {
+        var i = pending.indexOf(name)
+        if (i < 0)
+            return
+        pending.splice(i, 1)
+        check(name, ok)
+        if (pending.length === 0)
+            Qt.exit(failed ? 1 : 0)
+    }
+
+    Component.onCompleted: {
+        // The JavaScript engine of QtQml
+        check("js", JSON.stringify({ a: [1, 2] }) === '{"a":[1,2]}')
+
+        // An object created by QtQuick
+        var rect = Qt.createQmlObject("import QtQuick; Rectangle { width: 10 }", root)
+        check("quick", rect.width === 10)
+
+        // QtPositioning: one degree of longitude on the equator
+        var distance = QtPositioning.coordinate(0, 0).distanceTo(QtPositioning.coordinate(0, 1))
+        check("positioning", Math.abs(distance - 111195) < 200)
+
+        // QtQuick.Timeline: the value half way between two keyframes
+        timeline.currentFrame = 50
+        check("timeline", Math.abs(animated.value - 5) < 0.001)
+    }
+
+    // XML parsing, done by QXmlStreamReader of qtbase
+    XmlListModel {
+        source: Qt.resolvedUrl("test_qt6.xml")
+        query: "/items/item"
+        XmlListModelRole { name: "name"; elementName: "name" }
+        onStatusChanged: {
+            if (status === XmlListModel.Ready || status === XmlListModel.Error) {
+                root.finish("xmllistmodel", status === XmlListModel.Ready && count === 2)
+            }
+        }
+    }
+
+    // A triangle drawn from an SVG path string with Context2D.path
+    Canvas {
+        anchors.fill: parent
+        onPaint: {
+            var ctx = getContext("2d")
+            ctx.fillStyle = "#ff0000"
+            ctx.path = "M 0 0 L 32 32 L 0 32 Z"
+            ctx.fill()
+            var inside = ctx.getImageData(5, 20, 1, 1).data
+            var outside = ctx.getImageData(20, 5, 1, 1).data
+            root.finish("canvas", inside[0] === 255 && inside[3] === 255 && outside[3] === 0)
+        }
+    }
+
+    // An SVG image, loaded by the image plugin of qtsvg
+    Image {
+        source: Qt.resolvedUrl("test_qt6.svg")
+        onStatusChanged: {
+            if (status === Image.Ready || status === Image.Error) {
+                root.finish("svg", status === Image.Ready && implicitWidth === 32 && implicitHeight === 16)
+            }
+        }
+    }
+
+    // A WebSocket echo over the loopback interface
+    WebSocketServer {
+        id: server
+        host: "127.0.0.1"
+        listen: true
+        onClientConnected: function(socket) {
+            socket.onTextMessageReceived.connect(function(message) {
+                socket.sendTextMessage(message)
+            })
+        }
+    }
+
+    WebSocket {
+        id: client
+        url: server.url
+        active: server.url != ""
+        onStatusChanged: function() {
+            if (client.status === WebSocket.Open)
+                client.sendTextMessage("ping")
+            else if (client.status === WebSocket.Error)
+                root.finish("websockets", false)
+        }
+        onTextMessageReceived: function(message) {
+            root.finish("websockets", message === "ping")
+        }
+    }
+
+    // An SCXML state machine: start in "off", go to "on" on "toggle"
+    property int scxmlStep: 0
+
+    function scxmlStable() {
+        var machine = scxml.stateMachine
+        scxmlStep += 1
+        if (scxmlStep === 1 && machine.isActive("off"))
+            machine.submitEvent("toggle")
+        else
+            finish("scxml", scxmlStep === 2 && machine.isActive("on"))
+    }
+
+    StateMachineLoader {
+        id: scxml
+        source: Qt.resolvedUrl("test_qt6.scxml")
+        onStateMachineChanged: {
+            if (stateMachine) {
+                stateMachine.reachedStableState.connect(root.scxmlStable)
+                stateMachine.start()
+            }
+        }
+    }
+
+    Item {
+        id: animated
+        property real value: 0
+    }
+
+    Timeline {
+        id: timeline
+        startFrame: 0
+        endFrame: 100
+        enabled: true
+        KeyframeGroup {
+            target: animated
+            property: "value"
+            Keyframe { frame: 0; value: 0 }
+            Keyframe { frame: 100; value: 10 }
+        }
+    }
+
+    Timer {
+        interval: 90000
+        running: true
+        onTriggered: {
+            root.check("timeout", false)
+            Qt.exit(1)
+        }
+    }
+}
diff --git a/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.scxml b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.scxml
new file mode 100644
index 0000000000..3982adb993
--- /dev/null
+++ b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.scxml
@@ -0,0 +1,9 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<scxml xmlns="http://www.w3.org/2005/07/scxml" version="1.0" name="Switch" initial="off">
+  <state id="off">
+    <transition event="toggle" target="on"/>
+  </state>
+  <state id="on">
+    <transition event="toggle" target="off"/>
+  </state>
+</scxml>
diff --git a/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.svg b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.svg
new file mode 100644
index 0000000000..fabb35b6f0
--- /dev/null
+++ b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.svg
@@ -0,0 +1,3 @@
+<svg xmlns="http://www.w3.org/2000/svg" width="32" height="16">
+  <rect width="32" height="16" fill="blue"/>
+</svg>
diff --git a/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.xml b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.xml
new file mode 100644
index 0000000000..6db6e4140e
--- /dev/null
+++ b/support/testing/tests/package/test_qt6/rootfs-overlay/root/test_qt6.xml
@@ -0,0 +1,5 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<items>
+  <item><name>one</name></item>
+  <item><name>two</name></item>
+</items>
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
