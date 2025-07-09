Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B69C83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 09:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDBD40B99;
	Wed,  9 Jul 2025 09:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtGdlxOb8rSw; Wed,  9 Jul 2025 09:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135CB40655
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135CB40655;
	Wed,  9 Jul 2025 09:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C22B69
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 09:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DBBC40329
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 09:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF-trLJSGUIE for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 09:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86625400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86625400E4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86625400E4
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 09:21:05 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 95C882C8471F;
 Wed, 09 Jul 2025 11:21:03 +0200 (CEST)
Message-ID: <ca5c4945-3b51-45d8-bf66-4f377ea35b11@bubu1.eu>
Date: Wed, 9 Jul 2025 11:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20250708131418.666495-1-buildroot@bubu1.eu>
 <5a42b7d1df702de55803090a6f5bdede@free.fr>
Content-Language: en-US
In-Reply-To: <5a42b7d1df702de55803090a6f5bdede@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752052863; bh=Q9rZSsRrig48mqjjAZ6SgERJZYAIdpvRLXP4nojgd1c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cXwpbrb98srbxJ9Xp5EqUyf81z1+LdYxYoaX9gPhXzsu+1N3a+rROZAuWjgbLMTQ9
 qmUptMEHvCuxKmZ1Po/7GXQbftrHTOfXQQu1VffaLcCgP3TSh3eLTXi6AipaOwWLfW
 R0IpbKD/FlCCxbHMye4tPCwh/aDe106OYUJAjaJnlB9lZaM/qEkj/9YCAvSnkdv9An
 qXeSQ+EjixlfnyliRccwaFPMQCIKUUyelAkpFhX2rfV1FJysrnrN1EDTU8nFCTRGYX
 l1lf1r2nNVV279rMJrkFL1MogiJ5VEhqW0jf9p9vjWXcT5rvgvtg27bMud2fK0Cb4N
 JjXtp+U4n9LRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cXwpbrb9
Subject: Re: [Buildroot] [PATCH] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien

On 08.07.25 23:03, Julien Olivain wrote:
> On 08/07/2025 15:14, Marcus Hoffmann via buildroot wrote:
[...]
> 
> Applied to master, thanks.
> 
> For info, I added a link to the upstream commit introducing
> the issue. See:
> https://gitlab.com/buildroot.org/buildroot/-/ 
> commit/35708db02403b5066d4efc455e802c666ed01dc9

Thanks for digging that up. I actually couldn't find this quickly 
yesterday and then was in a bit of a hurry and gave up. :)

> 
> Best regards,
> 
> Julien.

Best,
Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
