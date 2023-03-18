Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06677C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11C58149E;
	Sat, 18 Mar 2023 21:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11C58149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nECQM0j8tZ9z; Sat, 18 Mar 2023 21:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBF1F8137D;
	Sat, 18 Mar 2023 21:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF1F8137D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBFCA1BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 961A381235
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 961A381235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d--fSMAjhihP for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:48:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E05A81257
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E05A81257
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:48:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17D2220004;
 Sat, 18 Mar 2023 21:48:45 +0000 (UTC)
Date: Sat, 18 Mar 2023 22:48:44 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230318224844.42119893@windsurf>
In-Reply-To: <20230318000439.2710306-1-ju.o@free.fr>
References: <20230318000439.2710306-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679176126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1yJyKTva/qao93TB4n4IOltI94cUG4X7I0z3mmlVHQ=;
 b=NzVzPLUVVHGbBVuY1Gxq9yfyGTWBwfT68+LIenorIyKsIfgxyPofbhWXepC1tuH1vYc6ng
 4TOai+dVMoiLxlvU2LMbOfaHveSsQB+L4tSn/dkOKt02SI3v4XvPn7WXMc+0ilRdBebI0n
 19TTFkJizF2uXiLM9wRlGANNDLGlzuofPHvvUBCgsGnvxRaOBQZu/V8c4cLoPLDkv7W1bb
 bAfJeVr13AV+a3jZK1ZL4LSN1lB5XQjU9CYQXK2bQichaQ/Yv5DzpJMzrQvRojYu8Tu2jD
 sR7dohY666qfUEnqAdkB+9Jcvd7ORL5kvdN+v1IV9RHlpscS3x12+bNzUrpFHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NzVzPLUV
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v45.0
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

On Sat, 18 Mar 2023 01:04:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v45.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit d305189 with commands:

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
