Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E73606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X2CQLZ9x
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D4D812E4;
	Fri, 30 Oct 2026 14:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9gp3BB9UoRz; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAEA4812E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369897;
	b=sblMk1zTCZw3E6ntLDcIk5kBz+RBbcJ+F0PkkOKiTZuTrUGSzbHUhsZhafQZG5Rj7YQo
	 MsU00wYXk8+uOJ9sgtssuQpaVOCYOz2qA4V3Vm7Dx96QtB2pHe0BdsZGAqDMhoAgK5tE4
	 oy6br/V1trmKWMSuuF3I+Ng3wTba6ZfGthXYUSq1qmgGaJ8+sXTZ/MdTvI+Ks++UQxYHn
	 H3dCnVAMvSHJGQqYvxix08acF0BTkzcLqLsTlgJ5W/YpKYY8TomMemVdOsmogJFwvN6Ih
	 n5gYXLZiW7H73BfVVAL5/xmIrLUVnvEJmLrR8irZZMkCQnimLfmvZXGjrF/ZhERZ81A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8diGqhi7XSWpHXTX+7/PWHoOdTXyPaovnN1nkzAPycM=;
	b=OEyrqIeTnC+QmNVFd+Z+9U+/vGm+mBXFx3Y5cdHZk6e+sNVBrUfu//fLXsNfgNw7K9Zl
	 e+K+uZ+AkBQ16Q0v6srVSFHVp4TXwDGQe+vZf243hreAsiQr/ei9zsA3Z3FSRo9jJBsxp
	 Xln2DcgXI0SGigJL3PdnPYyrvWGLHPNEBTc0W1+AJ2WcuPM0ftsJNrLnCWxqJ6nC5Xnog
	 8PRiSY3gKOja0cl5G1ISfNT95Bc8nFFg+AORz4gfDQvBMYqLL5zfpRi3uq/Vn0PQUkXyw
	 hOqwkuYTaXnV4t8nqFIw8B9djSyiTm5bqPkcoG3awmQdzTu1OmykQg+D+I52SXHDkqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369897;
	bh=8diGqhi7XSWpHXTX+7/PWHoOdTXyPaovnN1nkzAPycM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2CQLZ9xBgkzev1rTRZEFn3YL1DXmuYWOu5/jiITxT4mJqKpexkMmlqcPIJwdlPkp
	 WnFXzKgCXstgycf8UnJVapvciQMVvO/1Cs6rl67peNSElNBnnTJiv66xU0jZz8t5Hm
	 LQ9EoIZDa9qi7kk+IIvItZ65c/QUVT3Wn1YUt2ixnBjeY7JGvr3cr1Kiw2Wi1KH0iQ
	 qUscFV5QR6RvAjl3nlzP3y0GeevNqAT71JjhjYK11Sf81SLMIqhR8X6sqbULQ/khEY
	 ak1gBV9r/Bz2Kk+z0eSB9AsrI/pUIZAimHCY/8+E2F5GpQW+XQRNTAZeU/YiEPCpE2
	 WRd2qXM/CHnfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEA4812E1;
	Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB84712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0CF2400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywVC-a9nqtmg for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EFC7E4052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=MXMXmFyQToLovc+QGFXtyqYW8w6ZRi/QaijcoOkPwSUKw9YzHYiTxw+lQmt9KhjSRhuq
 1Qcc1yE6NjT0cE44+uDvh4cfHwKHDo+C3g8bBev1jhEigSMY9WwmHwCpzmLSwwUoZz5s3
 H29cUppvFddXZr9Kuoxg/jrJjLyOBa3WuRtWIh+Y4Y7CtwFn8q4ziOPRvSngdD67SqXGu
 j8rr6pmu1O2/phgpU/QJ4OFBjYl2VBdZRlMvVVjDJpbpFTM8WZd0eWYtREfqkNui3xtmQ
 J1xor8dzGPud+3GIXZmyiYeuy+zeowNSp/WohBNcWFno0lZt54Rhto6IaOfMwz0Z/0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OIcLc1dcbZ2UDEIOGufc7Z7pauXLxS2gTyc/lZcgxfw=;
 b=NBf/HetdWmKgo8hiTgWFXUUoLWOwvpNqyUiqNu1e903tJrl0mEutnFbLz8GI/5z+uwQi
 qNXCME1cYfGt5QEoCKGY0I2bDCTlq9499T2gy8WN59cgKsP4Rg9Lb/E/Kb/zw3mo3YD/8
 PpTVTd2a8UJkPWz7u5ShwluHJMpocRa+1N/gwY7l4qBNVV4PkmNUmN61Sno8iOL1DfEn7
 +ADKZroIiFuilnxthSy4/rb85uKFyaCMj/il/xdFPfk2FKavJwY7Xpn7oSFUCXbA6ootu
 mM/fUIC+VT4St/EzmgTdnoIwvhhOQgQtjl7Mc3d4cd8x6j5hE+uluW/2isgGmM8pYlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC7E4052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AFF39D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d221b13de08928b175a77610a7942abb0572f132
X-Git-Newrev: 5d30c58b588b52934631638013004a8bf0612da4
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.1AFF39D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/fmlib: add
 warning about the need for NXP kernel
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
Content-Type: multipart/mixed; boundary="===============5652023236344275338=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5652023236344275338==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d30c58b588b52934631638013004a8bf0612da4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Building fmlib, either on PowerPC or ARM64 against an upstream kernel
will fail to build as the kernel modules include fm_ioctls.h, which
doesn't exist upstream. fmlib will only build with NXP-provided Linux
kernel sources. This commit mentions this in the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47cffe76f391863199e9c2ef577bdc7a0137832a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fmlib/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 459d5bf102..17ab47ec08 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_FMLIB
 	  configure driver parameters and PCD (parse - classify -
 	  distribute) rules.
 
+	  This package builds kernel modules that need header files
+	  only available in NXP-provided Linux kernel sources.
+
 	  https://github.com/nxp-qoriq/fmlib
 
 if BR2_PACKAGE_FMLIB

--===============5652023236344275338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5652023236344275338==--
