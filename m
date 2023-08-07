Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E024EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E97DA8194C;
	Mon,  7 Aug 2023 08:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E97DA8194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5SiEASS97BD; Mon,  7 Aug 2023 08:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E2480E51;
	Mon,  7 Aug 2023 08:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E2480E51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107C91BF350
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E10B980B18
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10B980B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXkivqxst861 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:49:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EFB481E6A
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EFB481E6A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 409306000B;
 Mon,  7 Aug 2023 08:49:10 +0000 (UTC)
Date: Mon, 7 Aug 2023 10:49:09 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807104909.3a795dfa@windsurf>
In-Reply-To: <ZNCugJjbSzNv7YPd@waldemar-brodkorb.de>
References: <ZNCiPEKIjPhDgxLN@waldemar-brodkorb.de>
 <20230807101431.40cb9d54@windsurf>
 <ZNCugJjbSzNv7YPd@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691398150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+Ajz57fkreJyS40jSmekfjGbuflAdI/AOpmqZzDTO8=;
 b=l8FVXhlMXrddhQaTb3CQgOZUw/b6txRRQ+zu0ix4kKxPtRbxmLEdJ/VCFMT5KfL9WevbFy
 AkvPVoBwbCB0E0IX8KTwxDVxI1Z7OQJapZQzIU5at2IlkorhGrDyVk5X4Wwrn4afphi1Wo
 pg+laoDBNkIpK0lwRWtnPpxw2JnXBv8YMRNhQf4Wn1NABqps7mOGkt3t54buBA+3U/Qfvl
 FulvdVkCC+aifzYvBHIXDBAGI1xfVQqfltTndodRU3tNfQbk2jtRccNz8EYqWbfBCb6AWF
 5o0v7EFyz2r+TkW/e8ApcGPwaXuqo7tyowyohcTXDv0CZdRMMOyXLDg8S3vIQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l8FVXhlM
Subject: Re: [Buildroot] [PATCH] package/elf2flt: handle more relocations
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

On Mon, 7 Aug 2023 10:42:40 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The problem with upstreaming the patch is, that it depends on not
> yet included patches for riscv64 noMMU. How should I proceed here?

Ah, yes you're based on top of the patches in
https://github.com/uclinux-dev/elf2flt/pull/22 or perhaps
https://github.com/uclinux-dev/elf2flt/pull/24 ?

I guess what can be done is:

(1) Comment on those pull requests with this extra patch directly in
    the comment

(2) Upstream: <link to that comment>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
