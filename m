Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B61C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D973E842CD;
	Tue,  1 Jul 2025 15:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmPqts52hVr4; Tue,  1 Jul 2025 15:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17132841D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17132841D5;
	Tue,  1 Jul 2025 15:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B95A179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5167541881
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 100ZiH-sOyx5 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 802D74187B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802D74187B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 802D74187B
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:56:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1787095855; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Jul 2025 15:55:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uWdKv-006mQH-0m;
 Tue, 01 Jul 2025 17:55:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
 <87ecv1park.fsf@dell.be.48ers.dk> <20250701173404.3bc34552@windsurf>
Date: Tue, 01 Jul 2025 17:55:57 +0200
In-Reply-To: <20250701173404.3bc34552@windsurf> (Thomas Petazzoni's message of
 "Tue, 1 Jul 2025 17:34:04 +0200")
Message-ID: <87tt3vewhe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=I/yZLDtNZjHmHq3dRBWS9wsOJDOq08wwM4eCCowgTWOJr5hTACMtngbWhVo91F1pAHDCtprpEyMEFeReymyIzdLcL810WD1OUVZ+mLptW46r/fBStZKO7Pepx2Q/T4bGwQsaeyLlof9nPRaRvkVtbAw7c55v7bCbI7z3Z7rpB+8sTPcf1i+aiSxvDjQK4VaV4oegKv+svCE6sP07qO1tLPqtKtD+Z5s7NRu8kJYz+P3617rEkPutTS5Ni3kp71FHcfzw1wjhJ5Svl0sYcptfsyM1ffkLreyjg3nEQpG63gQQnqQ1pNGCvu7mctAAExBt/7srnalxap26s1CcvJybYA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ARFdRXBk5PbMtjEc1YexzZnCFapJat2ASarbBNwC2oc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=I/yZLDtN
Subject: Re: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 30 Jun 2025 16:25:03 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > 1. Mksquashfs now reads files in parallel from the input directories
 >> > 2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
 >> > 3. New options for building reproducible filesystems (Mksquash/Sqfstar)  
 >> 
 >> I didn't look at the code, but is this something we could/should be
 >> using for BR2_REPRODUCIBLE builds?

 > So I did have a (admittedly very) quick look, and with
 > BR2_REPRODUCIBLE=y and our current logic in Buildroot, we already had
 > files date/time that were clearly "in the past" compared to the build,
 > I believe somehow set to SOURCE_DATE_EPOCH. So it didn't feel like
 > using those new options was really needed. But as you can see from the
 > patch send time, it was 11:55 PM, I wanted to finish my Buildroot
 > evening, and since I couldn't find an obvious reason to use those new
 > options, I decided to send just the version bump as-is.

Heh, ok ;) I believe a squashfs file system also has a "creation time"
timestamp, but maybe we are also handling that already?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
