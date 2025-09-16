Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2761CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C833412A0;
	Tue, 16 Sep 2025 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqzINhD1kK6y; Tue, 16 Sep 2025 20:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9610441297
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9610441297;
	Tue, 16 Sep 2025 20:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B376B12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A44D4834F5
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAHFWKFZiyEz for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 866418164A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866418164A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 866418164A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 512801549; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:43:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uycWW-0039JQ-03;
 Tue, 16 Sep 2025 22:43:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  =?utf-8?B?SsOpcsO0bWU=?= Pouiller
 <jezz@sysmic.org>
References: <20250913095642.20835-1-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:43:35 +0200
In-Reply-To: <20250913095642.20835-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 13 Sep 2025 11:56:42 +0200")
Message-ID: <875xdi9lhk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iztee9aZUzkllAWdo+IzcWHYokZtzW7i2MzJ2zc3j0AnjyzrcLwi6Mky4nzCvql4hm7RnNr5OSesm9kStuDjBGbXZcVvijUM/XkroRrEYaXItmyBtm5OL7lWtaO4AaCQcKzkXq7goTN8vVCxNPePvMj1yZWkekv1LY7OCt6vzTbW5y72WAanrks4EeRi8Tmdl/zhxH7yDBv36V7A5AmX/PsEwU4GkuL3Ga7mKXgOrCTYNGT8XqV42+Vg1FlKSR5LxXPLI9M/SUrdPIo03dXY5xUw/xEodx8/GO228++fpAL4z1SwBDtjrdE16qRKkoJRT7Q2ziAuThg0iqCn8iNXDQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VQbwm/Jq6qVPLCXudHqGNHxfFuN/LM2niODjPHBrLek=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iztee9aZ
Subject: Re: [Buildroot] [PATCH 1/1] package/apitrace: remove stale patch
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Running the command:
 >     make apitrace-patch

 > fails with error:

 >     Applying 0003-Explicit-header-stdint.patch using patch:
 >     patching file frametrim/ft_dependecyobject.hpp
 >     Reversed (or previously applied) patch detected!  Skipping patch.
 >     1 out of 1 hunk ignored -- saving rejects to file frametrim/ft_dependecyobject.hpp.rej
 >     patching file retrace/metric_writer.cpp
 >     Reversed (or previously applied) patch detected!  Skipping patch.
 >     1 out of 1 hunk ignored -- saving rejects to file retrace/metric_writer.cpp.rej

 > Commit [1] "package/apitrace: fix build with GCC 15.x" introduced a
 > package patch in the branch master while Buildroot was in RC cycle.
 > This same commit was cherry-picked in [2] in the branch "next" to also
 > apply cleanly the patch for commit [3] "package/apitrace: bump to
 > version 13".

 > The merge commit [4] kept the apitrace package patch
 > "0003-Explicit-header-stdint.patch".

 > This commit fixes the issue by removing this stale patch.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a4b0913280b95b62cd74fdc5ff0b25e3afa2c529
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/bf55f4713e1ba877183b9e31469df5d3823ec4c0
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/aec2f2ddc44d037ad21c9a061475459dd9f3d3a1
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
