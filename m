Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFCECD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C56649832;
	Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hsNET0ZvGGJ; Wed, 17 Jun 2026 12:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7B94AD66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781700832;
	bh=OiXTwDynjNY4P7alh94rbR6ciiEgFYikxNfy9G9ExeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H+eey8cCeptq0RkwICe5HJXJHklfqyHFgbL6Kv8tWsexlypCrCAzg1LhRLXgfUdMz
	 y6Ml5MnpUimO59NcvpZjQi2so5RzQTvfoC8wkF/SVHK6AldoicwzgqhCtRuU1mj1Eq
	 OZ4ZP9EGnKonQgEmi5qZ52URk4X5OdFFrhz5/1KpE1ISWF1VNlMzPpTvvjnB6UtArj
	 voSvgvuIv1NRYRBCI7eY5UkNTkny+KcUB+F02paE5uVVM+7A2Neo2IQpswd7TMZyGQ
	 f0vHCXG9+uZaachJf+gREsECoVWN9LKpb4762ldfG7D3sXBcxc4rWyeNTnpyXMKgWT
	 y4bJe7MdAxTmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E7B94AD66;
	Wed, 17 Jun 2026 12:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65147355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5772A49832
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNX3iqNqfB22 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A281D4AD66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A281D4AD66
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E39DB81216; Wed, 17 Jun 2026 12:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:52:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59bc42f1a6dbe808a2498ee1fd4b33cac6e097e3
X-Git-Newrev: 2c80df91c20b0d4dd5846a4f78ea90a6ab83c178
X-Patchwork-Hint: ignore
Message-Id: <20260617125326.E39DB81216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd/S40iwd: implement restart
 command
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c80df91c20b0d4dd5846a4f78ea90a6ab83c178
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/iwd/S40iwd | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index c329f3bcc7..00857502f8 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -43,10 +43,16 @@ stop() {
 	return "$status"
 }
 
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-	start|stop)
-		"$1";;
+	start|stop|restart)
+		"$1"
+		;;
 	*)
-		echo "Usage: $0 {start|stop}"
+		echo "Usage: $0 {start|stop|restart}"
 		exit 1
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
