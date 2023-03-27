Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C7C761AF
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 07:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2E040A02;
	Mon, 27 Mar 2023 07:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2E040A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Wf4ar75900K; Mon, 27 Mar 2023 07:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1FD409FC;
	Mon, 27 Mar 2023 07:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1FD409FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40FB61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 07:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F5F60FBC
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 07:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F5F60FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8gpe736uqQ9 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 07:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8EF606DC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B8EF606DC
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:09:48 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB71A60007;
 Mon, 27 Mar 2023 07:09:45 +0000 (UTC)
Date: Mon, 27 Mar 2023 09:09:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230327090944.6626fa5b@booty>
In-Reply-To: <20230320171733.1077811-1-fontaine.fabrice@gmail.com>
References: <20230320171733.1077811-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679900986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uinzEmSlfMPNroj+GEubox0IgZk6dA2z3deqb5LBdng=;
 b=E54fLXov98ecitAiJZRSPQmgmLaFu1+WsN9W5vLZPS+sAuef24HzyGMLJQrfwibTF772Uz
 3PoW+pjRB5yE+ocPi+Nfp46mlpHxxcoMeyMcyH1itWunHuQcXimwLsUOVskNsfxZjnjbOl
 kNdBnQacvlcOxoPOr3RSm6bgfQdDfSAhCNt5Pm5b1YwDUV5CZaJzUMBSX9x8L8yazwx9rC
 JCVZ5SqX351845tWDD0ChMnBP3G5FeG6vpMxIkn4GyRgHJlAz31xVqXO5tMiSEkU7qbsq8
 2CZcu7sfx2XaapqZ+8nY6hiQQap62hw31JCutLvGX5ahyWWLC0Oqa0Aer1V6JA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E54fLXov
Subject: Re: [Buildroot] [PATCH 1/1] package/snmppp: fix build without SNMPV3
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Mon, 20 Mar 2023 18:17:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without BR2_PACKAGE_SNMPPP_SNMPV3 raised
> since bump to version 3.5.0 in commit
> e011fa0415883b9d44df616cfaf6956e1a11da88:
> 
> msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
> msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
>   263 |   if (m_target->get_version() == version3) {
>       |                                  ^~~~~~~~
>       |                                  version1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for the quick fix!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
