Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B1C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A08440424;
	Wed, 27 Jul 2022 07:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A08440424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00gP8S46FrSR; Wed, 27 Jul 2022 07:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9695340412;
	Wed, 27 Jul 2022 07:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9695340412
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4761BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E939E40919
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E939E40919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZudCHDf9-iz9 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:45:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED17408A4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ED17408A4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:45:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C8E1240002;
 Wed, 27 Jul 2022 07:45:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:45:34 +0200
To: Nicolas Tran <nicolas.tran@smile.fr>
Message-ID: <20220727094534.5e912b16@windsurf>
In-Reply-To: <20220726155115.2024965-1-nicolas.tran@smile.fr>
References: <20220726155115.2024965-1-nicolas.tran@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658907935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK0UHOqE13AfDLBPurkswqOsbVsnoSXkmNMVfdmbCTk=;
 b=D0jpbJMSjuaylzEhH7DpcC/P83XZBLVdNdgJiZ2RfI4ynPa4BZHlfeAgZzZtmVKQFuuviF
 DM5yoe+/Lr5Pn4BoVd+xgsXJ4TOrEtcC2POJot6FS1WGKMOj5ZLnAMbXX4zh2CLiUU+5Ig
 JgAsFFGv6knbQjS2Si5kDvYaBZWPTFYHj0XUkTjm6ffGeYQ4rpMDBiT/s2PJ16DSYU7nHD
 yhizSXPyYSOy3v/WiuwbWVM0QMoDlZumcT7/Q9xn/3XDuvDhwFt5OopRjkkHmHfkWej9hQ
 LldFCRSxTKV9RBbCbal3OsOwpIT1x0Eu8Rgc9rUlROk05RmYKZB+EJCXv3DcsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D0jpbJMS
Subject: Re: [Buildroot] [PATCH v3] package/dust: new package
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

Hello Nicolas,

On Tue, 26 Jul 2022 17:51:15 +0200
Nicolas Tran <nicolas.tran@smile.fr> wrote:

> diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> new file mode 100644
> index 0000000000..82043b497d
> --- /dev/null
> +++ b/package/dust/dust.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde  dust-0.8.1.tar.gz

The hash doesn't match here:

ERROR: dust-0.8.1.tar.gz has wrong sha256 hash:
ERROR: expected: 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
ERROR: got     : 271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you check on your side if the hash of your tarball is really
271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549 ?

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
