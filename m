Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AB4E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 22:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A2A8104C;
	Fri,  3 Jan 2025 22:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEUHWg-pn5g2; Fri,  3 Jan 2025 22:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB4A1812A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4A1812A4;
	Fri,  3 Jan 2025 22:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABCFDAF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BBBC40817
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZsm-0S-s7Lc for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 22:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FF78407DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF78407DE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FF78407DE
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:40:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D38BE0003;
 Fri,  3 Jan 2025 22:40:12 +0000 (UTC)
Date: Fri, 3 Jan 2025 23:40:12 +0100
To: Nikita Kiryushin <kiryushin@ancud.ru>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250103234012.2bc31c96@windsurf>
In-Reply-To: <20241121140134.3476-1-kiryushin@ancud.ru>
References: <20241121140134.3476-1-kiryushin@ancud.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735944013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89/1icVQ+ibyWgaZtSvydEW5/S7kgSCvc/aIbHvf/ig=;
 b=AV9gx7JXuO+rdH7IFwPDfXPX1sy+TB6PRHxlkQjzL5Mh9zCTukYby/4jIixsBNby9I/VD7
 cZziGqOE0Ka2yvWsq5FfYTjPOYVc2fo6CvAmksdstm2iqklOigCxJLjTX2zxIO9/Np0Ehk
 JY4RMLVR6ZkZBUO24w+dLSUGgw4kjhOGFFwtrvM5FH1Gw3C8ctj9rQJ1jrjfHhjp+mJQ5H
 8yROGW3IOy2UGTwnon3xF4oBoK4WjhcPrCINFWqcWwO+iH8ZqJslpNI6qMJArQ+vbPf6Ry
 27CXTAlTxxOZKbKDCD1ISjKpx58cwPvqCczCrNsaQGOyxObL+nTXyO3j3cePcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AV9gx7JX
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: set session-socket-dir to
 /tmp
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

Hello Nikita,

+Fiona in Cc.

On Thu, 21 Nov 2024 17:01:34 +0300
Nikita Kiryushin <kiryushin@ancud.ru> wrote:

> dbus has a session socket directory configuration setting,
> that, if not set, will be autodeducted based on env vars
> during configuration time.
> 
> Becuse of that, builder's environment variables may be used,
> which will lead to an image with a broken session bus while
> leaking builder's details to the image.
> 
> Add an explicit setting of session-socket-dir to /tmp dir.
> 
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>

This looks reasonable to me. It also fixes
https://gitlab.com/buildroot.org/buildroot/-/issues/67 where a
few more details are given.

Fiona, could you review this patch, and give your opinion? It would be
much appreciated!

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
