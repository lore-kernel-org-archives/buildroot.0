Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA15AC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D817416AB;
	Thu, 11 Aug 2022 21:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D817416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgBbhQv6Ekzv; Thu, 11 Aug 2022 21:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609474155F;
	Thu, 11 Aug 2022 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 609474155F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0439C1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14DC4041C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14DC4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubT5MACZe0_V for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:01:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACBB0401C9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACBB0401C9
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:01:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AECB240002;
 Thu, 11 Aug 2022 21:01:38 +0000 (UTC)
Date: Thu, 11 Aug 2022 23:01:37 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220811230137.76b34496@windsurf>
In-Reply-To: <20220809215915.2740950-1-fontaine.fabrice@gmail.com>
References: <20220809215915.2740950-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OF/Id+8jhKoT5fI2MkrmVYVflXwTU3dEXunF78zmuzg=;
 b=VtNdo0fmIRfcukSP1/TEqVFaHMm9tpSskbha5dRDmCjepK2g3XRv4MKjZjdjkNAsAQZnHc
 QuXHRYGcoAEmC2df/sg2CTI5OCiuavbOzfXjh0IL+4Fd7Wu7OUJzxyi4LZxhTLJJ3Sd3ZS
 i6KM0Yg6nxS6dQXmRbRd79xbiiFYeO5Caw0Qpyshb0+GGAkyQHG59L9hsj3bci5Y7B6R40
 jxNH5c11LtIgRhwqyTEbTIlMzItNKuCc3L+9A/CSbG7CIJkVX0wCFFatG5OHl2O/Z0L0uY
 LEEbQmV/G2iMpLqoAeptKPmQ5TfybkCzpLQJRgeffhZKjqlI7YVWupu1SSuMzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VtNdo0fm
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: fix musl static build
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

On Tue,  9 Aug 2022 23:59:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass LDFLAGS to avoid the following musl static build failure raised
> since the addition of the package in commit
> 814911aecb6d49bb603c34dbfcc0d86614516b41:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
> /home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Makefile.linux-pass-LDFLAGS.patch    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch

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
