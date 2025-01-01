Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E6CE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 13:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B68B6065C;
	Wed,  1 Jan 2025 13:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB094MN8sZcD; Wed,  1 Jan 2025 13:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 567B760865
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567B760865;
	Wed,  1 Jan 2025 13:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBCCE0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2064340B9F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-O_RnAIvYqn for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 13:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0459C40889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0459C40889
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0459C40889
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:17:56 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 30635240D89;
 Wed,  1 Jan 2025 14:17:55 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 0FE8424058E;
 Wed,  1 Jan 2025 14:17:55 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id BD62B240CF9;
 Wed,  1 Jan 2025 14:17:54 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 01 Jan 2025 14:16:56 +0100
Message-ID: <4618658.LvFx2qVVIh@kilian-laptop>
In-Reply-To: <87r05mpti4.fsf@tarshish>
References: <6114083.lOV4Wx5bFT@kilian-laptop> <87r05mpti4.fsf@tarshish>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 446
X-purgate-ID: 154282::1735737474-3953D89E-C497C9F9/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735737475;
 bh=z/oBoIKg8zXIjxmPbtzNhHwuwt6OMRiJbWe/g1dBMbI=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=qQGc/kjGEwswfqaALRkWIfs+9YLwjtBGXngk0oX1Ur1tJaQuZBcbKupZWObnqZQq9
 x1mqac/3XHw029XINbozBTidhfYQkOqrz/IFePWOfAsc4Wq6uoX3riyD/9XVuhOoBX
 Ixj+A92x/DewrXm3rW7/m4ss38Ck5rHn6PCpkMSYxrwxCihhUkwW8Ki6FJCPtL5y4G
 hyAWnKykuQJa70viHWQHB0IPNTw0HhZsuoizqm2RCa7CbhlAv6113gtJl6uPAMCT1z
 XYGY9xsGevtWLp61VsarsGwzyeCfuMO6LBf+7VNxZv0pgpblQwtM0vd9K0BzfhmLKh
 h7w07vH+lTWHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=qQGc/kjG
Subject: Re: [Buildroot] [Help] Problem with
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and kernel 6.12
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch

[--SNIP--]
 
> See the link below for a recent discussions of this issue on the list:
> 
>  
> https://lore.kernel.org/buildroot/dcbd3f77-e737-41a2-9f23-87141d0bdf9b@gren
> oble.cnrs.fr/
> 
> Edgar Bonet suggested a fix that you might want to test:
> 
>  
> https://lore.kernel.org/buildroot/035d6d78-0a31-4083-8fa1-65f5be5f74b5@gren
> oble.cnrs.fr/

Great, thanks, I will have a look!

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
