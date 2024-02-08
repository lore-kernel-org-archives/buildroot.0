Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7949FC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 12:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7CA6FAC5;
	Thu,  8 Feb 2024 12:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4tLGqeTrzXD; Thu,  8 Feb 2024 12:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 528586FAC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 528586FAC6;
	Thu,  8 Feb 2024 12:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F34251BF403
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF63741C52
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHe13sIUsvss for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 12:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 264ED41BB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 264ED41BB5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 264ED41BB5
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 12:52:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2099F1BF203;
 Thu,  8 Feb 2024 12:52:47 +0000 (UTC)
Message-ID: <6433c090-b23b-4c5c-8097-9c3a77086509@korsgaard.com>
Date: Thu, 8 Feb 2024 13:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1707060159.git.yann.morin.1998@free.fr>
 <1bfeb8d9649b7bb7fcd44cab8b5bd811bf389c0f.1707060159.git.yann.morin.1998@free.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <1bfeb8d9649b7bb7fcd44cab8b5bd811bf389c0f.1707060159.git.yann.morin.1998@free.fr>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] package/v4l2loopback: drop
 _CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/02/2024 16.22, Yann E. MORIN wrote:
> Commit 1edb9d691dec (package/v4l2loopback: add
> V4L2LOOPBACK_CPE_ID_VENDOR) added that variable, but set to its default
> value.
> 
> This is however not required to define a valid CPE ID, as it also
> defines a non-default CPE_ID_PREFIX.
> 
> Drop V4L2LOOPBACK_CPE_ID_VENDOR now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
