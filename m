Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B7CC87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 17:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698E380ED0;
	Sun,  3 Aug 2025 17:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U45fY900a96t; Sun,  3 Aug 2025 17:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8D980D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8D980D6E;
	Sun,  3 Aug 2025 17:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D27A1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 216F680D52
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4_5FzRohHRZ for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 17:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3D0C80D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D0C80D6E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3D0C80D6E
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 17:22:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.232]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpSl-1uBBPl3n7x-00kl1B; Sun, 03
 Aug 2025 19:22:48 +0200
Date: Sun, 3 Aug 2025 19:22:48 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250803192248.4ce97302@gmx.net>
In-Reply-To: <f0393f4842c7d7672a3d66ec9cfd4d7d@free.fr>
References: <20250803140011.186274-1-ps.report@gmx.net>
 <f0393f4842c7d7672a3d66ec9cfd4d7d@free.fr>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Z8B8AYxNtuJDE95OrflEHEgSjQj9cBTPygj8sj8To5QT100b38F
 dgBljQoUVkfH3zE6Zima9igUgYbaZrKrDdtWrTIF0NeKtGr40Ck3dUYOcK0ufVCH4UFe9GT
 S5W/Ya7RpujaMeXTaaZrGE5lvogn95UJnDwMw0koUqfZSOA4jczq0MSLVLE6EvZlFQgJGkb
 5hqnRDqn4XnI9pPipDK2g==
UI-OutboundReport: notjunk:1;M01:P0:B1NIy7DzF1E=;mK30/XlNwhJBmvLk8mPoMCIRfwW
 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
 NRrsqgbl3rA77UX+db0Y7jm5eTDQmXZRRJf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754241769; x=1754846569; i=ps.report@gmx.net;
 bh=K/YAaXAeHZJ44N1I+jKY/dNvXyigSb7buubq7+CBap8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P6eY2dElmxXnxucHXuWjL4KU5MsuIyxz1i6FPQ3roSL5bPjb2ezKVGh1c60MVSKq
 gx2HK/BC8yzQ2HwZ2Jii5QKuonMYis+f2CKoYGopFJCDEAE8Wqu6U/cF+j4oi2LQO
 WibNjLJW3WuHQefsTdk+FnWhub5n4UwALBtyLnbJcOF0GXXgL5C+rqKENzJq5kCyY
 X70595hFuI1TU+CXZio1vmDrHEJaTQ7TEvuIhIcWmn6Qd4NWAcZoF896A5n+iHiwA
 hgoPTVEdxgIF2POLjzF0zkXroORgRLXkgLJC1pIrosbuEuEp4Zgx/SS0WytmAJcON
 ZWgYvdkLu+8p8nm+mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=P6eY2dEl
Subject: Re: [Buildroot] [PATCH 1/3] package/ell: bump version to 0.79
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sun, 03 Aug 2025 17:50:55 +0200, Julien Olivain <ju.o@free.fr> wrote:

> On 03/08/2025 16:00, Peter Seiderer via buildroot wrote:
> > Changelog (see [1]):  
> [...]
> > [1] 
> > https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.79
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Series applied to master, thanks.
> 
> For info, I fixed another check-package error in patch 3/3.
> 
>      make check-package
>      package/iwd/S40iwd:0: lib_sysv.Variables was expected to fail, did 
> you fix the file and forget to update /buildroot/.checkpackageignore?

No, simply missed it (did only './utils/check-package package/iwd/*')...

Thanks for fixing it!

Regards,
Peter

> 
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/0343f03ce496b16b775859c78664425be6278aa9
> 
> Best regards,
> 
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
