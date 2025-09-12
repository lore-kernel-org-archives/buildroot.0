Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE4ECAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3B041378;
	Fri, 12 Sep 2025 15:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLkh2sCAczCR; Fri, 12 Sep 2025 15:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D7841350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D7841350;
	Fri, 12 Sep 2025 15:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9A812D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCF22412F6
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7uZEA9wSjEo for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7E6841323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E6841323
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E6841323
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:32:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -114170160
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Sep 2025 15:32:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ux5kn-001sZt-2Y
 for buildroot@buildroot.org; Fri, 12 Sep 2025 17:32:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250909124300.3839010-1-peter@korsgaard.com>
Date: Fri, 12 Sep 2025 17:32:01 +0200
In-Reply-To: <20250909124300.3839010-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 9 Sep 2025 14:43:00 +0200")
Message-ID: <87frcr4rgu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=vhOP1RzM41/2lplVXWE446eaKPH0yfF5xVJOoXsV5E9+9t7lvWvDtKbgOfatZqABRMBCiULHU6kdmhOZ/boGra/JbzbqDwrQ4j4EPRisEX8e4WZpOWsVWcODiHZbx6SY7U2uQ7UH0zbxPL7VKsvo0/rLIiYuJ7Q9KCgVRdYdJiqerZ7oMErRAwDGnst8J8h5W7Sdf9JeHDkwMwZ2YrJ1sYGAUyGEWGSNpNEuGMLmuc9XRNF7PQLnmwKEyRqLprBgQEI6VxX38C9GreHcfKa6i1YPJOricUiXlOcReTw//fGtREHRQzsDrDN5oBeiRkmqZwA+b2cEmKN+jlYHN5rasw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=jB8o2M2uLRkeNXvjqEXEVZVqYrT0X/vlNV4AVoMBU4A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=vhOP1RzM
Subject: Re: [Buildroot] [PATCH] package/fatcat: add upstream patch to fix
 CMake 4 compatibility
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add upstream patch fixing cmake 4 compatibility:
 > CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
 >   Compatibility with CMake < 3.5 has been removed from CMake.

 > Fixes:

 >  https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
