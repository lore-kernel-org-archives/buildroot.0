Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D687FC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA764139E;
	Tue, 28 Jan 2025 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8KQ9nVo2OVh; Tue, 28 Jan 2025 21:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC4F413A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC4F413A5;
	Tue, 28 Jan 2025 21:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5092320
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31D3A413A5
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0zz_JROFY2v for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 21:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DFF04139E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFF04139E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DFF04139E
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:14:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF6A520008
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 21:14:56 +0000 (UTC)
Date: Tue, 28 Jan 2025 22:14:55 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20250128221455.5a625b99@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738098897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=At2UwtWMvh39f9AB0QoSWRO0ZfL51bPbci760DvE2k0=;
 b=O/ES/VTNuTm/yJgYBto+Wo5t3K3szRohEyi6QAxPt0Qa23Zng+UjUgIM8EPP4r5+eRfHX+
 4wZIQfvikL/LC9nvHY3LP9syoCd/iqwnXktKnyOTBm84NBQ2ONtQ2hCqjU+JXsGp9ZKvZu
 +ySSaMGeDWVzwj3ic9rneMLvXyQAOWe5hFACu6/mxRX+5ClA7ah/eTGBfscuz1QhX6qhe9
 VgpZIw1ocZm6HIbSUeGtkTI96Hdy1e3h3tedJqnrzhOnYtdZw4GYTLKHTDj3nfxC4olTMD
 +wPt9C2cG3ayyI7qIJwidV/R8iiYzM9eflqR/PRLgJfXJ4nvck43B00cwprDPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/ES/VTN
Subject: [Buildroot] Buildroot Association General Assembly: Feb 3,
 2025 in Brussels
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The Buildroot project is supported by a legal entity called the
Buildroot Association, which is incorporated as a non-profit French
"Association Loi 1901". See some details at:

  https://buildroot.org/association.html

Practically speaking, this legal entity allows us to receive funding
from members and sponsors, and to pay a few expenses such as the
buildroot.org server or travel/meeting room rental expenses to organize
our Buildroot Developer meetings.

As is required by French regulation, we will be organizing our yearly
General Assembly on Feb 3, 2025 at 4 PM UTC+1 in Brussels, Belgium,
during the first day of the Buildroot Developers meeting.

This General Assembly will have the following agenda:
 - Review and vote on the 2024 moral report
 - Review and vote on the 2024 financial report
 - Vote for the new board
 - Discussions and questions

People who can vote during this General Assembly are members whose
membership for 2025 is up-to-date.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
