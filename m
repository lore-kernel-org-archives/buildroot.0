Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE14606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sftt4JaX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C1E60D6D;
	Fri, 30 Oct 2026 14:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iImcgW673Wqu; Fri, 30 Oct 2026 14:20:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7AC4460D77
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370010;
	b=mGVw8Ada0fMff75mb47zGog/4NVAVuOJRReIiZ6W8K0xTfSjMxOYlzs8hUx6h7DAq9El
	 4NGNiKLz+Dh6gWGHyLSFFteCMRZKwGQLGsw8p5WwTIIZnMXgFXy42xmvzif627rihTGnS
	 ip7/V+px4AN7PhBKbq56TR0CwO8DkFB/j83ttkgzZ7sJpYTGB7zP/gV0CkFlsGuZ73CIe
	 xfpphmAN+8LUbMWg5Fh4Uy5eA+JizIMwplu6B2farYwd1oVCXeNUevi9DAOHe5bv3H54A
	 jG7PQ0etUWfbfoqa9M3iEpsMlDrg96r/6kEb3D7wi5sdLk+2wN/ByZu+i2Dz+Hu8Vaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WjKRxKEkPh+FhDEyTiXqtAeTkqR1cn1ML8cVpx8LT/c=;
	b=Xp6shgUBveL1dtdCJ2WkrWoi5tQFU+UQD5NfyV4WnFDkumB3aHeglUY3OqMV1qY/3rYD
	 MfGTzBiQFwNmBaahLCEBoulIHsRq8BVIIT/y/CSBBT7Jkc1kw9jW0PAm/TV9qpqs4/Spc
	 9+07dixsxqM4tca6bYvIYJhJzaiUfGzP2at7mAJ5s8J8FIMN13Vb+qxv+C/Is01LvG+7O
	 N0oMuXXW2sQJ/pYSL4P2TyTDmIOG2ybme7j8AImXA3yFoZN6XO+zTqUUBfXpvl26/hEOd
	 5MJ2JGSuit27nESxHcZWBaNzIb1mZcyact6Clz9Njc1614JDlFFSWQJ6J0FrtpVpNQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370010;
	bh=WjKRxKEkPh+FhDEyTiXqtAeTkqR1cn1ML8cVpx8LT/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sftt4JaXhErHBjsNcPRaDNLuykdyoSVKYUgKDQ9+AG4bb0o5NQIpPNm+cWPcle6Cg
	 LTNqnxigXezu7pAqsu38D0zsGFhmwzCJWQ9XmbdUzK1QXv7XxJMUnLWO1GAG0IZn/v
	 /nnxm9u0FlyDB9z83Nc6GG63+a0VYU09rCtVQhIw2PAYrryk0nVwvCgq5W9A/jBjHq
	 1S5ALNMMck2XSXW+kjFGWvCavh/OnC6OgAdl255jx8yY4iUvpnZ+vEDRu71a+SLdjq
	 LMbSl730UL8bvrIAML5gBgVaIqCbGihskUFEg+y09cPCO7PuyNh3azHJFMAzg9Vbnu
	 ytpWCFvA7eLBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC4460D77;
	Fri, 30 Oct 2026 14:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10642D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8AF04053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9YuLGxKOXj1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5C8474052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=DXajFNr/SVMFi6I2KRYcuNjAKLCcmqJfJ2fW7DPBpjxhbUC4VTI0uWvBPbQGRXJgVMen
 moEHhmFAiVnyvvtWgnKcynb/SKLjJ7nNC2ZCw9qKoog1oubh/rZSyNRkuLNDY2fGPD2Jj
 qM0geqT88fsUt3ZvqEfqIu/TG8KN6k4Li3IXJcPiX25kwoUGxu5TAre+KvahAWgAPWK83
 4zMTj/BB/491jRcpI6nqpeiHPi7zT7tJYaBttyFrB5cCX+NeT3XQybT+9raR8fxCUfVpL
 BXMJL4jjv3eSmDou7dcUZvNVAQ8/p2NKj7plC4cnzYIM5d+JV6XXNXxcCYdlK9O+ZCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F51gjzJANd2I/CIBWE031jv+pLmTIZAGnwy8+RqqdJg=;
 b=BapUTeeJYxqG6XyD1STf8t/kk78Ix425cXLKJlV6xLc0kjtAg3fVQHfcgPqM4ZW+7Trl
 pem3UVn3UtAmp8InKds4DX4xCIkzs/TOYShP+pLnVIJyV0zuEk8gzSBTPmCM/g9mWlDfk
 d2yCD4dY5PvpQhQ1pc0AwngmyaQKxC0po1qiqUwU+NpPgoQKga+nQkGowp91czkxv+NZv
 lEzx7QnsO23g5JQCC3EiZD1rXW2km4/woi5vRRGBQ4fRc7ORFWuXL6167MI5C2unEmZn4
 /Q8hRGe6tB2v3w9Pd3p8FwxQ/j/+mwpcPDs7A4buFJ29aSg3+Fn1aEAWXruybWT7Qew==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8474052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B0AD9D389; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3c0e1ce4180e4bd26b7e14a658288eb6fa5fd4b8
X-Git-Newrev: b2a3433e1c2caf9d03b114d5e79381cd933a1ff6
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.7B0AD9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/domoticz: remove
 configure option needed for CMake < 3.16
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
Content-Type: multipart/mixed; boundary="===============4537696282494944142=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4537696282494944142==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2a3433e1c2caf9d03b114d5e79381cd933a1ff6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In 2020 the fix we remove now was committed with buildroot commit
6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.

Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2466c7013051f6030bec5bee80cb6fcb9ab7e8b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/domoticz/domoticz.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..498ca232f4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -22,9 +22,6 @@ DOMOTICZ_DEPENDENCIES = \
 	sqlite \
 	zlib
 
-# Disable precompiled header as it needs cmake >= 3.16
-DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
-
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \

--===============4537696282494944142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4537696282494944142==--
