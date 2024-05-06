Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF284C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 11:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5190C4069B;
	Mon,  6 May 2024 11:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCC63iGxA2kw; Mon,  6 May 2024 11:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 185F2406E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 185F2406E3;
	Mon,  6 May 2024 11:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7C91BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98769403BF
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xToNBLiEpLfD for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 11:51:54 +0000 (UTC)
X-Greylist: delayed 1432 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 May 2024 11:51:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3652C402A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3652C402A7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.172;
 helo=mout-p-202.mailbox.org; envelope-from=socks-in.space@mailbox.org;
 receiver=<UNKNOWN> 
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3652C402A7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 11:51:52 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VY0BD4VNtz9sp8;
 Mon,  6 May 2024 13:51:48 +0200 (CEST)
Date: Mon, 6 May 2024 13:51:46 +0200
To: Artur Rojek <contact@artur-rojek.eu>
Message-ID: <gph3ic6l5sw5kgpy2urkg3nuqh3ui73fft5nn3ljpi6bjr7nlx@fb7tbyxadrs2>
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
 <20240504195407.1409466-3-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504195407.1409466-3-contact@artur-rojek.eu>
X-MBO-RS-ID: 8f7e248a2af2040b67d
X-MBO-RS-META: 7d9xd86h6ss9p9pud5sj6zd51cpfcxwz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1714996308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EG62nP87H1WDf9a7JJwc1vwGxUShi4o2RsVOQdYRBBA=;
 b=VOFoNzUMv4zogIa7CM0OrgIzYoEPOWxav8i/NRr8xIqcu6JU2ro28/1GUbzyYvkQlveGYb
 sCptpy4MfnootR9YEAySEANnu1UJ3zHLV7O3HTn2vmgUWjCrKBn72I+WJQrmqoAOWQzI5l
 NS6xuUJ/jFqWjShQsCADL9UU73zolJcOoWRzS9WlyjX+7/kGGBgpu0IjmTFgu5W522Y45Y
 l9S3zSomp9aTqN5vh1jtjYBHigTwAD2BJ45fNWwNvdMUZ7s4gq6ZousacXq52Q1IESXd0Z
 rV/9by/x0LnjPSBmsKNuJVVFVSVX1GAkHphRn5w734sIXsD8KJ+A4cc7kaORiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=VOFoNzUM
Subject: Re: [Buildroot] [PATCH 2/4] package/gcc: reintroduce sh3 support
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
From: "socks-in.space--- via buildroot" <buildroot@buildroot.org>
Reply-To: socks-in.space@mailbox.org
Cc: buildroot@buildroot.org, Paul Cercueil <paul@crapouillou.net>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 04, 2024 at 09:54:05PM GMT, Artur Rojek wrote:
> Allow gcc to build with sh3 variant of the SuperH ISA.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>

Tested-by: socksinspace <socks-in.space@mailbox.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
