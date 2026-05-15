Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36473CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1083641DAA;
	Fri, 15 May 2026 17:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_67OTkuR5ph; Fri, 15 May 2026 17:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3148941DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867225;
	bh=RlMqZylnLLA5waAf7xMlmBkYYgQUV7TwULFLCkBa0JM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Us1h7NEIn7n8CbeUbOkwMVzcc/UDmnp0svpB1eU4v/LVha+B4usVxoXbjzW0WWsv1
	 h+/dTCZVpGWydRmdblJXlAkoXwpPR2JsrG1vadt9NlPHGQAfLomC3OSyRPSsJqvwVZ
	 2gSuwF8YPYj7vCEs0yj/yDkSCxM+2SvC0hGeFIzVBB9ByKZBMkjSlBMwrM7UMjbQRV
	 fuTfTe9l2w14UChZngjWsbigXE8mEf+YQwNl/wMJPFP0Opjpmd5duRTIasFbeEFoDQ
	 cscX+8RWk02Jnkt8/8YGusv+4vrlbbZAEqlGKJXkRHTvZs2uv1aoc5NZ1l6sgEkLgt
	 UNiMq09w5DAoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3148941DD9;
	Fri, 15 May 2026 17:47:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1278023F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5666041D92
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKSmR1UVwJfi for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A844541D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A844541D99
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E64AE863DA; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:20:39 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 699d4cfd7f09f18efafd1c9343392c59ae526c16
X-Git-Newrev: 9a29752770cb72d5d5e1d5923cd285de07b4e99e
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.E64AE863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: remove Martin
 Kepplinger from x11vnc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5993705320406901852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5993705320406901852==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a29752770cb72d5d5e1d5923cd285de07b4e99e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

I don't use maintain x11vnc in buildroot anymore and can't easily test.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 81e72115a05fb9b32ccb9e613c1d5c4151980426)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0772c958ad..214b4ff749 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2340,7 +2340,6 @@ F:	package/python-webargs/
 N:	Martin Kepplinger <martink@posteo.de>
 F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
-F:	package/x11vnc/
 
 N:	Martin Povišer <povik+lin@cutebit.org>
 F:	package/python-construct/

--===============5993705320406901852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5993705320406901852==--
