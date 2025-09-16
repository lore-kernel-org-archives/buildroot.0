Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E6CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF457611AE;
	Tue, 16 Sep 2025 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_ROx6xxblAJ; Tue, 16 Sep 2025 20:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5292611AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5292611AF;
	Tue, 16 Sep 2025 20:43:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F225C12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8BDF41297
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3CoeVraMzxu for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77C314129E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C314129E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77C314129E
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:43:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 219597848; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:43:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uycWc-0039Ju-2u;
 Tue, 16 Sep 2025 22:43:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Aleksandr Makarov
 <aleksandr.o.makarov@gmail.com>
References: <20250913101520.28649-1-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:43:42 +0200
In-Reply-To: <20250913101520.28649-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 13 Sep 2025 12:15:20 +0200")
Message-ID: <871po69lhd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=zbGT+MGSVNFywxYz5r61fJjgtFmtbkzCGRyADiNHATIUwOzpQhfpOqUvlBC6PORviRIY87Zs8g2Maf4xAxvqgzkAOlX3vyZmOHjmgfMITap5KYyDRp3eG6w5IuPOhTXNUMPiMIPLUPFk8oJs3XdjadLn4TIIlOFlP3eN24B81KFchmETZhA0jSAY7sVASu6nqSNrLwSGHDX4J0Olu/eateYQrsead851ZgV2v6Fp/XdLYTljA511oYZbrQyKuFt4nbP1h8TRWrSfXal/4BG+09dQWIVyB8U3bbqQAPQaDFl8OoIzqRCHG5V8QtROdVLRKLdRTmDeXNCCBywXxZEweA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bGI6ACh8utMELo/JogOUwFXkt2UV9k85NfeZwyQ4urU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=zbGT+MGS
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: remove stale patch
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
 >     make cpp-httplib-patch

 > fails with error:

 >     Applying 0001-merge-commit-from-fork.patch using patch:
 >     patching file httplib.h
 >     Reversed (or previously applied) patch detected!  Skipping patch.
 >     2 out of 2 hunks ignored -- saving rejects to file httplib.h.rej
 >     patching file test/test.cc
 >     Hunk #1 FAILED at 42.
 >     Hunk #2 FAILED at 2839.
 >     Hunk #3 FAILED at 3624.
 >     3 out of 3 hunks FAILED -- saving rejects to file test/test.cc.rej

 > Commit [1] "package/cpp-httplib: add patch for CVE-2025-46728"
 > introduced a package patch in the branch next while Buildroot was in
 > RC cycle. Just after, commit [2] "package/cpp-httplib: bump to
 > v0.25.0", also in branch next, removed this package patch.

 > This commit [1] was cherry-picked in [3] in the branch master, to
 > apply only the security fix for the 2025.08 release.

 > The merge commit [4] kept the cpp-httplib package patch
 > "0001-merge-commit-from-fork.patch".

 > This commit fixes the issue by removing this stale patch.

 > Fixes:
 > https://autobuild.buildroot.org/results/5b9843089ade428997035e49817208ce9c09a10e

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/aea7c89396f20570b5ce32c4a235f7011ad0bd01
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/519d03657c6a247f739003a3590c93948e6a48d8
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/fd313c4cebc8c0a8db2ff9641b48e2d8a993c245
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
