Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A5606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=II7kbecO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A9340C07;
	Fri, 30 Oct 2026 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcIIPTtkKjjc; Fri, 30 Oct 2026 14:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0AAF40CD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369900;
	b=qpKDm0IzHMO7QKeQRG6C3Z9QQPhqT+hAweTTWBrQb/66umm97/vEjgqI5j8MjESNAAa5
	 aceUzACKENhb+rIfTgM2uViWKcTSqxdBB6ZpUu09rz6PBrHZwv822oxwbzEB+fVJCxk3a
	 tUnrNBpNFpZ/eHM2cHjkHw9/e030sD/d0oG798qntgycX/REIHOpmiRMbLiWQGfFvc2hM
	 BeSWeEm3LRFSuUIIskoNu+LlvmLsZw7UUSOadOUjL4PK6+161RZWg7Kew65pYWgzByhmN
	 Wix1qpaGahbSbwon8B+re+tx5wiyrdtYI+QB1vxKu6/A7P33dq5YiotLewh2O5pwRCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=v7LAEyrCHKC1KERticmOEnmRmi1w9PgJ5DMFXX9B+Tc=;
	b=KBMZwk3IF08/v+CNsxYvxx2n/jumtRGW6Q5x18r2cJnsT1VmQeFVisd8/HKICD0N9N9t
	 PP0HLUt0NkT8Fd0PlgIuczhW/gY6VjxEiRtc+jcvI84EJAMcdxt5LV0AlNayX5Q0Xdwiz
	 FfitZqUq/DJgf0UAtemdNhECZZEQPXj0kTFSg3uZN5Poo58C0yszVzRamMuRUvSU7ytdR
	 DmP+F4mwHRIftSxfSrzYIY768g4dILmbSrel8u7VC/MrifN6m/eATo4+rjQePqj35uHcH
	 /XLhfrkmb1S4Qy53GY582EI7YaWhzdOHwITlUEy45/KJZkNv2mgzIXd3L2atHJ70prA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369900;
	bh=v7LAEyrCHKC1KERticmOEnmRmi1w9PgJ5DMFXX9B+Tc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=II7kbecOPuBNoKebYrhvN+vOdTQRSm1Q8zbymGyPYCeLhLLZWwlhwOYIYHK36JDLn
	 HAbqLZdNrfY8hr+BWsPP4vq1pc8XBhfPgvWR6EQBAMgrHKZyKG7q2xuGPZPdw1aoii
	 zBUO8iZfD+J0m0+4aSU0WRZ6ECV6Oyu7Mttn/9X8e2zyYS5nwMogCBTTgHH7fzqKyR
	 ouxaCKWN3ZHSVhEAmWN08AqelHuYTOmPoS+5H6frZqHZtaa8hx6oHajQKEF0AovMGz
	 8Kea6Qjg+GrAH5unugzTrV8UBwPqV7eNwfxyQPCuxV5eJyUvdZXvLCsTG6I7A1RdLP
	 UJDdpxW0Z1DSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AAF40CD5;
	Fri, 30 Oct 2026 14:18:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B06D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1250D812D6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8G62dJLnt4F for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 399A6812C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=bs6jCHAtWpc8iRYwm6kFdRYBfljTrjo1OxGubsyamL7cj7m9a++y37gRNXbx5xjxGrTL
 NzYywFF4trGWS12s2COoPC36lGf4EIjBfhY6DDzWjgjzJikUp5NRbptM7wESdrhDKuAmq
 EoV/CvaODMknA1PWrln4XXNSui/DLUL8ywGjh6wvfnskB0MRQ4LawRgdsoJNjPBND0LTM
 r2X6KT2EAYSqWa58ntI9zQLHMzoQW7JyyCQ44ZRQzqZf/G0m3qNIwG0qHDT1q8XyHdHiW
 WKuMkr5HiH5i1PTmFVy3RgDa5NgqETCPqNlytjf1xyFAvOBhTGdxoNAPvYmgKKyDIkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HgnDWCb6lXT+t4eC6E+gOhqjRudu6+er9urengcYkgg=;
 b=qxXDiHaaDkrIcMehABhwPF67etW3ZmRumJIRN8gkwChQe6RWmeO54bCCvzS5ylF5mxfW
 BnDHTQ7PR4qjJmnI22PD2QR+TFrzkpkk/nWK8gGk5mry+DXhmL2Bi860l+CSTlloOUEdR
 W8Pio3cj2GvMCWHYjy+Nk6/zGymjdCjMiXeRpaKGFWZjbX47ggmJyoXTq5LyozcBg6V2d
 kHxQhcROLxKOTL1gaD4MZL18RNwdzux93tQIWvCOOs1irU2skBTiyRMNucqQarKofVlhg
 0NUweDPPr0Mv8KAsDlthG6q0Eev1cZra21dw4xoYI6V+lFFqvIyLEC7M8d4ziP0U5Mw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 399A6812C5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 582419D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6499ff3cb7473d4776df158612a2e4e2f93fab9f
X-Git-Newrev: 71d5251abf7460b6396560f84a6f18383eba194d
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.582419D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_ttf: put
 -DSDLTTF_HARFBUZZ=OFF where it belongs
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
Content-Type: multipart/mixed; boundary="===============8061224967462614993=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8061224967462614993==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71d5251abf7460b6396560f84a6f18383eba194d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

No functional change in practice, but is more logical.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9e468d6bb6556933fce7e9ac2dad35ed9fdc42f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_ttf/sdl3_ttf.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 12441e243e..c37d6037be 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -14,12 +14,13 @@ SDL3_TTF_INSTALL_STAGING = YES
 SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 
 SDL3_TTF_CONF_OPTS = \
-	-DSDLTTF_VENDORED=OFF \
-	-DSDLTTF_HARFBUZZ=OFF
+	-DSDLTTF_VENDORED=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz
 SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=ON
+else
+SDL3_TTF_CONF_OPTS += -DSDLTTF_HARFBUZZ=OFF
 endif
 
 $(eval $(cmake-package))

--===============8061224967462614993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8061224967462614993==--
