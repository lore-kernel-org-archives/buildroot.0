Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B725CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278A84118C;
	Fri, 10 Oct 2025 06:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOjso8HQ9_Vd; Fri, 10 Oct 2025 06:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FB6D4118D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB6D4118D;
	Fri, 10 Oct 2025 06:12:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC6214B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008966140F
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSK0KxQQ09Jj for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BEAE608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BEAE608D9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BEAE608D9
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:12:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1794958077; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Oct 2025 06:11:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v76M8-008mOk-2K;
 Fri, 10 Oct 2025 08:11:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
References: <20251009203425.126975-1-thomas.perale@mind.be>
Date: Fri, 10 Oct 2025 08:11:56 +0200
In-Reply-To: <20251009203425.126975-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 9 Oct 2025 22:34:25 +0200")
Message-ID: <87ms5zwaj7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UZcC7Tq5Yp4FxZzUeg3zY6JDAAW+LQTBTioKJRNWZEwoILa+/EWz6bB9YLb3aJ+As00Lh5Em52ns1IfKlpMQzdWcBQu9pnHOj7p17aNLu1at6B7xIPhNHVs2UQky0xoo6nHquRW/lcDGIbAcSooU+NuftC3Y4DrHUbJEFvAB4CzfobqG5V99BREVqIQxWFyzn3mQwAe1UbVa3wLyn7OaI3oV22y/HS7QZLp5WvgF0CMVycDlAWWpAqTbL/YWfe/UFUMnlHaQghGjyNW5m62/nP11sLJXtagSGe24sJYoeBql/v9poamDxcp+OGuEs465auG9/c8oeCJ4vcDc6rODtw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=avlwQlzVl9hrV8HcV2xRUcWzauTp+PrfNQoDLeeGoZg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UZcC7Tq5
Subject: Re: [Buildroot] [PATCH] package/suricata: security bump to v6.0.20
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The v6.0.20 is the last patch level version bump of suricata version 6.
 > This version is now EOL since July 2024 and other new vulnerabilities
 > apply to this package.

Committed, thanks.

> ---
 > Newest version is 8.0.1. The following CVEs still apply to the version
 > 6.0.20:

 > - CVE-2024-38534
 > - CVE-2024-38536
 > - CVE-2024-45795
 > - CVE-2024-45796
 > - CVE-2024-47187
 > - CVE-2024-47188
 > - CVE-2024-47522
 > - CVE-2024-55605
 > - CVE-2024-55626
 > - CVE-2024-55627
 > - CVE-2024-55628
 > - CVE-2024-55629
 > - CVE-2025-29915
 > - CVE-2025-29916
 > - CVE-2025-29917
 > - CVE-2025-29918
 > - CVE-2025-53538
 > - CVE-2025-59147

:(

 > If someone that uses Suricata wants to bump it to be able to test it
 > properly.

Alternatively, I suggest we drop it from master at least given how
security sensitive it is.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
