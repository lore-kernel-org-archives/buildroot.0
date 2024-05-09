Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEEB641578;
	Thu,  9 May 2024 14:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6_0_OBsVdZN; Thu,  9 May 2024 14:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649FC41588
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649FC41588;
	Thu,  9 May 2024 14:45:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8131BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C9C46077D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6o6P45MOwKs for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15A1E60FFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A1E60FFF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15A1E60FFF
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:45:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A4E120004;
 Thu,  9 May 2024 14:45:09 +0000 (UTC)
Date: Thu, 9 May 2024 16:45:07 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240509164507.4682bee8@windsurf>
In-Reply-To: <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4haXg+hl3FI7NAWjjdJlpqpCmaLisk+IRoxZ/+cxhg=;
 b=Jzzwa7+N0eqKx7tPF4PxgWs5wbEhaN5Up/IOsWOzhodkzuzCgDRnf+AiFvAPF73XTNqwH+
 lLJznebD772GjCK7pW02hNXzfcZOzVVHBJ/R1JKLt2JBOsfF2n9gXTFeKQJiUKRaV4EGbh
 au1HUZUK0m3xuNW0PsNH1re6fpMOhDbkCAiL+Yxmv3fLTfJJ2IYCUtIxHodrtlGiU6DqGI
 5K3HzZqqEK+TYlykKI4RvIjVj3AhvXrVpcNfqKafS/GBeyOAxDbZapzITtslyzGTGFv2Ie
 QQDm2IoWxANNviXEMvbWoliM6vOC6yISyqDZyuMMIGrTpob6JYEfLjgL59xobg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jzzwa7+N
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Romain Naour <romain.naour@smile.fr>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Added some Buildroot maintainers in Cc, for a question below.

On Wed, 17 Apr 2024 10:05:24 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
> Changes v1 -> v2:
>   - don't add unnecessary Config.in.host
>   - add required BR2_PACKAGE_HOST_QT6BASE_GUI config element to qt6base/Config.in

It would be good to expand the commit log with some explanations on why
host-qt6base needs to be built with GUI support for this package to
build for the target. Indeed, this is a non-trivial packaging thing, so
it makes sense to clarify it explicitly.


> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 3b15d40c83..5b598aa938 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -1,3 +1,6 @@
> +config BR2_PACKAGE_HOST_QT6BASE_GUI
> +	bool

My question to other maintainers: do we want this blind option that
allows to enable GUI support in the *host* qt6base to be present in the
Config.in file (normally reserved for options for the target package),
or do we want a simple Config.in.host, which even if it doesn't have a
visible option for host-qt6base would carry this blind option allowing
to enable GUI support in host-qt6base ?

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
