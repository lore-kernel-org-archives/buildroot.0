Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636CEC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111F6409F8;
	Mon,  1 Jan 2024 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 111F6409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqLnU-Z9QHnL; Mon,  1 Jan 2024 21:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12D91436A6;
	Mon,  1 Jan 2024 21:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D91436A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC6BC1BF3ED
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A296146A
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3A296146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N68120FwozeF for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:15:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C675E61469
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C675E61469
Received: by mail.gandi.net (Postfix) with ESMTPSA id C009240002;
 Mon,  1 Jan 2024 21:15:00 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:15:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221500.02be364d@windsurf>
In-Reply-To: <20231230205459.1237158-1-fontaine.fabrice@gmail.com>
References: <20231230205459.1237158-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJLfRQQXS62em+k5ojm9otE82H5N1HPatDgCvoJ493I=;
 b=YIZ68YqBt06KGLg6AUTraf+SGnEXemnFnMThYIDZYV/ddEVmu6wS1H1eQiOeZY1LeBIBgh
 Kcvly9+lOEsX6tfbftEMnyRnpzb0UrCDtEEVkpgHTTpDZ5KZesz2v8gxP0Ul5XSc8kV21G
 YrKXCdZUVpo9Oj/qntZ45NqyunQOMXbVJ+NShWDGbcKrSu/VOC2wf5HjVXrgobzfvmKHJ3
 PCAXtxJ9hKMParpFiU8/bph/+l63R8EfGjmmITZ1aMhuyFLp/uuiWMfnlxkRRauGW8lSoA
 kJgSXRal316JEKet0hfpVQZyD8IiFxK/Jx6zS1kSrqoF0OAZJIP28ZIlUVQM3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YIZ68YqB
Subject: Re: [Buildroot] [PATCH 1/1] package/libucl: bump to version 0.8.2
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
Cc: Nimai Mahajan <nimaim@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 21:54:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/vstakhov/libucl/releases/tag/0.8.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libucl/libucl.hash | 2 +-
>  package/libucl/libucl.mk   | 2 +-
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
