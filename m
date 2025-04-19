Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FD1C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B8EA80AEF;
	Sat, 19 Apr 2025 15:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CahfA0AE4Em; Sat, 19 Apr 2025 15:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84FB81517
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84FB81517;
	Sat, 19 Apr 2025 15:26:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE8F22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D98814B7
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDVCm0w8ufn5 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:26:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EBFE8149D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBFE8149D
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBFE8149D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:26:28 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 8CEFEBDED2B5;
 Sat, 19 Apr 2025 17:26:25 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 19 Apr 2025 15:26:25 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: ct clmsn <ct.clmsn@gmail.com>
Cc: Buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.3.1745064001.375107.buildroot@buildroot.org>
References: <mailman.3.1745064001.375107.buildroot@buildroot.org>
Message-ID: <6c0f8202ef17cd38940edb4e518a218d@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1745076385; bh=TlHCoSy9kgImIismsfOMl8RFvfFOP0sq1tAU5dFPkOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Blaq2YcQQVxmo6spoWq4F1djsMV9jDfcEDnbpFRB6Fv3AOMzTHmJEsNzrm2E+pSKJ
 ahyFXNjgWZMrx7cwx3QEn6OluRKD9j7EC5oGp3pfKbSwbd8jSme9dWXxLD94e5MoLm
 0wV9afRyb6CiuB2CAUiL9+teMx4wh1rjilRgtAvQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=Blaq2YcQ
Subject: Re: [Buildroot] kernel install from buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi ct,

On 2025-04-18 16:03, ct clmsn wrote:
> 
> Hello,
> 
> This should be a pretty trivial question mostly asking to make sure my
> assumptions are correct.
> 
> I'm doing hardware testing with an SBC. I have an SBC that is 
> configured to
> boot from an NVME-SSD. A vendor encouraged me to use buildroot to 
> compile a
> new kernel. My preference would be to just update the existing 
> environment
> on my SBC's NVME-SSD.
> 
> Given `buildroot/output/target` contains the compiled linux kernel with
> firmware, which directories or files should I be concerned with copying
> over on the NVME-SSD?

Buildroot copies the final kernel image to output/images. In addition 
you need the content of output/target/lib/modules.

Kind regards,
Andreas

> Thanks in advance for the assistance and confirming my 
> back-of-the-envelope
> verification.
> 
> v/r,
> ct
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
