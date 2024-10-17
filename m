Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5BD3C530
	for <buildroot@archiver.kernel.org>; Thu, 17 Oct 2024 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21968605FE;
	Thu, 17 Oct 2024 20:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK6KFkUq8IjP; Thu, 17 Oct 2024 20:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137736060D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137736060D;
	Thu, 17 Oct 2024 20:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A8527ED
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E2D06060D
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSOd403tjwCY for <buildroot@buildroot.org>;
 Thu, 17 Oct 2024 20:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8B03605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B03605FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8B03605FE
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:43:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1225225591
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 17 Oct 2024 20:43:51 +0000 (UTC)
Message-ID: <5a6a6ff8-6abf-4b01-9c8b-ca03a943e163@korsgaard.com>
Date: Thu, 17 Oct 2024 22:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Buildroot Development <buildroot@buildroot.org>
From: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iLVV81G94ElOFyGcNIq1WlVRuPem1wxCJ2CP9H4hCoi1Fn4tAndM9JjfM+Fb8bVJgLlwib9D1uIrW5k0r/cPWRIM4XS7y5KyywyqGuDDeuXXkGB8fH4u8OSjGDe0NToHEhe3cPrAFFywxJ1YK++Ul1oq7VSZeeeX2D6mJKWHPBRu0cqtNB8fRRjZGYMTdxta6wkuuHIJcUnh4OBoG5qUzfxm45M0p35KY4Q+FcWk7DAUjD73MqpPXmNTgVLL7tTzlPGFXG4wfXPRJ0K5L+1YqKhEWcQmK0GptUD0zlznq4xWe76JJvELYR+sQhMMZAFnvl2zb5pDpfmZWjp8OvKZtQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=FWoVsHMZj2QAwErlgW9MZut1NsTJ5qPNbAAs+hBOhaU=;
 h=Feedback-ID:Received:Date:To:From:Subject; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iLVV81G9
Subject: [Buildroot] Mailing list issues
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

FYI, we had some mailing list issues today caused by a migration of the 
mailing list server, but if you get this then it should be working again ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
