Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3085BC25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB4781A24;
	Tue,  9 Aug 2022 11:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB4781A24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gcshEYdq7Du; Tue,  9 Aug 2022 11:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF51E81A0D;
	Tue,  9 Aug 2022 11:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF51E81A0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FCE41BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BB160E26
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02BB160E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1AnrssVDBt4g for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C5A760E2D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C5A760E2D
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:32:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22C7360006;
 Tue,  9 Aug 2022 11:32:40 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:32:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220809133238.085b76d6@windsurf>
In-Reply-To: <20220807214658.191628-1-fontaine.fabrice@gmail.com>
References: <20220807214658.191628-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660044760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrnZQ81yUW5o3/gPIwmRFOu1XSNBXMKVp8/J6NURORg=;
 b=TqFsdXUpzdDbxWiuLEfHQEQjlu+40A1c9oIanZ2Vss9S4lGhIK/CUGBrfoM/qdeiodpsXS
 k62oZxzvUysNpcQRuoG2RwM60S6QkcPepNAUhxLEEl0bYXYTXrozOqo8r2FirA2Qwlp39i
 5/5UgFda5jZGNLBoGpl6RXN2EKFCEg0GZtiw8ZywSnlSCpdAQ38ONnyQ1kwfvUfs3ecb4D
 3eGRgkDxlGIjlbXvx+KojNkzCOnDvPBOD+q5N+nxxFchEkTps7qhxKhfEVRi3Do7V0JMY7
 F37m1K+xAF0/9CMMA56iNiEfqE7qypNceBG6+zt1qoiGpo6HJDBvQ0EjV8ziHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TqFsdXUp
Subject: Re: [Buildroot] [PATCH v2,1/2] package/ocrad: fix license
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 23:46:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ocrad is licensed under GPL-2.0+ since version 0.24, here is an extract
> of https://lists.gnu.org/archive/html/bug-ocrad/2014-10/msg00000.html:
> 
> "The license has been changed to GPL version 2 or later for better GPL
> compatibility. GPLv2 and GPLv2+ programs may use the library now."
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Gilles Talis):
>  - add a patch to fix license 

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
