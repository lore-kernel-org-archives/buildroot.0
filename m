Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA8606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OpunpQs5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AF180D87;
	Sun,  1 Nov 2026 22:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn9uXoiOvRtS; Sun,  1 Nov 2026 22:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62C4A80D89
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572920;
	b=NEkMg5dCvj7L5jR7En8bQfEe2wM2rgV4A0hYhJ7G0FM/uQ40rAbR7PfRHp4ytXcq+3Bn
	 IDDgHjgSBZ7U+FiVZZ9yAyCIkM/2ZhlgM3PwoZftB5eNebEJs2pnn4TAsQZ/bXYBbtG2k
	 2vtokIWSHK6MLD4TQYqPoLOuZiFkTZpeP17t9S6JLeXhBmEe1BphH7pw9iMh9ZzLCMIek
	 8T/SFlstZ0Ak/E3468YTJJdMDtQhdj4u51LSxEeFmKu7J7OLQ3/6EWJmmIUBVlAAvX5BM
	 GOpepbRAi7fa1UtQLpNoVZMrMjsHgtNJnW/VHxia2/uAfwJIxfYLNiUWLGqROoxoYSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sCLxTf2np3PrjnnsO+vn4gG1mc6pr/tbBspULqizlw8=;
	b=AIddTDBL/54FLdBZpKiigamoUh58cZZT7ACKNwg1NNSDiyXX5bxNiGfC70Q6JSJDQ1dZ
	 FxhEnYXT2MD5FGBFItiBwmQWLCzR6MZY/wDEfJtr1b0N6b2/w3wzH5bdK6K1A0TnEY2KO
	 cLKsEPhPOG7soYxTUJlvCwq59MrIIPq6+QDhgjJ/me8REB9KWodifGt+MEmO4YJYwJ3Ab
	 z6jUmMpuWXys+k/tcE7CoO8+dPz/93JfVvnEqTKNrvdc0Gy6aDU0Yln1OcwCbEK5L5NmO
	 E36SqoI7p7Invc9tIG35/wHh53AgoIo4MfKYH83uo6z2b4SRinQ6SKe2WNDGmIVx9Mw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572920;
	bh=sCLxTf2np3PrjnnsO+vn4gG1mc6pr/tbBspULqizlw8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OpunpQs5dC08M6gVgYhbKX5Ey1UeWmrTD2WUUIIzJziDw5DntZg4lFYMP5eDDzinQ
	 cEgWxTNc5PfmkugdEjndnk44OC/a7IK1J/9LZSDQMRBclumy5pwKRLN6QlGwzw8PHg
	 hEuM0PS4X/rLYQiArBQgcsKEhLm9woUE3sWKWi/B+40nkIn8WhPFhU/dQumK/FQRZi
	 u2isSLWsoLN6A4vOBzD2WVShCwnnLvX1ew2fWzMfXyHOWm5mONaR8LW1aUGDIl/8vX
	 oRxqgt4v5cZM3wW+EsGET7GqGg9HmzvqcTfpktJ/IboAJ0gjUQFlNG9J4Q2RrGibNE
	 eSsN9rQ4+tZow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C4A80D89;
	Sun,  1 Nov 2026 22:42:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7B3F435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD61A405C8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHEoCBo6vBew for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:41:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C0132405C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572916;
 b=iULVoLwMEPypGUujwnuoxz01LKX+vjeB07PF4Jz9L72X8xTOWAX1ZSVqsD7P39mV/cJl
 cvblfxwk4NvBp53dnxGHEv8boCM8pKeVfWv1kYQtaxCCTDaYsqVRPCU5prfI/CrsAkTG7
 dxLhjWOt6n6HNhUM2OKDgTMAWj7cCfdK/AwK8JMw3e/cdnmAWRE2Q0Cqp+9NmzrcHNqqR
 HzxYybY8dWxMgv9lIee/cb8xoDYXy+lwugueWnIsgPmwVEcVVY8IrcXHLnwOKOZ3fptAV
 LB7Jq5W26qWWMei7WSkw/bhw2S0FjxeE46GddyrKEWinfun9MkhQIy5qYJh6cjteCNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572916;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tMSLqFke3P0oh4cVJ/Q9TB7BhMazMZs7814DVnNqybo=;
 b=mfkt/H5vmDOdFit0NiAzhMWFi20c7506+IBlFykWiud56e9KaYIex0ONUauj74RwdJmh
 zsNEJAjEaHk+BXqFraDuChI5i1hf1rv7qhvkP1CoucTI5EBVy8UW71mFh+Vecq3izKghB
 8FJ7/b3ECJn56/8vCF1XZeM0mb4jie2+JuvsN8suHJf1tICqqZEjB6ubRvju9KbFjaYPU
 UlSf2ukbykj/xiDHRo35HntsDFGONDoE9OWKURBCwQeo7OqoYfYb6Y9ds7Cg/Uev44TVq
 ZKNgBuo93kzm5tu08Y8DFTAnojHvQ4soH72Lytij+pE6VlXX+M7ScWemMzsRx+d+dzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0132405C2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45DA49D5BC; Sun,  1 Nov 2026 22:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 23:33:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3860ebe69fbd053ba89b8b679eb986a62bfbc50
X-Git-Newrev: 9462bb4baf4b58bec107ee1c6952b1e17072c3c3
X-Patchwork-Hint: ignore
Message-Id: <20261101224027.45DA49D5BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaio: fetch from Codeberg
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9462bb4baf4b58bec107ee1c6952b1e17072c3c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pagure.io was shut down in 2026 and is now a read-only snapshot that
no longer serves release tarballs, so the download fails:

  HTTP ERROR response 404 Not Found [https://releases.pagure.org/libaio/libaio-0.3.113.tar.gz]

libaio moved to https://codeberg.org/jmoyer/libaio, whose releases
carry the original tarballs together with their sha512sum files. The
0.3.113 tarball is identical: it matches the existing hash. Point the
hash file comment and the homepage there too.

This is not caused by a Buildroot commit: libaio has been fetched from
releases.pagure.org since 2018.11, and all maintenance branches
(2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x, 2026.08.x) use the same
version and URL.

Fixes:
https://autobuild.buildroot.org/results/0019c80cc07db35d11241c516c04a0ad3e00ca57

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libaio/Config.in   | 2 +-
 package/libaio/libaio.hash | 2 +-
 package/libaio/libaio.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index eed843f44b..6796035122 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBAIO
 	help
 	  Library for doing asynchronous I/O
 
-	  https://pagure.io/libaio/
+	  https://codeberg.org/jmoyer/libaio
diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 4ddc97334f..f37e4cf4f4 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,4 +1,4 @@
-# From https://releases.pagure.org/libaio/CHECKSUMS
+# From https://codeberg.org/jmoyer/libaio/releases/download/libaio-0.3.113/libaio-0.3.113.tar.gz.sha512sum
 sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
 
 # Hash for license file:
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 16cb502f16..0512c6a728 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBAIO_VERSION = 0.3.113
-LIBAIO_SITE = https://releases.pagure.org/libaio
+LIBAIO_SITE = https://codeberg.org/jmoyer/libaio/releases/download/libaio-$(LIBAIO_VERSION)
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
