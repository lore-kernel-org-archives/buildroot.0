Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13852EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC3D6120B;
	Tue, 22 Aug 2023 19:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCC3D6120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVVN-A4RlS62; Tue, 22 Aug 2023 19:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1499161202;
	Tue, 22 Aug 2023 19:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1499161202
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D40F1BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2678281FB8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2678281FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCMkV6Zv4k-M for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:22:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18C0481B6D
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C0481B6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40B7CE0008;
 Tue, 22 Aug 2023 19:22:28 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:22:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822212227.4552e277@windsurf>
In-Reply-To: <ZNonuEcvkO/N5PXe@waldemar-brodkorb.de>
References: <ZNonuEcvkO/N5PXe@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692732148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKo20Z2FPmUzW6nG44toG5gG0xlqZFH8xvQqJfl7CO8=;
 b=H/VNuZGcNzFXLA5UbcfNHH9FcxcWKnowZVQWSivES15ncDiru7Eh86Oq8aFP+WHs5nULTv
 iABnV9tNZ3oS3RNFs1JYSHH13BH6RCuL0PXByUY2CUS5fg7jMIgRTW0gskc3CE0NLfyiUn
 xFr7f4vdnZVEiaH3pYlBQq66DmJ945muvyN8boJieaOrykdiTX/sShdyGg8xc6N5Kt5GOz
 VcT2clIQaFGhQbtFoXdQIjx6Sb8RBygMOSuL1Pnb98VrlqoH+mJtqv7uv3mfrZOBbuZtov
 kSsQTXWevmkjPsrYfzY79OEOyITDuINupgLSLDr4aiBSV2SEUhnbJI8GZs4p9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H/VNuZGc
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: handle power9 cpu,
 fix compile error
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

On Mon, 14 Aug 2023 15:10:16 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Zlib-ng misdetects the powerpc cpu and the package fails to compile
> for non-power9 cpu's.
> Power9 support was added Upstream in commit:
> 02d10b252cc54159f7c33823048daec4b023fb22
> So it was introduced in zlib-ng 2.1.3 and this was added to Buildroot
> in commit 0df456ea6e05306fb077e96064adf68f3863eeea.
> 
> So there is no need to backport it to older Buildroot releases.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a9f/a9f45486664b2d5b23a2f330a63955a06ae8189d
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/zlib-ng/zlib-ng.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
