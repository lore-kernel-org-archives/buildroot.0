Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC78606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q4hXJgXx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C69B60DA4;
	Fri,  6 Nov 2026 21:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02jzBO8QIM0W; Fri,  6 Nov 2026 21:21:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFBC060D8E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000066;
	b=fA4Y+EP+byyWJsYjv7Gpx7LtCGeBsZfwtHaFNb0TBDIUw2v6ErxxKnawr08S4AAVUC09
	 vsPz4BT1wnLcn4BjMHPdMQAT+ay/qTHzmUfoXuHslBzUl0U7Uhf35ydFf0F7QWsWA124/
	 oO0W7xE0+3BdadrnU0lGHTVRSKEpbL8E/TvFLoc1KbYAeq6h5CoN+f4lFgo0iAHAvE643
	 RvGASp0lHFbFxoTor9R0ZFnEB7YUJMrF9F7X2RGC0+1MY7HBni0Fy/RlGtLFgPeX3lqxp
	 lMly9hQA3Jd5cXg58aUYy8rQWT82+lhD2pZPLpfZgWRWkCcmPm+OYCGXsb+JAlZf7WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=YapY8/zTeGS+H5UWi7pfhlsickaNJ2sy4kf3+oqomVj7tS4aij1FTns26J3fpzP/wCXA
	 FTJ5io6SJGBzPiToud63SyALHzScCImQEIMT2/g0N4F4HGc+40y+fsxCHCI24I6M0ytBr
	 CYyoCc5LbXfk2G9492RQFEWuYcw1Y8e/96hFrIfSJmUeE6zBFKU4/O9QKmwLYzD+W/10C
	 QHBd8wFm7zNnOE2JRLXnlr8/1BcV26ZEOl2iQ9+e4sTSkdRKkvZYgpw2DeYKCC5qJzwqI
	 52syQ+ZXZAsQzIp7kHls+6jXFRce/FRfov259Bet7p6jj8FpzaTKR6+pjBQH27z6gIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000066;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4hXJgXxHiQKVGgpJQtmWzHWVP8t4qnGH1BNYfXRNwbhHzbUAXPUQsJYhSDfqlEzg
	 Ttxgc1hyXbSNhx170qJr3/mjU4cOdYo/8EOi9wEMUmmnttU59eETsJpz/aaJt3rXra
	 4SyNjWHH4+oYlP8bHsmdgXo+0KQX28omPRZrv7uC5BOy6wNw56yp2jTXsPUFHeNAY5
	 LaYS+1kErCCL+eabordhE7zGbZ68flGUfe8MacZVdP2DLGzQygZ4DLKP3KUO1fjV5E
	 SXyDuEVEo8v3Sxvr/RiIRg8IPLHJIbPHNMFzamAI9cV7BKxY3fcyJ2Q2f4oZFVtRtP
	 wU1cYMwlz8Hrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBC060D8E;
	Fri,  6 Nov 2026 21:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8FCC31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D64978169F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enfSzevm2jp6 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35C8781699
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C8781699
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:21:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7EAFD78034E;
 Fri,  6 Nov 2026 22:21:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:21:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:21:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-24-james.hilliard1@gmail.com>
References: <20261106191536.2120153-24-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <975b4c640ae57f53a5da301e46032a58@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pysnmp: bump to version
 7.1.31
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
