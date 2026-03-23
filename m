Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30FBF483ED
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38A126083F;
	Mon, 23 Mar 2026 20:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYHE6hzbIbuw; Mon, 23 Mar 2026 20:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0060F60828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774296098;
	bh=MHMQR9puv1CnbbmwYncTHhh8rtOmbViNYuP7uN6hOtQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s2XmE/NFVQeqvUAfCHIL4so3M8Ga0AzF2/V34qiUpk1QIoRwf0ZjHXbfIxBmggK2k
	 6l7h+BklNTX9vTIZQszHKL0ZFQlohYT/cefYImLbucThRzVA22l21a8JAKqzM/SY6v
	 QakqkpfbiHsO6nlWrDQPs7glCkqF9Ylt9RXAYjKBlMb32QgAX+3J2Vf0+/NI9IkPyc
	 deGH3A2IRUY+AQ0sRFnODGDdqg2Lp96usoaYFXIABLDj8q1asHH6HccT/ND3tYaRc2
	 IEdtq0baKHRshAQf17R/XnrwT/uwQiV/O/j5/oXgoLHHi6yOThGFy+Cr/8qhIUIW+G
	 FUB/P/T847y1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0060F60828;
	Mon, 23 Mar 2026 20:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C5EF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA5BA60828
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_vOUp9ZLukA for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F80E6067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F80E6067C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F80E6067C
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:01:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F09C560129;
 Mon, 23 Mar 2026 21:01:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:01:32 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:01:32 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <acDgfd2FRjjG4J3M@waldemar-brodkorb.de>
References: <acDgfd2FRjjG4J3M@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <fb698b51c84bb52f3d64d6afbd3ecb6e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774296094;
 bh=y9HnLcPAIWApfoO/zVkn026FDe3noXKd5kw1FQ0hKws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nMA7Wg9R51t84dAVLTxp0EfcbUhxry5vIft1ETzKyAUHuy/AIVnXjo6F04B4+H6wS
 UNW+E7rtbLOpOA3F9B5bxKcexknADSHse0BLTNAG26c7TYwuon0nCSwoZdw0+y4ufd
 9kbSjaj7hnITo+87TIKlZqoAhpeNdR2J4ZY4MlOfkIKfbFpYz8oOb8P6O/NgcfoUHN
 QzACasGKOL0EdAb5taAl3yDjc9hNX+zMYMqrfqv45v+UfpSuUAgEQ++Nze1UR3opbX
 MEzXwDAb/DnqBElnHZ6egAHHzjmeOFq5VDnpqPmqr9jmBYPNCFf8lRuEVIbWYr8ngN
 +E6BTjdk0ZqRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nMA7Wg9R
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Waldemar Brodkorb from
 zabbix
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/03/2026 07:41, Waldemar Brodkorb wrote:
> I am no longer interested in zabbix.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
