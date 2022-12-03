Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFC7C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D74181DAB;
	Sat,  3 Dec 2022 14:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D74181DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bArOKxqZDNLx; Sat,  3 Dec 2022 14:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8A981B6D;
	Sat,  3 Dec 2022 14:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8A981B6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE1B91BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9977B81B6D
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9977B81B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4qHiCx91s7R for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:32:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CA2817B3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49CA2817B3
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:32:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D592EE0005;
 Sat,  3 Dec 2022 14:32:22 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:32:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221203153220.4efe9f1e@windsurf>
In-Reply-To: <20221202215905.7800-1-fontaine.fabrice@gmail.com>
References: <20221202215905.7800-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670077943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzDkk9GcmzEZZDt6lt53Wmh7AtQTO2uwt0djZJp/L9o=;
 b=fgRlUSGwg1OSaULcpEaD22FbB8q1B/n0PefoYfACnhnPLFkUoejOQN1lYhOXJANXC4gMMV
 Ibfi/awwbu5tRReB7Wo9GovmKDNqYZzQJzwVPEuYVC3p0x3wJ7SnsHuFzgaAilq7pEFnzr
 XjtUcqYytYbqqJezBHapqF8Ba07eHLZlq2dfQOHTdqsE8kq0SB8cANgcpBO76kfDOe8nWw
 x73hbt9EQJAiBnhrDOAVqnW27mKEVTAuVKoEQF4YJc6q4Aj9b7W75rjCqcL7MEvM7D1XM9
 pnDA19NKC0dRhUCaRHY8infCbSeHL8kBmw09Ly6f5Ho11c8SrwwEJkWDdUCLOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fgRlUSGw
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: fix CVE-2022-36227
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Dec 2022 22:59:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In libarchive 3.6.1, the software does not check for an error after
> calling calloc function that can return with a NULL pointer if the
> function fails, which leads to a resultant NULL pointer dereference.
> NOTE: the discoverer cites this CWE-476 remark but third parties dispute
> the code-execution impact: "In rare circumstances, when NULL is
> equivalent to the 0x0 memory address and privileged code can access it,
> then writing or reading memory is possible, which may lead to code
> execution."
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...chive-Handle-a-calloc-returning-NULL.patch | 38 +++++++++++++++++++
>  package/libarchive/libarchive.mk              |  3 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/libarchive/0001-libarchive-Handle-a-calloc-returning-NULL.patch

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
