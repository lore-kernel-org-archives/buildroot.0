Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA179606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FqM4ZSeJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 954D18167E;
	Fri, 23 Oct 2026 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CTeXL-0E6dI; Fri, 23 Oct 2026 20:26:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A59D981162
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787166;
	b=Qfq3zkCQAwdSKgeV1yaduiGEYCefJNWAAOjOke8IeEGDLqYJbCUFloeKGPsfxQYYc4lz
	 7Lq8RPCeqzVJvV4i1M+XJ3xL1J1XpAlK+3pem5FKrop4Fn9DawSFinm8GMh6xFLjYcMvn
	 OgT5VcS9eCjFFl1gBg4svSow1AoLx8c9YfCjakrrB7FG6aFLFElwIUboQl1gfZs4pS8uk
	 Ud0qfi5AlZFsnT20gv4QKsehhz1A7ghGsRJUybOZIypTa50hfWFzzlFNx03UJ+bx2Tf/2
	 x4G58RhBOsUp+uGHZZKl1nSgM6EqSW+4zH/fVTWI3iTVn33DShpQfIQCMvRjKZE7r0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=bFVIqTsbCl8lh1a/QAKIoDQJiKkS5RVlesL5HVXueU4nKURyC2u/c/BsZ+G1Nt+CtGyy
	 mKb4GrpSpJKGzT2SJgr5exiEm3wspttmueABAbUi3VPnwvQu0PGOiiNpDCU631LxzK22e
	 dJtug3KUOmmqMwjGA1g/cKstS0zSepJRjVHe5I7El7Bkr5gywcaWdk/Gb5pRb158gGxVe
	 H/cdEadwAVqjCTsvB8/W7pXv9pXZRg2AdrGyQt3zZTRG5fq0837c/IXVzdcnqc4BWZcSa
	 JWk5fjHhQAmqEXQoyT24MyPZv1FSDPebavbZz/OMeoH0hlniHxUOgX5GavFipVDkS5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787166;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FqM4ZSeJuBHk2WkdAmWeGjwVm8uEyBmpUro/PPjld+WYvXDcAigP+23lMnh79Mj0N
	 EoKbTU0fhuTYAWpIgBMD9JaLHRCFpZdZCouj2/Dsh+S/nSMOsrF51A9vuSXpCcNGE4
	 JnQoD3MNZf9Z05SXHnq+kJDXlSBQIJuW9cvuCaYAWAVtGoV6q8S7tfWo8NBmLQmwOE
	 JGRA/DPIUfgN4N4SJwEBiuhOq1w7tuW5jdlSRDHG/tehYU8BuAo4DhoVoOyVLOwk1w
	 TK6/HCbcNQXxDuziKSoiZ89Oez6edyAXMk5YwTMJjSZsI4dxv849ED2C7J3JSrapnz
	 GNCa7663iU+Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59D981162;
	Fri, 23 Oct 2026 20:26:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CFAB356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62E5940474
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys6blQZ0GpoK for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3E8E2400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787163;
 b=L5KqUvXGbuIW1aVEWyAk7/0IqaAUepyhC6PFgR77UQmHrzsgTtIWoWLzzweyxYfN5rV3
 qqtN8GkDGCVya72z1JPcRhu5Wg7xWt6rCU3xqCJyUj8C1/hU+MVeXmkThSRirsKAjJz4s
 GTJeAg/zDJ/uontCGMgBFLdOOZK4lKgU2RS0812KWN8lLrRcr6WqpuDh4wSm1QH2EbOKs
 KyVVYkdbmA01vJGeH3d9bKm520Atd4TrqoW2kQZHkRiuNc/PAR7XVxd087isLPopSjjYe
 XTCHSMpi6s2We0kW44P9Y2FylJ2o7qUpuObpubfQx+74lYKPNs9eGpHr3iaCOxYPBXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787163;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=cv7F8NhSCtaFQjI8a9VLQETEwMUdWA8oRMLIbYMwhPldUvdLPQLwMyET1i2Dlbk8gVPN
 OSoP49NEDxEVrLBBJfIHZlxYu5ISaKrpIvuX6Z6yYH7s0NmYQ4ADOy5HunDOhvwy4l0Df
 FaVGMc58U/VlZWzMIk56GpyDOLzqtrSdwyNpnRLXl1/HKZ4MwfVINqp0x3w65L4Momula
 N3Mw0JVn2FG3YRbxOl5l2Pxh6cbnqtksLHWw63Qkb3A0LUJao2TQ1Lj9KxlQq/eTObZF9
 fpXwbW4yxRCBTP4cvcRnxZKSytfd4p7oDHRxK8+ngsVVcYr8QQ0RqF6z60EG4V3ZkoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cN7KAWtP; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E8E2400B5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 855F3B0054C;
 Fri, 23 Oct 2026 22:25:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 22:25:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 22:25:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-2-james.hilliard1@gmail.com>
References: <20261023181818.920329-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6717bdba55b648dc7a779e736dbf77d2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-asgiref: bump to version
 3.13.0
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
