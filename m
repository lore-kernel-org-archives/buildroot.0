Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FBCDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EC7606F2;
	Tue, 22 Oct 2024 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW4aCKhMfs79; Tue, 22 Oct 2024 19:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A866606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A866606F5;
	Tue, 22 Oct 2024 19:16:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 521EF2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4025B80D2F
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ5-qPTZLL5E for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1350C80CFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1350C80CFF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1350C80CFF
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71AC91BF205
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:37 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:16:35 +0200
To: buildroot@buildroot.org
Message-ID: <20241022211635.36d035fe@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lNS/Dq5pTmzevxHqxJSqYFe84W1vLXH5byGHsoTm5ws=;
 b=M/er+Ql0IyMY+YmhAA5vOjDsmZgV3udg5CGlm6KQlkay6ZgnFTcD92oH+QrnQqURmIUpwN
 xcQHAkRomgRXH6DM6G3C3ssTBh7PBEsn3t/LDw6DpxOuyrCs7xW3RmCVuiiWTNp4dt4Was
 DvlKbXnYCa2YO2J25ydYcj4tS7pSnvvOG5h7niuHqsFQGMmhrQLa3bcIiIv5CKXFkqFV2I
 SF6GX7wJawDbWG2+L2+l5rcOchQ+eZOB4xip/9K/VXkWo7xSFIRE0NlRdEQBgdkXKGndb7
 pjDgKecYGuCGFFjTawpXuLAoMwuFDdF6gpfm2YdHxDo2ul5FYjVkYRFRANPfUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M/er+Ql0
Subject: [Buildroot] Welcome to Julien Olivain as Buildroot maintainer
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

Hello all,

We're happy to announce that we've just added Julien Olivain as a
new member of the Buildroot maintainer's team. This has been in
discussion way before Yann decided to retire from the maintainer's
team, so it is unrelated to Yann's decision, but obviously will be
useful to help handle the amount of contributions we receive.

Julien has been making for a few years very positive contributions to
Buildroot, and we believe he will help the project in a similarly
positive way as a maintainer.

Once again, welcome Julien!

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
