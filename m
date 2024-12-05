Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7C1E7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 02:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D8F6089E;
	Thu,  5 Dec 2024 02:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNyLRO4oi86W; Thu,  5 Dec 2024 02:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4185D608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4185D608A9;
	Thu,  5 Dec 2024 02:20:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D7E1DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 02:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0409608A9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 02:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmU6JWkXe19P for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 02:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F5A36089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5A36089E
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F5A36089E
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 02:20:05 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-101 (Coremail) ; Thu, 5 Dec 2024 10:19:58 +0800 (CST)
X-Originating-IP: [59.46.133.34]
Date: Thu, 5 Dec 2024 10:19:58 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
Cc: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
References: <20241107134342.4306-1-tianyuanhao3@163.com>
 <20241107134342.4306-2-tianyuanhao3@163.com>
 <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
X-NTES-SC: AL_Qu2YAf+dukki7iWZbekfmksSgOg6X8CxuP8g3IRWO5x+jCvpxBwxQHBTInLs6/mDLQONnQiHdRdj6NtIQLhSfK0G0Jy+j09uJ2HAmCbUon0Z5w==
MIME-Version: 1.0
Message-ID: <6e2e67e6.2701.193949deeb9.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZSgvCgD3P1jODVFnpL83AA--.40155W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBYxirjWdQ3PnOewACs4
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=2CN64cbpXzYxl7+1WmLbkzEwVWpxP/w00hUxeb+f3ak=; b=D
 +oG8Yc4L0VXM7K3MZAZNVGYK0nPiu4LUS83d0I2g7uDu8qsB5+qJFdhaut9Zm4dC
 J76b4LDs8F84er0eAJTH+0LdsugbobtCdCR7c+dgSzsNkrNcvL97Eaij0y6u/aua
 EDIXfhLTM8xLRhFCZPHQhCgrALGKn97V1SZF6VVrK0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=D+oG8Yc4
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At 2024-12-05 05:51:38, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>
>On 07/11/2024 14:43, TIAN Yuanhao wrote:
>> Two configure option names have been changed since version 3.7.5 [1]:
>> 
>>> Old: --without-libbrotli --without-libzstd (also --with-*)
>>> New: --without-brotli --without-zstd (also --with-*)
>> 
>> Fixes:
>> 
>>    configure: WARNING: unrecognized options: [...] --without-libbrotli, --without-libzstd
>> 
>> [1]: https://gitlab.com/gnutls/gnutls/-/commit/6b794e49d1a14e43f9e08023f958364712c3c89a
>> 
>> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
>> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Since this is a fix, I applied to master, thanks.
>
>  Patch 1/2 is for next, not master. I didn't apply that one yet.

This patch must be applied after gnutls 3.8.8, otherwise another patch is required,
see http://patchwork.ozlabs.org/project/buildroot/patch/20241009113410.5077-1-tianyuanhao3@163.com/

So I suggest applying it in the next branch.

Regards,
Yuanhao

>
>  Regards,
>  Arnout
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
