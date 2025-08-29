Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBCCCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9560B61529;
	Fri, 29 Aug 2025 10:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URs-0BAX1Dmn; Fri, 29 Aug 2025 10:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F8C6156D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F8C6156D;
	Fri, 29 Aug 2025 10:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E59AAD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD8B40EB5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krg7T5ZbQ8ug for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3F22403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3F22403F0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3F22403F0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -648627842; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 10:06:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urvzd-00BVOS-1x;
 Fri, 29 Aug 2025 12:06:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
References: <20250829090842.103239-1-titouan.christophe@mind.be>
Date: Fri, 29 Aug 2025 12:06:01 +0200
In-Reply-To: <20250829090842.103239-1-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Fri, 29 Aug 2025 11:08:42 +0200")
Message-ID: <87bjnyjvcm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pPKA9fj0c80kjcgM7r0Yj6zPMIPscCNl/8CuI1aR7wtL12eKpjK/0ECLJMREBWZiZvqSLDchW+H85fhA50+zgNLuu8qc2S+PYxKoGTF8FJ28rZbH871Lvj4TcdXMM6vO59EgcHyzWjm9EvZ4qkpFxWkv+FP1sbXVA2tvx0Fh8DxNhFcrTnz4j5Rgt2AmPkZrKo1PtIDA8bSEPouQfVKntcjP3iZX6zli8wX2iLs1Cn2VJVeyh22NwFNcKqM1L6RsAPUtz00zZNlEfe2xpocfaN9wF6GJ/2RRdSshQQm5DmiderhWJ+Pzvj2IYtlW1bYroleSG0vsq04DnocLnKoBGw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LBbObJ0GYsSh1frkYmuOqC7mCSWSs+LFOkzUxwvJJp4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pPKA9fj0
Subject: Re: [Buildroot] [PATCH] docs/download: rework download section
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
Cc: thomas.perale@mind.be, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > - Display active Buildroot versions as a table, similarly to kernel.org
 > - Add latest release date for all version
 > - Add expected End of Life dates for all versions
 > - Add link to the changelog

 > This makes the section much more compact, which makes it easier for
 > users to compare the versions and know what to expect from them

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 > ---
 > This is how it now looks like: https://imgur.com/a/a3ipSiz

Committed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
