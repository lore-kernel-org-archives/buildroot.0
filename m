Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F579C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7E360874;
	Thu,  3 Jul 2025 20:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNOZPL3cw3Ir; Thu,  3 Jul 2025 20:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF7560AF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF7560AF9;
	Thu,  3 Jul 2025 20:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4371CB0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34FCE60AF9
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBCcGp9n3--y for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5936C60874
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5936C60874
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5936C60874
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:28:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7DD7319F980;
 Thu,  3 Jul 2025 22:28:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 22:28:41 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 22:28:41 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250703183408.654229-1-giulio.benetti@benettiengineering.com>
References: <20250703183408.654229-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5b3010b4da5429b622aa62077e167215@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751574523;
 bh=VnmcBvX6ovOX8t9DYKNFwLrt1eKpQS8NdH7StEtD9jI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o1NU6ODiS+SI5/5/UlK6kFNlWB0zZiWBv4HeUdQ1xcy0FEMQ32xT0hzpGfea9xarw
 AZ+2s858rjEfast84cUDa0u0rvLf3ELWv50XearPZFLVuiBk1ZAVyrMuFIsuUU5gHF
 /YF5BXMKy7cTr1Xod0CzzUWen6UrZAxSUVE7xiNyFwDcCItFT8X1jNqAsZtLcrAEhl
 Ls1tJiGXqkD9XPyN435fQkGM9BBArOOFYv4E0zwt1K/yo3JWbP3MU8HqroHXvERkLY
 CQEMV/pK3qi0oqjcO8nRdrj0TqiZKkW1hX2iZPLHc34kcyERCNKNP33tgy530Kc0mJ
 zB/il4QO4JuUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o1NU6ODi
Subject: Re: [Buildroot] [PATCH] package/libnss: security bump version to
 3.113.1
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

Hi Giulio,

Thanks for the patch!

On 03/07/2025 20:34, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_113_1_RTM/doc/rst/releases/nss_3_113_1.rst

Why did you marked this bump as "security related"?

Looking at the bug reference in the release note [1], it refers to a bug 
[2]
which fixes a certificate. In [3], the "User impact if declined" is 
described
as "Users may see certificate error pages for valid certificates".

Could you provide a reference or a justification why you think it is
a security bump?  Otherwise, if you think it's not, could you send
and updated patch just marking it as a normal bump?

Best regards,

Julien.

[1] 
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_113_1_RTM/doc/rst/releases/nss_3_113_1.rst#l35
[2] https://bugzilla.mozilla.org/show_bug.cgi?id=1974299
[3] https://bugzilla.mozilla.org/show_bug.cgi?id=1975027
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
