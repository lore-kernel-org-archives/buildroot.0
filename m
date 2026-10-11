Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F2CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 12:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0DD6060D;
	Sun, 11 Oct 2026 12:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2eAESk7NJpw; Sun, 11 Oct 2026 12:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE74D605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723174;
	b=Ws4Bz2jXGlcGyQLW4A1OGY+d9I9eDfoRQDZXtGz8VnI5saZwcFE1QNJ9E57fm4wdNtKQ
	 Rs8J0sVuZXD0fDn4fkj8Fk5RjGlBK25VsOgnmozSBQggdJbplITzvyoPjain4H/QvjzNn
	 OEghkY5ZuI+1VTDVyA98/nGwCtzgSkk/vgvCGMRdgr/yOXImhvpDCxxLLzrzCa1OvA0at
	 GE+ojoichyQqIEweFO+W1COYQE5yazn+q7oijiLvA7CS9Q3GDDMk/v5XnBKxl9zgAQKoc
	 +R1IMjyMpkJwu7Zg2TVDG2WrB/eCdlOkvBJeZaTEWfYHNGKGpxrp5eKKdklklm6QN0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e7eYkQwadeI8gBsM/rP5yXkzO58tTeeX0Vm44OXReUY=;
	b=m6pLhUQOyhQ82H2mDzj7wK15zF36sL/jtL0D4s2WFr76mTQBMmjRjLZhm0nOKjJV1oaj
	 ePq4GHzNUZne+B6n2xrUdAwhVJQBO5yArtHNmPArWkoRXZUAl9bvxWYfGG72wpUrCnBk/
	 pNTuMnwRPs6qghYGzTC+2nQUI9CeUecX7EzuYUIkQHW7ISB/pce+IrjZkf5MpNT2ylyJF
	 1d3hxpK+hzPXexoVN7mQiJ/WIZf5W7Ei4ta8LY5aAkKVWImiGGjmSqIPBZ4KL5O4BJ2Eo
	 J+uQ661X/QFvpNVFCuhQFgbQT7mwfr3iWrQDXgICUebm9lYKJVEX/g3+3LDw/PSeTAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723174;
	bh=e7eYkQwadeI8gBsM/rP5yXkzO58tTeeX0Vm44OXReUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PLlO3PGUZevDmBwQQOOOLhd2boiUkxrfVbac0UK4nCpD/Jj8SIv1XgvcXqjr4P70Y
	 bs3X4Ufb1OO5zSPvBUBa/rrbSsLLb59ScUhF9mKAsRZkZDm67MQvhVQyrfbdnx/8vS
	 rSYTOFGtRtNtKK+nWKNeXz2SUiP7cMrdG/XMFhmlfBcqDUBViqWsszFr/ytT9TarW9
	 KXBAmug9BFIRd0nF72VcUbxi510OGMFmmhKOfGVSKJPzcaadI5KuKHfM9aCFyvEnTk
	 UwpdWG4ndPW0cYnARogOCZ9N0MGpo0vIALwlspykrl1p9QvcbyMgCkQH0oXnaBn6Kv
	 YWwtVrAS6L38A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE74D605F3;
	Sun, 11 Oct 2026 12:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57491194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DB3B80A96
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZawvaRNeoIz for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 12:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3B6A3808C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723172;
 b=XX5yH7eXN5EirI5MnQe/gYRP7b+b0maVj8QB1ItfcY+ysUtcZKX9XYVLDoqruTjDTY0N
 mgjczO07AhbirGi5WL+CPLIop6Xq7fwZDZCcTFqLWYX9aaLuzrg5laBsJZRcpU0XhI6DS
 B8DEBNAfohdr1Tro2YCrWz/Tkv0MRbUwYnCYMkHHuavRQQ8czZpd1Ntb6nh7uv5NemrsS
 nMxw1Yjy1chqKVBQ/6nUk39IRkLsj/WB04Ld6oCqZkhNkyN/CzgmLQ6vREl0XySCvBPeZ
 Ej4B+PmlBewE/awMqLxkjqljGg7BkLLXgwQjNTAhi4KQQROzE0HV6iA+VmCeXqAb8AA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=n323ZRnSaQfFrmp0R5xUK67leOGI1fR1NwS14nJ1FeI=;
 b=STTlVmYSzy4eRmZnnbB/QDQuopHcxlHuO02CKQ8nOr8m0j6ga9gjsK0NA9OsQdX5jYIG
 X1jEmdyDHDBTxvmAWYA/m5oxstPC4TR0N2TdFQu8K/t2iv3Ht6uSUKS8PR6bA+HA9mwD4
 gLAlktT9jBIaEzEZi8OCOHyO/6eXVUmj7JzeVaxym8AhhaD89nqY6oSm8J1Wztu7cS/L7
 5MkqAkhwKV9ufwkyyP77OK/IfgDQut/o+CmouRytbL3SKN9upsTgvNvuEyVBvOq8t/RBR
 66HsP+6mvRBtLLpZ8i5aTKv61UPTP1h3pudEn2v9Pq4tJrJKahbJDQg3OEdnQJDxokg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6A3808C6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D6828D6F8; Sun, 11 Oct 2026 12:51:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 14:51:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 319aa2b9ed30f542124a32efbd3b27e92261b4bb
X-Git-Newrev: f350991abf13bce2a0d21a69b08f0e7a6a579b1d
X-Patchwork-Hint: ignore
Message-Id: <20261011125133.1D6828D6F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.adoc: mention
 mailing list subscription requirement
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f350991abf13bce2a0d21a69b08f0e7a6a579b1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mail address used to contribute via buildroot mailing list
is required to be subscribed to the mailing list. Otherwise,
messages sent to the mailing list will be automatically rejected,
as server only accepts email from mailing list subscribers.

This behavior is not explicitly stated in the documentation
for contributors (aside from recommendation to subscribe
as the first thing for contributor to do). This may lead to an
unpleasant surprise to developers, who prefer reading mailing
lists using archives.

Add mention of mailing list subscription requirement to 'Preparing
a patch series' section of contribution manual.

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
 docs/manual/contribute.adoc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f82eb14303..6ac75fb66a 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -380,6 +380,9 @@ $ git send-email origin/master
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
+The mail account used has to be subscribed to the mailing list,
+otherwise your message will be automatically rejected.
+
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
