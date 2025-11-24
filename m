Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFFDCFA466
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9239B81434;
	Mon, 24 Nov 2025 14:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lvf8hoYv_MH6; Mon, 24 Nov 2025 14:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C64813FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97C64813FF;
	Mon, 24 Nov 2025 14:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA2BE4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7188A40BEE
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5clbG9oOclK for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E5FB40BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5FB40BF8
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E5FB40BF8
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:13:49 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id E7EACE00305; Mon, 24 Nov 2025 15:13:46 +0100 (CET)
Date: Mon, 24 Nov 2025 15:13:46 +0100
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Message-ID: <20251124141346.dvpuy23dvcafrs7j@n621.de>
References: <20251124140704.15108-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124140704.15108-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1763993626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9z/UOtxfJ83no7PQ2Fz8/VSHj26FPQT6LpYQM4mAJDY=;
 b=WFPVpSawcgll+xBA0cwQ+I9AsqgKX5TyngUyT2fkV8790fO9RhrrfjboMYQS9tkOiPyfiV
 1M5fWOzIfJwXaTA75lN8e2q1MXkPF786+s9v4hOdRWeECRb5aIZeeHjIBLfxgX7i37ZLXq
 9skRZm0i+U2TQQAiu9I9S6Edbq+DOKc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=WFPVpSaw
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfig: refresh tarball hash
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 24, 2025 at 03:06:40PM +0100, Florian Larysch wrote:
> The original version is still available on sources.buildroot.net,

FWIW, this probably means that somebody has to manually clear out the
old tarball from sources.buildroot.net.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
