Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE91606A335
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V/TS0dXa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE7756061B;
	Sun,  1 Nov 2026 17:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsR1lUsEWXVx; Sun,  1 Nov 2026 17:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A3C4606C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553257;
	b=iBJtkSHrp4sjzoD44d8Bq70cOnjT2UHnAuXl4Nt2KJWBqvnuaYgyx3HYWlm26xcAF9K4
	 +uuF8p8pnQdnLyOnYFe+b9hVxZZ3lvkpUunKnzUu8YkT08B5egLiWwvYyniUslaOxaa2W
	 8riLA0r66x2PQoeRHlfVwGpMPJ+JYu0SNNquLWs9ZyTv5kXBTRc/cmhioM6Kfs+I7WUo5
	 hJh4lzLUNQ9l25Ipyr2a5ehfwJQ3+R7eA0tktgrVD76bwo5i/g5hnYW+SFdNd4rSbW5ST
	 9cIQK5EacIr/sUlWObLr2BX3SDE8qoo0XDnuzWZRt+cfIO9LHqvvBbol/iNfyMVZBtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=U9eQS8qXq6rZL0YdyYo4VeZFkA3H5sWOloWDGijC/uj+j/rEwA4lewqmqRM0XZX8T+fR
	 uUrs9oYvOlk1aXLGA2FO84Tcj9y8LxR+lO0rv8M/riA08VB1yTj8u0EM9YWVgMbqLvT5+
	 lGpj94N4uYDzFVS1bgNbhqRAS4lQ4FnwMLJ7FTcUGvLzl/KfVLFH22PyINdpN00t0/igK
	 0gN/eCLPDlY+2HV554o/+t7FuNVMgzeJvsf+udszSbmt2NHplSbyOvbf3KsdXEDLQjo0w
	 0hi6M6eGJZvskBbqT//i1462j3bgkIItNWV3daJ7RdfDT1dc2ON5iW7vQEW1AntDkYA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553257;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V/TS0dXav5ZaZ/booYiBddNq6bWrvGLiL//dtrLPG7IWsfwrJe3nPKcOsHR3AFF+X
	 0DvvZfMuD9yPhMd932Hcc1TREQbvv7rOd5KGYwZ/5YKRq73BmQIG5jr5FYDA9tOsEM
	 GajtXuEA+KqDHa0SGkAiFep5V3wz037+o9rhGq4hnnUgyedFH6x7CwUW3sP89uilWJ
	 KVN80K4aBcheokni/FZO0AL/SRyIZD4rEFF5zXu108l0IlKmaxquN/fAgIOca/ZHjy
	 lr32ozR9A3f7udHTFQKIS8/YnEhIUfKOLqlkOoppm0aFHUXFR9d6VJlORnhedhOWMJ
	 gvUhiy4ItnX4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A3C4606C9;
	Sun,  1 Nov 2026 17:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78510EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DA4640305
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQnDqneBJN9J for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:14:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4C1B403BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553255;
 b=lt02+y68jrkYharPzLvlfpy5CLJYMxfrczucvUsl2T7YunXrMuz1eW/+Nq9RA9pqVAS3
 Z6DjDADrEE3YLdqmNgCvEso+bNAhiQRnkqczb2PTMYDFVpWTgeTT1qH4pOCtzl/dfXA+c
 mblRGxqoNuvBcpSOwX9iqPn3xgr73k40F/WRS6Wdk0CWyFu0HWbwRLYLk6ByolrVREKD7
 aBorYvqY+zjYLLQjy83q3aRyL+XKWvTIoYfB78x1cySx1O28rxNd2o5sQL4JMcsP/EIjR
 oQKHiA5nCkrD60yLMJ6GBXKjYlbrG+y3geA1DgzEQED6hs5NgT0Z2dqBFVYaspXFbZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553255;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=MqiOp+4d14PzopDN5ZnZdvsNJoIz2L4Ryga+JpHzRqBv1cI6rc3yYKJN8ZBa/sARrwoG
 wGIM+36WsEeAdKzS4Ns+WdUrPXZa7LVBTYditCO5M9ckp1jFH0mfWnQH8KC0WRR/B0+md
 AZ6lLzs+GzeBjXNow8CfuOW6hPap676mQNmhkNSESLFXuHUIVL1uipw/6ug4qtPYPWtsP
 11i4nxfIRPTW9E32Ox0qWmRLPWYyQkXev9BZa1q4JB1uSTduuukXBWwWsR3iC6yVfLkJe
 fXWeULo/93dcXp09DipQmqWcBnVhPwrzXiPVMVX9w0SbYP8A2/o0TcsxLF5ScBEz22g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PLCxfGck; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4C1B403BD
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1C4912003C1;
 Sun,  1 Nov 2026 18:14:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:14:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:14:11 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-25-james.hilliard1@gmail.com>
References: <20261031172019.2683287-25-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <557c0d68f4029110aa5af050a72bc76e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-wrapt: bump to version 2.5.2
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
