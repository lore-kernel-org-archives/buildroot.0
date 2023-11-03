Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACA7C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0FB60E91;
	Fri,  3 Nov 2023 09:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F0FB60E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0O6iBo6eLzPN; Fri,  3 Nov 2023 09:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF69870814;
	Fri,  3 Nov 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF69870814
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45C191BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FA55433DD
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA55433DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wi0YVKIrfJfo for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:32:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58F17416F8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F17416F8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BB8A60005;
 Fri,  3 Nov 2023 09:32:33 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:32:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103103232.4bc63976@windsurf>
In-Reply-To: <20231102211136.8412-1-fontaine.fabrice@gmail.com>
References: <20231102211136.8412-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699003953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MGY6Sy/Y7I76rQnyQRK47iPEnmuoEkDGkk+oQ7pB44=;
 b=LEQc58hyFuE11/rUPWS6MLeEnVzzxy31azzSuq17W38+N4eM23W/rvytQD/eIL7eHH1yg/
 1JvI8Kp0+HoYVeVPmtLOseKIoJ8ByBslYFBc853dc6CQz0UU0Nk6c/5m1/SeCjfdyWQ3i9
 lDIZojk8O3p+TWQKjQcRGOq5Xv6xtQ/SetelmNh4Ahra1hOIirpEFjQkp2opd0qNX6uk8g
 jEeLolb6pgff7kL6OYf75ShmKU/j2Jo01pepbePlRr1O3GLOmLhSf87+Q+t+Ifp+Kp0rHC
 k788Rb4agUFtg2wHL1w1ILep1JN70O0wf8eNg7rjGhSeEMW+S75Pu8DzQzxjYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEQc58hy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tftpy: fix legal info
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Nov 2023 22:11:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit 8dd5390be6b210eaac1bf02af2fea84d4c87dcd1:
> 
> >>> python-tftpy 0.8.2 Collecting legal info  
> ERROR: No hash found for LICENSE.txt
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9e12e0cd81bdf1a09884a340ca809c194e4dba9b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-tftpy/python-tftpy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
