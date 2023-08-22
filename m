Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EE3EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F45606FF;
	Tue, 22 Aug 2023 18:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85F45606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDTYcrAVHNGA; Tue, 22 Aug 2023 18:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2521611C9;
	Tue, 22 Aug 2023 18:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2521611C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 451621BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 118EA611C9
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118EA611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHe6Xx0xqbi1 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:07:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BB2F606FF
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB2F606FF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A8681BF203;
 Tue, 22 Aug 2023 18:07:04 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:07:03 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20230822200703.00507757@windsurf>
In-Reply-To: <311629eb6d15475f7a1497dc10b1e3b6c84051b8.1692679844.git.baruch@tkos.co.il>
References: <311629eb6d15475f7a1497dc10b1e3b6c84051b8.1692679844.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpX/gkoyneBxhzfNpySZuzPzH3BQL5HyZqcdMawXpk0=;
 b=aiz5/0JeMfFCEe3WQehzlsrPsPHLFiwSLVmMgVyPJ3diy8LXF9jDf1plXCW8t5pxfq/aKU
 1K8jhdHj8JMfKQAu4lUd/jjplV/4BzWXbhP1MqhYl9RuKxM4IDXUKpsNWF0QxlKY9j9PUA
 fkE6Q7yZmUuAmYCXoPYpdrg0Ka/fWA+i0EeMP3q/VtrRbbm4oZooPv8jDoDQXheqWJ6xlF
 KduTwyUsEAr2TxyDiBTFTSYLpcj120rZjhJ8I+I8b9pxOl+Sqw7Li97yrp5yk+aCxenAS9
 X7Wwg5SXG83LOROrp5sIKHhfpPHFrmbKYLK6+qi/xzkVkmjcwLy/Zf+Ye/QkKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aiz5/0Je
Subject: Re: [Buildroot] [PATCH next] package/libassuan: remove stale hash
 comment
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
Cc: buildroot@busybox.net, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Aug 2023 07:50:44 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Commit 0e19425c774fd ("package/libassuan: bump to version 2.5.6") moved
> the sha256 hash below a link that provides the hash directly. The key
> check comment now appears to refer to license hashes, which does not
> make sense.
> 
> Remove the redundant key check comment.
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libassuan/libassuan.hash | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
