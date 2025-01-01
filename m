Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871CAE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4863581CAF;
	Wed,  1 Jan 2025 22:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1a5W-zTZ-G-w; Wed,  1 Jan 2025 22:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6363281CE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6363281CE1;
	Wed,  1 Jan 2025 22:28:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D8AF24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB4A481CE1
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKrB5uIG16J1 for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 22:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E61A381CAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61A381CAF
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E61A381CAF
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:28:55 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 17E2F240EA5;
 Wed,  1 Jan 2025 23:28:54 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id B587C2405BA;
 Wed,  1 Jan 2025 23:28:53 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 64228241208;
 Wed,  1 Jan 2025 23:28:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Han Gao <rabenda.cn@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Wed, 01 Jan 2025 23:27:54 +0100
Message-ID: <8511014.NyiUUSuA9g@kilian-laptop>
In-Reply-To: <3258931.5fSG56mABF@kilian-laptop>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <3258931.5fSG56mABF@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 541
X-purgate-ID: 154282::1735770533-B953D89E-925643D0/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735770533;
 bh=hb3HzX5AdZzrzG1nLNUq513/IQsZbfMgIhqfcJBOy70=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=XDWjRGRfdlg67WU+cOjjbAAkt3jz+sBPvB668IF6P7T5xxKhE7eGRN6DsDXqudZvC
 lk27+xXi+ODm5J2rD51xIrlxySug9LZFT53G6nGEKbt85qN4lE6K9plS4C/qnu/cbO
 EzgOFOYbA65L1vfM4zvFAlh87egtHFqdMHJXRAB67Z15FVHs3inahE/v+IVxTzqkrB
 1QivqHDhuTCqdrOvtk8C3Eycx6De7/rjc2bpzr+PRRN4XN2GR4v4/sT+GnaQKGkeZY
 0tpqwXRpITU2czTvsIxy0WBV4qjA4yxiWwij3tDguk+rz0TNZ0YrzXBdDxqZWhkE6F
 e/nrSVScfl0CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=XDWjRGRf
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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

Hello all,

> I was able to change to another custom uboot, which seems capable of
> activating all 4 cores of the SoC. However, still the two needed binary
> blobs are in a repository without a LICENSE file.

actually the custom device tree containing the reset-sample node could be 
wrong. With the node it seems that the cores 1-3 might not be activated after 
all, but when omitting the node, it seems that the custom uboot does properly 
activate them. I have to have another look at this ...

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
