Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BF1C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF6E60C10;
	Sat,  5 Sep 2026 12:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqjKt_EQNggO; Sat,  5 Sep 2026 12:21:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BC64160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610883;
	b=YHnbjavAUoZsEmuI/ZkIEhN2j/wS+pOkiN8pxxjSjVtfwx2ztQNaF9nTplV9JINYoKLX
	 tNBy3XX3cvoopgY57/PI2ITzTdsf2NxePsZMSxc0wx62gyGLrvXo+pp5GeYPhICnI1Wlo
	 xUa60WrlbNKcE7+Agy9rCXqIalaiAKhJr+au58dm2tEmTepgh4MdNRJwC2Cd64I3OCt1L
	 JAIM2/xbHdNHU99VOvNaSjYP8PxCdVG6GNY70T+ncTIl5MtEMQC8dPYuUXGh78gx3mNXD
	 ht9PPaCms6yuhafaL6x5psmhXnMiCtPyXMyHrPvrf+dCiil+xaOLwgbyb0rTTmi8oEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610883;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=07Jzqg7RBlyidTjEC8kPWRYe89+L5botjNyxyvC67N0=;
	b=CjvPHI4EUEyjg/WsJ8LYMuBmozUd8XEIIMcjoKmzQa3BlNuf7coBYUA6WNvRg8qcg67u
	 ZvUBKiPQL9/Ikb4cDqUivi5ANagCFn9gQ/xwCiOY4E4P08Z5QlhlkXg7KEWD22ATRq65s
	 7qPj1W4eJY1zkw3FoIwFjtKM4KaLe+nKeKkESOcPvLEO7+br+rheDo5R+C4ijH3b/cy/3
	 nl24HijItKDKQeaykkOEY/WfO7bf3e2ATQ3Sx5jQWlM3h1vRcVHJlmuY0UYR3NlgAlCLT
	 +Am1eR6J7FPq5dnnyn0dGQKymMfTw7lQZUbEl+VTfqFD5IbM8vTNNxRkYNLxaXrdI2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610883;
	bh=07Jzqg7RBlyidTjEC8kPWRYe89+L5botjNyxyvC67N0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hNyZdj2DJi/Mr/FMnL7ZB/T4KBLn1tnQUBLmeo5VuOIc3g+l0Z1rw+olrOMIRmOiO
	 puKGxS9gwfKYYwfoSg4HjHY9mDLO4vr6AutUWVmMiD6M1yN/B4Jg9UrS4Q5AqfCELO
	 vbcIHBQ4wNzcsl4cPAyWeou3Eknf3ApxFbI0wq6szWqMbL3GRg91IwkbdMaCeKOYuV
	 Qnt24acA4VJ4K8pgcgM7ZWAKEchz9O/Se+Cy1plM6L4cB2vum1jw4VUfZIiPo+QhfW
	 1pMRAoKTkLRksFGjrJcAgLXjIbdfIQXMsy9hnkeKcco26k4aVghxxEFDRJcFL4toPb
	 9P5/AmZcMuqIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC64160616;
	Sat,  5 Sep 2026 12:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E22672C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83C7D8111C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DxnAzcTcC_l for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:21:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90E6F809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610881;
 b=O8C2eFNnQS2+v+Y3rJ89rvb/YvtHJDPfybtxuakjvdWltJgzh6UjhIrYLW/BZCqVz9Fo
 MJ8f2s811almBcsDLoQXCVNAo8zLrjdIpJXfU/C36D/AzCm8YXEHCFshlPxvQlSdMTZm9
 YzWh+F9ITLLIwGfYRbIx6VuTL5OULNYtNOYVzYsuNHKU7PkNGWVcIPB+FP1urel5LVZ7k
 izYp86TWGlXrLzZ04exp9t8dP0djgnT2+h7/uYVn3q1YQ8nMzM85Va94Yvff5OyLoNrum
 b4zoI6QyobhANf9kAStN2t2a/LnPdXQVDUnSVaNXVyTCbBP3Jyxh2ZNKANQ0ZnxU1TA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610881;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3RfXj+7Vywexx+SkbHXiGcr0WpXuASnNzwJcEjhiYpE=;
 b=a+yDau02agGx2zJVT/geADlefKZhEgN/CeCkKIhOwxYP3VQoRknFcZRTYIoa8fqAN4ND
 KDFjb8GReatx8jsap9bHhPsAk6+g+dkiC0a/6N542z4qOaDY9TbJZhRgAeTGcVGg6qhdh
 e2p04+bNf8P/JP0NgNaCZ0hos5u3PBl7aAZ99mq6v+bbNW9nCLW0gyqj/Cp4CszQU4wxQ
 f4PiS3FonI0VHogwrZLeWlc1XlsZIxYJj61PlDDdwEGrGB83leU9ynCkHFlxOfFYxmlMv
 KZPJudEhpIkERF84AgZg5FxPS9dZfCGRpZtNOecOlXBOLqAKQiFILPkznIw7z39ET1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YWGwUcHV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YWGwUcHV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E6F809E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610861;
 bh=3RfXj+7Vywexx+SkbHXiGcr0WpXuASnNzwJcEjhiYpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YWGwUcHVR9o33U3GI46NU7uR5yyd7ep7MTssHMEZ1qiJ+CziWZBgHzQL0FuDxpica
 peXddpF39nWUb+UGkq8aY22oQyZDCIK2V3cftX0RgespyPEZG6ha3D/jOWx8WCBq0K
 OJmyV+UdlDWdOsRAvvnFwTpTtfsVj7RFeBWEZ/zcMFU0KJtqlgybG5ny/jCQ5ZKRFN
 RZWtVLy9D/Rgxy7uxxIw9JbJ756ZBDQe4iHwUmWUGTY+eDvp3rSlNW/T04qQ9g/hFN
 kga0bdSvL/CU35S01jxlS31YUgCKxuBWXXlUcaRfpT1/uN4d79GqD+AvFA4Rz9nw5E
 DQv5ytwmMrsnQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8BE1A4C2D22;
 Sat,  5 Sep 2026 14:21:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNx-000000006UX-0mpO;
 Sat, 05 Sep 2026 12:20:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:37 +0200
Message-ID: <20260905122040.2054789-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 5/7] package/python-pylibfdt: fix build with
 swig >= 4.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...e-removed-SWIG-Python-2-compatibilit.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch

diff --git a/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch b/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch
new file mode 100644
index 0000000000..fa2b587ddc
--- /dev/null
+++ b/package/python-pylibfdt/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit.patch
@@ -0,0 +1,59 @@
+From 5008d1d6a356b8d0a78060da2e1021507d529cff Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Wed, 29 Jul 2026 07:55:56 +0200
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+
+Upstream: https://github.com/dgibson/dtc/commit/5008d1d6a356b8d0a78060da2e1021507d529cff
+
+python-pylibfdt imports tagged dtc versions and currently waits for a
+new dtc release: https://github.com/devicetree-org/pylibfdt/pull/10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libfdt/libfdt.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libfdt/libfdt.i b/libfdt/libfdt.i
+index 1f9c0471..b1cb9873 100644
+--- a/libfdt/libfdt.i
++++ b/libfdt/libfdt.i
+@@ -1136,7 +1136,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+ 
+ 	if ($1) {
+-		resultobj = PyString_FromString(
++		resultobj = PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff = PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1169,13 +1169,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 = PyBytes_AsString($input);
+     %#else
+-        $1 = PyString_AsString($input);   /* char *str */
++        $1 = PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+ 
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=1) int *depth (int depth) {
+-   depth = (int) PyInt_AsLong($input);
++   depth = (int) PyLong_AsLong($input);
+    $1 = &depth;
+ }
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
