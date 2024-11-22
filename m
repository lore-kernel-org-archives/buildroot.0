Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD53E69183
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 17:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61EE142C4F;
	Fri, 22 Nov 2024 17:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sNIW41XCjJw; Fri, 22 Nov 2024 17:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2791442C40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2791442C40;
	Fri, 22 Nov 2024 17:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB39B8E
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 17:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E8C284A22
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 17:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Frl1OdVhtbsx for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 17:46:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.189.117.8;
 helo=relay164.nicmail.ru; envelope-from=kiryushin@ancud.ru;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FE2A84A1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE2A84A1F
Received: from relay164.nicmail.ru (relay164.nicmail.ru [91.189.117.8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FE2A84A1F
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 17:46:16 +0000 (UTC)
Received: from [10.28.136.255] (port=25988 helo=mitx-gfx..)
 by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
 (envelope-from <kiryushin@ancud.ru>) id 1tEXjR-000000007Po-8RYd;
 Fri, 22 Nov 2024 20:46:13 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO mitx-gfx..)
 by incarp1105.mail.hosting.nic.ru (Exim 5.55)
 with id 1tEXjQ-00E6gm-34; Fri, 22 Nov 2024 20:46:12 +0300
From: Nikita Kiryushin <kiryushin@ancud.ru>
To: buildroot@buildroot.org
Cc: Nikita Kiryushin <kiryushin@ancud.ru>
Date: Fri, 22 Nov 2024 20:46:08 +0300
Message-ID: <20241122174608.12470-1-kiryushin@ancud.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-MS-Exchange-Organization-SCL: -1
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ancud.ru
Subject: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mail address used to contribute via buildroot mailing list
is required to be subscribed to the mailing list. Otherwise,
messages sent to the mailing list will be automatically rejected,
as server only accepts email from mailing list subscribers.

This behavior is not explicitly stated in the documentation
for contributors (aside from recommendation to subscribe
as the first thing for contributor to do). This may lead to an
unpleasent surprise to developers, who prefer reading mailing
lists using archives.

Add mention of mailing list subscription requirement to 'Preparing
a patch series' section of contribution manual.

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
 docs/manual/contribute.adoc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index ffaff6f857..8de0520667 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -375,6 +375,9 @@ $ git send-email origin/master
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
+The mail account used has to be subscribed to the mailing list,
+otherwise your message will be automatically rejected.
+
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
