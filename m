Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9FFC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CC781E8B;
	Mon,  7 Aug 2023 20:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CC781E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWxSDNi7jpKc; Mon,  7 Aug 2023 20:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA1B81EBA;
	Mon,  7 Aug 2023 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA1B81EBA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4F7E1BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80568409FB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80568409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEJ-Ui58fkB5 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:24:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38B4E409DB
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B4E409DB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C7FF240007;
 Mon,  7 Aug 2023 20:24:16 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:24:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807222416.1055be91@windsurf>
In-Reply-To: <ZNC/P8D2B1tAPFk0@waldemar-brodkorb.de>
References: <ZNC/P8D2B1tAPFk0@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkyoOjekPgzad8Y/AzhUawRE6fjUBN7yJZ9Rhh4EJOc=;
 b=kTZEkqTfBB4NYh34C+kfU27zTu1PAmud1mhMvy4qldUVf8qlLhaw3iJwK/LFlGDTamNi/A
 7YOO5o3SVFTW9so5cStqg/v/y3mdGFPnjkWN3/IK0SiBFJlrs59kQtpKv8zHSWjU+yD7d9
 AAinVUZDRAhNcnATJbt+o/zHM9W9kFWYH00SiJZyzhio8KYb1h5mFAHkGjBGOAyxGgTX12
 uI2LgZfdnhc37oAuVWV6XsPTglwxDnbRQWW49HWQia5Wiv0aHVuJM9rMmQmrEf6QMl2kyV
 RUzAL1lx5mJ2Lp67toEoqx39cZn+pqMNMQzNNpTB069FHNCZMQKMhmwT1vU7kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTZEkqTf
Subject: Re: [Buildroot] [PATCH v2] package/elf2flt: handle more relocations
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

On Mon, 7 Aug 2023 11:54:07 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here the comment:
> https://github.com/uclinux-dev/elf2flt/pull/24
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - remove patch numbering 8/8
>  - add Upstream Tag
> ---
>  ...e-relocations-required-to-be-handled.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch

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
