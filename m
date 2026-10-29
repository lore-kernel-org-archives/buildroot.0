Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD4606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Du/YC3qD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD1681083;
	Thu, 29 Oct 2026 21:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 904Ug0SKVnnP; Thu, 29 Oct 2026 21:42:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9835A81065
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310166;
	b=Lv5nCEtIfPJNoIOA2KVROTl+On2EdbRa2lIAaP4dOd8QRcuczpQKe+We0dOvaqBtHowL
	 id+PMmgD6wGpZcI1+fWTAXb6q/pbZGtDoiIChuHpiMTEcnoF6JLDWQYH3HqgethqfjfbU
	 eDj9hm4Eb7BYV3cdQeWujzb4I2wHOi+Js7+zuCYiuU3sxPJQIP1eo1pp/DoELaFVGbQDt
	 6J3lsNvHV52CRN0fLxuzetL9K2CbIUYSONZm53jzRB4StOQSQO22ZMaLB6QrAnhfRiWBV
	 JMbpoPTmGWFvc/yqg+sqHYa6lnzQ1pJsY/2B8GgbLNuCRPrePRqsnwnWC3Ha4l4LRrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PU8IWjdA7yMz/PDRKYzROQ+5G82I1YAwz8yynBAs2C0=;
	b=p9cgLW25/rWKm/gVntUTGDrajYJ42Y2I7I8nq+xmR3BGRYbd10Wvety5rCzujy9INXxx
	 xP4t848NsIKrRB5bPJqf+1pVazyJ+98Api7DKXXl/POQrpf9tzgsDdVnirYUYXn5AmDfF
	 Y2lH5BP2onbrb9qDw3xgzzuekHEEdAJeW0oobzYjW6ylgOIdqjME7OtBlZpi4Coyiy+0d
	 Sn5odwhuwfRo9WBEwX+AJ14m32hXP6M+jnbDv++rdg4ObZP1FJMrWzS2LdRLbhKe3Wq4Q
	 zo4/jE58ps/1Cns6eDFoadzt+NulKLBqZU5KEw2djPvqWqhk365sJCBdYAf6g3oJwqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310166;
	bh=PU8IWjdA7yMz/PDRKYzROQ+5G82I1YAwz8yynBAs2C0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Du/YC3qDhJ8KUrdKsvgzguiaAxN7smiLQ9LvFsHaQLHrfhG1v1BRasoqdrGjo/mtT
	 2NMQtsDnRONQ7qtzEeyz0T9HHNw5mnCX4I93geUvR7K7ymIfq+Ed0uSle5zMSGOQKc
	 J4ND4hUltruSRA0B0nily6u6O157DMhXC388YvyL2EHGll+oyqVJYM+wPhWXBtS6HX
	 j4BKOVZSJqJlA7y3lqxhA9CdBAILpob6nFqQEmKvIehl8qTdkttkr6YLV/e8JsfE1e
	 J7m8uuhM8/9A/j0YpOuTFVhSIyC0pSAfpcdXDneXEryCReMMcOm77V6l8aHXV5IGKc
	 8o7dqoEB2HAEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9835A81065;
	Thu, 29 Oct 2026 21:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1C11DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E961F40A72
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-n9n8pIdSxz for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73F0840A6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310165;
 b=ix2x/FaUOUKep5ewWWVy5js5zcHEEvq2Pv/CTXLLCj2n2c4vfdeEdOM63sXw+86qvMgC
 unTYuqUfKoD2659HZgFVKqjdB/qoqhTBT4mDn0HEwaiHF9yg6E4B7hSylFIo0odenNqC5
 7qyMQjOslnX+9lw0n6S66rhAF4AP1hlMQhOzuiNFC6tI3lbG0cCieDrcHLaNrD7HGOC2N
 ot1f32mAmHvORtrFAMx4aJWcdUP/JDvCTWDjVzin7Z5+IDn6U3JDZV2aJYS5at4b9Zsfj
 yIqSUB7PfHl5GxBe3w0MFd0LAeNzWUvaBF2ky8b2ReCIra+72edeEY3ZdzCfj+Oywag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310165;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=tI7um9lqHpMKCAgKOMV8PVmKwqFQQMqptrz8pVWVdM4=;
 b=qruy/yaF5uYXkwA/2F2q3sxHD6zutT/VKDgv0+NAiDZEewULVoAFDXa++kktRcH+9ttb
 7ll7Oe0u0eQq/PnM1xkuZ2J6FXT3MNs/Wd9XirkArh696FFNSWr7Ls5xQmAaw8kyZ701T
 Qy58Bk0O6WoATJY1hZJU+40q6IA6oZdYIetoFjLTtYt+aOW+AB8MVusdRWgccNS8++ZEQ
 2Sc0DjKM02oDRje0mIP+z/GfbtlLQttyfy5XFYkDKT5mCQeBBrNK2kf5SjAupcVyQMrX0
 ciBKU1LariluSRwNdbtTXBwxJjKH5iTsBaT+ExMBzCD9ShxpLo9OSOMUwmh+lheeIPw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nmhk50sU; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73F0840A6F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:42:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 197E9780375;
 Thu, 29 Oct 2026 22:42:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 22:42:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 22:42:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261029211140.1455177-1-bernd@kuhls.net>
References: <20261029211140.1455177-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <c046f757d334bd69787ae2acdd9153e0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 22:11, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
