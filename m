Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371D4C4829D
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47D241B89;
	Thu,  8 Feb 2024 10:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hv33vlzvDS9j; Thu,  8 Feb 2024 10:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982FA41BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982FA41BAD;
	Thu,  8 Feb 2024 10:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47DE41BF2A1
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F76141BAD
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSRJQkcALH-I for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 10:53:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5D2841B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D2841B89
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5D2841B89
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 10:53:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45E8EFF802;
 Thu,  8 Feb 2024 10:53:00 +0000 (UTC)
Date: Thu, 8 Feb 2024 11:52:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240208115259.150a3219@windsurf>
In-Reply-To: <CAPi7W83R+a-vwbBVS-Lk-u7gW5isBmfz8aJpCYUQap1cRM54Ug@mail.gmail.com>
References: <20240114135446.1156025-1-fontaine.fabrice@gmail.com>
 <20240207164741.1bad9b44@windsurf>
 <CAPi7W83R+a-vwbBVS-Lk-u7gW5isBmfz8aJpCYUQap1cRM54Ug@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707389580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgIxa0k9IwX2aCGwzT03JjGN0l5SReJCfJD5FIjsMEQ=;
 b=U6FG9EmiBkMUx6rVWb2/gRbROPpM9IslJTtgVem/y4wlC76BKzl8Iu4R1ZkvwI+HtTGlmb
 fiNBbJo82+4DN2JQbOMgCEVSB46QMv4ndNMOsFOoywle6tLaGU2vklwk6vTu+ohzyWAuFQ
 9zxoeKz757s0R+jBMhfDkuh+xsXA3REm8ynoTycRaA/KTvVi6Z+u3aR5VBvVE+MSf3Kd80
 heLm/i90cTZsyuwUnL88gBoxNYwpKSDfvKRUqIUyLFT+My3iiZfQCMEQ4koSkLr+rrU7y0
 5dmTNMu3rAgLiNyXMARv7dkvIcPrZS/wjdcFZ0YYnSVSy7xQ6NBSdHuNm72BxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6FG9Emi
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/tinymembench: force arm mode instead of Thumb mode
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Feb 2024 21:48:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  - upstream seems dead now so non upstreamable patches will have to be
> kept "forever"

Indeed. The repo has not seen any commits since 11 years, despite PRs
and issues being opened by several people. I think we should drop this
package, and stop bothering.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
