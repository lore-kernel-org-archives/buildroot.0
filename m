Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ED5CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A12606C0;
	Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU3c1FsgBQIZ; Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 68AE16076D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304218;
	b=mrhfypd4ZkXkVCbePnR01b+1zkN3da8ZiA2C7grsriPNy5xewodQpJLmNfCg2ABpAWnO
	 B1SiB/eBigSPgsYv7Qb3GxsYL4eK6vpwXJNo0TM7J5nhCKKcf3sf02/TN2IvEyw4oBH4r
	 4hOyqjfVTm6rb77ceAG/KZb8e5+edfuLsPYtEiBe8mr1MD5mjZioHOmshWvaTFunlrGrz
	 ffR87vJVoe7PKjrMAGaJt12XkPshk33TB/e4zFcpOXqKGrWPtU4/NVml59qO/gKqjgfxu
	 rXWlzI1P4e2pPobOhw5vN2TNMhGh7mxrgGkl3ebvqkRItUZf/BBcPz/yWnCILr/Zg+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NDoAZ/KECvjnik0D26ALBrvsgzFtepm1Vi6VKgjQLh4=;
	b=JEJF034XGmvzhdQut4xiOxYC/i6xof5mPUiVrzban3FmQePwvpIopRh4HpqnB/DI/R8d
	 s+RIfOxkJZwL69qFDLSJkcFRJIe94m4ecWRdfONd5nLPzTTkPqFnfliFNaJYOhG2X0Flc
	 UbWFm8LNbgj5G3gfuCXpavdizwJBNe+9/jY40FbNYncLQEil4vpmPOEBzi0C/C5FKFR8/
	 baTRyIuf/vftRdItcjEVSd29HwPFf9qPG90WBl4Dklq+c7w8H3xJK07q6AM09hBATpM+s
	 VLGdFCqsubiC61QRP/+4SjGY3gMmLS2+4maKFb89Y0EZUQlNd+jWhBepOBme6WiI0Wg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304218;
	bh=NDoAZ/KECvjnik0D26ALBrvsgzFtepm1Vi6VKgjQLh4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ManZJEgXyYszNTPL3LIzxzBE7ImUWk/P9xJGHtuKCJu47GfioTNOB0PATTlbKlCrn
	 6sBWrMqyJAF3os94rgeqFAICqZvj6VKWymxKiTclqUKLuOzBEVCsqrUCmrSsONiVsp
	 WpJ0hWcfzHb4WwmGLXfv8BpIE/AuSJ/wXiwmnKp4bZGI6ncJC7BuyPozi+wK8nPta5
	 CKb15LmtsdyT5LB+NpCCCDg+OtJYSe1OABJL/R4u48JCVBvxx5fdJkGSzK3e2ioHzg
	 b08l46/0uX/GAxIw2e7bnRJoQf1rJehJaJ6vkbUARSjf6w2Ybn3s+4g3TPZ3H5H2AF
	 67c5ASgGo/zgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AE16076D;
	Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E40341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56F69405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R50NDMAUacM4 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 13C6E403D3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303886;
 b=GTxGZRehVxabWZMdr6iGtRlVNE4AsC3T2QBUUjD9kTaVmqO7wufKLeIKZQbab4WCi6k6
 bxV9gtXQToMCQi5jV2Q7lyFX7Se3eL8t2fskQ2cSzXOE4gdPLBds1KO8+XQoSKsWnLPZ4
 2oZio/6vtk7vigfsh0RkmHGz7m5RB2e//ptfT8mDc/gtHFOK/cJiDVcHZ3ZsLgHsde2zq
 XxmRmH4TUcK7jYscX/TtFyFeWS05/KRjpR9dgCgYrHpzHyh2rTrvsnPCxSdEcfJ+xUc1i
 4OCOFGt+yhOGrUJy+08ftfkFY6qEjLMconaCzSeuKrTZ3vn6dDEjA3rXdd9XsJAu+4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303886;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Pgi+4lTdPoH9i7llAhpUyofJC9fqBySHJ+eqNxebmVE=;
 b=L0V9FFB0j0OMeEARy9I7aVegO7XFb/4MRKwAGocyW4RkVRvCrBJayqhbMUDx9mNS5+3a
 GnMQhSI7WL9pvQDxBwUs/WowsvbKLiMMUAvt8YZoIY6kCoqurdtp++5gvwi5oVGwRlsvc
 jNoS2jtKpp2feDsjgA7Dgfl8vGc6c4m63lSb8s81nXNL5wBSCznpOfLj8ySKduuXRxW6X
 HEkAeWRFVD+0RWleguBW+sxIXj4cLWerLDRN74eXT18li2mcTJVj/Bhc87bZkFUYmO3o6
 6qMhmWC12wLWDjKgLNVpajX+7wUT6pc+13NV5LTmWgC26qvFPLR7I/JLJ9XMGedwv/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FzSgQxux; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FzSgQxux
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C6E403D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=Pgi+4lTdPoH9i7llAhpUyofJC9fqBySHJ+eqNxebmVE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FzSgQxuxXrROxQSGVGHyNGWvrdWvd2sA9Kzd4FBgJPFACCzlmc7P9/ZpYU+ut6pjq
 Y2P30OP5EX8cXA2YGqU9iYT3Tv8iJL6o3JsdiMjk/5zvU6Izu8oGJ7nKETB0JCkqFw
 OE3OsgltIvNtvEnaq7+bMcTtO+Qi0eiLs5kP1/9pw11I3Lnk4ogEIDy4xGxDkorU0u
 V0PfH573wbVXnwQfwFtFqQFhsXt9DE3u7OWaVuqbkl2k+c+HBO1x+Uaneh2fE86AaN
 Dkwr7M6bENEaLSTjmULNemGmbf0L70Dq4eoa3VOkt9VAXAZnkV7VBNduC4rKVQAyiL
 YnI6DH1WIkZqQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 UUvKsX8VqEuGfJbE8ND5wka6p6tj06uHhnX0Kaehf0jPGShuCnTjmluNouD/KcqdU/GLjaqdy6Q
 bEBWWW0JxgHqGsHfd38kZiuyDVOWwK5uO6+4Vg2a9R2B0thFfulqbmCIM0D143f3ckcodwqFUnH
 51gc7uB9NMV3ETguj48q2LjyVZhxVf3RwYiJxKTO4UOd91p2AE4C8ZBqTrtGU9G5b052ckl9LeD
 U34GQ6yJFpIkrz3YRC5RbG8iqwaAvS2iG4sCA1m/S+L8KQCzuF2Gtw7ybwQwdx0BiTzLU3GMclb
 3lRLFmX474s6dnnVqYleXnmG1sbiKrtH0aXYoom/z4WSb0fdQdG4BYEcJtfbNb4HLyj/Ri7N8Kn
 vvJiT8mzlFAf37//UI7ItzOhrhH3uWc0oMhFKkvdkJ/DuHoEsTPui9OZhloS5n4IV3JZzyMA4KY
 vSVoydwDyKPW3qrg69O4tCUugn0mEth+iHZ6/RtCCTyUnkiuDMJTDE5VRsHwl3xLgDR70/Qwj8B
 0OcepBMjqY9Q4bO1/AFFUi24AvGO2bXVHZl3SGbV+W0jcRLBqgSSKj+sjPpKIOB2DdB4fZ8KTfi
 AG9TfKU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CBAAA4C4D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uq-000000000ir-2q6i
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:47 +0200
Message-ID: <20261006162106.3439373-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 66/84] package/libcec: bump version to 8.1.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Pulse-Eight/libcec/blob/libcec-8.1.7/debian/changelog.in

Removed patches which are included in this release.

Removed dependency to libplatform due to upstream commit:
https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

Updated license hash due to upstream commits:
https://github.com/Pulse-Eight/libcec/commits/libcec-8.1.7/LICENSE.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...DeviceLanguage-accepts-3-char-ISO-co.patch | 66 ----------------
 ...Python-wrapper-against-SWIG-4.5-whic.patch | 78 -------------------
 package/libcec/Config.in                      |  1 -
 package/libcec/libcec.hash                    |  4 +-
 package/libcec/libcec.mk                      |  4 +-
 5 files changed, 4 insertions(+), 149 deletions(-)
 delete mode 100644 package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
 delete mode 100644 package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch

diff --git a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
deleted file mode 100644
index e2a86e1f7e..0000000000
--- a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From f53490e23037f17b68043f5e1ff2f4378d227d56 Mon Sep 17 00:00:00 2001
-From: Lars Op den Kamp <lars@opdenkamp.eu>
-Date: Mon, 13 Jul 2026 15:24:27 +0200
-Subject: [PATCH] fixed: Python strDeviceLanguage accepts 3-char ISO codes
- (SWIG char[3] typemap)
-
-The SWIG default char[ANY] setter uses SWIG_AsCharArray, which reserves a
-byte for a NUL terminator. strDeviceLanguage is a raw, non-terminated
-char[3] holding a 3-character ISO 639-2 code, so a valid 3-char value needs
-4 bytes and overflowed the buffer, raising a TypeError; only 2-char codes
-fit. Add member-name-scoped in/memberin typemaps that copy the raw bytes
-(str or bytes) so 3-char codes assign correctly. Scoped by name so the
-NUL-terminated strDeviceName keeps the default behaviour.
-
-Upstream: https://github.com/Pulse-Eight/libcec/commit/f53490e23037f17b68043f5e1ff2f4378d227d56
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libcec/libcec.i | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
-index a01f9afc..520ff7af 100644
---- a/src/libcec/libcec.i
-+++ b/src/libcec/libcec.i
-@@ -15,6 +15,37 @@
-   $result = PyString_FromString($1.name);
- }
- 
-+/////// libcec_configuration::strDeviceLanguage ///////
-+// strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
-+// 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
-+// for a terminator, so a valid 3-char code needs 4 bytes and overflows the
-+// buffer, raising a TypeError; only 2-char codes fit. Copy the raw bytes
-+// instead (accepting str or bytes), scoped to this member by name so the
-+// NUL-terminated strDeviceName keeps the default behaviour.
-+%typemap(in) char strDeviceLanguage[ANY] (char temp[$1_dim0]) {
-+  char *cptr = 0; size_t csize = 0; int alloc = SWIG_OLDOBJ;
-+  int res = SWIG_AsCharPtrAndSize($input, &cptr, &csize, &alloc);
-+  if (!SWIG_IsOK(res)) {
-+    %argument_fail(res, "char [$1_dim0]", $symname, $argnum);
-+  }
-+  {
-+    /* csize counts the trailing NUL; strDeviceLanguage stores no terminator */
-+    size_t slen = (csize > 0) ? csize - 1 : 0;
-+    if (slen > (size_t)($1_dim0)) {
-+      if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
-+      %argument_fail(SWIG_ValueError, "char [$1_dim0]", $symname, $argnum);
-+    }
-+    memset(temp, 0, $1_dim0);
-+    if (slen) memcpy(temp, cptr, slen);
-+  }
-+  $1 = temp;
-+  if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
-+}
-+
-+%typemap(memberin) char strDeviceLanguage[ANY] {
-+  memcpy($1, $input, $1_dim0 * sizeof(char));
-+}
-+
- /////// replace operator[]() ///////
- 
- // CEC::cec_datapacket::operator[]()
--- 
-2.47.3
-
diff --git a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
deleted file mode 100644
index 351091e17d..0000000000
--- a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 55f3443559b0b32a1d7194e424727575faf6f7d4 Mon Sep 17 00:00:00 2001
-From: Lars Op den Kamp <lars@opdenkamp.eu>
-Date: Fri, 31 Jul 2026 14:46:27 +0200
-Subject: [PATCH] fixed: build the Python wrapper against SWIG 4.5, which
- removed the Python 2 compatibility macros
-
-SWIG 4.5 dropped the PyInt_*/PyString_* macros that pyhead.swg used to define
-for user typemaps. Two places here relied on them.
-
-The callback return handling keeps a PY_MAJOR_VERSION guard rather than moving
-to the Python 3 API outright, because the x86 Windows build still targets
-Python 2 for the EventGhost plugin. A Python 2 int is a PyIntObject, not a
-PyLongObject, so an unguarded PyLong_Check would compile there and then
-silently read every commandHandler and menuStateChanged return value as 0 - the
-one thing those callbacks exist to report. SWIG never reads SwigHelper.h, so
-the C preprocessor makes the choice and the file is SWIG-version independent.
-
-The cec_osd_name out-typemap is deleted rather than fixed, because it is dead:
-GetDeviceOSDName returns std::string, and cec_osd_name only survives as an out
-parameter in the C API, which is not wrapped. It could not have compiled if it
-ever did fire - cec_osd_name is a typedef for char[14], so the $1.name it
-dereferences has no member to name. Removing it leaves the generated wrapper
-byte-for-byte identical.
-
-Verified by preprocessing SwigHelper.h against both Python 3.10 and Python 2.7:
-Python 3 resolves to PyObject_CallObject/PyLong_AsLong with no removed macro
-surviving anywhere, Python 2 to PyEval_CallObject/PyInt_AsLong.
-
-closes #726
-
-Upstream: https://github.com/Pulse-Eight/libcec/commit/55f3443559b0b32a1d7194e424727575faf6f7d4
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libcec/SwigHelper.h | 9 +++++++++
- src/libcec/libcec.i     | 4 ----
- 2 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/src/libcec/SwigHelper.h b/src/libcec/SwigHelper.h
-index 3c40fc87..0752acb2 100644
---- a/src/libcec/SwigHelper.h
-+++ b/src/libcec/SwigHelper.h
-@@ -137,8 +137,17 @@ namespace CEC
-           Py_DECREF(arglist);
-         if (!!result)
-         {
-+          /** SWIG 4.5 removed the PyInt_* compatibility macros it used to define
-+              for Python 3, so call the version-appropriate API directly. Note that
-+              a Python 2 int is a PyIntObject, not a PyLongObject, so PyLong_Check
-+              would silently reject it there. */
-+          #if (PY_MAJOR_VERSION < 3)
-           if (PyInt_Check(result))
-             retval = (int)PyInt_AsLong(result);
-+          #else // (PY_MAJOR_VERSION >= 3)
-+          if (PyLong_Check(result))
-+            retval = (int)PyLong_AsLong(result);
-+          #endif
-           Py_XDECREF(result);
-         }
-       }
-diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
-index 520ff7af..0d757aa1 100644
---- a/src/libcec/libcec.i
-+++ b/src/libcec/libcec.i
-@@ -11,10 +11,6 @@
- 
- %ignore *::operator=;
- 
--%typemap(out) CEC::cec_osd_name {
--  $result = PyString_FromString($1.name);
--}
--
- /////// libcec_configuration::strDeviceLanguage ///////
- // strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
- // 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
--- 
-2.47.3
-
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 2dddc53635..7eff540f38 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index b04c724668..d5fa11cf04 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f7da95a4c1e7160d42ca37a3ac80cf6f389b317e14816949e0fa5e2edf4cc64  libcec-7.1.1.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
+sha256  e4ac4d1dd3559cf83189d29ab40fc5537b5a2beceb82916ef173dac7e50dbfa0  libcec-8.1.7.tar.gz
+sha256  088a32f3caf17e6e76a1a287af32abda65211049593127beb221769f4adfebca  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 0e730503da..380411e15d 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 7.1.1
+LIBCEC_VERSION = 8.1.7
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = LICENSE.md
 
 LIBCEC_INSTALL_STAGING = YES
-LIBCEC_DEPENDENCIES = host-pkgconf libplatform
+LIBCEC_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBCEC_DEPENDENCIES += libudev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
