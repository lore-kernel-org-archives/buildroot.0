Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LfWQq0if
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4BA60A9C;
	Sat, 24 Oct 2026 11:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2toJqTZjcc5; Sat, 24 Oct 2026 11:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D17E060A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842966;
	b=rYhuICkv5XxfpUgdqDKAvEHN09Tc7ddPb7OCXgyAH+2QquAMZ8OB240f7olKmPGf6lOp
	 3Bao56KpCu1SeNaYU+JbAqmXCWgoV4k2WCQPH93pBJ5L4oEKDiXpsdUgWDPRcb78zUgbg
	 E4Zkn1ddYkVKgnm5/XcIdXNXRh8Uooq1qvVlEXw+9juLRYowp9P1ocxbDw62xeZBivMft
	 Agi+BQfPEU+pYCwSGvbnqCDrkSF8PY+qMdIkZGQuCtOx5LgqZQ0+fAUI4nboIr9BCKn0Q
	 hA0GyUCyeD/n3QcfadSc/nT7wl15fXQ16ba8G/X+5LkZgpEUVo1MZlZR69R7qkHiV+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=Xn/Xs/cziiRvuKiZwZhxuDvm2S4YnxwZabpMPVu9xLXV1ZsOr4AD5hwm/vahNrdRUe2B
	 7Vm4tdV/lIHcRc3VmV10Ury+FKSJoMfgogJPWVp/AHX/W0IIuTQjBtRdaSgxMTZMoc3Ql
	 SZ83MaL2EK3cpbcwJnat/+CI0fyP6Ep3wvZ5Qgw0z3tpysuoHlGM6+OIevdys8Zk7SF6c
	 4NERu2f6rs6ysbqZu7uF5aP1lgibRrb0AGDfuuoCQpc9sdc1gxpVpb6dmUfCKqyOYZtAc
	 NcAUOtFl6ZfLSQ31T8l5GcHVJ5dvX/YoQt01IoJTWXJcsuz99wFG16QiW9lF/b8ZNKg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842965;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LfWQq0ifvx/rE9WhvHZ/v1Ez5lTL5zUXl3nu00loPNFMSVqMs8e3xuWT+yjLHwiek
	 aUaS2srhjlRpgADf37+RpVxIds3t/LrejezGiIKJ+A9QkP56jxrVdx6+EB/Qh2hwMT
	 hRWm71m1on8ViBOvX6bS4TepqdAWbhaYmde3V2IwQDjtJs9f3YVidOPPcL0NAP7Mab
	 SGn8lXr6BtFztofvSm5m7BXn8CK7avWLEZiOjoi4yN5NTz5NzGqj+EobjoKxy4XjNw
	 XMEzNz7wqvJQOVkFLplINn1vobVBgqiZ8P10MSjRuuotVbsbaxPGR6v4TgRXKgSIaY
	 jM2G5LQt/EeJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17E060A59;
	Sat, 24 Oct 2026 11:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 876FE43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79DEF400D5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLJImmBS_H_g for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:56:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A8F2240068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842963;
 b=Y7+l6giYK7vPcC7T8fY0uVyh34PrUg+Qyt13LxONHXIv8rI0Vzdo6UdhZvgHkSJPcxmt
 beceo0jIwrQW/hAZFIY5mDoGL841NiJBN2YX0VNMO240xL1qpkryUn+5oo+qd9z/WARdh
 sN7KklaMoWpn6qxb9bWu2anx+cKAZD1eeWhVeLor4aBefC9dl0SfNrzhoQB/y4GZCyXCN
 TZOcES9jSHRHkj6e+HtaAgRV3ty8A4GQP9bSIYJWm+VqM0JmR7JJj7wexxSv/JU0UgbMq
 hVLX2oPBwKkXmmJzIEEsgILj/BgyIJZcpBlZhIrJZLlpmLDPuJM8qrBAD1GsFML+40Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842963;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=E4rUGJYpEQGiLEESLoQOXc3HrrE8wW+vFh5QTDHHkDaDuo4JaLwsmfR/bY+U2YUiRsC7
 jvCzNu6ZjpevCeLekzwg+2hou7gzCUuSWxKQApfptdU0jDsKoCMFjaRR4G6ZZHvGdXpZn
 2HdD1ExEcJyMyi1OjHU5xICZDpjNrIPfB9Md83vCb1MJa1HCGt5mVLGJdHWCmSp2lscP9
 k66T67kFq1Q8JwUlzBYXDOqWTrNiZ9ZEohb1DWb43GdKRjqDeOtznxWj3ophK8ycse6jO
 Q4IYeffSS4D8rdQB6nerr3u7rH1CIiNX6VdIFuIsRTOL5ei8AgBS0QNHbwHqLyo/5dQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GFimo1nW; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8F2240068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:56:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 26F4913F88D;
 Sat, 24 Oct 2026 13:56:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:56:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:56:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-27-james.hilliard1@gmail.com>
References: <20261023181818.920329-27-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <83c2b9a0837b3f6ae7c549bb446d14c0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-typer: bump to version 0.27.3
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
