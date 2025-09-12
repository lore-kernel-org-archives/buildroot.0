Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B3FCAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67759413FC;
	Fri, 12 Sep 2025 15:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSCEgBSZbAEv; Fri, 12 Sep 2025 15:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD88941345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD88941345;
	Fri, 12 Sep 2025 15:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B4B525B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D37861200
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmQNEy3j3IJ5 for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA4AE60DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA4AE60DC6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA4AE60DC6
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:23:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1784950631; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Sep 2025 15:23:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ux5c5-001rgu-0c;
 Fri, 12 Sep 2025 17:23:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  James Hilliard
 <james.hilliard1@gmail.com>,  Oli Vogt <oli.vogt.pub01@gmail.com>,  Marcus
 Hoffmann <bubu@bubu1.eu>
References: <20250911161603.827971-1-titouan.christophe@mind.be>
Date: Fri, 12 Sep 2025 17:23:01 +0200
In-Reply-To: <20250911161603.827971-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Thu, 11 Sep 2025 18:16:03
 +0200")
Message-ID: <87zfaz4rvu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NLd7GRMK8OWuk/En2NxFDbblZxGN9igdv3ds6cKNM2+ZLefoEE+l8K1h3jk4kkjJbNSHaW8veL1swXdyc+ZtetwhzTsmtCPWJdtHDPJBLmcqDN11JK12iBcxfBa6w+CdYaORLU5uhdh5Afw7TW1POXrPKaqMZIEa8Mp6QPpi4I7MwqIW41DeTTLzibevXzwiewsBelEHN3A6cynFws1Jvlzd/NnnoakrsXszhc1pNFSgpmgWIsQ455zV/naRXChdIklic1ucdA6G/R/LIOPIy6Oh2FN1CVmhRWQw4zknKf91Jalzr8G7SZH/NCsDv2mrX8zk/7KBYqka9IEIMBVwdA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+bWvxEi46cVzNdJlJH3VTkeQuAUsKZhZ4QaVTfL/QMc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=NLd7GRMK
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 v5.2.6
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

 > See the release notes:
 > - https://docs.djangoproject.com/en/5.2/releases/5.2.6/
 > - https://docs.djangoproject.com/en/5.2/releases/5.2.5/

 > This fixes the following vulnerability:
 > - CVE-2025-57833:
 >     An issue was discovered in Django 4.2 before 4.2.24, 5.1 before
 >     5.1.12, and 5.2 before 5.2.6. FilteredRelation is subject to SQL
 >     injection in column aliases, using a suitably crafted dictionary, with
 >     dictionary expansion, as the **kwargs passed QuerySet.annotate() or
 >     QuerySet.alias().
 >     https://www.cve.org/CVERecord?id=CVE-2025-57833

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
