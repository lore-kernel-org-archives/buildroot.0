Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32E60828AA
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CaPa3LeV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E35408FB;
	Thu,  5 Nov 2026 19:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaUkymEY2Wzh; Thu,  5 Nov 2026 19:31:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8323D408D4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793907074;
	b=XJ71+Fg64XPDFSUb/o0IJkLbnaegxzt9QyaVZSHBRL7+u3QGOY2tmvUNGhDSvDQFHCgD
	 Ljs+a3VeCiTSRHTEv7BoQ2CPdcvLJkF9Q/NsGO319K2ApSX6l+IZ9jiLgqT/mlzGqHi9v
	 HiMsncVMJO4xQ8t+WpP9fROX3sY7+lPMXgGUyS73ee5oaBUXRJ7q/dmfwlcFMFgk97XfT
	 FWVKyi9e0RLalVJI2laZPG4Of+TfFhGSivfnWcmwK7Th1ujHZunvRRn7nZVjtV6lrrjbW
	 +sjWxradLQUpNhcCyqpNLI9aoEpaooAjdCgXk4+I0/i1yIZhX7CxYgGKtGK12izZC3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3agMlFZ9vEQtx9zff5dJ5BS9y3ugLkAHAdpp7KKagCU=;
	b=ebR4TWE7OvtzAWNEPzc+fqaVR8A8LEJ7n9G0ymvFG+7wTxBiOXw4J96UBVSY8MJTrfs3
	 UjAVXQnzJUgnRTd+l0JmaxSw+k/m5j+6eLTM0HTNABL2dESeDlpJqXq/e4cKpTY7a9g/R
	 bTuSprvdK2ltANS8OjAYiqvt84IMVx7C5U66Ti9XFpaEh/wOBxMaudHOa0gZhdDWCX9/8
	 AsxGF4LkQZppYjrH5difl0QoZ67RO0VwFsJYcYbCYZcxHT7sK+/bosDCmLr4S+h8yBHkQ
	 C5hx5wJ4Yk03NBT3rTAPAgB2WJAJ5dbz3LMAqnvfQJlI9gMNC/UHxCC7yNlKKsRpdsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793907074;
	bh=3agMlFZ9vEQtx9zff5dJ5BS9y3ugLkAHAdpp7KKagCU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CaPa3LeVqCu0/qsmN7rIQ2mb+/5cqKXsRio2vneOaPAZ72fKJSj1YjNht5+KqVmIh
	 QuThQj0MgyL5jmKGowbpDUWW22M5DtOBReorB3eMkZGqc012U4B0fkvetd0mheiO6l
	 v4HRmjG0sQthP6pvmAn2UlNIyGGYxvumnmmlk77B+JYzQXZwdQN78VkrB7ATrr5CxM
	 NeCQeQYIAnNYBI2Mb/gg/ZYoRLeO5idqf/QCyC12XbrKzMyjXb9OHq/5JVtboOrGf8
	 oKx8zVHP5dG64pK2ZUSXDT46u4/ysIlByO9KHn+2aGcrzw87jNVKezTI5fnb0wdBJ4
	 Uvialm11su11g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8323D408D4;
	Thu,  5 Nov 2026 19:31:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AC3B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4285A400FF
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_AyP8XJSAad for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:31:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1546C40363
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1546C40363
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:31:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CF41413F846;
 Thu,  5 Nov 2026 20:31:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 20:31:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 20:31:06 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20261105122042.1167294-1-yegorslists@googlemail.com>
References: <20261105122042.1167294-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2da1a4f8257a209cb564581d063d3359@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/iproute2: bump to version 7.3.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 13:20, Yegor Yefremov via buildroot wrote:
> For the changes, see:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/?qt=range&q=v7.1.0..v7.3.0
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
