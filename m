Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D21FCA17E
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E359340776;
	Mon,  9 Mar 2026 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqaB06FsEoFC; Mon,  9 Mar 2026 19:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B674740719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773085123;
	bh=DuSRicbv51jwb2OEa1l7HtRxDho19wpwytOYr/pKSvI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mtn0RzjgmCtVUiccoHE0XXpmfpTabI7CfXr6A5xRRm0SRGyGRJGo9UEeYfI/ocP3r
	 qZXpd7liMmPs4Y0ul89+L5ik1e1wy81nHuZFOfY6+umDK4KOmiRqjQZ1EduyS+vEJ8
	 4l/ND4spbn/0VKQ4LuJ18BF9VhSisOLP3gxTgBEl4fM4DzJF+gNMkXT9hnxGhdFhfb
	 bs8OpxGdWLHBeA+JE6ub5BMzDBljB8K45ZVWi3lhlyDYsPB0AExyExa9NiA4LjYRDA
	 zIINjDYzRkPzJkBFr3kbj5Jy3Z+rdft/32sOq5F0Wj8if9jzM1dBGEBs9KnJ9LdWMl
	 nrevhROC70h6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B674740719;
	Mon,  9 Mar 2026 19:38:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 678A0119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF714044B
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9x72CJfm1sV for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 19:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BF25401E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BF25401E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BF25401E7
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:38:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3378B780383;
 Mon,  9 Mar 2026 20:38:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 20:38:36 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 20:38:36 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260309083104.3500964-1-giulio.benetti@benettiengineering.com>
References: <20260309083104.3500964-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <7bf3ee0d70169662e178b5da840f2bac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773085118;
 bh=IqRp7sOrQWxGM5z6sls3mmM/L7j2dGvAOxdRqJ+q7l4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KncUZDuokQ6z637j/bQAvchJUe4bRWeUl9xXF/O7ZhsptdT/HOsRRtg/i9/ucr/yi
 155shJ0bJwd8UNWPSCjSM5A+dUW+LE7nIz00vXNXTesGllA9Xs1IweEnM6tTyGnriU
 KrKFFvgGXY4Q4nbJEw5PywOjmh7gioHl7eQvvKdWnHK5KoFikQ0AoSMdYdNAt3oy+1
 ohxUFd/hpC4yDbIReS9N3yBes8p0bJyx1DK7eRv92FC3p+iV+KlKz5mim6PsN3tDOA
 A4BK3oH7GoO4/Iz8XBQEYLroCG/PKsRRZPbe2WVux5bpYONEzjwOMvPFZg0h5JFY7H
 bdrxxEsmr19EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KncUZDuo
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.6
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

On 09/03/2026 09:31, Giulio Benetti wrote:
> Release announce:
> https://lore.kernel.org/linux-nfs/4d58bf28-a3e0-4496-bae8-05387da27054@redhat.com/
> 
> This update fixes CVE-2025-12801.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
