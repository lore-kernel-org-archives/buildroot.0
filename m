Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7CC83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A1181ECF;
	Sat, 26 Aug 2023 19:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A1181ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WA2OzsH49vzk; Sat, 26 Aug 2023 19:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9254E81E60;
	Sat, 26 Aug 2023 19:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9254E81E60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0F8A1BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C06AF40377
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C06AF40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNNiaA9_rPZB for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:49:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5ABE401A1
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5ABE401A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6827920004;
 Sat, 26 Aug 2023 19:49:13 +0000 (UTC)
Date: Sat, 26 Aug 2023 21:49:12 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20230826214912.7821c07c@windsurf>
In-Reply-To: <20230808172231.1114696-1-jesse.vangavere@scioteq.com>
References: <20230808172231.1114696-1-jesse.vangavere@scioteq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693079354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGmwmGkXSP9MXDqswzMz7p6VwyfnlG930T8v1Sb6heY=;
 b=pqTL9pzeYiO8z4B6p0CZ6LNiWg9pTd4n4hqcTcOSs28sKk2WuoH6DGX1VNfYNQ5lY9I8H2
 eCYazjgsBFBEEzi88UjAPVc7R73h/FfrpmU3bBGXYEuTuQh8jzk6AgiEYntR/8d1yILxKO
 8csYXfj1SGsHx15lcw9IU8/4dYQsebTyV0+QsBtHDj67qIgQ6iVvzr5skNkkvukoborgnV
 pCdgv7zHRUdi5F4YiB1BHmfOawaZzbTniz/Nfi9fEI2E0andmUdDRAbf8MkFuDLu1pKkrT
 eLIWJ5EWcsFXgnbXZMY1HOXi2STQlJh6hQ+3l/5Ww8esgUZzAIfdi08ZgidEvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pqTL9pze
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6shadertools: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Jesse Van Gavere <jesse.vangavere@scioteq.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Tue,  8 Aug 2023 19:22:31 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
> ---
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6shadertools/Config.in          | 11 +++++
>  .../qt6/qt6shadertools/qt6shadertools.hash    | 13 +++++
>  package/qt6/qt6shadertools/qt6shadertools.mk  | 47 +++++++++++++++++++
>  4 files changed, 72 insertions(+)
>  create mode 100644 package/qt6/qt6shadertools/Config.in
>  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
>  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk

Thanks Jesse for your patch. It builds fine... but it doesn't install
anything. Indeed, it looks like qt6shadertools doesn't not
build/install anything when qt6base is not built with GUI support:

Skipping the build as the condition "TARGET Qt::Gui" is not met.

For the target package, it would be easy to fix. But for the host
qt6base package, the story is a bit different. Does qt6shadertools
really need GUI support in host-qt6base? If so, how did you test that
as nothing in Buildroot right now allows to enable GUI support in
host-qt6base?

Could you have a look into this, and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
