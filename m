Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBF8C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE6D64115B;
	Thu,  9 Jun 2022 20:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMu2bs17rCmG; Thu,  9 Jun 2022 20:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AAAE41023;
	Thu,  9 Jun 2022 20:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB26E1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E84A441C32
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70wV1LmzPmD1 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:44:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1FA041B8A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:44:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A1451C0004;
 Thu,  9 Jun 2022 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8D9+WaUyjvXIQOEGK6DDLrrT3fI1FxWrwAZAqAvldm8=;
 b=izgu5htLNF3n5AwixfN/74x83Ci/NtGOs01WDW8/yjGMrLgMytzrhSWpT81l42bNtlYv2i
 YrCPxDEsQe40+XGb/UCvQRZxokxqKs0dsU7eZO8VesigIwGwW6UBHCfD+rKJvbSHBvhH4c
 2AOqeUwh48IbbZ6bkoaHZrb3cbQjtHJLq02o5v980X3s4CVnlI0iOXxYDdvNoFrUVEulwP
 zAG6yKKhRDbcFOcQ5hbuv7pjFvgYnuxn0ZryL57xHnAyUKZ9p8qVKxsawo+aag970kNoEf
 7DzdrqfHQINBiXtK6RV6wrB9IQ0sPcpvWkM9hRS2JOOV+S9Hec1mKcpinfL+Rg==
Date: Thu, 9 Jun 2022 22:44:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609224421.5786d206@windsurf>
In-Reply-To: <20220606212342.3981-1-fontaine.fabrice@gmail.com>
References: <20220606212342.3981-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.0
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

On Mon,  6 Jun 2022 23:23:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This is a long term supported version that will be maintained till 2027.
> 
> https://www.mail-archive.com/haproxy@formilux.org/msg42371.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
