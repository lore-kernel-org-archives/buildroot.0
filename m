Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E46FCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C56412E6;
	Sun,  5 Oct 2025 13:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhwDWR0mE7p5; Sun,  5 Oct 2025 13:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B374123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B374123F;
	Sun,  5 Oct 2025 13:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44A67909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AAD41187
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2v38vMFp952 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F26240B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F26240B8D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F26240B8D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:40:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -27301383; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:40:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5OyR-00GnFj-1G;
 Sun, 05 Oct 2025 15:40:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Semyon Kolganov
 <semenak94@mail.ru>
References: <20251004095751.276084-1-titouan.christophe@mind.be>
Date: Sun, 05 Oct 2025 15:40:27 +0200
In-Reply-To: <20251004095751.276084-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Sat, 4 Oct 2025 11:57:51
 +0200")
Message-ID: <87a52531ro.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EpkanNUB1VsG+n7cnZZZeKiT2XNchDbm8gnENUdXCenBzDRYMFq0oXvjhxiVB12DC6D4R7igaUWgi3L25PDGt61f3/l6sj6g0gxI0KlJTPCD+S9nFcp06YCELtWZSCPHdJMPzG5Be8ungv1sYQz9dMiNhGucFnoJGLapndmSmvJ2YAo7OOQ0rtcrpLrAtVqxSSgaHOuXwK2LYLfAKtdMFFNZkkhkxarXZUlxsoryl6bsUORdofpOX548fF97PW+zGXXYsb7VYlVg2CD60Zg/NcamBKXjolcOAjSzRh7pNZzPwsq5gzj30whzqsRbbOI93Zmx8aLhPCUrK15DEQuJ7w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=8bFN1pGsNLvVft8zNfbzmCBQorWM19ctPMGd9bBBqN4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=EpkanNUB
Subject: Re: [Buildroot] [PATCH] package/libbson: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > The upstream libbson repository has been archived since october 2020,
 > and there is a known vulnerabilities affecting it (CVE-2025-0755).

 > Since no other package depends on libbson, and it hasn't seen any recent
 > activity, let's simply remove it from Buildroot. In case anyone needs a
 > bson implementation, one could integrate the replacement from mongo-c-driver
 > instead, see https://github.com/mongodb/mongo-c-driver/tree/master/src/libbson

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
