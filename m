Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF6CD116F3
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F7A82151;
	Sun, 30 Nov 2025 17:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-yuFsBxP-8r; Sun, 30 Nov 2025 17:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2932D81EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2932D81EC4;
	Sun, 30 Nov 2025 17:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D82219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D744D40109
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdI4swaOolrM for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 17:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C89B840064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89B840064
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C89B840064
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:07:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -184664987; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 17:07:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPktr-0000000EHa7-2zeI;
 Sun, 30 Nov 2025 18:07:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251130104423.822691-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 30 Nov 2025 11:44:23 +0100")
References: <20251130104423.822691-1-bernd@kuhls.net>
Date: Sun, 30 Nov 2025 18:07:51 +0100
Message-ID: <87pl8zh2jc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bhCDElpmGYAPQCtcjDUzgxfh4Ug+V2r22o4Vi4ivoofjvurWoiDHkn20mLgrSOTWpIBOJkw0kyle8LSQVCWoEB93aAWf+AGhArC6WqcIpLJny2StHKOAh56AmvFvkJY1dPWWrmPeMePQJy9Vh5gnUJ99338dOK8JrmXrGxavqcoBCY/CRRDKzbRFddUX/yDzJiD6wa9RYW+8hnOT8j07B5k8FjV4MuNsiIHyjMoGgUBVcGxixZX6Zhb5Ad5REixydKPLAZ5k6+oFlICxuz6HQDgqk5VojRMJnyw9EXiErUZDLQtOwjghR+hJZcHTlAwfB3iwWE8M4ffGIi8WFofBHA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=L++TWMG8ZUWXKU4uCag48R75VwoWxGSM2rSZFTtCXos=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=bhCDElpm
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: fix non-NPTL build
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

 > Buildroot commit 2ce329692ab60da7fe7ccd52bf64a8c4802fb317 bumped
 > stress-ng to version 0.19.06 which includes commit
 > https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b

 > This commit breaks the build with non-NPTL toolchains.

 > Fixes:
 > https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
