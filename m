Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57178C352A1
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B491D81EEF;
	Wed, 30 Nov 2022 11:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B491D81EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVWWlewq4bGb; Wed, 30 Nov 2022 11:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1C281EED;
	Wed, 30 Nov 2022 11:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1C281EED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28C201BF31D
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 11:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1135360E07
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 11:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1135360E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szTaK8V3qDcp for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 11:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA5760DF9
Received: from m1312.mail.163.com (m1312.mail.163.com [220.181.13.12])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AA5760DF9
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 11:11:32 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [223.102.84.39] ) by
 ajax-webmail-wmsvr12 (Coremail) ; Wed, 30 Nov 2022 19:11:25 +0800 (CST)
X-Originating-IP: [223.102.84.39]
Date: Wed, 30 Nov 2022 19:11:25 +0800 (CST)
From: tianyuanhao3  <tianyuanhao3@163.com>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <20221130074444.829636-1-christian@paral.in>
References: <20221130074444.829636-1-christian@paral.in>
X-NTES-SC: AL_QuydC/SbuU4j4ymcbOkXmk0Uj+o7WsK5s/gi2YZROZ00vynv3xk7VFldDXnQ39mELDGelj6rbxlX4NlVUZh4WpDYL8APHa9RJvF41gnOLlwK
MIME-Version: 1.0
Message-ID: <7e756d30.b3a7.184c83bff01.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DMGowAAnLhZeOodjEmXsAA--.14851W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbCqQnJjV0Dht+GewAAse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Sc7sou6YO75Szo6F5UpR2wn3uMawMXZ7c0Rf+enBYAk=; b=Z
 wFta2n7C42CApWYZUxmPTa7SEe0QWCY0Ha32PwWQnOVCYVZBIAIRxlFr/RqtSFwI
 7QEKczjKGZSD8/mlSXE8Uj3I4dz4uWPFXSVAJU7nzukN18W7HlNrvIor63cbTnIk
 8aCKXpxNV0w+Q2XPK6ILxYM6IHHuHzClj8BZnAt9Oc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=ZwFta2n7
Subject: Re: [Buildroot] [PATCH 1/2] package/balena-engine: bump to version
 20.10.21
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
Content-Type: multipart/mixed; boundary="===============2622891531815706040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2622891531815706040==
Content-Type: multipart/alternative; 
	boundary="----=_Part_169628_595272025.1669806685953"

------=_Part_169628_595272025.1669806685953
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
------=_Part_169628_595272025.1669806685953
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div style="line-height:1.7;color:#000000;font-size:14px;font-family:Arial"><p style="margin: 0;">Tested-by: TIAN Yuanhao &lt;tianyuanhao3@163.com&gt;</p></div>
------=_Part_169628_595272025.1669806685953--


--===============2622891531815706040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2622891531815706040==--

