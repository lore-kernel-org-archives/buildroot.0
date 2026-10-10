Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13072CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8EE40848;
	Sat, 10 Oct 2026 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIg8kGfDCKac; Sat, 10 Oct 2026 12:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B1F740821
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634963;
	b=s+cwqkq8t0YPuNr/GzWslgjpfD9YjWdXKczRL97NQa7OXgGFk8hqXN8WuHvOEIfxNwZk
	 7AAc4wfMdFgrGzfbpNxOmc35UGj7QloWYcKbYyBeadbPZe46Zwaery38SezxVOlWC4Nj3
	 xH+UbcPLPratguGeYdNhUqfdf3oGEDGpI0yCzXjptslZVh/HAcGRneBmUcnOLKb6tXMzl
	 GYK8d2PE0cKM4mIbIAKLU408E9ElaTHcNCsl7hdLR8+Q6TehpOCXNXc/L0kWeVfIPRCuF
	 Gh2aCmv6SlNKQOt67l/p4b1o68a7nMzDOrGiTTBEU/yZIPPPYrLk2dhJf4IVlaihr1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=a9uYHcSrktkhPX4bhRa8lZqBSklrgLtfniX8NU+ZJKI=;
	b=hO8qZvH6E0CZasbwlpgKxcTpc3YQGtHhjCXQfIHZIdhnQVhCWKz7Jd8AVdMk2ZZDs6Up
	 2EU5/Qh+I6l7lySVY7TIu++LpvnbDThlMoiM+a7bxY8ifU9VhDjUJaYPvmUyWMvLsDXkU
	 ll6VH1KSFgcDkicc5LDT0u2jYQGhExs3RCF6LMZqiGTOG5F42hf2KnQaSXPdSNUaGpQ8c
	 kVVtRs492Lr0p9QsHzGxFSWBaXM12ZcZRs5b/SS6zuVInbwF/h+Bh+xZWE+tZeWeLk2ZK
	 tg/4aWpE3xD6MQlynLgJ3/ctgyM0rStmKKQ9fe0fJf2SW0pmamFiGZz8s5EU/fd4EkQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634963;
	bh=a9uYHcSrktkhPX4bhRa8lZqBSklrgLtfniX8NU+ZJKI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QW6E5NM8iGLVfVyCGscEm92g6Nj1FDkWpMpIe+y7NBQmsTWuErFV00VpTRCEXP+xh
	 k1myF0sqGrdWx4fFttWsRhUgg8Mrv2S9bBZ+rfwXXx8skKynxUXbhf4qri7BNfmMwx
	 tigh6iERNLepNjApTrHQ4x5ApudQ0TB2xnuxdDmCM2hnFeuux9RBi2OYUeiF0p3S3J
	 kSXPoVhVhRuKKNqqjjipWEwdhyt54z9aAWvFYVen/lzpQHIB04T/r97bp95gBO4CTP
	 Qyai1YhzLjW68icqNWQnuMk9u7fZpxUcHevbol53IJ4e62icW+bg83OE1N+t9LpckR
	 wY6p091qJSlSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1F740821;
	Sat, 10 Oct 2026 12:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E17F235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EF7240061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwVM6OSp7h8j for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95DEF40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634960;
 b=oIcTf+Aa/TV8NmOsmK7N0Ld/Rf5u/fF+n8M8tPvWQhz5A512pz4ecbdGODVjYzWO287I
 4xsnZ9BeQ9NVNk06jE+ERFDVQfEJRXqFCSyNYvEeTocGtHVKbZ2xQfHN0P/Hq0O/y2PUX
 MBnhCxuoy0nOZK0PfHDeiWOtPh+FzsHOvUsN2EqpNwo5RxCtCF/sXDu5ASpxTwO2VSph8
 MqpO3GNnAubbp2DDTKXPMQiGxPr4dXurAOJ27esfttJjVVHPWId/CqTDXWUeSWadcrtj3
 9w/oIDuLzJ1kS1cS4aQxXirR08OYK0rYFZN6UTLeSptpP5KpfPMluQlc5rdeRA3f6bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634960;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=eoFPDf3/iDWQC5HJWXKXdsUCViHq0T9aXAjRsN6fqHQ=;
 b=ekp+RjVYpFDXqXBMp0WqZbcXlDF8uOuAiGJLuaNWOePpo2qGhEVpCzfyPvLHGNhCN+ZR
 XlIPk/kEi4ggxroFKzGr8RDh9e7lR/YYfCq3zeyjVnre9mKvsnQAjf4l03brLfJAE//KJ
 DuGLZJeNbC3ro0oGThyMSGvkAunUb9/nwJ2QL8R/0HgqVRWxCJp3A74+dk5znP7AH4OxV
 NdQf3i1uk+sXG4CL12Y7G7cWNtLJEc7lXg4Ku3+itNbdE6roSmHXG6qUa6tK/AqYwk9Yo
 6JbmGlrl4+UWLl1pF/jAtRD/9/res1TFJ8hk/ktgmgfaPuPyNhMsRx9gXaI6nwpn5Tw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="FhtP/Fyv"; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95DEF40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:22:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E955C13F88D;
 Sat, 10 Oct 2026 14:22:36 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:22:36 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:22:36 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-6-james.hilliard1@gmail.com>
References: <20261003224447.744966-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <5f2d230ee52214ff1bda408371c16595@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 2.0.1
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the hatchling build backend.
> 
> Add the python-anyio runtime dependency.
> 
> Add the python-typing-extensions runtime dependency.
> 
> Drop the no longer required python-aiofiles dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
