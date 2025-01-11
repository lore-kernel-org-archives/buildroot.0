Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C78E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4527360727;
	Sat, 11 Jan 2025 17:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCOsrucu08KN; Sat, 11 Jan 2025 17:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2C8606F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2C8606F4;
	Sat, 11 Jan 2025 17:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EAD9940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D31260727
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoYDHeNv6Bo7 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E9F8606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9F8606F4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E9F8606F4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A407E2003CA;
 Sat, 11 Jan 2025 18:56:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:56:43 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:56:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250111153621.2848039-1-james.hilliard1@gmail.com>
References: <20250111153621.2848039-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d40579a80fe27be46314c3f55364ce48@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618205;
 bh=fcMjG/Wg0ll46WZyIEzjezajWV8QU16cgVcK+BiYbOY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VbmTwNRLEfeP4Fy7PxVkT0GESwFIqpbB6fqgl7Qj7JC/czOsbr5mcG1z8oeNX76tZ
 1c3sxRSjZlwzCmMfh9t8zb6Td5YMLpINsMI2YK7WNmvU5Dn89eIBeFwd0QQ/xBKvAK
 v8AN7RQGNiXPO/zUmoYZepmW3DKE15zAWBYxqbrr65s2ooymDS5vRqQ9V/EtVDne5A
 XDd24Eqh3srLFF4yojgVfADAQKaJFjaMJKI9TQ9AAkDnKoB8Sm+RbN5xLsLMbxc6qX
 7upfOWkuh0QzFRvj6poDOX9lB7qoIxt9VzRup4+1lbq8iCh51kFqha+rtC4YcTXjQu
 yZ1hFTlLk2mIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VbmTwNRL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20241204.1
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

On 11/01/2025 16:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
