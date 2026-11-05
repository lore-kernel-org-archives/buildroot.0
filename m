Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD9606EE98
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nGt8b7Dx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F095813D0;
	Fri,  6 Nov 2026 16:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvbV42aLI7Kq; Fri,  6 Nov 2026 16:08:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EFDEA81567
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981327;
	b=QbfoLKpExWCVZyxGfo+bIQcPUPbwDzxJUFiHO6V/XOm5fxHqFyhzr032HuFAdoNkqmu1
	 PRXj8COJa8r8EdS3LOPfrueq8/YUkiX635UsZGRUWKBrYbQG9h1XjgJ729/NpYR+Ljy1B
	 7SH064uNOb3TH8Z1k0H/0Fx3H/FNuUSFUyqPK1QpmjYJ5swNatfPqrnywifpBXRrmAjvs
	 KcJNhw4a6BrYUGdJXbAiTpxPi/Z2s+N2ZwySZ7hq3vlH1woWXDbbf8GLU7qxUsXu119wl
	 VhE+uD6csxusT9eeiAIX5xkJytJP5xHtBzom5mECw7Y0nQGyiAjYQ4DZ/8vbn3ekFzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981327;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2iVyTjSt0/xlqPiBdUvk/yLk7qVgCWfPSgwwuAZuH8A=;
	b=ikNWgnN3UyM9mjQUHw888VgtvEXxgU5js8A3BqZmFnmvVtcT/CoYLfUDU+GZ/Ns2S9VV
	 8g0ZVHpI+tev+23XfynwehcwsibQqrtG7FFJf0mSB1OSOvjaDed5DDKmAC2trJHMraCYr
	 qXzQ+vyzq5FWyy/l79Ffqv/J+wPUsYm4yBo0L6+omrxZuLKyFPo3Ujpt/A2ojsX51F5Vv
	 rtj19Zg0R3CAC/io8fN/Z6hbFA9rgTo3pBuQAA84QgOr9ACI82h+/vJt3V864RN/59mgX
	 cBDCU3VnKAl4LeW6WY0em1Ek9LXBcD+fid5bfimjX4aY26af9cw5/BT33nhLUs9HZQg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981327;
	bh=2iVyTjSt0/xlqPiBdUvk/yLk7qVgCWfPSgwwuAZuH8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGt8b7DxTr2FC2wAER7QbJxalZLpd+k5tOjuS1rTn/OltFXagAV4AKGoSKwhj4Zj0
	 s7SsMiFb/GCGX8dEQMyw8Q4EVr+h90dCo1PuzZLkGvAMaBpfS5wWHssHF26jvbQ6xa
	 PcMNPIpUvjENLZEZ5vgXsMcFUaimHJ6FjJVIgT0jl+DL/x7s3ahwdKoVKeFscwQvk5
	 7A0b+27JMn+XPQvNuHPU5UHERi5sHsNMDqsO+V5/HiRelyFJcIlqgnhAcnf1/RKcsi
	 hJM5aoy3s0PlrGFyYd0g8Gnk5Z9s9iTtdGZU/3C72SuJkQm6f0ucTukkGe6yNnVx1l
	 3eeB/dp8NRPsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDEA81567;
	Fri,  6 Nov 2026 16:08:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D172E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3914381331
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0COVn3e-Ycm for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8742C81330
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8742C81330
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD0179E0B0; Fri,  6 Nov 2026 16:06:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7edaf226a19d216f662bb23e06f544bcd8a8b609
X-Git-Newrev: b9087a21312d61c2076852aa850eb5dc3b8dd7b0
X-Patchwork-Hint: ignore
Message-Id: <20261106160656.AD0179E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tor: security
 bump version to 0.4.9.15
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
Content-Type: multipart/mixed; boundary="===============3555080953366671879=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3555080953366671879==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9087a21312d61c2076852aa850eb5dc3b8dd7b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fc7d8b6b899ed85fa7c4ee04653e390751bd3711)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 37dd1e6000..dc7d35fa67 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
-sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
+sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 49b9524c26..3f07cc356c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.14
+TOR_VERSION = 0.4.9.15
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============3555080953366671879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3555080953366671879==--
