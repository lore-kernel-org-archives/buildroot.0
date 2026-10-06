Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A602CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55168607E5;
	Tue,  6 Oct 2026 16:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0Z93wJSKLLC; Tue,  6 Oct 2026 16:31:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99E3F607EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304285;
	b=ieAS6lFa9O6NocuLexQ1CdaFjD/aSdk15DJxWSwL0bKYTN8is2Sdc7yz5JQJmFHa+EyB
	 3lpjWY/5gAmtRat5GtFM4E2pik6crD1iJ6NcYHCN39Xrz6MIt/xYpNB2y6N+hg/Fb0sfl
	 5KQE54VUrusdWwOWXOrJQEqT4AqgipOfPbXGzrofYAQLESN2aJGmD/Ojs1N2RejX6U1AM
	 n025sA6xZYsNYT3lml73uL3Ccs3iEsD8+wP2IDR7quwsvPhqIbdei00OuyPxMGDjkgrGU
	 A/IObSwJoRSUPNVBeyyKh1OkRR4kU4Os8Hx2KCrviiSSu1MtmqYm5sdLki2lr1c2IYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=E18jzHDcb3Xcty7gfcuyqBv6QYo80XqmJ750ZX+OTm8=;
	b=MpUXZOsQ2/rIuSCIEXhuY9JXSEfPSzfeGiu0AKGdJs495aFClUqmH+KLL4c/0acvNL25
	 la8szgHiAa+F5aljBl7n8stdbQgi/30mQzRZukG6q2ZvN++BLjC7JfqUVwaMlPVJ37nT6
	 wB1Nq19sXCEpU1G8ufulz++/QL+84hKCpZyIG6qZbUh1ZbRl4ssYgcFb6dNnRB33Gqe6T
	 0wD2OHn0geumdaGU59xhg5tD+17eRmXthgz64+Wk0+xpAtyr/3ZzNPtGLOM2a7aAs8xoO
	 tDfg7Ox4LwXV4IB9kXIewnfQ9K4KVf3w5vw5BrQjEftjLBTSnUgrtt5uMU2KkUf12aA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304285;
	bh=E18jzHDcb3Xcty7gfcuyqBv6QYo80XqmJ750ZX+OTm8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jL2ZIaqvaBkMqI9hhLhIKpp0uPue3YQEOMuxO08vTvwNtbt0hPhZPlUGTFrrD3RJI
	 1zl3luFeIDePLM91KBRgXQh9zPJ8VOfTq2tvrRwVro2cQy1UcLM2FZNpGJF70F/EF9
	 lFe4NPo4EZY/z+Hq2ITIXqyqXm5LqLFgUH9Sm11RFK1GLd0F3xgCkNrfUtL95Fq/Dw
	 I/pLONPzRXWYNuyJKpSJA/vAf0C1v5WSwrt95HYsNMup15nAWICOHHyOKf7tubmNXy
	 HyVpl8DMdVDlfjuMxFmnplca2Sir5MKiMZVAVIJk4IerpVRyTt1bdb60Prl5VnrBpr
	 6L5dBpmZ6NuNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99E3F607EF;
	Tue,  6 Oct 2026 16:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5379341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6E3540274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6hXAAHW-TpP for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7F0BF4009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304130;
 b=NKv1c0oihhaxy/Ws+bEH8A6FBg2l1cXPhh8RQfFkbvDHwyez7ZdeBZaCF7OIEQc5F9cG
 nnRydQiN17VD8Plj/1em/zarSMfan7jRVasBrOU96g/8dv07VVKzQxIDYuuR0gX5S0/ty
 9nMMtazMo74v4TZzf+JkbJk6mJensQYwa5d6RFOOX6S2uLzsEVMcKOzwKt2x2QVLQBvNk
 /Wqv1jhjdnahKv/qzaHiUiaVMEVJFoHhj81VpgxuwAfvwoWDf1VLijH4KQyJN4qncjNGA
 Tz/nCMQ1A8v91f98tk1m6F5/T6vr8IetFlPs1GsKRsJ8H2sm9eeM7owYfv9q0Qv5PeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304130;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QnWWNbXruaVkT/s9zJKVoBXXIW0hSE5szJedoblOalE=;
 b=aqgIWI1MzzIeQrWRrbdzbsRxNEinXuK62FI35MyzhgYvNf/HpzwSuEDL7CPZV7BMZL3g
 RRyD1z99ztFldGl/isXgW4fz8xnSQxC3hL1Mlyab6GH6RG5qhMClEDENi8ynvWS5XzGFb
 gcyX5/NVXTTZpOW5WoxZTa5Bw7lIhPXMknFuSm7qK6SoJkssffdOrjd/FH9NnxncpSsKH
 Nc5n75hvGJxPl8QGWy3D2PbZlSLf87PPV0fKomndSow0iZego9yQuvj8Yzyzz3OhovDO5
 BRCgNnRuIZ6Cj492/OWLXKDL751H2N6HtIHJQ1V4CPbGodCJTFGTby9i6sp4FSlUdbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lT8uZE1Y; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F0BF4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8365E780507;
 Tue,  6 Oct 2026 18:28:45 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:28:45 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:28:45 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20261004201853.915471-2-james.hilliard1@gmail.com>
References: <20261004201853.915471-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b37c64a3b951b29b8c7f75b9f71791c1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.3.0
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

On 04/10/2026 22:18, James Hilliard wrote:
> Update license identifier to MIT-CMU:
> https://github.com/python-pillow/Pillow/commit/22c05e232c67343b193b9fdeca9e7b683d470bc6
> 
> Update license hash due to the copyright holder name update:
> https://github.com/python-pillow/Pillow/commit/7c121637c9b0062694069f8f6d173e17dba8c46f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
