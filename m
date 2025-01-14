Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B9FC02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E6260BB7;
	Tue, 14 Jan 2025 20:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9dsCa81611L; Tue, 14 Jan 2025 20:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A9160EAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A9160EAC;
	Tue, 14 Jan 2025 20:54:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA73B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 081BA60EAC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6YUiX3UhVdo for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3174960BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3174960BB7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3174960BB7
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:54:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EDD0320046F;
 Tue, 14 Jan 2025 21:54:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51996])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:54:02 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:54:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113183121.3010413-1-james.hilliard1@gmail.com>
References: <20250113183121.3010413-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0b2e6cc644b2b8f9012dfaae4e251dd2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888044;
 bh=zI0ORPeflFOcl4+HD23smQ4bcGcvQIWfy0k97htuyMQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I4bOQIHhOk3ryMxoNfE58j3cJRycjwSsXpOMWJFyvlLB2rWp0Cv5ydU6fHlcJl4ga
 W2y1CHxfi6po7QdsIQEtbiSJX9eJcCiTwW376moSizlbx5AAmFHHcgFxSm9LiQYCM6
 9Qyb7qHWuv49nO2MAWIvfl99RVpdX8K9lGwB+oqYPucqeCFKUeuvzyrA5Kpkrhwvv7
 xDRWqhTDWNtzT8LwPPXVqmzACO93m1zW0O3n4bVsg9ctqEhxKGa3bm7jO5L56xjy/3
 cFYpFlgflqjxKNASJeI1UIjDNIBDueQnCi8TWQqbnj6Op2/VMcUzyWvK3sNRobLV08
 N+uPuZdTctVsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I4bOQIHh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to
 version 25.0.0
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

On 13/01/2025 19:31, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
