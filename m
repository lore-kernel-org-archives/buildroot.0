Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA25606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZmYHIKm6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B626084A;
	Thu, 22 Oct 2026 06:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRxSxOIjuO4Z; Thu, 22 Oct 2026 06:23:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7F8760787
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792650225;
	b=XuswyqaKEMOOAo82wOSDCsEICWvTx17AIgpCMGdFYP9iw1SLjJ3L91+5D3pd50IOgBhj
	 W192T3BY8bDZAgr0HcC5ouGQWj0auMXEBA94rnpaqFujJqtL7sszltZA6WmRdT9jva2jl
	 dU4Uci4pSNp6yyTeZ2cMRihqjdnFJAuMsYKw8AFJfv6R1EmM9AvGVrrSH7bEyat+H25rU
	 jNoyo1d9eF75Rn1MUa/01EaISlVrI8+CxnQ2QpoREhulinhQSvmYAENrJJrufC4kq4+Pe
	 tYbBk4QHWT0jhXUYOzkzoPzpqeaELhx+omhiTy5FLbGMNu1mOHTiXZL3OcH4+J4riMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792650225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zSq7OMlpUmTCGiF9MJfXpMzCBuKWQY07JQ9xFcLB4VY=;
	b=XXPeq5UJXQPciu7JWzH5zhSiHqkymFY1eo4KD/T03LrTyj+JU4QnV8Gq2wdVUwZfhgzE
	 WXjQRN1KHezoJtUCoSQ52Lt9BJJZ8QsVlkPk4HcdnpO0QEMTZVPOwErD+IKldyUaRSP3E
	 DBtpLHaq3/M7V139iqje8MFxYJdfsFJ/vwAKg+s6RgzDhfxhDmrGcZKPIzz+xM3mDYYbU
	 HcWulO9vwJ9DnZteyP2BtX0/kmAWJZOg9duZkmlEMuGQo7Cl9/USauyKXwLSjKtjErV2o
	 JhsQbSKIMsJrFzdEFySki5tM4Kr2K94c7FFOIjQgKvqC9L/CowG2u957KsMNcLkeuEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792650225;
	bh=zSq7OMlpUmTCGiF9MJfXpMzCBuKWQY07JQ9xFcLB4VY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZmYHIKm6acjhB7T3kVHeGLRDNKZn8VfhPMxaSwiHrlC5HA5mxbZKa7fA+S2kOeFGb
	 CowUZpRQItdGi03LLfOI/7Ivu4iHkgNrCBS5HkGFxa0Eluw1NQ8NYAeFkvrCKyRRYU
	 pTv7go7qyct9COFVl54UU4Xiezj+AB2qD9tt2918vkcVljOfhT/Gjd3sP1ZCs/Oinn
	 KYDn16e+f7mRPSONH0JPN0ONnuCgGer89Axp0YZ1PjYQSd8Smb5QaWkwQkIs+KQi5u
	 98QHPkYSq55EOx3DlJsgWEK22LMetM9c3nol9VYa53/H5Mfkp9ceLN6Rvu6BURSELE
	 LTl8wldOhl5Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F8760787;
	Thu, 22 Oct 2026 06:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D65A356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B1BA80A53
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRdgL0smLofz for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0DD29809A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792650221;
 b=Es+4LPuifoREEisFyDSb1lawoRDR2x3kLqeNV74r3UUT0wIDspjC4IGJsPv/mF1gmw8l
 Z4Ae5KVrGo/b38XeKBU+nD8ET3Xk7avAtcorkSVqHaPhw6iHrlGXFhLjT2OjfY+l/lbWj
 eHy+ZJM7PYQyYrKgguh8efHso7r33vBJq0/X9Nk6DUXVXtgVt4Oq5s81d7nlsxqyr6R2N
 1AIy7FEB9/rm1TgG2KvxN0uhW3At+BqCH3Fy19GLJpsqL125uqtfzjwsuod6I3V0tJOXn
 PVhMCJeOOcRAt1L0m0ITpvr43vTs+mPQdluPP1F/rpwi2ltQv1QxcpXbYVQyOicnLNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792650221;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o5hIBqm4PeKSMEGEz7y0uj3Gm12IaOS+3C4kduuN154=;
 b=dgXyLJLv7K43Dk0+iyteZ3zMGRfBwUH2wvers11IkRKyHMNKQrTAtmav4Vy8h8wwPw87
 138k2X4hN4F3BuakcD1KgtIpqSy8kEQW+95cUKsI78w7zLu5UfKJLh6gCxOJGc0SKwm9G
 KXxRuJg5RLIvJN5192mahQ8ZgIMRRx9UXfpjAPmIPQLr49qmQe/9bPl326DptJcd9wopO
 i6MLV5GzaYFL8RFxwTRfuQHz3pqE3z8PLtFYSbBOLTlx9jcTwCFAG94wW3onoXRVWSDRC
 Bmv/2xJRGfnrd+xN5p1HNHgxOlVFOlADBxX76tvfQKIjbjZ2nymz15IQE0lku+xWeQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DD29809A7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:23:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2707E9AD7D; Thu, 22 Oct 2026 06:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 08:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b216661a73f7b8e21290a1bc9033e7f9b5fb230e
X-Git-Newrev: 5c37cfc96df485b0480284d43aeed9a45cc8aa80
X-Patchwork-Hint: ignore
Message-Id: <20261022062217.2707E9AD7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 7.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c37cfc96df485b0480284d43aeed9a45cc8aa80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For an overview of changes in 7.3, see:
https://kernelnewbies.org/Linux_7.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e0a8bbb457..6a1eed3146 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -39,8 +39,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.2)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_6_18
@@ -182,7 +182,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "6.18.58" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
