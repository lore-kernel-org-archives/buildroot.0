Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3249EE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71C5606BA;
	Sat, 28 Dec 2024 14:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVhrJ_Y61DwI; Sat, 28 Dec 2024 14:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040B3606D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040B3606D6;
	Sat, 28 Dec 2024 14:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D8DF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0FE606D6
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3-TWJU9V1Yh for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B475606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B475606BA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B475606BA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:48:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 685743923; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 28 Dec 2024 14:48:40 +0000 (UTC)
Date: Sat, 28 Dec 2024 15:48:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
CC: buildroot@buildroot.org
User-Agent: K-9 Mail for Android
In-Reply-To: <cc98e6c6dfb8a48b0547361325ec43f5@free.fr>
References: <20241227153522.3076932-1-peter@korsgaard.com>
 <20241227153522.3076932-10-peter@korsgaard.com>
 <cc98e6c6dfb8a48b0547361325ec43f5@free.fr>
Message-ID: <796D9705-0EB4-4DD9-89F0-4E40FCE93F35@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=zAzAyXYMLcvAxUrYTlVDFRWM5tJD8FQiyO5dcMiRnO0PlaxR3qfGNN6UsaP+SFg00i+UbhIvr/Cl//8YZJL1C3jECybeg46YExekMVwNjjRf1p1NXXlISrcdwDThC0qOjyx5tPAH79zwFjNP8yfQtBwvSctH6ZaKr1L748mQ/tWh37sQ+hyVZnzLD8kBEMhqRn07+7FgLjgliYFQtGoBRxJJEIC8wpoR1R7eQZEfG5RBOpOuaRaf+XlVsEiOG04SvteGRmLZDZHbBvLgmuFMFfhRJ8NdIQIrsncbUyySPvsvu1AO/37PqDk01MeLjSYLUQB4im8knBGzOMDQj0Vf5g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=jS1X9tVII5VkuiVH1BV9f9hxVyQfZSY4aQczleWF1U4=;
 h=Feedback-ID:Received:Date:From:To:Subject; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=zAzAyXYM
Subject: Re: [Buildroot] [PATCH 10/12] package/gst1-rtsp-server: bump
 version to 1.22.12
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




>For info, while applying this series, I fixed the title of this patch to
>"package/gst1-vaapi: bump version to 1.22.12".

Ups, thanks for applying and fixing my typo.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
