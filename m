Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA3C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F0F040948;
	Tue,  2 Jan 2024 20:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0F040948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmP_AFu7u_wB; Tue,  2 Jan 2024 20:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A332640A97;
	Tue,  2 Jan 2024 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A332640A97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA8401BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B176860DB7
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B176860DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KyaDbcj57T7O for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF5D60DFD
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF5D60DFD
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3AD320003;
 Tue,  2 Jan 2024 20:18:38 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211838.1375eb55@windsurf>
In-Reply-To: <20240102174635.1012997-1-fontaine.fabrice@gmail.com>
References: <20240102174635.1012997-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsA/DXijDn/2I80N287ixS/qvjE/YfxnLQB+SM52geU=;
 b=XigwcwpYDWdECWw4AUOhvAzYLJRrtlT+L9AlN0g4w3gL1oiLrEZY7n8Ipsyg64TTe1S5Sv
 OQpVsIZslHpNsK/vae6QYcw2cB4/IQ+99G1+PmTqgSXjz+X/nKoiqbBansQabfyk+xl/Zt
 mFgpJ3Mn4QkpzawHxmf5FUVDEwiShP2GxA2GbQkpWtNfoAbYTK1oWygm5UZWptWKVX4K9m
 zr8z75YXFYtwiCSCh6ZQMbEsLaJwpdtJ72oOkKlPlK+GEgMWdTpZouR1+9/vn3+ks7aN7v
 UcMfI8fSnjNCF73MA8xF6u7/A7q1vUKSnxO/SXrFhE0TGSgfFYUqXJu9BQMPLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XigwcwpY
Subject: Re: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.25.3
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

On Tue,  2 Jan 2024 18:46:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/p11-glue/p11-kit/blob/0.25.3/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/p11-kit/p11-kit.hash | 2 +-
>  package/p11-kit/p11-kit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
