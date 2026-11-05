Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC529606A32D
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jEDPnpz4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F7360888;
	Thu,  5 Nov 2026 23:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzRDoPQv7KSj; Thu,  5 Nov 2026 23:12:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC29C6089F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793920334;
	b=tQe6FpP84iOjZBMN/Ebr10dWL9GL1TzaBcKpqfjI6kx3U5mEKsTFNZPaFIloqmbYyLcz
	 XggUaZnEE6L7RHAtjFATuOs6/YrI8oaBARls5sX3DU0DqJLDNUlCYdo01OYwis0q8i7DH
	 PphEmHsq7piYMv9U40i0SZ8SZHrxEfkSjDOMzvbUxcBV/klZwNL2KvXChU4i5zEV3Hd/V
	 XsHDa8igH1KNWBI10rIWnOg/VFDu0uuZEiXNWGSHscUXjKzsFhKhJ1F3SpnAlrqLpFa9a
	 kW6XJ9XGuZqpURMjo+PjK01g9AghO6fhq4iNmL559+OL71Wy6L8WNk4ySFGpSMBOR3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793920334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EdHLeF3tgyQB+NbmyOs5Irjeoy8r3f+o+KpuBPV3w24=;
	b=b5qDxy3eCKlZyY/WxJZY2kLCdd/44NnBlcctNNmAk0A1SwbVvzPQMXrYCaC6v0E9lWH7
	 cUGnzUbxAZ8QSwZC30HrzXPMrOWg3KcMvRMS0bMgt6jtLTIhiida0oo7Uc5Z3SzbyYbIH
	 o3zeQOQVSvCrkot0Ze9+IwfkVc4Cxi4vh2LhsozgDc9g1pZEtL2yLy7MtqNYVBjDkJ3Oc
	 okYHYnx/VxIhwqiQ62k/0GZNTxOusa4ZYoCDh5Xw1BkqIvNvzwJeBizV3UAxrJJVd+BiF
	 miv2JAeHuZPEiLkMCEQEGU4iwVFZStqp9jOKIc9xhkXkHwL7N7XgBDWpxgk5XrqJ94g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793920334;
	bh=EdHLeF3tgyQB+NbmyOs5Irjeoy8r3f+o+KpuBPV3w24=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jEDPnpz4B7Dzwjx08KyVcy5uCqjBi2GWTsHNFhZwmfz6pF4FM257UnLO/QRh0LfLH
	 206MEmgU+IlN04Et2NslFtmWlAma0bkhficOoJ+0uLxb2lpovfbdj1/vvmgqb0d5Tf
	 UtlZ8A5SQCKbzEGIBO/HNgL0nZIRIWQGIhqmG9DhW4YvC7Vs11LHH2/O7AOUvET2et
	 ZhnY+3I58tYd/NjlfVm+MLrjTk+14TkV0yqule68E9ronEq4zZD9pn5HozH6dvQETQ
	 CSv+6uO3LGDS3ySDzFfKNzyii5U5SsI6nagqOcNk6pd0tU5WBXwVQjI94OEhFJ5A+k
	 w9aDUlVmigemw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC29C6089F;
	Thu,  5 Nov 2026 23:12:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 693F6209D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B1906089F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytIqzSHCVO7S for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64A3D60888
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64A3D60888
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:12:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D8F48B005A4;
 Fri,  6 Nov 2026 00:12:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 00:12:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 00:12:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261105215440.1613885-1-bernd@kuhls.net>
References: <20261105215440.1613885-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <a5c69365bd62acea695d50c8d605d814@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/docker-cli: security bump
 version to 29.9.3
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

On 05/11/2026 22:54, Bernd Kuhls wrote:
> https://docs.docker.com/engine/release-notes/29/#2993
> 
> Fixes CVE-2026-116587, CVE-2026-116591, CVE-2026-115538,
> CVE-2026-115539, GHSA-2fqp-xg6f-v7gj & GHSA-w26x-xg27-7qjc.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
