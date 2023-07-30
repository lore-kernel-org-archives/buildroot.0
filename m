Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F53BEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A4B61032;
	Sun, 30 Jul 2023 21:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A4B61032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQPgjn2Gh-Sp; Sun, 30 Jul 2023 21:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E3C61040;
	Sun, 30 Jul 2023 21:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E3C61040
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43F831BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB91819FC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB91819FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8wOKl-KeV49 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DEB4819F3
 for <buildroot@busybox.net>; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DEB4819F3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E6771C0002;
 Sun, 30 Jul 2023 21:55:42 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:55:41 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230730235541.2bc8a259@windsurf>
In-Reply-To: <20230315090755.399279-1-francois.perrad@gadz.org>
References: <20230315090755.399279-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690754142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRHYqmmH3PTUFaHmdulyyJCbVlmv2IieYGoJZfNr+XU=;
 b=hgnRRmsdls/stZJybP+pYJ2rWFVcEwyG53uHKSCeSBcSxfpISyVQ7IMO6mJu3yJtVzph61
 axT5MLcLGxWeqdrLqTXR6VfXlpix0lfguok+zHkKoYjG9FID5UZiELIoDmmgxT1aODhatU
 yLheeNNumljCymqgJDOl/TV6+srGW7NExPhxV2jBdfmQn1CPWEdaoPqcoTpuG14/cnvV7h
 La7BYZFGRtMkAyFbL/8Al1Nfg7AoiNv3u9O+B9ylyw5Eb5IYydMKG1wgCQsjCikytiZsLV
 HW1sLpxw5TFmBLftgUEjx+1Ucnmso20z0abQVd190jBBS4rle/pI+uCTKevflw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hgnRRmsd
Subject: Re: [Buildroot] [PATCH] package/lua-dkjson: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Mar 2023 10:07:55 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                  |  1 +
>  package/lua-dkjson/Config.in       |  9 +++++++++
>  package/lua-dkjson/lua-dkjson.hash |  5 +++++
>  package/lua-dkjson/lua-dkjson.mk   | 12 ++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/lua-dkjson/Config.in
>  create mode 100644 package/lua-dkjson/lua-dkjson.hash
>  create mode 100644 package/lua-dkjson/lua-dkjson.mk

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
