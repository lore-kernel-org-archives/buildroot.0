Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA22C3814E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE75540C97;
	Fri,  5 Jul 2024 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_ZjOr8EvzGB; Fri,  5 Jul 2024 09:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5169410E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5169410E5;
	Fri,  5 Jul 2024 09:45:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B46C81BF2A1
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 200A780FB7
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ppZZyK-jV1S for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1ACC81045
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1ACC81045
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1ACC81045
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:45:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWih0-1sweqq2fOK-00IFWq; Fri, 05
 Jul 2024 11:45:08 +0200
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:44:49 +0200
Message-ID: <20240705094449.8550-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705094449.8550-1-fiona.klute@gmx.de>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZgEQ1K6owH5nCnnQjs8zEWsL5aMNJHsLRf77Om3lsbCPuI4xkjR
 ZyLm4v9QABnlhEGCnpBG276Xhr1BovbUE4oH1e8i9Y/hAVpV774+KYIdvmtH0aiEBuVMxYo
 70hfTB5kPEkd5Xs9C/zbAjwnJX/iq+etmKJ+wLsiJr9a9jzhKQrZJ6H124za4STTzVEv6Sk
 RTQGGFK3xMFlcn9EZghWg==
UI-OutboundReport: notjunk:1;M01:P0:pDF4wrWHOqU=;cQl4pPl7owDk14o1WGzamPoFDU8
 LN6KnH7vjJPrIo8Dl3C0kD17mBoSxwWzZbTLmUGtHzqdL6ZbQyKDekJANsTDlfy+zd/hckIEK
 j0aKgVv94lCnawfCeHYgNFxysALUB/VkZ8v1hvIZhhvNvk2x+Tzbf+qj/g32ai8E23OpUVz2u
 Hym8oNoyJ91PPUUVgSrw9ATFd1a6Jx5oegnwN6/0qLQKykFpjY/wr05QmVXQrbxIS1GIEn/s9
 9wxFRyhNkEUzsKTFxMrQ3o3qbXECFSYnKF12D9g9699+9yRSwzPjWtiEcE1tOYe2rDUw8yuDG
 h8IAcTBahzu9jX41kDuaWDkyAGLXDPvzhXsPjsv+U2ilYSpEW6DATPefaFvv7vqunsRAlif1L
 CdDl0xU0nQDpKU72p6eBsvB6iFHjSCEpM+ZWTSJx28PX5lB6PO6PYhX9pt2g66FQiah6hLidO
 MbjZwjG/3EZBv+Ux7fDu92NKjR4huheZoxL7tJXRjkK/LHtr4qw/g27E9GtOdAsK7bG07mzuS
 oPh6gnGarf7645pUy8Lg+1swzeMCQZ835uxIzUusU5/o805yh1wpIUd4PWwJ/jU453+VMTvjt
 RUWQ+UjgR9NamdWw+oT4yJt7HggbuFdHnKoZTGHQFzKH5zDLR/WLtIrWIFcsXmZjgRMQgepXd
 l0aTuwdtnOva542RJdKXc7G0IP2yaRm5qEgbPtcDd+SDOXe42zTUBRr6i9G0/9V8FllpI7hfx
 +zaLpvKMz7JSUQaK8PeoZzv95yHTKnDdCL+5Ds90W9L8lliBD3D+396t+D8ujT+aQD7Tirj9U
 hmljcWSaJ1lJwQXd3HRwtObx349gm3vcHsIn2gYvYLyeI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720172708; x=1720777508; i=fiona.klute@gmx.de;
 bh=VHBcUnHzq1llPdIDXr2NBX42V9d8s5HwCwCsKHo4Xvo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ivg7J94Xyi7rSojPmfyWvd75/zu64a4uUFuFqzB9ZUQ84ufzvZ7VhYg5JxdnbDvr
 Mry6Lq9bnULoyXcWiBooxTORsDLThv4ufnBuhxWwl6ownJ4zvgXUVNHh4Vsx/jOO+
 2DTrcYbqb0ElBVODm1ecIxwKcpotoXXzzM2gMmf3qYVva3P7l6ZfrfjY40tS7IPwW
 dh5PEAnx+0AQ7CYdEQqVPNpiue0dQ9SnzKj6h7kTnk0EQQAGcehOVLq59o+yMmsTX
 cu6nNYxqMLcWdGwsrHpSP98oRpP6Q6C/gOd0x9ynn1W053HDyCxvLIWsmIDAti4Vv
 trgS9gRSuKVkJPemKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ivg7J94X
Subject: [Buildroot] [PATCH 2/2] docs/manual: allow sponsor mention in
 author name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Unfortunately not all mail providers deliver mails with subaddressing,
mention people can acknowledge a sponsor in the author name instead.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 docs/manual/contribute.adoc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index c88035597e..078725ef56 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -264,6 +264,10 @@ separated from it by a plus `+` sign. E.g.:
 +
 `Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`

+Alternatively, especially if your email server does not support
+subaddressing, you can include the sponsor in your author name in
+parentheses, e.g. "Your Name (Sponsor Name)".
+
 When adding new packages, you should submit every package in a
 separate patch. This patch should have the update to
 +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
