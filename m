Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF258FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B0984C77;
	Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJNRLmR06F5p; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B9F84C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047942;
	bh=yobDxoZKLfHf0RKmwZXpI4Txxt816GbN9le7tdy7xbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RsqaLEkqKoh/CdNwXFCGNcUYfzFFyesWBzrrvhVNJg8ME0Bn0od/J3sKygZANapPy
	 PTGUTRG0JECN2rR0mGVGHhmITFAubqvnU5gVVFkoXAqu77trMy5unH3kPwmi29vW6G
	 hTF+rFfzp4pFGcy8Vx4j8vDR0LZiPcO1xbrfz+b9q/P8QyuZkSr/MTuaw/yqlr0pcz
	 /ClJAQupBn0e2IBYCvAtcea3gcFvCiV5v8Ts9d+XmJcUAGj84LLqRSU1GDQ93opmue
	 8eklUL3bYJGTvEI/PN7Qp4JxsDBMs49foflVncFDIWPrYFvCDkFJdlXwSQmm7wPgD4
	 heLgqwYlhR6Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B9F84C78;
	Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88B8E24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82DB261C33
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuzVVtI-Ggck for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568BD61C31
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 568BD61C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3E1C82AFB; Fri, 24 Apr 2026 16:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 212700b9d57c6fa6e621cfac52934a6b9331a64b
X-Git-Newrev: 4afa94f4fb9662a8655eca8d035b510352de1694
X-Patchwork-Hint: ignore
Message-Id: <20260424162538.E3E1C82AFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0272624020650631935=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0272624020650631935==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4afa94f4fb9662a8655eca8d035b510352de1694
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes: https://www.python.org/downloads/release/python-31213/

This fixes a handful of bugs and the following vulnerability:
- CVE-2024-6923:
    There is a MEDIUM severity vulnerability affecting CPython.  The
    email module didn’t properly quote newlines for email headers when
    serializing an email message allowing for header injection when an
    email  is serialized.
    https://www.cve.org/CVERecord?id=CVE-2024-6923

This also includes a mitigation for a libexpat vulnerability:
- CVE-2025-59375:
    libexpat in Expat before 2.7.2 allows attackers to trigger large
    dynamic memory allocations via a small document that is submitted for
    parsing.
    https://www.cve.org/CVERecord?id=CVE-2025-59375

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit f862711b1033ee3b0bd92f2aab9f16ee4035b603)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ed0d879f11..5b10f24f70 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31211/
-md5  04feb01316c7bb1b448001adbc63dd23  Python-3.12.12.tar.xz
+# From https://www.python.org/downloads/release/python-31213/
+md5  b67dc5d55b27c98a36615f7d0dfa6e4c  Python-3.12.13.tar.xz
 # Locally computed
-sha256  fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4  Python-3.12.12.tar.xz
+sha256  c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684  Python-3.12.13.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4ace4d8573..60ab5b0cbc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).13
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============0272624020650631935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0272624020650631935==--
