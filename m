Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364F0CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40DB405BF;
	Sun,  5 Oct 2025 14:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X704TRPA-I70; Sun,  5 Oct 2025 14:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF01405EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF01405EB;
	Sun,  5 Oct 2025 14:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1B2272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D00340A84
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSWQXl59FgDj for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 14:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3E8340A76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3E8340A76
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3E8340A76
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:46:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2093376117; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 14:45:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Pzp-00GwEL-1e;
 Sun, 05 Oct 2025 16:45:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251003201145.2430150-1-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 16:45:57 +0200
In-Reply-To: <20251003201145.2430150-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 3 Oct 2025 22:11:45 +0200")
Message-ID: <871pnh2yqi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CsprczQdclS4aCpIVxFJkRJxwVvkdJXepNEvhuiK+loNJgR9gXD/Z4fDj+Gy3v9oU1CphhDswCpJTAKWlEuOhJ50XrzneSBAbo9m6hZW+JuKvMKHnse+RrG8OWx5JAV21Fwrr4OCjphGNU1gk1WSPKtzk/XovhvrA0hMviJpNDKXSb1GVniXn4uD1k+DSXQ/XNh6ZHQKA8TgFBK7idvRfd0Bh+3Bw/dNwZWk0b2J/eE/joGTr4ZzfGU6tj5n7HtKmXSknwvDImcUVQxihEW9nA4bHABcHHw8IUrjigpByZ9MwqOBoXAmG2ePF1OzQ/oeBORr+C7/bysWn7+t4P7XZg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=WOCrvpdoXiivKw1QQ4Q8xZK+dqhfoNagYxKIk6hBJg4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CsprczQd
Subject: Re: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.14.1
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes:
 > https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/

 > Updated license hashes due to upstream commits:
 > https://gitlab.freedesktop.org/freetype/freetype/-/commit/8d18acba8c476267bbb7ab9f24c977d233d2f831
 > https://gitlab.freedesktop.org/freetype/freetype/-/commit/2adb53616a1fa5369e55f9b17ed19f8812c16c83

 > Switched _SITE to https.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
