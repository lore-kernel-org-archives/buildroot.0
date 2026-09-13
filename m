Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD5BC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CFF80E8C;
	Sun, 13 Sep 2026 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uz2OEHwRxsJo; Sun, 13 Sep 2026 10:53:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C37CC80E3D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789296817;
	b=AeG4GVT4/w5hRNlYzMB5QNuThPpeEoFFl6KWZogrvaMl8zyX4h25rqYXhyyCHx0SE5RP
	 P3vf8+XWaXoQIOVS0A75xgT7js34BUCpCQI9Ed9jGzwY5IET7hUl1dscgaCsYluvwuioG
	 WUdEFBV/lOFwj8cGVpFUvXbCSGzDbczieiKR4IYvgNNzUZGu+eXC1Vtijp2KIf3Qo+O4o
	 nmiMIMq5UsDFVVE//4TmVfzMARi/Ro6pWPRtXuEKHM6zLhYHllIRxwuC+4RisE0oDnqb3
	 KWWQBAOVwlk6Dd4IDASfg9VXBGN/+JjdU/RTXsmxRrQT8d/QAyrHNdGB1w+Fb8vVi4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789296817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=T8yUxYuUcqnx6ofR59Obi+Of3165N7rsN/22kUKKC1M=;
	b=iBaIjW8noMfnKxjaf3bAyMykD+/bxPCm0HMd9JNWtH2nQoI/AJn88GpVi87Op4ogieCy
	 mjMKeewTN6XNOPmexBHDmVnUKH3bLoBRfSnMh/iL7bU09iKoZzW9g63XB9viNBOnYhF6g
	 G2dfPxtEhkwT4iNZgrWDHb8ZJUtTq7c925CApzPvKj36NKrcbMXnvDOSdw8ZrGSlYIdhH
	 20GUH6UV6avFF2f6eB+pHRsIHzl3NJqZ69KFImEqSYnoWS22Jum3JgzISCs98jKkIOS6G
	 G7TBf/z2CNRKv021PHZ1HQE/aaYGcAzx++iDmxKcW0l8KYgz3JWp9xkPcsdgg0OW4gA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789296817;
	bh=T8yUxYuUcqnx6ofR59Obi+Of3165N7rsN/22kUKKC1M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XReM6nEJGen83FPT03cy0ALuJBjNOundeBO2W7TW8bocM8Zpe1NADbWzjudEc7RTK
	 o26oEREpfsda7wj5B7lNrqx6mVxCd1hKzbDJCkLJ05rr7oDJIORjiDBMe0grWGPvEK
	 m+vm9s26wbwlxD51Zl6krQrc2czTZEa9XJEgFCBJ7lPwe2IyHhWUrFNDZvZ1FDBo36
	 gB2nalyaSz4EfIlqlHrk662FQkxj/rFSEfUhCNitL8cOMw3m/wSNnW9T4SbrYdxNa7
	 XWwdpIV1nXyUdPY0pi5J72xYgvMflRUIXBIq45vqLY/uc7rJiIWPmnw+ZAsqgAXTEW
	 k6YNeDVv9EtJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37CC80E3D;
	Sun, 13 Sep 2026 10:53:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3453023F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3110F400CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC0WTi7dyaKE for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:53:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9FCC740022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789296815;
 b=Tz3VhJ8twHDD4ezy0r0d/FZZABF+Qf0H6fbZkGC8Jip7EC3N2Tf/HujUxZzJ3AuUBk9S
 7gfcE+9eHOqsmFk8PaVuESJU9fif4bG9T+Dn69p4HPZyIbsKmL/sn9cDL7e9mhmB7ZrIN
 9VX9K43lJKrfVylesPtY6c/Vxao3tpUaVhQYN2W8A1gmbuP9d4IggHMbwQUNKaK7LW6ST
 G8Te7FmN6LDwqQyWMZaneA2ecJDDPXipGF8poHcFntWABeACYgRum58+QyEk4KafshsQ9
 vdnqofhu/qIdnFhkZrWaJildbaE4ogTzLsnyv/RlMLPI+z2LiZsw07zyaGBUEdV6uug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789296815;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=JjeYWNyyo4x1ngCR4GcwNELlmwvCOVMtgqeAnPWXoiI=;
 b=R6fXbz9pRZ9y7lJ7T8rOr3938SPFgzbjkQvwgEhjIi9ALalRuA4Db5cWNRtMYz5EtH49
 G1q1PAkQLP0d6k9FdtcjF3DHvThndOIb7I0NssN1i1UAoMEyc98T+6ddoHIskGq6vBRk+
 t1addMY9+hyzVV+XYDk7Yf1zeKZI4g3PklQAP8efgS+HyCbeZy852S7wGun2EXWeE1Tv0
 dNfNvIBB8T94A7Nll9oqrbUOvU/8zxnDq9MoK/gKF87vKsgBoMgBmXrEL5N+3s2ItA5Jr
 Mg1xORFmCEVhaW3ILT1ypllsrXftNX1Y9iQKRkbDorM3u3iSiRZs+DR8iY+1WeCMuIQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sGwJe+x+; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCC740022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:53:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D0C4D780331;
 Sun, 13 Sep 2026 12:53:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 12:53:28 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 12:53:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260912193121.1645531-1-bernd@kuhls.net>
References: <20260912193121.1645531-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <ba591e0db9133b71ed4baed4313b63de@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: bump version to 6.0.0
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

On 12/09/2026 21:31, Bernd Kuhls wrote:
> https://mmonit.com/monit/changes/
> https://bitbucket.org/tildeslash/monit/commits/tag/release-6-0-0
> 
> Rebased patch 0002.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
