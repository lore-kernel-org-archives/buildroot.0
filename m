Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50029606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/NxQUSa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BA1405CC;
	Sun,  1 Nov 2026 17:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq--XcUnvu6z; Sun,  1 Nov 2026 17:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BDE4405CB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552842;
	b=VgdlE9A012yDRdTnDo0F7N1gTJZEqONEsT5ZZb9lnKRqSZfGF/poZsufHfD5gw28JpcS
	 bHQ4oATDnP6Z1sB0IStZxZyol8qaVBzNvj/dxL5asZbaUCzj2e+/GDL6XbFw8q5k7rNMW
	 DYE0nhVMLfgDoeNbOqU3QYbrSkh7xd2VfyGUgAgPirQyN30KY4aT67Wgw/WCDqEMqHeBD
	 A6lnjVrXxHigefSKTVjKWD4Q3JMOGtUA4tvBFugGwCUGAQAbM1mmiojSOgK8Fw8VMiFZR
	 Yktbujt/joSsnvZ6y/DdTTliWJEgNBU+z8qIjSRN7YV6xGuSQhZG60p77/PY+YmHwtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A7g2TeHCe9bFWWPNe8kSV/yM9UjZn6b/FRpjY2QSlbg=;
	b=tZgd4mytwwy+EMUCFGTwkP070h506yKpKE8TUN+sRtB3JYxjuc3bRwnq1CekGGyR/IQG
	 8iwxe2nwWDFV2qAGhWZg/1rklf2oegCdGJoSLEkPzd3Rp4jzEKfi/gXja96W22egV4uCD
	 HF33sqsZq6Vuo7BGBJp4UWpTJw+pxKV/ktxWCDbtz0MdXHHwJDce6luG01R0daypDX0q9
	 E66+v4fC3pUDN9tmQ0Hr5Y0facxDlKqKzai7n+krgbpwuNwIHNujw1k6svWgf70j7W14C
	 kLzE93vOPu8q/rDMyE0K51w5ZLomB2Fi1H6wrA3rgoLXqtBpTSbQ+dgGo/lu34+QEWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552842;
	bh=A7g2TeHCe9bFWWPNe8kSV/yM9UjZn6b/FRpjY2QSlbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a/NxQUSaX659rh1TMjSAZ2TlhLdFXfSFeHKHJAtd8KUaEEkord+j2S2cA4WZQPzH/
	 y+7rlor/AfI1wG0GDAcXHockw9AZu/hqQI7O61P/BguXtuBs9L22vyMnw/pfB9JAN4
	 0HQdVYrE0WTHMKPfyJWXl1TugPACYENLX9MZRR0TsHjvCkS19ltV9Iwlhx+Y8H443I
	 Yw8ulQL5O1QLp3mjEUF7Qisb20x4K7c3kgyYDmDxXxjQvx8L22s5xbGxq7GTU45f5F
	 UAtkwwd9cYwQAbe1f2FiWBLDATkHpLck0MsrwLQv40SASZqIUc7/UkZcyHidvYgoAT
	 49rXQmV4FDoig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDE4405CB;
	Sun,  1 Nov 2026 17:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B5EEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47A9E605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTjJcFsk8Rre for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DACE6060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=Subvgx/XXsCerU4Q5mXxCP/G6/ck+dgUevliEMN7NOvm8cVumMBHZYXqS6B71XBHB8hu
 lTyusT7TML0K7of52pvg0XOm25qaTFk8WKC/HQU78STSRzJZ0INL7vPo4jlbUJ2V7FuVa
 5+ZlWCEP8pElyYmt79U7dLKthYik12GVWdwraNBIorevbymO/pR2HuSg7A4wNykRrunyG
 QjiGIy02nNAtJIEMEiCLXlUPNoQYIaJ5FdYOTh+VZlRicdnst6IyLi6RPy7Ry9AKXZL+w
 EPl30+isOY0L6u739ZUe3zauMafRzVdAypV+pb83FytotTNSN6R14UC2d7U+nGH5TTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2jv9jp2RNFkgnkQSNfTF2Jy7fKM2BFyQrS/VuTUYfLc=;
 b=Uvp7BocAwNLjiP32F49ixaiCg0U0mMg9wiq6HNCSARJi0T47c7FK+a6n2+kCmzhP9y73
 Ab0gpRr6+VN/JZCh7eQL+jTiE07Qqxqc1NUzO2aXzHY8NtKyFXiYI+KfK3ACRNOQERzkY
 /Mp9jaWowy0Tr1QI1AgmHQK76k5Qqhg6Bj7ETsZzvpHmOWd0V+tXowW+FTiB/xf+uqI+z
 WU5rOWyqpqMd2cJJA7sZFbsTTUlRORG0cc+uqhY9utWvURmjE5YSZMzNveEwOkWIi1/4F
 VYgIBrVIrfkSyaWcdDC5OEcMy/XJJrS2G3Hg7dh5MzoDNvBI7Smcfu1W5O7rR2IlYLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DACE6060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 490609D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22fc84a150560b2a47454c3c41ea4b87063a365e
X-Git-Newrev: baf595f195294216dab08559ed3248ba165cea9c
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.490609D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.68.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/baf595f195294216dab08559ed3248ba165cea9c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 23167e17d8..5a3d92735a 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  95a2a896db1eb6f319ec454d1d9490fd  fonttools-4.67.0.tar.gz
-sha256  3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519  fonttools-4.67.0.tar.gz
+md5  e8b5caba01e81bc70a28f3a64c5943f7  fonttools-4.68.0.tar.gz
+sha256  73294e233070f71e2b3653b6bd8564af676d57f26d075761fb06d1ab2e4a7a5d  fonttools-4.68.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 0c82bbd62b..902b166206 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.67.0
+PYTHON_FONTTOOLS_VERSION = 4.68.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/94/36/102e180f8f5dbaee88b26595b01ca8aa80bf4e62128d9aa94265b3996c96
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/0c/b5/672312ae80ce8b8eb9779c56052a24c8f36652aa7293a1a420553bcf03e5
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
