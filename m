Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40076E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 19:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05D606083A;
	Fri,  3 Jan 2025 19:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acSWpmJ9_Ldz; Fri,  3 Jan 2025 19:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDB860B2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FDB860B2D;
	Fri,  3 Jan 2025 19:11:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70D28AF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB08407F7
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR0_mgmP_sTU for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 19:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F92407F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F92407F1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F92407F1
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:11:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 341127718; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jan 2025 19:11:39 +0000 (UTC)
Message-ID: <aea29e94-c575-480e-b352-47f0e8f0a833@korsgaard.com>
Date: Fri, 3 Jan 2025 20:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=yIHqVyBzxrbajwrA/T6+iAFczoY7zXB1wRfp3UHQ8xSHRJwQvYWSfVhWKha34F4zw8LIaZ/+8e4rPNzKptGXbDPu70U31uM0VLmVgexg02a1fhzidtCJIlrpqs96QVQ0O02yNi9b6KLaKRyngIHVchNwEd9VKN70CfrpPg41yEGijfMcDgtmtvPUjjubfpwIkiM+TUxyVLvC5cbJYW4B1rpJPFBaXmjYAIoGJkXNhTGHbnUa8HAo/FZJo78EaZMZwRMZPyGqlwJJTo4vfr8g55Zc++F9TiAK6128oOLtTmbX6LBQGpzAKTTjXPMou8FBo6AgsVBwMNlIqu7qItcQoQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=8AEb/qeVksWw23iyDyrE9oxl2x5GFcJWUl46viTGSYw=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=yIHqVyBz
Subject: Re: [Buildroot] [PATCH 1/4] package/wayland: bump to version 1.23.1
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

On 12/28/24 21:07, Thomas Petazzoni via buildroot wrote:
> From
> https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html:
> 
> This is a bugfix release for Wayland 1.23.
> 
> Joaquim Monteiro (1):
>        meson: Fix use of install_data() without specifying install_dir
> 
> Kirill Primak (1):
>        Put WL_DEPRECATED in front of the function declarations
> 
> Sebastian Wick (1):
>        client: Handle proxies with no queue
> 
> Simon Ser (4):
>        scanner: extract validator function emission to helper function
>        scanner: fix validator for bitfields
>        tests: add enum bitfield test
>        build: bump version to 1.23.1 for the bugfix release
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
