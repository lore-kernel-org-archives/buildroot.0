Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C07FC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13EE40FA7;
	Wed,  1 Jul 2026 19:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLR9w6gsXzVU; Wed,  1 Jul 2026 19:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48E3840FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782935903;
	bh=CsDqZjzORNa9v+erDgMX8uD7g/vMwNfF4gwVUhzPF7I=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwCUkLx663bgRP1AXFS5m5VVUioANkzNphxnfjaS+WVK1LXEGEVq+Jir+hHSdAerw
	 R02xsVKb4Ef34hULzFaD//rnbcKB2BxcfX65hHUubK5iawmg0c/upZjlyFmxbCf4+p
	 QL/GeHuBWNtMq1M4ZqOjZu/7hDFnysDxiwthKaFft2toU/4VRXC6dD83Bn0YwybqDn
	 fKQg4/XHJH3RxXuLlkKbzpAdv1ZnTrJFigt9e24GZb9sKqYrR5AG6AdGbvDak957GC
	 NnA9YWvmtx09dF998rwCUIjKkCexyzbhPgsNDERG4rXaTDDDH1MhcfgfjozBqLG3SI
	 +DzpUILq+JJxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E3840FBB;
	Wed,  1 Jul 2026 19:58:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0275316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B62EF41483
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvLWhUHF3vZ2 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 19:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D0A04005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0A04005B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D0A04005B
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 19:58:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -114433289; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 19:58:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf14Z-000000031uy-0Dvl;
 Wed, 01 Jul 2026 21:58:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260626203415.303763-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 26 Jun 2026 22:34:15 +0200")
References: <20260626203415.303763-1-thomas.perale@mind.be>
Date: Wed, 01 Jul 2026 21:58:14 +0200
Message-ID: <874iiiscrt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tQ70ofY4dU1IjzSSYsq7pA9vzKAm0/O+Elffup10leVM6y8j0lqg2da5cnLbKoHzs4H75Uth2Mtirwqw4sGD50r4a+jSoCORl4C25rMh8bt1NLNZzlj2rGMAi6PAgkMcj2OF1jdBjDnGj9yxsMCpHTStNzv7Jf1s9zatrYxDoHTI+LF0PayOvHmDyoBmZ89tcg1fgL2Ctv4t2OnAon7LWckjsGOWpL+TD8h9gYsLL9/O8KXKDbM4uYZZv08Gd6GPPOssFa8C0TFkHX8Hp1uUU4/C2Nq5LlUe2qaZuW1ma97RoAeGBnVNBOU6e1orDt23rnBS0QgwRCFtuBl6ex0KIw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=VXB6Js79aktEIjNN+abmGYlfnJ4USKYEAXsuHdnC6gE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=tQ70ofY4
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-26
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > See the changelog:
 > - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-24---2026-05-26
 > - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-25---2026-06-04
 > - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-25...7.1.2-26

 > The bump to the v7.1.2-25 fixes the following vulnerabilities:

 > - CVE-2026-53465
 > - CVE-2026-53464
 > - CVE-2026-53463
 > - CVE-2026-53462
 > - CVE-2026-53461
 > - CVE-2026-53460

 > The bump to the v7.1.2-24 fixes the following vulnerabilities:

 > - CVE-2026-49219
 > - CVE-2026-49218
 > - CVE-2026-48994
 > - CVE-2026-48734
 > - CVE-2026-48733
 > - CVE-2026-48724

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
