Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A75606A331
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BL26p0nJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78C004053A;
	Mon,  2 Nov 2026 10:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klqML32fZ0K7; Mon,  2 Nov 2026 10:54:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ADB1C4050C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793616854;
	b=Bz3m7P6wRhttANULHlV3rclZ56nVX96tpuRcv6hsc00HALhcttcHM27sYluCkGDlLVZV
	 iahjDtQVZKzFUCScurEu8hDzu/9d1SlRJmsV3FqUv6HJU0dsvvfPC+0CQMqY97brZmSy4
	 Brss+lwT8Zm2ScIIt/Y/Hwb96el8vK+5kiqziDQTXQtc6B12f7fFJrcqAnZLFKiKAK1bT
	 Nx6bwXEoMYTz3NogkxCctA7AJricK0f2KGuV0xNcVFm8NjBOY0AvmJMIoVU02+ecl40T+
	 ZEEPz/zBkGNS+fKSDVAflZaC66ASO1arutZ5eNOiOYRHNfIuh1E+23TQib/o+/VoDbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793616854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/dt/iUU7kp2iTNW+j61JYtaqtzwSSLDQpOJAgUQtg8E=;
	b=fePEdqeRmWpWaEoni2DypQxiCebjPeGwaboT5tHOd0i8X41FmXLIIuY6QAz+CrA0cBs6
	 vplg03ks4J9RKWqhIzrO93VGtpmfg+kuE99DvmXAZV/jvq578SsNBJaWCLV+DfbCCJJWq
	 uNoaLx4Iqyg5GgqozzQQipyIMQcZsl+9x4jO+wgd4v+bqybdhOaFd2YGMB3GRYkAVhHxt
	 KC5a8K/i54lz23UuyjgCrG858bwV8hEIIiy0DEzl2noAvRIu6cnP95Qwry9cCRWq052qB
	 aIS2HghI+1KaZl4eLAsQnZMPkIvCEPTRE41++IAjMIX5ZCSMJNG2KnTj0hjoY5JOcNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793616854;
	bh=/dt/iUU7kp2iTNW+j61JYtaqtzwSSLDQpOJAgUQtg8E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BL26p0nJGWh9KNh2RdmXWPpi+3D8MLaOD4wP9cdJmcprJUPGFC+Jg8mwCfCVZGXBZ
	 bFzHO6NYxrp1jJY8ggd3puNa2FbL/OYrlH/KID3u5xK4bM6Fu66qQEtZcX+/kddg7I
	 mb7zkdGwWdpvLUK5fRtWkL7bymurJyVA6EZMhS9zTOCgVhmbh+izkteHbqh0akgnwi
	 tcRcXPRj7Jv5F6kn+3JlGxhg/BXigw3enfud9ubT0lIEm5bt3PnvhxijNYkwDhnXP0
	 8LXJ2tOPMDuTlqELY8yhIbI/4pNhvKZ4Gkvp/X3aav3HFWpfcni1gptGIB0UeoNpyu
	 kS8g0YIc6A6bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB1C4050C;
	Mon,  2 Nov 2026 10:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65177362
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6279380D00
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mizfSuNSkTd for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 10:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BE3480CDA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793616852;
 b=A3r5eDQU+yClcW6tMmZh6DCL35kihkzQVU+Zp5UyPEBUa5sVz9zCRRKTc967CbHefQMA
 60bRZ1xCbjvf8F1M25s6LvYbpFw940dNVzilLymnoMUkZ4Bjsu1VxgmL+9Xrzk8FhCuP7
 DMCoI3xcclpx3wy0SGyN2Sd/tbT7lD3NNKp8B8UvUXzR8ecTOeHsie9ab1oeea2bPwCnM
 eAa0qiJAOMko8C/Lcax3YQsdT6ffTXROyQUCzciumfqVt3H244S6PLMXMdlwKNr0GpgB9
 Dooaq0zDo2CCeYExrriXsxeu5kHSy4zuqzk/uXi0MaK6x55QMZ6RoJlEp9T2+nB7RpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793616852;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nrVTWdWOUfM9Hn7tDj9AMnC8i/WU+Jn8JODWrG3LF5k=;
 b=DIU48ge5DIGnHjCDx4EmdUmI3ObGbS3LxdJPjidEpAOgn7IkbVO7U8HF0PIxP5NATgZW
 WL45U4bVGDpZAUxbIhf7SMNncz0jEgE1D2UWfHLEO/cm+H8Rjfp/Zl10rfRQJzPyUbrDK
 emY1TGvLWEk9ugdmHZvkQq13YbB3G4bCOcf76LtVmyH9oRlUyiS2Xvp1IwpYVL+fbupvM
 tEDKsOs7boCiPqpl/hth5XT6DiiT6xPJ9Evdav0yIrqRNLNgY8ARpyNQjnyfaY7XdZ1UM
 XdQZXpXSVBhee/1Tcf0PJSgU6JuVsaO6Em7/bcu1nmTmEVAkfX9p1jUDFSgn7YeQp1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BE3480CDA
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:54:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E02E9845C; Mon,  2 Nov 2026 10:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Nov 2026 11:48:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: efc09a0fce6f76d79d5974790175c8c5323e132f
X-Git-Newrev: 4081f0aac9f1c8e21c33703f06c9f46b60b01660
X-Patchwork-Hint: ignore
Message-Id: <20261102105242.8E02E9845C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/brotli: fix hash
 of brotli-1.1.1.tar.gz
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6243201028731640635=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6243201028731640635==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4081f0aac9f1c8e21c33703f06c9f46b60b01660
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 58e85acd44 ("package/brotli: use github macro") was a backport
with conflicts. The conflict resolution took the 1.1.1 version into
account for the filename, but kept the hash of brotli-1.2.1.tar.gz
from master by mistake.

Use the correct hash of the 1.1.1 tarball again. The github macro
URL gives the same archive as the old archive/v1.1.1.tar.gz URL, so
the hash is the same as before 58e85acd44.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/brotli/brotli.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 8db342ebf0..b80b008e42 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.1.1.tar.gz
+sha512  f7f3a7e4620403aa26d69458e0bb886d322f7677685c55717fac824f0b789e0c25cf4ff7d8d455d70a8526d0150d7a09b9df292a11f9ef5d3bf625878cb51368  brotli-1.1.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE

--===============6243201028731640635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6243201028731640635==--
