Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B20C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D2141BEA;
	Sat, 17 Sep 2022 14:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D2141BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezoVTA7eaiNP; Sat, 17 Sep 2022 14:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D108418FF;
	Sat, 17 Sep 2022 14:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D108418FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5D61BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9980682B97
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9980682B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzdeJpWmnXJI for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:43:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D9CF82965
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D9CF82965
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:43:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E39CFF805;
 Sat, 17 Sep 2022 14:43:37 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:43:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220917164335.6e2ee1f8@windsurf>
In-Reply-To: <20220911230211.3730844-1-james.hilliard1@gmail.com>
References: <20220911230211.3730844-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663425817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfODIYVyOhJDVHNBAMj3LINTWyZKMxdfZ5WQr8x0oSU=;
 b=CE3wy6uQxBke8WOweN+yl/+8fVTfvLQZ3msIbCPjDD9b8iw4FWvuQoSeoJweOZPX5lB9QM
 6SUSm4B2/mFjkMSHCIUJZHp5IAPqSDMrnO46oa8J3outhTS92334FhSJPgGMtHZY3ZwhYJ
 45WfntqQ8qQZ4Kw5y5gkEigKHxL+K4IxRJWsSbKXIqVlBTGcDM4l2UZ/fli2a8v3nvWtNo
 S+DUgu8d47c2MB2Tw0LWdVQE2r1wbh896qk6YeG6rPAt4q6q03irsKqxvkKv6g6s23A86b
 XOTSVC7QdRikii+IRmco9b8s3/WwbbsjfQq5hMiesZ3fmViOpu6tK3tEK53dKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CE3wy6uQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 38.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Sep 2022 17:02:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...id-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 -------------------
>  .../python-cryptography.hash                  |  2 +-
>  .../python-cryptography.mk                    |  4 +-
>  3 files changed, 3 insertions(+), 59 deletions(-)
>  delete mode 100644 package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch

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
