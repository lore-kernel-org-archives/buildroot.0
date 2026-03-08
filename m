Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD60EA8541
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0063360A58;
	Sun,  8 Mar 2026 20:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KligJUFrJgP2; Sun,  8 Mar 2026 20:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33910608E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773002195;
	bh=ib/U/1YQuMmVWx90E6Q/aZsAKmFvDLCFcf4KnSgCSEg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QVjjHkSNSMNjRKmLEexyZNtejfgyhTAHB1aZUF4PnsYzCd8SISJor4lHSf79BSR1V
	 OufateZRlhndExt3LKDhPoXBCEfGvU7L12hWiZpokp9dpezbLpRtcr7HAk/0CnEmYB
	 pm1GvjXrbzoSCVRNjdLJDiZP5LBsGOsmEGsXpIdg+u963Kjy9v8zh4f3YhJJTrLKXe
	 kp4dZcGhX7ogg2Y+pvetsv1D8GnR8eNkZAvefjQ1NLRUqYRLkOI+T0jw/ox0UtOjUf
	 unkyUfulU1tjnxdGmVBCBkpaeFM3HjRx63N8M3ido2+WAOghxQOnNp8X9DTL30gvzi
	 KOm0wKxKe/WbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33910608E7;
	Sun,  8 Mar 2026 20:36:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F8D358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F17608E7
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHI5TK1DEekt for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 20:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97D8960627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D8960627
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97D8960627
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:36:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B51CEB00535;
 Sun,  8 Mar 2026 21:36:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 21:36:27 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 21:36:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Michael Vetter <jubalh@iodoru.org>
In-Reply-To: <20260308160344.2593517-1-bernd@kuhls.net>
References: <20260308160344.2593517-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <6ee0630f4369957be39ba4ad0fe79fd1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773002190;
 bh=6JeCaDeHUB6XhJjmucwADHWIYxzfuVotX350/L8u4ZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J7vG467Czz+48GOErcJ7CguTuPwtka5gfDhzXdg8suTQK2rWzZ8OeRIxdWNKfm9PQ
 v3lETNzu1KhXwrpwRkBase9P8NYiyvbR6+P+YXGUqmlFJXZQ6AxuBuUeQFeDPfIjBn
 tHau2tOjwiwBKdqSMGhR0HkfsfDlyFCkKV1j/fDYHcfkjbqTAUAkNp7NReOTNbQw33
 FO0JcOJzxJWCzCxfFYfsuuqZA2LL7XHQxESy/jzX4XftpI5Zgi90vjECIchKZHggD9
 nG+1oL4MMW8ZP0zAknaEyJLnmBzHu8DxAEGmoHm8iSM++MI0E+AfOMvuv173hNl+SG
 zyUOEcIBtTfyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J7vG467C
Subject: Re: [Buildroot] [PATCH 1/2] package/jasper: fix build without
 threads
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

On 08/03/2026 17:03, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
