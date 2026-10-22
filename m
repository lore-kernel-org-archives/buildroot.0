Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB9606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aUpLf40M
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 862704076D;
	Thu, 22 Oct 2026 15:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnPxVoFjL0j7; Thu, 22 Oct 2026 15:25:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A992407C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682713;
	b=iHsD/KXL3Lew0Xf4YHPU/oLvRdiw6ei9t2n9NsB5hheIXYC4bSegmf9QleNPUsWVr3nh
	 EH+mNJWGbVxBz/WGq6lEcmRZ9SP6CP07LXjuwIyOm0X36kB9FUo5IRhMfpArF1RnXPe2R
	 47aA8tQts36IDQexCZKzIDz6acTBrrZtku5GLsWgl7EbmD0Q3xikF7ZdXS/DhIxTsiVs8
	 lKXYepmA2S/SYP+vEQ3x5Y5xnSd4WIDDxc6+vsJasG4kcram2pSfn2lqO2yFM1DdB9HPG
	 MhmGp1g4d+Ck8nhOYyqvfKANzu31YRc63jKJb8YIYQNSX9g9bxYRg6bvwbDxEt8WEOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1y0AqzrCsU3jKdXT7r2K+GeOVTgSx36K3wbnsUMmjmM=;
	b=U02Hdgo7IvmmVvbPIAL8MePo5k7Y8C88LQz99MOEIVqHG5nHqqN6hLoLWcNynTa8EE98
	 4Mq+02bbLbXsfjh1r515RKhxf7JNdXwHncb4L5LRWHrgrENycQESKB/sWicGye/vwtvzq
	 a/yyfSaauSN50Bg4nt9Mu9EpY68+wpFam7VdFKgn6t0PyzyrQplN2N9VTgUUyb6jFzFxg
	 daVFr7A5oUc16rfTD0gDfds4SOvcS5s+Ozk9zQ9PEema+nAwxVO/h2eW0QJmHO2pTiYFG
	 cEFu3cAaZmQ4EA72pLYUADFcTppI8eCpW9z88LAXHXY1s7RIEyt8me0P9tMbWHI+wRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682713;
	bh=1y0AqzrCsU3jKdXT7r2K+GeOVTgSx36K3wbnsUMmjmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aUpLf40M2HiuQsAR13kT/Vx668vqrwL9SYnyM4CqfB5vDHyVRbySu7+hKmSLSE+hY
	 YvLc5OJJuJVZsF7tRoqvRvCbpwPbQyOHpLyw+TRGJJ4t4TyejNgpLtV4Yt0k4BmLkL
	 b4F0mssZ8FdiooFxMyt9IOJF/Vu127ucfMtJC+9TlMB/DaKdkP0sHlp1mtJVoK1Pbr
	 Qz8EYg9h++fix1qihMc2i6go6Hdc32q0COGKjvn2UNR1P5hv8bI4rC1maqbToRslaB
	 0Xj3dNnDwAVWsnO49A0JD//NWYRV6oHDVSli5NOk92yJqrPRw8jffmUPGHiBJqg2rs
	 OmKq1VflX6/Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A992407C3;
	Thu, 22 Oct 2026 15:25:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2879C3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBBC811A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9Ns_qGFCX70 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:25:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A29F811AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682711;
 b=h6SggKZbqhBQDEL29nQS6Xj+Xy522EkIQOgGMNRzgg41pwoJ5l28QGftdDEQz4Toyekv
 syxGwXdMrfH7uTWQLdLzBwBRLLjR8/VCnEkjcRoYqNVEW0Hy9uT1da7J3Org1pVLwC051
 gbjdwYfe/25P2k4CKUAWy9Tk3MSXTxmRVzt9G4kZguHqCunB7wrU0/X+s7SzrNvpuqNsp
 hN5DjNA0lTwxJVG+MEzgLxwWVK+MZt8KCVg96uPKVCUCuFOuGIKUfYUmUfMhwYNgloUUO
 f69gqXa+pVq7llcSfaWABK7YFw5o4qx4KNLGpHnxsloykymWQzeIF0yvqo31Vm66ezw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682711;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=35FRLnQh/LPTE+aBN71nH6IvqrjELtHYgZ/gtkLcjiw=;
 b=RD5jUthy5FzlJstFJAQoKffUoWZ615GbeQSU5Onb7OVrhQoedD9ehAA7SquSoAvSJNb8
 6xtF7digYd0b6T/AkeCviiOJZqw9qFnGrSRfDkif4kpOEdiyNFf9lOBBI1qKy8l536ilz
 hK9Hi5Fi4dx8tE/fxgJYEZ0UfQCma49HigczCYNeNMEkEx9UfkA3iIVfRx5I8jJRu3XTw
 3GkQr9zASUIrdEuOHtCxfCHz2L3jhP4rCH+xE3LNCnOUpD/GFUIwNARNoZaXXyBE7C95k
 ePhMAhca5pLhgYqv/YUCQWTt27b2a6YSEVyanmY+4mhPUKx2IT94fhrDezAiu4IPDaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A29F811AA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:25:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 027339B9F9; Thu, 22 Oct 2026 15:23:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:19:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7fdeadb3b9f12f78e5fccca914d7fef47090ab9a
X-Git-Newrev: 85cb9195db250012922721c2b37eb86e604f1505
X-Patchwork-Hint: ignore
Message-Id: <20261022152347.027339B9F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] CHANGES: add "Changes
 with potentially large impact" for 2026.08.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85cb9195db250012922721c2b37eb86e604f1505
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index 1b67cc8c83..419e11f8b2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,28 @@
 2026.08.1, released October 22, 2026
 
+	Changes with potentially large impact:
+
+	- PHP had two very serious vulnerabilities: CVE-2026-109618,
+	  CVE-2026-109619. If you use PHP, upgrading is *strongly* recommended.
+
+	- Some trusted certificates from the eMudhra CA have known private keys.
+	  This means that it is extremely easy to masquerade as whatever host
+	  and public key infrastructure cannot be trusted at all. See
+	  https://emudhra.we-have-a-problem.com/ for more information.
+
+	  The ca-certificates and python-certifi packages have been updated to
+	  remove the root certificate that signs the vulnerable intermediate
+	  certificates. If you use ca-certificates to validate TLS connections,
+	  upgrading is *strongly* recommended.
+
+	  Note that some packages bundle their own set of root certificates,
+	  including libnss, nodejs, and dozens of Go and Rust packages. These
+	  have *not* been updated in this release.
+
+	- BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
+	  if any download cannot be successfully verified against a known
+	  hash. It did not do that if there is no hash file at all.
+
 	Important / security related fixes:
 
 	apache: CVE-2026-42356, CVE-2026-42528, CVE-2026-46729, CVE-2026-47360,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
