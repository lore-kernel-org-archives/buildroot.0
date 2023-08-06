Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C84C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460E8607EC;
	Sun,  6 Aug 2023 21:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460E8607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uCLNH8z-9cp; Sun,  6 Aug 2023 21:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 804F860807;
	Sun,  6 Aug 2023 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804F860807
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6044C1BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A9534011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A9534011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61MYURa_qjNp for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:56:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AD3E400CC
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD3E400CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0CB8FF802;
 Sun,  6 Aug 2023 21:56:55 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:56:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230806235655.1100a637@windsurf>
In-Reply-To: <20230806213957.4098743-1-james.hilliard1@gmail.com>
References: <20230806213957.4098743-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691359016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Trs+ghkp0XwoFIcCTYvHW/Za/Li7LqO509ruAhvM12g=;
 b=NhbSFZiSZbuUasVCyB6FUIYRM4OXx9zr3399umg2ZxN4BnKkypeURi7GqkuN0ELuyiTz+e
 kGZE5PjLZJtzVRQotypVUnor8gKcIbLyiKVIgnYuneOb+nDyFcF2MhwLNJbj19snzITWAq
 G6UgsJoPpUIWTC0oxcerrjMEKQzTNK/PkbgcjSTQLMrYg++I/tK/YPxOuPj5XThrTwgPFV
 8iYGO14vmISDgVXimXALpueD5FsY0uNwDcl/m2it+4vzXj5lEiRcZMtbW5onciujroN4W/
 0U0y1zQ9ifHqDiWyMmHXNtq65ih28/HNh/i7yp60Ny0H2V71ZXteHl+3tQqkCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NhbSFZiS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.28.20
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 15:39:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-boto3/python-boto3.hash | 4 ++--
>  package/python-boto3/python-boto3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Same comment as for python-botocore.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
