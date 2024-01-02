Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF55C47073
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A894086D;
	Tue,  2 Jan 2024 08:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A894086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XW_9aUBapqRV; Tue,  2 Jan 2024 08:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82C2408BC;
	Tue,  2 Jan 2024 08:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82C2408BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF3CC1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B024020B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B024020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMT8yxOsD5AY for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29E1240360
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E1240360
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16AFF60004;
 Tue,  2 Jan 2024 08:52:15 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:52:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095213.2ae4052a@windsurf>
In-Reply-To: <20240101215931.4304-1-fontaine.fabrice@gmail.com>
References: <20240101215931.4304-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laEiigKO4ZCiAlZE1/N3tcKLwgd+3shH4FhSRdn9jzE=;
 b=KJoHzxYMCvFSYMLXlg+ndZit6URC9yn7YyW9+rAi24nz20EeyegNfOe5UT+rYCd82P9k6/
 j2pe4OEJqd4v8tiiESRPWqNB4wp5IwK0dbHqF4AajPAn0wFg7j6Pzos5DYM9rXUrEXNQA3
 MjBgeUReFFbd6btJNoeWlnc6ShKn92Z3jFa+BEYIT/+yz51WYwsJVymyjiBuHiEl3oV00w
 DUzIPzdobS8IWxC8nDhEYyGvj4/cRGWG3KqftftPd1VWniyNVEGn0mG+z//ClzaKVDSDNL
 Q0KqijXkv+ZBhnU12NtWncrCxmfKfGqrPrJeX5B2l8Rej6H8SX51JfKCN0+tPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KJoHzxYM
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2024.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jan 2024 22:59:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openzwave is not a dependency since
> https://github.com/domoticz/domoticz/commit/62c95f24305f18734cf5ebb3f6517b225fddc36f
> 
> https://github.com/domoticz/domoticz/blob/2024.1/History.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/domoticz.hash |  2 +-
>  package/domoticz/domoticz.mk   | 12 +-----------
>  2 files changed, 2 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
