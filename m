Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB832ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCFF34102D;
	Fri,  9 Sep 2022 12:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCFF34102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hu2YdHjcpU5t; Fri,  9 Sep 2022 12:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1714E41025;
	Fri,  9 Sep 2022 12:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1714E41025
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8591D1C2744
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E9C941987
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 12:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9C941987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KJwbxkcz0EB for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 12:40:13 +0000 (UTC)
X-Greylist: delayed 00:05:49 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2615541945
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2615541945
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 12:40:12 +0000 (UTC)
Received: from [195.4.92.123] (helo=sub4.freenet.de)
 by mout1.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1oWdD4-0029Ox-Da; Fri, 09 Sep 2022 14:34:15 +0200
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:64446
 helo=[192.168.0.11])
 by sub4.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1oWdD4-007ibf-NZ; Fri, 09 Sep 2022 14:34:14 +0200
Message-ID: <661e0716-bbca-eec2-8a4a-0d155edea5c6@freenet.de>
Date: Fri, 9 Sep 2022 14:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: de-DE, en-GB
To: buildroot@buildroot.org, busybox@busybox.net
From: Alex <earthquake.de@freenet.de>
X-FN-MUUID: 1662726854E06293F575A3O
X-Originated-At: 188.192.224.49!64446
X-Scan-TS: Fri, 09 Sep 2022 14:34:14 +0200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bue3HeTfA+GVocewmTrOrMx3zCvIpcrZ9MA9MolBlI0=; b=v4QKHBlAIuG0PD2tt7eUAS3jNR
 oirzO2rmrpVAt9dXjWTxN55FBV9ktj/M+WaWEKDI7uBYgD/njF+SMXcTYwMj7aeC/5WvujpEB1m7v
 0ZF8IoUHlkBIWSAt8aCGhiWEGGtzsjJz29e+WY+TPvZzAYWw5YpQXHbU4AER6lEaZXi60b4NfiQ+f
 xoFLmV2PL21zA87ZW1rjh1HTEF2JhJo2K69cxtQQbWuoHH+n1AE8thVG2t8IloodXAKtGART+v9ti
 cmdDv/XTzTBh4YVxNK7O8kKNNo3W+mHw5FH+NXpkhaESffgQBWzPifWTf4N9/CKFkHUT0EXNeluCD
 TDYRHmQA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de
 header.a=rsa-sha256 header.s=mjaymdexmjqk header.b=v4QKHBlA
Subject: [Buildroot] libstdc++ DSO missing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I intergrated my application to buildroot. Complie is successfull by 
when linking I get errors:

x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libstdc++.so.6: error 
adding symbols: DSO missing from command line

Are libraries missing from buildroot environment?


Additional I get warnings that some .so files not found, but they are 
available in output/build/<Tool>/lib

But I included this path by $(@D)/../<Tool>/lib


What is missing in build command?
Any ideas what is missing or what to do to handle the DSO missing error???

Thanks!


King regards,

Alex

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
