Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2998FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02E160E56;
	Tue,  1 Nov 2022 22:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D02E160E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF16NJMYPS5F; Tue,  1 Nov 2022 22:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD9860E2F;
	Tue,  1 Nov 2022 22:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD9860E2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45A551BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2190C60E2F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2190C60E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZ2JIXt1Z3B8 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14C7360E4A
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14C7360E4A
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:24:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A738100002;
 Tue,  1 Nov 2022 22:24:35 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:24:35 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101232435.073217d2@windsurf>
In-Reply-To: <20221031221131.257422-1-fontaine.fabrice@gmail.com>
References: <20221031221131.257422-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRVM8yh674Odf/QjDVwtNHwhXoI9GSLuGqn0/Qu4jZc=;
 b=dT7PoRDX1MyaPRD4Wvz5cfrjlmT7rJspvkxSUrsEU4Haw6TKuZZSYzwniAIwWAx0j1kUmV
 8vrroA/q/+8nDdsA76L2DmHvCEQ8QxWom4pfvOCRwfmN3y5SJVIa8vxoedYFV2j51HA3uQ
 BLzCQjI+HtTawpvETNG1EA4eP/eZM1Z+vQSzWfWHgAUapXrJ880L3EvY0mzfHZGLe3sgne
 QK87cwjlOMMgwfUjmZ1+udZAZV0nHBymNFzYo4/FWvIo4Oi1ivl0lo5rrl9ju6QPjEUjFm
 oP05HA/80fNNlRgPTw8rTXVbBSBQZDTYbh/A4A+IhscGU2J52FwHaIvWqinlbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dT7PoRDX
Subject: Re: [Buildroot] [PATCH 1/1] package/rpm: bump to version 4.18.0
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
Cc: James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 23:11:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://rpm.org/wiki/Releases/4.18.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rpm/rpm.hash | 4 ++--
>  package/rpm/rpm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
