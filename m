Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E18606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZZlBG5Nw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F63E81469;
	Fri, 23 Oct 2026 12:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBrDajwkeflv; Fri, 23 Oct 2026 12:24:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F8A381326
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758273;
	b=Ro1QpkVjet6mO5AP6QmYeF9L6q6YTOrMqiFrx+RjDjyTbPQNg0o8LZk0ooehVIWUF5vV
	 x2x//4bVncvCLky29Heol8BDYmzi9PNMFA7TFpn7aI7SlNcvUIZsjkqdeeAEhqosP51Bo
	 UPt0VNVpkJMu/U3zQSVxfrScz7OuJ3vQ8BgwiaiolWvKcppwDIXes7PCXTl8JVD6ttKS8
	 YkRpbyMJE4gedswez7wXwRGPUrKwI3VQKKa2Vu0J5Gjhy1HEJN9ab62gg4HrNcxmXnVXC
	 RSO9lzNKaYAmfdQ7Ahref/Gz6GUAwXRN3mWXb2yiPLCwuR6j2t06eEh/NYrHZR2g6iA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=65QsN4vWnDt1fjGtl2xsQYaE9iCDkNG/qg2mffmnXCg=;
	b=YEE1NB3L9m/sZQ1FHSQwxMrzjyEM/CDK9zgPAPe3c956k8/GGqRTEuhu5fpXLDoMmGhM
	 iatCHvScSiJXPfytJV5sxnDcw1JgoPvobw44Ab05DsMErIJ3cVFnIxT9GgqeHXqh06P3q
	 zAtjSpyMsL/MoAOluXmPlZLtIspVUKI2x2g5eE6oO5/HoWHeP6SftADZQabv8fkShByBk
	 RbzgaoHK2+xKFpElvq7eK0yfTpQoKa9O8iKc+8jKv89r5A0BsdYK277nezjW4Yip7w+q9
	 pUuYKOateHxIJnb3Px6YZEWR9Tu8KRIW36yYsUpbC7+g05QlxD1fQ32Wa8iaET23d1Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758273;
	bh=65QsN4vWnDt1fjGtl2xsQYaE9iCDkNG/qg2mffmnXCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZZlBG5NwLnigyxAO4k6YvNK1B4AK3bV1wCgdAgG881HO81sV/U83v2R9E+ZcapYi4
	 TrTa0U4PyDXCJXYl+txDKTjjye2+olHFN2DJq7BnCZhkeAJyB+D9OLamxTosJGZ00P
	 ptswEYvtb/1hM3rR56jBrPtzUKKNAZk24Nddi7ZYr33DdRHqUKu23zBioR537aEfEL
	 Gng1yQH9jvxIeeV6X34FL4i4kvzebcxkgWYfPhVydmPyLUJ0O/tbhey1tdIBPIqqoP
	 t1j7NmKQLCuMfFYxwuBJsopvpSv1cur7mbGh6MFj68CTjoAW3Bm7z0u897LfT8Y8l6
	 PLPh+5JzPlcBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8A381326;
	Fri, 23 Oct 2026 12:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB7912C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6036F40782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CiCvgSKvH9n for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B31F44072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758268;
 b=rTuzjQQQFdT/F/mvrAzNn3Jbfo5//pvKtH/stB/GJWmGlBp9/T4kzRBF44lJkvvHnh6T
 Fu3ozwvNMEsPMF6ZQI4OovJgM+6nNov8GePnKpuYzkzC+fR3iM2cJzk32XustV8DjcDNl
 7GCq0oZsULtsxMuccAZ/RR4xECxlp5WHIE/Aveg29baFo3SyW3+OeBvSWUiU+m5afRcva
 nV6s+OeaBfMkktleiHOwYW/UrFeZol9kTG7gdSk3F8htAeePt5LAl8VxVpFO8uaPHuspb
 50po0DefwopYWEJGSoyoGgxTIsxm0qaUnbzbhfU0tKNP8jXT19k43FdhitLAZS2wUkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758268;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e/BcvV0R1u1hDkjIEsBTfthUBR6NQ4xbf5RdC19C+ZM=;
 b=dlsZTBOiZt1/tzfIN/OBuhIBeTqLP9+Z7CvBUc5SWMWJJKweS8Xm9JXGd/bUypPCElHX
 i0kcfqLoL8DKsiVGeVTBazZz9Xon/dWOhLDQ/IQEC8pVII5Z62015ydqCyd47FmQb5Cib
 BAtoTGFHK99P7zaHOdzZiX4y6uBe/CSt9Z06+eNP8AGvLKh75g2XWawBDLXfhm6kOAIAI
 GpDlAZMnh9Khv6iTTldZ0Fph9YDxKKch35F3AAjRGitO1cONTYtxVwGoXjGt4agGI4h9h
 h6HNH17UOV/58FPtcXvemiIllrKT/g88KjU959+TYqupWpT1dVVorCCVB/ybUX4i5Xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B31F44072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 464969C66A; Fri, 23 Oct 2026 12:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d6c2ab7aab56532bffd2ee8488b4b4d30476f1f3
X-Git-Newrev: 8bd1da88250301b3be3f399da70bfaa163f1a54a
X-Patchwork-Hint: ignore
Message-Id: <20261023122304.464969C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtpms: fix typo
 in HOST_LIBTPMS_CONF_OPTS
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
Content-Type: multipart/mixed; boundary="===============8688224802329874671=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8688224802329874671==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bd1da88250301b3be3f399da70bfaa163f1a54a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

--with-... arguments need two dashes.

Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448 ("package/libtpms: add host package")
Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc7f3bc1fd5d4c564539c4f7796eb60a8ffef8df)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libtpms/libtpms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 7bc69a50d6..0ece84ae04 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
 # Required because a plain Git clone is used:
 HOST_LIBTPMS_AUTORECONF = YES
 HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
-HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
 
 $(eval $(host-autotools-package))

--===============8688224802329874671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8688224802329874671==--
