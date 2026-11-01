Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E574606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lC1gSQD9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C26F405D9;
	Sun,  1 Nov 2026 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nehNXVB_E7x2; Sun,  1 Nov 2026 17:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5897B405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554585;
	b=MjOHVn2izdHm2qNgT+tWGaKHOdpuM6YMfyrKQTyT665ME5WZJCaAbDmk+jLlGsW0ECn8
	 TuQ+lWX6LWjvbTq/PEVeeLFeSQ7mllQHKQEzQBGEWrbsbsmKUqS+QOqU+9+S3efx+PpGA
	 31Y8ZFkM7ZA1syAmhWTh0MeVRsg0dakbz/ARNudDnKk4Io+cZvS91v/DQxSrZ/dZmV38I
	 Y/X70U3X/IPYsiWK7HYelWxJbYMGnkoMjBwHFj1+qIa/QT/m3IyYokjTsOenZ1yhvPWLH
	 iOM5acstNAjZ1bSes1/yulJPlhZZPc+qbsOmqIaFytnGI9W7FHR8mBKySRklRasLo4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fRc/OAwP5qClmPFcvmpdsrpsG6KzjUc58v3xPaPQtV0=;
	b=DUye5A/OpNMgIaVDcxKxSedMBKTlGfJO+5L30VOvpsu+REGvc1m172m88eo6To9radIO
	 A7hcZ1ahftWLa/tJ8GSuQY9q8KBBdzPBbdYKK8hl29DT4zNhU80gVGB7p0owCwMhcMemR
	 BQZdsMD8HYvc+3jnV1ylEnii++eLiuH1v4fLHyNzuipoyAgVO6sr2Zpo61tI+2wb8tw2M
	 j+C1Zrks5oXEglsmu8ib9xtEPjvp+Q/4O/9i8OQN2Hx4LPDAwktzBfZI1li0nWuTm4wQ7
	 43RuqlrS3m2mT34FEpJTxc4XMFpbzfq4gPUBQtlS6qtwFyI3+Qow06lQV4h9H0dtDBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554585;
	bh=fRc/OAwP5qClmPFcvmpdsrpsG6KzjUc58v3xPaPQtV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lC1gSQD9RPXhKwecc2utkjv5V704rcjCSD+NVqNZNnHyrK4JMWeq8mgD1r9nuPBg4
	 GDs0M3kkXqmN8BoIBO4hoGVLRWtXKPKy/PbbkkItVUiCa+aReKRDzr5gESNj8zluVw
	 7ZsUpXR/b57UPNB8ECYaITkEv87yYufgiIqoMxRxqb9CZf5ySVStDaExtrVZNZN+YP
	 MoEEzhI0O991Rmwq8PQtEC5L6G4PtxbWSxQ4GaTm/6Nu6cMo0xp2rLKy+Btxl29tDx
	 byUoi85Zj2z6rPGHYMHXptmJRFM5/CilPxMrDqOObUkfV6WInAnCYV4ixdTBdBWcc/
	 jg50bWewoyjSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5897B405CF;
	Sun,  1 Nov 2026 17:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAF14EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AA5280D88
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMmq6qjQoxPS for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B04080D85
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554577;
 b=FtbWvu65pPftf2rKjHkVJD6rH42118VbYOfOSGPCNURV4RgV4tQhhxO0Wy7wzfmdzGLn
 B4FHvQoZPLfBD6C+Rd4gAFwEd7icv/zot+BqGbpzyXixBcnQxDcMwjfOwn2X/9CcVjbTH
 cSymthJCHheys/XhfNTj7ls1zJFRJTGp+ep1p5AbtxEXsgoZTfKte7j/BfG7cFKSp9Pk8
 p33lP/c9v2m2E1APGHmZLUwSHZH+aOn1+q068YPJO07OyhlMGtUDhcv8ByG+toGCiUDiE
 Ch3/XWurny215H/IoeDN0B0hL87KP3C0R183wjtUuiZNiHrPofahiHb2iFtRzqDXaYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v3bSZ3yG+nFy+6wub4CzvbmxKn5ma0pDJUXFox1dXUY=;
 b=Hc/bidDK4Wl6dEC23xEgIQ1SO7JMyXap/jHFc9Z6aH4oygZ/+EEtkHQ57NptANVyr9QA
 FkVlIKTncX3pM8y0Qyj4UvvZobMkDXnlEaoHLcHaoGWiNcXBWOh9RrvzBieZlQj/rHCkE
 2IW/Ok+mBVkkQkU1+iFDxRm1ouARtdl9x99eHH1fdE4Mt6IJ2XWCkz8/+JxEdEe8r2Zau
 RgrPK/kLkIUWhpDrZ5IW9oN6eMAmqY8K8E+YoIdZBS68QN3fUWWr9P+XVLNEBYJPshbBU
 KvE2UBlb9keLiqhxyEmWbLh6qLb2K35JJ4ymKjBQCtBrgYLnBZ3gf2newzYlZ0xqV2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B04080D85
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 551FB9D425; Sun,  1 Nov 2026 17:34:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 006269e93297e1a4009553526b158c6287aad805
X-Git-Newrev: 68458f39d17e56acf627534f29a939353036410c
X-Patchwork-Hint: ignore
Message-Id: <20261101173448.551FB9D425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibftdi: bump to version
 0.24.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68458f39d17e56acf627534f29a939353036410c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 10dea3f7dd..5b2104bf9c 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  6243ede1ed3c210846084d0c204f0a96  pylibftdi-0.24.0.tar.gz
-sha256  e2229bc10d077f018cbe7b2b490227b2b538643fa6f7bff132cde15549ca129b  pylibftdi-0.24.0.tar.gz
+md5  9ed7dcb7eb5b3f4136ef06cd6fa48cd1  pylibftdi-0.24.2.tar.gz
+sha256  c892e71178055490b90db488a0195cb5815b1554061c4f31f13c318806d532e0  pylibftdi-0.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 58c1c82c86..2e77069bd6 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.24.0
+PYTHON_PYLIBFTDI_VERSION = 0.24.2
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/19/5f/f0e03128161fff27d4f92d57b7fab20fa64e9bcd53627442d2ef43b8882c
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/26/d9/23e892c9a1d08a0e01623164cb84ee6334aa1c33dafd0f4cecf763513a31
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
