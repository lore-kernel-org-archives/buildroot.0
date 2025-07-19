Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B887C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E292E61438;
	Sat, 19 Jul 2025 11:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ls3pyzkTk4cA; Sat, 19 Jul 2025 11:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9756142C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9756142C;
	Sat, 19 Jul 2025 11:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE45222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03F9E4040A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLoZHafSYjAo for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12744400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12744400F2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12744400F2
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:50:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E86EE19F734;
 Sat, 19 Jul 2025 13:49:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 13:49:54 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 13:49:54 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250715120924.1223648-1-buildroot@bubu1.eu>
References: <20250715120924.1223648-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <0f8106835df1937f7d48d9934e8d4fd1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752925798;
 bh=E9yQsYYINH/6WP2X5mF/Gavul1rW6EvS21k+SNsJXHA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=STmSa82H5RmDUCHASLT2VdfOmOiqebOdSJJaoz3WUE26YdTPhBXyMYNqYoiGedVAQ
 SHl7LAG6CCFQswwInn3XvHjWWRO/pW77SNZeL6S7sEYlxOPDnh+aXhZxnCOFWMQ6BF
 xQ/KTlt5VMAlvsTQsQjtVCjO+FclloMO8ysseMQnfes8nGaNXnAyyz9FHi8mn5uk4p
 huY5NRtDhv/PMBoS9uMfS2wo4cHthxvOFAktiYAO5Je6aOkPUY/FjfAtiw3lYYSR9r
 8yoNe8kHhWO75O0LCdMiQPivx1EwMIi5swj+CwEzqyX1JFdqO4iTm2GrOeVHWjcupY
 VBoqMkcgn83hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=STmSa82H
Subject: Re: [Buildroot] [PATCH 1/2] package/python-msgpack: bump to version
 1.1.1
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

On 15/07/2025 14:09, Marcus Hoffmann via buildroot wrote:
> Changelog: 
> https://github.com/msgpack/msgpack-python/blob/main/ChangeLog.rst#111
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
