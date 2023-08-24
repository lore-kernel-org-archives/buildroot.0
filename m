Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3FDC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CD3041667;
	Thu, 24 Aug 2023 20:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD3041667
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnRkaDZU6M0X; Thu, 24 Aug 2023 20:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D3A34159D;
	Thu, 24 Aug 2023 20:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3A34159D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94C8F1BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D39760F65
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D39760F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6m8mh5IzJdu for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:31:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB63D60F5E
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB63D60F5E
Received: by mail.gandi.net (Postfix) with ESMTPSA id A236920004;
 Thu, 24 Aug 2023 20:30:56 +0000 (UTC)
Date: Thu, 24 Aug 2023 22:30:55 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230824223055.64cf4169@windsurf>
In-Reply-To: <20230822191634.92015-1-giulio.benetti@benettiengineering.com>
References: <20230822191634.92015-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692909057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2bL8jbZbhySyIFDdu9JyPnpaUOW7geP9W/sLefTRHs=;
 b=IgWRI3Z/qHTvedvCGpmeGw0fTnjB7bO6qg8kga/oMYbYBEYE/CPLrfNrp//xNtcWwBQjbh
 LJHxyfBg6L3b9ONCIBigvAsetlG/CfYFci7JKCUtbv+CEgYqPLqelU2oTGYwLrUWLRDdVz
 9btDdbCVX6sCu/HhsHQP+1QnUiwYPd2D8xUdMcq81NH6YA364Z6OX0jCIb+B0zpE03UncA
 9unZ4YJ/liHu2jToaC5CG4xP4PtY8d+H/Kv4g0BLea+tN70w2foZeZoG9q0N3wPWgjM+hQ
 1wkZB9tZt3W5+22HG9tlG2834VZYYNEBFFBMHDh/R4KiickmjfNQ/1Y7RCfHJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IgWRI3Z/
Subject: Re: [Buildroot] [PATCH v2] package/libfuse3: bump to version 3.16.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Aug 2023 21:16:34 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's drop local patch that has been upstreamed:
> https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fix tarball sha256 hash
> ---
>  ...est-applications-for-cross-compiler-.patch | 43 -------------------
>  package/libfuse3/libfuse3.hash                |  2 +-
>  package/libfuse3/libfuse3.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch

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
