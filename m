Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97E3CA0EF9
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 09:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BCF80D49;
	Fri, 30 Aug 2024 09:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kp72CHnn7Syz; Fri, 30 Aug 2024 09:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A27B80CA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A27B80CA2;
	Fri, 30 Aug 2024 09:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5129F1BF319
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 09:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E36A40AFB
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNkPCMFW1qAW for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 09:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AB1F404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AB1F404EB
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AB1F404EB
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 09:14:56 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Fri, 30 Aug 2024 17:14:49 +0800
 (CST)
X-Originating-IP: [59.46.133.34]
Date: Fri, 30 Aug 2024 17:14:49 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240830082650.1895430-1-peter@korsgaard.com>
References: <20240830082650.1895430-1-peter@korsgaard.com>
X-NTES-SC: AL_Qu2ZB/ybtkoj7ySZYekfmksSgOg6X8CxuP8g3IRWO5x+jDDp3QcnRnBaM2vv0sSUJgyOuQGOYDtDxeR+ZaVaUqw1blxTzq04sLsENRO1leY+4g==
MIME-Version: 1.0
Message-ID: <27993780.8e0f.191a290e0c9.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3P6aJjdFmbhYbAA--.2746W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXR9LjWXAnAQO-QACsI
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Uo+v67zI/f3NCKSlQqCmP72HmciXsVhzLK9qX0jVgIo=; b=b
 1DEpoNeHUeTcjDDIomIBwlWjyAWV33ZBUGfUmpEfB+xwVDeutWsAXFHz5V02/Nn3
 yTPiaJ0A3IB6UooIgUJwr/EYKDv5aIiS0cW5RfEe4B/mkvVC1nklHSxAo+Jyp9EQ
 eeTuoh8K5TYSuuk5GwiWCYg9sz1sGYPhiZRSg7pm+8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=b1DEpoNe
Subject: Re: [Buildroot] [PATCH] support/scripts/genimage.sh: drop gzip
 compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At 2024-08-30 16:26:49, "Peter Korsgaard" <peter@korsgaard.com> wrote:
>Commit 6889056f1eb4 (support/scripts/genimage.sh: support creating a bmap
>image) added unconditional gzip compression of the genimage outputs if
>bmap-tools is enabled, which is problematic for a number of reasons:
>
>- The gzip invocation is not reproducable (E.G. does not use -n)
>
>- The original file is removed, dropping the sparse info
>
>- It hardcodes policy, E.G.  bmap supports a number of different compression
>  algorithms / compression may not be desired for all images / different
>  compression levels may be desired
>
>So drop the compression step.  If desired, compression can be done with a
>post-image script.
>
>Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>---
> support/scripts/genimage.sh | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
>index b479ec9e0b..df224241ab 100755
>--- a/support/scripts/genimage.sh
>+++ b/support/scripts/genimage.sh
>@@ -54,6 +54,5 @@ if grep -Eq "^BR2_PACKAGE_HOST_BMAP_TOOLS=y$" "${BR2_CONFIG}"; then
> 			continue
> 		fi
> 		bmaptool create "${image_path}" -o "${image_path}.bmap"
>-		gzip -c "${image_path}" > "${image_path}.gz"
> 	done < <(grep '^image ' "${GENIMAGE_CFG}" | cut -d ' ' -f 2)
> fi
>-- 
>2.39.2
>
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot

Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
