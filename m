Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91066606A333
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ibsAjG9S
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6BE608FD;
	Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-CS6zb5d_Dd; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8CC67608F5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981322;
	b=rZHZk1b6pB5gARweK9ZFpJP8aE4IrofJkhROhRWN09BMMX3b10QuCzfi8rKCjnbCu91+
	 plvOypoJkinFCPjB8jhazHQND6zx3FlGM6fd2zL0Sl7B6nO10vl+N9d8L6Irxi0UAsl2v
	 ZJBcJmErmWQR6CavHQDSIGVptHqUPFbOHUyDh8c+c2gvOl9PrDgl72nkGu5/KGkUXpmv7
	 ZIt53/PF4EZ43ohG6FtupfyRyxjlEUt/yUmZv3KxnAVegHUUjRHwuKxrTA/tcoocIs+78
	 6OS9/CAtajlxyhSYAK0YjIItTW08Z+DCaP/nmDyeo5YyI9xCLavPNGzrbXLbxDyFWSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981322;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=n4xps3y6FjlX0Zuah9fIwbgenZDPTfYuxnka5NxImc8=;
	b=TAVc1z2nhchOc4RrKKQbUn3z3qOpBVkeYWbcVF/gOix26h8FXPTYm1IK4WMlCV0bwhOQ
	 xSldRvzBhsWu0ICE5IB79ahbTW1jTHnwCd3xL+BI3/rUJ0FMv07yGCGHpnSNExmxiUmBy
	 F/I2EA0f0fZq6+Hu24Z4jn44sHl2ASp9afa8NCQZ1R8eqNUAmG2YK8sxza5sRc5sQDKYQ
	 /RLTsyuy3ueSgZsbltimKWHJkEcDMmTVBRK3Nug/evncNEmdtkDUev8C/Vy2Es8+WCHI4
	 d106FOzyg6McJHVh7wS+vPcnN6+Bg1j5zQm0ZeD8O1zB8pBAncP0x7lbEswA8jCwrTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981322;
	bh=n4xps3y6FjlX0Zuah9fIwbgenZDPTfYuxnka5NxImc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ibsAjG9SnTf0O/A7U4koQCJuu1vMzdJf4YLXMlDy6t5HRYDl7n9RM7MEuP+nv5St9
	 OBRGIYrPYbRv5aP2AELKnj4eKgbzhD/142yduLT7b27Wt1YPfzhN+aHayBXTE94OwD
	 3hcAGfZvC9bXYTgoErQpBnz0LhU5Lf4KLyxL0REJT29tOgVuiIoo9O2Lwj68C/Dvmz
	 LovOOLdQuwb6pTAPzTWsoU6AmIHh3RSjHhcWf7hwxRaUvy6Bwsx37RuUIVO/QN2pSF
	 7hYTmul7ok3Y2IkGJB+nay2WPDBxTwS5lemY7kFugehICi8LVZoY5tD9cNXVjV/zzE
	 26Tcr02/xLa2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC67608F5;
	Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 910174B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76F7D40917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rm7EJ5LGH-tJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C8DB740913
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8DB740913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F22C49E09B; Fri,  6 Nov 2026 16:06:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f9eb30c33d22bb8e78cdfe876fc9a62cfcd72df9
X-Git-Newrev: f4f82e5e6e8a6c3346316c8df0ee1c54672b27c8
X-Patchwork-Hint: ignore
Message-Id: <20261106160653.F22C49E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ntpsec: security
 bump version to 1.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5844857263527680969=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5844857263527680969==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4f82e5e6e8a6c3346316c8df0ee1c54672b27c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

- bump version to 1.2.6 (for details see [1])
- fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, CVE-2026-102485

[1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7af7e73ca4b485ba77105d745feaae4fe93cb45d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 768ee75a86..4bfe81aaae 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
+sha256  c82f213532d2a5b5e9c368127287ba69a20e3116bc134e64a5c767f7c96565d8  ntpsec-NTPsec_1_2_6.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 0fa8a3f527..a67308af4a 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.5
+NTPSEC_VERSION = 1.2.6
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \

--===============5844857263527680969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5844857263527680969==--
