Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65176C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6CCD83F36;
	Sun, 30 Jan 2022 17:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbrHpR7yJypT; Sun, 30 Jan 2022 17:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ACDB83F33;
	Sun, 30 Jan 2022 17:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 944F91BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDE24090E
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAiHY4hPFaJU for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:07:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CBE240908
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:07:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED8A8240007;
 Sun, 30 Jan 2022 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643562431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHEKACPb9Vi/zmIyTrzmTa3/g2wbc1zcPV4kyS1xgJc=;
 b=XrVr43w4RRkIt5nJZvw0zn7a8hs6wEZpC1BEEWOzdry3FwdDSuyB7aSD6NISPXX/CiTy4Q
 u73DovklOXIZNmMGTM9hwd8egkUMv5EIpV1dbNYtrVqs9dnKjgs7mLuHdJPFG8JUrmHsa5
 O8qfE8midNhcLmfI4tarD+yw+UloeV8PMi5YOgRv6OyvjEnErJhds16VFrzeSOeNMRIAj9
 b+qfe5KbbHKDrXCThJVJJattDvxAOY93YD2ETqSVJxQ5IbchE08qkVO8yNeBY3sC+lzg1Z
 QOWl/16EhvMkCjdGRkQSrReY6Cpi9Bl5SXJ0kueZLbm8sVJlp0gE15kwDLHrpw==
Date: Sun, 30 Jan 2022 18:07:10 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130180710.0634772d@windsurf>
In-Reply-To: <20220129110734.3737599-1-fontaine.fabrice@gmail.com>
References: <20220129110734.3737599-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix static build with
 openipmi
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

On Sat, 29 Jan 2022 12:07:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure with openipmi raised since commit
> 8f6b346a34bdb344c4a001d8bd66f5e973013c17:
> 
> /home/peko/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libfreeipmi.a(libfreeipmi_la-ipmi-md5.o): in function `md5_init':
> ipmi-md5.c:(.text+0xa7c): multiple definition of `md5_init'; ../lib/.libs/libipmitool.a(md5.o):md5.c:(.text+0xab0): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/01b22faf08a798ecc5d5465e1c0c13fa024f1096
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-rename-md2-and-md5-functions-macros.patch | 695 ++++++++++++++++++
>  1 file changed, 695 insertions(+)
>  create mode 100644 package/freeipmi/0001-libfreeipmi-rename-md2-and-md5-functions-macros.patch

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
