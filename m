Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3859DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5F960BE0;
	Wed,  1 Jun 2022 12:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPQOTRNOXmwD; Wed,  1 Jun 2022 12:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFFA60BFB;
	Wed,  1 Jun 2022 12:33:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E76B61BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D75FE827CA
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GviT6--wu_YM for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:33:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B7B827C6
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:33:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C97A360003;
 Wed,  1 Jun 2022 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654086822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAut5a3TFAKjuWa0r2UYYgeDwuVao4CXMwDNh8rSl+8=;
 b=pbvfJVD9n9z0zQajD/EpXn0dmRv0CNHKhHYPZKYjwBWht6JcBLV/4gFzQrusVG8n5XGwjH
 gmYBmq6aY36OLnZ0sOQC4Pcq14o2AO6XpbPoMFUqKwBw+C+wgM3HwdZInbqinJCVUURr71
 b0drBNFqA8kNVlbJ8hNXfZnVGFpgnWziLT4xAlBv4aoGUt8oDpuYCOsRftb89WZe8hZq2P
 hahsMLPQwQHhZZ635GJmsSW2TY8UZgP3/KFVNUnYeUuq7dGcS23xNYCLvBghhkuIeByw2j
 H5mbwjPMtebclvwuAdFSKhDohU45zHYfE+wBZKZvIUL4AoPrYCyekc3G7uqfKw==
Date: Wed, 1 Jun 2022 14:33:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601143340.01ea61e2@windsurf>
In-Reply-To: <20220531192657.340827-1-fontaine.fabrice@gmail.com>
References: <20220531192657.340827-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libks: disable tests
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 21:26:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disables tests to avoid the following build failure with
> BR2_SHARED_STATIC_LIBS:
> 
> [ 42%] Linking C executable teststring
> ../libks.so.1: undefined reference to `dlsym'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e61a683928795402375165adf686687f3305e0c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-CMakeLists.txt-honour-BUILD_TESTING.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch

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
