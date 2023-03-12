Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A781C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35F71403B7;
	Sun, 12 Mar 2023 12:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35F71403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxJ0FJHMI7Vu; Sun, 12 Mar 2023 12:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26128405BF;
	Sun, 12 Mar 2023 12:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26128405BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC94D1BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5C7181285
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C7181285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Etwyc2l7OI6 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:32:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FDB280C30
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FDB280C30
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:32:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D909C0003;
 Sun, 12 Mar 2023 12:31:59 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:31:58 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312133158.721f6917@windsurf>
In-Reply-To: <20230306211435.2283414-1-ju.o@free.fr>
References: <20230306211435.2283414-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7EHpdgI1fbFIrqNGxwz9i8uWn+7WhNYnIkMKFRCpIGQ=;
 b=Ovd5yseCTelUqmxXZdt1hBmdGK9MyXvZBnG/QJgKl1Am6xNtf13l/Y4AJM48buJWzKzovP
 nDa/jMdpAXsjXuQampsiiwhlj/cs4uer8ICVvPao00DX1JuG4QMmXx/Fp3dYI9+xrVsPIC
 nVK/C7dpf1ZB2a9HqdkWu9HEyOognWCT1DWu48S0AgphDSLfopJBz11CBzydjuV1vOcAai
 S9Tma/4ONM2QEY0CXCfb8SrlCVaaTWEde6Eg/RdyWI7ssCZFtcZ0HLYgUvAvU1dmaWk1D2
 ZvTheIIUtNk5vMQ0skQ2FdX8vq755tHlxTZFzISyWlh8VNgzYvahRtiPqzXQJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ovd5yseC
Subject: Re: [Buildroot] [PATCH next 1/1] package/gsl: bump to version 2.7.1
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

On Mon,  6 Mar 2023 22:14:35 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 2.6, see:
> https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-7
> 
> This 2.7.1 version includes a minor libtool version fixup on top of 2.7:
> https://git.savannah.gnu.org/cgit/gsl.git/commit/?id=77e7c7d008707dace56626020eaa6181912e9841
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

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
