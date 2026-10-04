Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E7ACA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DC86070D;
	Sun,  4 Oct 2026 19:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCSOXWxvZd2L; Sun,  4 Oct 2026 19:31:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 46D2A60706
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791142283;
	b=qUGPfHTeKJVlgwb3Im6BfHI68AkpZOHxkutZK1GmdA2OReSRNAZzu36t1Q4FtaQxCUv1
	 usCYsXZMhyb25tf3YJY7ir/7E1Uvc5VSlnNNV8SKq7abWP4AGt9VrTDEDBBeeZdeF5gU/
	 SA/MN4V2+BCcEuM4TkjGYoQi9wJ4n1/cuB+USp4wWJJB9U8LFAE/hmJ9+XeJ8rn5haiyV
	 N+9Fop/mt9+F45rEGpZwJTEvg07wDMQE/Bgid6eYtVPUPhkMXRrZDYAg2gAbd0e9fndG6
	 wyMZ7vfNQP/9c/BPGMiQ4bu6zebZvGBHjJ1B/aVb6csysnVKkJwNlduGxiDaZKDLT0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791142283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mG+hLdGasYEl1rQRKR4vUNOyS5aGcvafvtHgZcjF/oE=;
	b=eos0zWaPk+2owuRw9+wCPvLtLz9XAAPUL7Jh3Rd9n5yMXSSsLcubPIRX1Hw0VWmtkebr
	 2SWLwVTnOznI8R+FPGeimNdmZrcb/VPinH7K8JJUkLiBjqpkxUU19z0XE31+wvnGez+94
	 evpRyNqqXkSdW5O5njrxfDn6GSN9K0ApJDaaMhZ660slyDya0aljQqSuscTiIVEV/bnal
	 xrgpAs/lntuHlPLxvkSKzvBFzRPVwDJ/zT2jGQoSwnFQ+V3a4f69gz7ycXRWP27P69ZmT
	 M4ZH9FAWozENY5Di+6nFVO+3OYyyuBWPhsH8RCjt3XPn3R+DW4YMKvcuh49n+VOZrmQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791142283;
	bh=mG+hLdGasYEl1rQRKR4vUNOyS5aGcvafvtHgZcjF/oE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BwYDU7448v40FsLZfeVGdnoONE8mi7cXqdMthziE9YHmpacdCin5dfIaRbwhrLqzm
	 1lQlsqaR6ocrs93K4v2SjTqecZu6wEZK8FAjCnvRXnpDuABYEmxWTbWlGUIbdizpKA
	 ohKjF26ggL3pP2mV4K7BTVRA98rxBL9G7KuJNsaogKxS1k9ZJ37782iwaH9udyM6l8
	 gQqwz7LD2d72rClv+zZcJHVaHj+hvHzkgrdjYirbDsFjKqiNGx+J3okgcT+NmlAsCz
	 4Gfn1nKaLPnS7b0PqKAJgm6Uo18VfsZs6hPfS/mOp7dWspvWz42ZfN5LQLyMFWmEJG
	 rEiimBDi+ETww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D2A60706;
	Sun,  4 Oct 2026 19:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 759F922B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6762680D92
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uV5wIScb6Nl4 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D26C80D15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791142281;
 b=VfEwzUcTw1TqIJBXNvN4Qubaz0QDwpOss5rnO3w978TDNSYr4G+M9zT1druGmhwixYbx
 xvE80EylpdjRk/oHKew9ylISynYG210poHYd32fRZ7FHIeXT8lre9V8QxoSklVBxyYVvU
 +LKISKC058GudKLr873Zg4upBDKpr2/6aPp0+pnnNUMVVE37YR8jbaCInzbUspYvJxK6I
 au6eaXG9LjxP++RX1suHWi/XkglKfSs9l7Oz0cCp4dhEQh+MuuUE44V2EWK+t1TLyGSWd
 IpWhenRDPtmzqa9n72iJ7JOq4lpUMOH12bZGxqzbS9BXzFTwzAB7XIY7XNPlGAnuv+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791142281;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=oTzE8YeyiGGcBxY1Dv6vm6N5AaTRHK77dAB5UdwWFmU=;
 b=AF7qUwXRFJz2dvo+XCr4fRlAHh7fzAcSegDbcPODdv2rFggu31EvVuvOPa/Ioo2mXU07
 fUTmxh2Pl8jQ8iUAUXosF9R6mXLSfQ84BmK+Wb70q8iUTjThyWNxitXUUJsa02/Qu3YHL
 RzRlfKw7IBDFuDqG6RBrU7MVeFXrZdi6D0GM4Umn70nrLiBKz8k95xZGvSEMbMCUCKIED
 NtxGXEbLlz+ehKuhK0QZUWyuruz9DCZdj83SKFCZAXvTtiLLwFeRSnWYpyJ76TPBxbcx+
 wXzbEWpVo6NWA7YKrXKQjUwOpL/5lQ+oeO7y3CXrlffxrdAHT/7Y9Ll7Q5stag1LUKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qJRXiH2u; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D26C80D15
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:31:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0C3FA5FF88;
 Sun,  4 Oct 2026 21:31:15 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:54110])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Oct 2026 21:31:15 +0200
MIME-Version: 1.0
Date: Sun, 04 Oct 2026 21:31:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20261004075948.2995582-1-bernd@kuhls.net>
References: <20261004075948.2995582-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <ac98a46f0009ecacc5ffc8a710daf5e1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.14.1
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

On 04/10/2026 09:59, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_14.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
