Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E67C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FEE80CBA;
	Sun,  9 Aug 2026 15:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3zphw17gYed; Sun,  9 Aug 2026 15:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF74E80CC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786288067;
	bh=QaACazopL7OA4Lo1aG01V1PacLjAd3aPxQ+K44iYef8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p2QNvlXCWU46zK7Z7uFzJl6grncELmwr36YF95SYNEE9jaZg1wCejTQ0+y1gaKcjW
	 rJOUKb1HE33fp7BTWwGkH3vE2b7OkPJ3G71+jQBHzC97pqeVcJ9N5RFim9EfgT6Dtw
	 ySVMXF+lT/BgFRAIBPqtxGPEKRnGE/vbF57TrppNU4WjzDIz6w2TQfg8WqvDe4wHAa
	 rZghpHqHjtMEzTKkyU+Bt+FWJ4zCYWN8TSdiMHE4AhSGZtgvgdOX8uqsI0I+Hxo6W8
	 b8SUVepwUh1/vlgbKm/0OrjwFT4vbK2D/GNSNV/en+pvSeJl+PNHyRXfpGxBuQfu9z
	 lhjZ0v3vGLeYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF74E80CC5;
	Sun,  9 Aug 2026 15:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AFA1296
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40E6440539
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahIH3ZDblRxs for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51FC740536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51FC740536
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51FC740536
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:07:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 13E8513F88F;
 Sun,  9 Aug 2026 17:07:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 17:07:41 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 17:07:41 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <anh65LhHJZT8yMcO@waldemar-brodkorb.de>
References: <anh65LhHJZT8yMcO@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <115ebd6e5628c418d4561a364138f767@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786288063;
 bh=VWEaqnhjNAK9vZcn08aPQPSrEO8SH5xTKFKeK9BHREU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GOWvE28t53bvQRLRqp7QDVN+XZ5kJztlGEIz3gJ+0/oN+gJDCwgabR71KnFvLp5p+
 l94H1U+ON25eezPRpiOK4/wEhhhRm4qsvqSr8iOqLJOQeTWDCAvRIV+tdp5SMl6fzb
 k3iPyyiBlyC3fAoI4LcVEt4NMXqS5JJs5QfdY/U3RqQnhpqfPheua5+UM/Sx1G3WYh
 ZBJlFEHQ+6IbAeRodPI9E+K9vncvFo4x5aqRuKq/jQJ7/MEF2gLHbpHqXqB1NVRCK7
 mIsxKpJENKI6Yi1Ht35tBU3Ztgaj4gtTxn4Uyg7A2UDk9D2Q949gLuxnqXQD99lhoX
 O1vK9uaZG2F/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GOWvE28t
Subject: Re: [Buildroot] [PATCH] package/stunnel: security bump to 5.80
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

On 09/08/2026 15:04, Waldemar Brodkorb wrote:
> Fixes following CVE's:
> 
> CVE-2026-70368: Fixed an out-of-bounds memory
> access triggered by logging attacker-controlled protocol messages 
> longer
> than 1,024 bytes (thanks to AISLE Research and Clemens Lang).
> 
> CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
> destination filter using alternate local-address encodings and
> interface-scoped IPv6 destinations (thanks to AISLE Research and 
> Clemens
> Lang).
> 
> Complete Changelog is here:
> https://www.stunnel.org/NEWS.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
