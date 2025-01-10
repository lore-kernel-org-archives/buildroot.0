Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE3E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 18:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829AF60F06;
	Fri, 10 Jan 2025 18:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjuJQ7PLDg2T; Fri, 10 Jan 2025 18:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA95860F0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA95860F0C;
	Fri, 10 Jan 2025 18:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B65EC76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3FA940E3B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEiAnFMemJhf for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 18:35:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72F9C4123F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F9C4123F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72F9C4123F
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:35:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 91F4113F8C2;
 Fri, 10 Jan 2025 19:35:33 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52238])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 19:35:33 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 19:35:33 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z3/nRFjjatiNygaG@waldemar-brodkorb.de>
References: <Z3/nRFjjatiNygaG@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <8e67e11215b477ce965a6b7059cf581f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736534134;
 bh=XWbz23fZBuLk795civI/PJWAeUjykjWkjO21SL8kPv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQkmGfjp2TPFovLse5vttWvzxbbdsfDUYxXE/8TbXbT785vWVR5h7y5f/jr7sV59I
 kPy2PS6U13Zej1kedCfTWA7/f4So8rdoLVPD2z5WQqFmQjh+/5sjSWuwiQMhu1XbdT
 E9/QOO/p/fVDP0Ch+Ca4X/RBXhYWZinMibGr1B7XuqZL7fB9iZxgijiNSh/Znqn7RT
 24RXKTY3et/rdaVTVB/uyRFw5u54fTolgFfIygnvk9ssk/DPBHxk9rxc8cZ1KuxJAJ
 lOwZRyJmwt+i9NypV1pviU9NrvzvxyKcRDEpgZxiEu6MIPqolXOG1/jxwvvg6yG2ef
 PZO7naUoTbHmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JQkmGfjp
Subject: Re: [Buildroot] [PATCH] package/bind: update to 9.18.32
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 16:12, Waldemar Brodkorb wrote:
> See here for a ChangeLog:
> https://downloads.isc.org/isc/bind9/9.18.32/doc/arm/html/notes.html#notes-for-bind-9-18-32
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
