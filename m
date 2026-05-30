Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B15DCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF8F6853F8;
	Sat, 30 May 2026 17:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtKX0BvMJdEA; Sat, 30 May 2026 17:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E0A853EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163189;
	bh=aQsU8X15RiC7q9UTvJXB9c7TLL6aWo6LveIgR8hE9a8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JNvyAQmO3IakvQZphFw0B0aedrFNJkaec+PUwMZ322J6945Rg8/wuKgND/mIaMl12
	 2oVwI4xxzghrw4xJ1dsK2eb3hv1CX2bWG9dkOKYaFjlluA0iCppp+o7v7vZHzTBWKT
	 n5PRcb2cGGAswf5y2hXlZCVHv3cTPvvE14ROTehdLeBD2dAqsrd/h0QhqptkDP0Ly7
	 KmIZfzJZlHlnwTj1GQi2UX9v0gnUQjHv8eTgrS9/3I0x76fBdcF26faZRa97oliWop
	 IAj4plcQSlSHWauS/jlDXhndgD9FW6MQmg1KVJknOrDTWZKGxKOnb3T8C1IT9UtS5K
	 mMgHL5f6wREVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E0A853EC;
	Sat, 30 May 2026 17:46:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5C9D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D4986F5BA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzMeuQoT5Ku7 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:46:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C58C6F5AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C58C6F5AA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C58C6F5AA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:46:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 544C3C6246E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:46:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 121F06073B;
 Sat, 30 May 2026 17:46:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C56010888CD2; 
 Sat, 30 May 2026 19:46:22 +0200 (CEST)
Date: Sat, 30 May 2026 19:46:22 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahsiYta_hDJhgT5t@windsurf>
References: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
 <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530174139.28613-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780163183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=d1edNZF+jGYpmQp/m2+RzJ89Z//HGg8G2AfhzfxBbvI=;
 b=SfmO4D+o2xI7jHzMb5D5i27e6qnvg3+ozbxXd/F7s2iL0ng3Y7NEb2C4JkcBXsDu4SXSbK
 /M0AREHG/mNE2Fz32vpQJEh9MlT0jVDizrsO+yV0pBVC+w50woM1/hsTgOjx4pnfTY5OUK
 LpRgE/hkNWgTv3qSGYsSE3No5bznKehYQrX7qUR/Ife/hHv2WvmgFvzx0G/Edof6YEoYAN
 pYtmhJRatOVRqxtgJy7/S2qEo1BrSz9MTM29KZ+HMC9rbszFA99d1E1bW31zb87v0VazqQ
 Imk16qVRLXmLhQ0vQI3Krb7DUs3ypDzV5ZbSCV6zd0xed5G2mAm0h1Xk4f423A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SfmO4D+o
Subject: Re: [Buildroot] [PATCH v2 0/2] package/font-awesome: bump to
 version 7.2.0
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

On Sat, May 30, 2026 at 11:11:33PM +0530, Shubham Chakraborty wrote:
> This series bumps the font-awesome package to version 7.2.0, adding
> maintainer registration and addressing review comments on license and
> directory structure changes since v1.
> 
> Changes v1 -> v2:
>   - Added details about the new license scheme (OFL-1.1 + MIT + CC-BY-4.0)
>     for fonts, code, and SVG/JS icons to the bump commit message.
>   - Added explanations for the updated directories list (css js scss webfonts sprites svgs)
>     and Less removal to the bump commit message.
>   - Split the DEVELOPERS modification into a separate patch in the series.
> 
> 
> Shubham Chakraborty (2):
>   package/font-awesome: bump to version 7.2.0
>   DEVELOPERS: add Shubham Chakraborty for font-awesome

Thanks, series applied to next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
