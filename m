Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC47C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9122340C91;
	Sat,  5 Sep 2026 12:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsp25pxFyRuO; Sat,  5 Sep 2026 12:21:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6950540C89
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610872;
	b=i15w8Mub/EEql685w+puPHiWzCHiFHRErEbWDjvchX0G9+gyL0dnB5A9UM9yu10akRLB
	 ppaeQLMf+sOmC+8txphijmgEPWNtD9p1Moy51FICIIUzmjRP35gzxSfTMJuDhVFTLpwGr
	 0EfU+SD3SHMyE+iYlVNptojVyb4BI5y513SCYb8uIEVE89J1TmlK699rTYT0IFDMeJlrm
	 AQs/QywBcStsSh5Fzlq4cKVlM7o0X/Ib3b+BKL4BxBLtj7tPRv0ZP2laQrl6CFo0cxovK
	 UtW0ZroxxSZcxIBWyZv+7HohS5RK9wkrydF5OBriw1536vk8R1PnnPoX2QzYHoSN+oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dMYQjLEdn+kqTqFPCemomi/sKzA3sPlM5AR1Ez2srF4=;
	b=E/1tJyGlYMZ+4YzGKfluVkFW4i+IYCBAZtWMNyuKXg3OseoiHh0uvAsarRNNhATVjsxS
	 h8AXbngKDRP9Szf/CXaVJQL6BI38ml8QITTKB7vxuALN45F8EVB3Pv140Rh7wnaOefxJZ
	 Z/jjaqB5lf6Jd7SdIijLOvexlQWBVzDm5R+RkzRBNaiW+lz5krazjjmfuvyJjgsZZOW0j
	 sgWEee8wstfV9NPh25SPch4X2BuphJBoFcwDABp55q1DNCWiFgNxxYxhmYbIAYGpHyE4H
	 +q9zDvFAGSUHFtYoUnOwGpjuc7zUi8UL3ED6ywHr3iqfM+Pbn+CYHYsWnSyaR4h4/oA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610872;
	bh=dMYQjLEdn+kqTqFPCemomi/sKzA3sPlM5AR1Ez2srF4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DpS11NynjIAfbs8XISNhBkGqfss7n4txy3K6ZBVccbBMfrS1mzpgtxKTaHlqbW4m6
	 GLYwicx/Aqn+DEOoFYXp2esTZGSRP8UfNQxWnEuDoy8LhDWDYW2j/o/uxIfqk8oUH6
	 V44qGsgl/pl3NMlnHKHa0p6OLltxxXOLq5bLbDx8grGbp9q8xLgVnh5LuPYaKAjxPU
	 B0hkTF+0f847uTHvFuS2CQ2l3MYxV/IEJ/2iC35PrxBpoiYQw/wCjCbaUu7UO1+vIY
	 ONVjYvf0pZ8wZ/gsaS4v8JKDnZKR2ZEPYjrpITekfErGN9qlT+452r0+G1YYcTnGbF
	 gF0FJoF2bCftA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6950540C89;
	Sat,  5 Sep 2026 12:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6735C72C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 650AA40067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22mLOkBXKzQH for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:21:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3B4CC4004C
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610869;
 b=AFkxY64FZBYAUkoJr0FJBGrZ4dHfDTsjpAds4uz3kqjbJdf+1FwVshUTI2TBq/NROxIK
 te/vKKMrJK8xkUX/8vTAP1JhGitXQvWLtqYveE2RFqBxw1zcOS+Yr3s7MZHg6o1LX5Srj
 3BYSkPPahiX/b1L/wwvnhr3DkHof9PE//Riib1KdkCAi2evLa63cbdpT9DhTpUVuMEflR
 jTPVM0fE1KlwfllUS6mLz2bk2BsXv3mVf45YbuI5GFC/ecdil7xdZr8qoGK3PPi3BpDoK
 eEwvedYnyEOIXFOgHoz62V10s3B/yRsuRGif85YrPKvpziw3wjtMht9fOGkpHuQRkmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610869;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hWNbSkd5ch/zij36ga/x8Qr/ZAOC8ZQzXeDEiTpf2yU=;
 b=aDSAvfTBPZD5carHgL/+KJY03gOZTl8XnhDPyWCqrVTfjqi3/eNKX4UuxjYmyVXJ2VwU
 VPuT7+MCU3Hy9uMNTlZyAcIq+L7cpgCQFfbLvsXH6bZ7JRsOphkY8qw9KWHhC4U0IMpTE
 g06qWxXCSJ0Gee3bFZNjCgvEmXm74vPeJeVAE1/slCZgWSTDSbed6up+aTXSKQRmd/tgI
 CWDTV/GAY5UXjnjtZQiJGddRVueRxjMJnP6/hIxnjaZFkN1PtSsrlgT4RQXZxXWsZOfck
 GXosjdiwK+KTasEBnWU3GYZb0m8qozCE0OcQF2aMVldmVSYm1kEKrTYoFPno8s5FWSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CkDjOB4d; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CkDjOB4d
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B4CC4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610841;
 bh=hWNbSkd5ch/zij36ga/x8Qr/ZAOC8ZQzXeDEiTpf2yU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CkDjOB4dDtDnxxj9dRuxalURvJJ5rAWHy2PJYA6cBr42+/Ts3H+Cfvl1ZOLi9BuO0
 5Rm4qj0IDol2oPSqnq/w9ZvzYyxhM3JtrO4Hg/Z745BWCAHVGRfxwTD8cgkFlBUg+a
 Z3xExmyybvQ02GeRqT0EvfzUX7e6Cr0JHJZlGCP3Ue49/v/oOidgGhdenhaC2hIHbn
 6OGXRnqXFiJrsB02O50uyP1FE2W5EN/2/cJtf+cxgvBlIW7Ag+smaQU9ymVgcF11jn
 3XKQbTuXUvr2xT1w6ZSEOkhHoOP2I6a2iX+/WVEgPlG8NEjidqJSllioczM0k3mU2X
 8a8P1Rk753gXQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5AFD2A4C334D;
 Sat,  5 Sep 2026 14:20:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNw-000000006UX-3nBD;
 Sat, 05 Sep 2026 12:20:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:35 +0200
Message-ID: <20260905122040.2054789-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/7] package/libcec: fix build with swig >= 4.5.0
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

Patch 0002 fixes the build with swig >= 4.5.0.
Patch 0001 is needed to cleanly apply patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...DeviceLanguage-accepts-3-char-ISO-co.patch | 66 ++++++++++++++++
 ...Python-wrapper-against-SWIG-4.5-whic.patch | 78 +++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
 create mode 100644 package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch

diff --git a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
new file mode 100644
index 0000000000..e2a86e1f7e
--- /dev/null
+++ b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
@@ -0,0 +1,66 @@
+From f53490e23037f17b68043f5e1ff2f4378d227d56 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Mon, 13 Jul 2026 15:24:27 +0200
+Subject: [PATCH] fixed: Python strDeviceLanguage accepts 3-char ISO codes
+ (SWIG char[3] typemap)
+
+The SWIG default char[ANY] setter uses SWIG_AsCharArray, which reserves a
+byte for a NUL terminator. strDeviceLanguage is a raw, non-terminated
+char[3] holding a 3-character ISO 639-2 code, so a valid 3-char value needs
+4 bytes and overflowed the buffer, raising a TypeError; only 2-char codes
+fit. Add member-name-scoped in/memberin typemaps that copy the raw bytes
+(str or bytes) so 3-char codes assign correctly. Scoped by name so the
+NUL-terminated strDeviceName keeps the default behaviour.
+
+Upstream: https://github.com/Pulse-Eight/libcec/commit/f53490e23037f17b68043f5e1ff2f4378d227d56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libcec/libcec.i | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
+index a01f9afc..520ff7af 100644
+--- a/src/libcec/libcec.i
++++ b/src/libcec/libcec.i
+@@ -15,6 +15,37 @@
+   $result = PyString_FromString($1.name);
+ }
+ 
++/////// libcec_configuration::strDeviceLanguage ///////
++// strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
++// 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
++// for a terminator, so a valid 3-char code needs 4 bytes and overflows the
++// buffer, raising a TypeError; only 2-char codes fit. Copy the raw bytes
++// instead (accepting str or bytes), scoped to this member by name so the
++// NUL-terminated strDeviceName keeps the default behaviour.
++%typemap(in) char strDeviceLanguage[ANY] (char temp[$1_dim0]) {
++  char *cptr = 0; size_t csize = 0; int alloc = SWIG_OLDOBJ;
++  int res = SWIG_AsCharPtrAndSize($input, &cptr, &csize, &alloc);
++  if (!SWIG_IsOK(res)) {
++    %argument_fail(res, "char [$1_dim0]", $symname, $argnum);
++  }
++  {
++    /* csize counts the trailing NUL; strDeviceLanguage stores no terminator */
++    size_t slen = (csize > 0) ? csize - 1 : 0;
++    if (slen > (size_t)($1_dim0)) {
++      if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
++      %argument_fail(SWIG_ValueError, "char [$1_dim0]", $symname, $argnum);
++    }
++    memset(temp, 0, $1_dim0);
++    if (slen) memcpy(temp, cptr, slen);
++  }
++  $1 = temp;
++  if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
++}
++
++%typemap(memberin) char strDeviceLanguage[ANY] {
++  memcpy($1, $input, $1_dim0 * sizeof(char));
++}
++
+ /////// replace operator[]() ///////
+ 
+ // CEC::cec_datapacket::operator[]()
+-- 
+2.47.3
+
diff --git a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
new file mode 100644
index 0000000000..351091e17d
--- /dev/null
+++ b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
@@ -0,0 +1,78 @@
+From 55f3443559b0b32a1d7194e424727575faf6f7d4 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Fri, 31 Jul 2026 14:46:27 +0200
+Subject: [PATCH] fixed: build the Python wrapper against SWIG 4.5, which
+ removed the Python 2 compatibility macros
+
+SWIG 4.5 dropped the PyInt_*/PyString_* macros that pyhead.swg used to define
+for user typemaps. Two places here relied on them.
+
+The callback return handling keeps a PY_MAJOR_VERSION guard rather than moving
+to the Python 3 API outright, because the x86 Windows build still targets
+Python 2 for the EventGhost plugin. A Python 2 int is a PyIntObject, not a
+PyLongObject, so an unguarded PyLong_Check would compile there and then
+silently read every commandHandler and menuStateChanged return value as 0 - the
+one thing those callbacks exist to report. SWIG never reads SwigHelper.h, so
+the C preprocessor makes the choice and the file is SWIG-version independent.
+
+The cec_osd_name out-typemap is deleted rather than fixed, because it is dead:
+GetDeviceOSDName returns std::string, and cec_osd_name only survives as an out
+parameter in the C API, which is not wrapped. It could not have compiled if it
+ever did fire - cec_osd_name is a typedef for char[14], so the $1.name it
+dereferences has no member to name. Removing it leaves the generated wrapper
+byte-for-byte identical.
+
+Verified by preprocessing SwigHelper.h against both Python 3.10 and Python 2.7:
+Python 3 resolves to PyObject_CallObject/PyLong_AsLong with no removed macro
+surviving anywhere, Python 2 to PyEval_CallObject/PyInt_AsLong.
+
+closes #726
+
+Upstream: https://github.com/Pulse-Eight/libcec/commit/55f3443559b0b32a1d7194e424727575faf6f7d4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libcec/SwigHelper.h | 9 +++++++++
+ src/libcec/libcec.i     | 4 ----
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/src/libcec/SwigHelper.h b/src/libcec/SwigHelper.h
+index 3c40fc87..0752acb2 100644
+--- a/src/libcec/SwigHelper.h
++++ b/src/libcec/SwigHelper.h
+@@ -137,8 +137,17 @@ namespace CEC
+           Py_DECREF(arglist);
+         if (!!result)
+         {
++          /** SWIG 4.5 removed the PyInt_* compatibility macros it used to define
++              for Python 3, so call the version-appropriate API directly. Note that
++              a Python 2 int is a PyIntObject, not a PyLongObject, so PyLong_Check
++              would silently reject it there. */
++          #if (PY_MAJOR_VERSION < 3)
+           if (PyInt_Check(result))
+             retval = (int)PyInt_AsLong(result);
++          #else // (PY_MAJOR_VERSION >= 3)
++          if (PyLong_Check(result))
++            retval = (int)PyLong_AsLong(result);
++          #endif
+           Py_XDECREF(result);
+         }
+       }
+diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
+index 520ff7af..0d757aa1 100644
+--- a/src/libcec/libcec.i
++++ b/src/libcec/libcec.i
+@@ -11,10 +11,6 @@
+ 
+ %ignore *::operator=;
+ 
+-%typemap(out) CEC::cec_osd_name {
+-  $result = PyString_FromString($1.name);
+-}
+-
+ /////// libcec_configuration::strDeviceLanguage ///////
+ // strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
+ // 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
