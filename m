Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97894606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bHdTwrWt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E8B860778;
	Mon, 19 Oct 2026 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIEYVt5Aadsr; Mon, 19 Oct 2026 21:47:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E00260781
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446434;
	b=CJH43O6lDpNqcU7Y83vpoAjYBdnw1YlieAmOWgzXLQTPM38e422VTDISg1lfwo0GWMKh
	 I9ymsmkV+jarmAj6yzgQqVAIz8LWGzjGFqDmMMiNV74JH6Xro4W1aLvKvu67eoCH9MNNA
	 TZuLqyIPgmjH26S7y1iWshi5B1TKgCv7aynrfK1xtU0RikYPic/QSOZCn1wW5Wrd+jG4p
	 P8V8t/xd4MRe+AS/DtDbkdU3AipNanwJ1StRJDkU9JcDar/hNQPltZzmajW3yuHUQ4J6X
	 siN8QUS7N/uuRJjgQ+lqPx4GuYfeHimZiDnC36F65Ka/aJ15twH6S6Wca9SZnuMTE4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446434;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xH44KthYmB44faNHrtezTcnmxH2aMzLDB2H1hzIQ5F4=;
	b=oJANS/dsVMNdrn2q7M3hxijuQb2ABBi79g9vV+X9YEyEhxGTW1L94vi7LZ47KaEdIMmK
	 C2GS0ik/2AnBsmOWhM/HY7nlmUiZsRPUxTRV11y2RW/b+qRLW/qRRzbL2lKfqgGKy+5HQ
	 TdCL5vnI8PTb0tW6EQ6LBQWWm8SldyiQ8eNlGxR6DJZCNBaz4K3UPRgixiZZj4S0o40Ee
	 p4Z9M0Sd/zuLooNb+pPldCh23kIOAgc8bAf34y+3aHyws4f/sGqZotDUyrNr97ZTyOqfL
	 O84GqOnuXo06OxhBd3aZngeW6Kxg3OpYcIIX87yvPRrbLFZ7lpwJXBHjnMyiDVTwO1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446434;
	bh=xH44KthYmB44faNHrtezTcnmxH2aMzLDB2H1hzIQ5F4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bHdTwrWtaW39xkrKGdZpv7eFYvkBdAqMpFXkVNGlJwflf8Jcb0rjTcAbiO/JztxNT
	 2kuxRsCrXFw4gE4e/rO0MGqSasXyvID16od+1sOMOk1xSu2x+VkeOrAZ7R8z0/MDzm
	 2FBflUHDSnI6MzGUAJCa4hn+vTr7SelcQb4Yt1BmySlMGPveZRDcQLWcpy4duphnre
	 vlEb5uTFjtAzD3jy/ng/3wqk+xOHbWjRrYVZhcXAG05liAI/t4gEi/uGvE6Ws7Aw9f
	 VkrJiI28mFCILbl8LYQKPQKbQfhmONc1+zyiMlx555gnZ3jQNAGieemiBP/AsL5dEx
	 M8/H/RcFt5jxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E00260781;
	Mon, 19 Oct 2026 21:47:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F17A712F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D77B080E9C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dpAxbDg9nGl for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3B70F80F92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=HiaGkTycJsDvRO6B0+BE7GFsePQA/ucIZPaATNXivAyU0jDQ+zdbqrrtGmshjXSob+xu
 jLWJx9gO1l96z9w4OzXzl+hbMmppqxSwrJG2Ezb8cHgiF9Agliu0JGPwQkw4B5a2Dw8SB
 ZR3k7NMLXMIGbDBY7XWuYbBnuulWqPcQZjHslm/8cM9BtdUiw998aXpVpe8Tfto1BigxE
 IkUFOMty2yAGW7+PHtGv5q67h5fFtompxBBHkZD5+mS71I0l3AaMbVTY/UHqel2OUjH2r
 2JmjJKlWgc/m8n7DNlIZOYNXeq2JJgxPwWSvVxL1XI+rHUB8MVL7zBAwvFZ4f6P/aYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mh6aOutiuHB+wazmkz3NessrgZaAC31n1AVhXOn7wis=;
 b=n09MDJqr0GqS15madvIBtd6Ygtqp6iJUJr7QQ01SvzZ6uhPWIOfn2Ykw/Fc+cqnfgYZ3
 oxB1o5BCyakTHRcxUMhBhV2pLcZofIQLWcPsJRCiL0f1Bc5azNIRirAHDwDVDpTkWevgc
 24hBr1I5jp3k4rFwxBetmpMc1dOx27k8c+FEimlNEi9Eba8ETDlU/EHYq+p79HmaM11xj
 lxsY6wkaTBswjSGc5BMpERg/zDWEKnnBTa/LyD7lndY4F539196TqE5FvtlEX5Ci5VFti
 mzMP3+v3BeKAnQr70x9Dv6GGq02EpvYBR6heyfKwU5maGSm6LR16Aa23vaZP0cUMG9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B70F80F92
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 781F999661; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:31:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 145d360b9ba62cb918563c034eb1218956db61d5
X-Git-Newrev: f9e468d6bb6556933fce7e9ac2dad35ed9fdc42f
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.781F999661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_ttf: put
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9e468d6bb6556933fce7e9ac2dad35ed9fdc42f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No functional change in practice, but is more logical.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
