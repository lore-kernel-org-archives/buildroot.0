Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B46C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABBD480FEF;
	Sat,  4 Jul 2026 19:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ee73pvglJjSn; Sat,  4 Jul 2026 19:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C29A980FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783192352;
	bh=FjTv2S2z7VzGSTbvcrZmDssKeuUq0kLr0/jq3Z2fsXg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U3I/d0siP3ZtL4FEN2AJAwKwkysSrqejvt89Z74ml405s0d8Sv9V1EbI3f44Jq2ux
	 qeEyZ2RfjEnY+wfY9rdYnkKFkkE9u2wRadVmIxn3iWUshqA1MqTU18ogWYbEsKidSt
	 AXmFNbr6wIghCiXrC605ktd8pEeAHuGcKTn6EdzvnWHY0FE3RjEue2GVou45MGZaJY
	 1PkbjyJk+UqSyyPIt/BksYP8GpRbEeTP8HWjRsYIQKrW/D00grEeCIPmd4NA2vgWh3
	 dFYS4AebqyP0C4Mk8CAdORtXPDCDEdgtTZAp+jTzg0pbwKghlNT+xNV17LcD5wp7C9
	 G2Z+2ZpOCTGSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29A980FFA;
	Sat,  4 Jul 2026 19:12:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD06316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA806064E
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKbEz8QGP6rY for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:12:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF51160683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF51160683
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF51160683
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CCB5CB00563;
 Sat,  4 Jul 2026 21:12:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 21:12:22 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 21:12:22 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260622094517.1342785-1-manuel.diener@oss.othermo.de>
References: <20260622094517.1342785-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.16
Message-ID: <148d421ac17cc3a4910189c34a418285@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783192346;
 bh=IaFD/tYxeIxwNbfydd2y5UrdOxC4VHsOm5CPfav4694=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AqJEPz0GMO+Al7JnQgXM7TrlhT99A9XiE+oPRQWPpTqxwvU5gtA+dQcbzwfaq07je
 02JqXuh4tY5+zdCmKdMqKGbRkiuarrhHXPm44aqgchAFzxaTojqZ7zusPIEttIT53H
 VseuZzJOQ9cS94Sl8qtR5AZ0trUSqIjB3HAgUh12S1T7GbD7tT2VFR/f4qzNw6wSmM
 zfT1LuPxlRUgVSIWyNT+skyeVDNJorsUH3IXQDyIavNM0UMMHgYPvEtl8msz+TG/uV
 L+0Hg1cfQmf0ArLxxQkAFPVD+NO33c1zuzOReXU51aJxU/1/jTDm8oIrqlMMcWDgFc
 TtwyQCfY/o/Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AqJEPz0G
Subject: Re: [Buildroot] [PATCH] package/python-jc: bump to version 1.25.7
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

On 22/06/2026 11:45, Manuel Diener wrote:
> See the release notes here: 
> https://github.com/kellyjonbrazil/jc/blob/master/CHANGELOG
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
