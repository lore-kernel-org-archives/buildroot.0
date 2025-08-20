Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07250CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 14:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C0A83B52;
	Wed, 20 Aug 2025 14:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7CKdZsLj11w; Wed, 20 Aug 2025 14:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5798398E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B5798398E;
	Wed, 20 Aug 2025 14:46:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 134A4E0A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50CB4079A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU3FuUJWuqmK for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 14:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DEF3402DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEF3402DF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DEF3402DF
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2074682594; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 Aug 2025 14:45:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uok4Z-00F7TO-06;
 Wed, 20 Aug 2025 16:45:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Angelo Compagnucci
 <angelo.compagnucci@gmail.com>,  Olivier Schonken
 <olivier.schonken@gmail.com>
References: <20250819133911.3965048-1-thomas.perale@mind.be>
Date: Wed, 20 Aug 2025 16:45:54 +0200
In-Reply-To: <20250819133911.3965048-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 19 Aug 2025 15:39:11 +0200")
Message-ID: <87349mm4pp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Ql8zMnvc4P1eJRf2YJA5ckIai9L0JomDcF8flmW6dzW4lBefS+wnE7nl/4+sWI3N/J0HzfLmvzrgeYABENU2vQjfuitfsFGsQlkAi86ZJ/50GFiD//e65vcDlOEyvMvPFFuTlmZg893q5QoQvL1kKoUp/g3qe6YIdLLbojOXU3t2KgT3CEyihjTjCDf4G84rNfIxo/S7ZyUqB2qq5XM3plW5gvc15A1L4PV9kX1c7OthY+M3j3sgJRhRzi8G6sgZ+lcsgWGhGPkWxJXQE66bZIT7wYn/uA0hP/rE4heKpGXUwSWVgzlICxA7B5lefR215O2TzEJcvK6UqX0DC3ZFqg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=j7plbsGUPpiA3TclhtiC1VaHAs/6iF6042jQVkKlH1k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Ql8zMnvc
Subject: Re: [Buildroot] [PATCH] package/openjpeg: add patch to fix
 CVE-2025-54874
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

 > Fixes the following vulnerability:
 > - CVE-2025-54874

 >     OpenJPEG is an open-source JPEG 2000 codec. In OpenJPEG 2.5.3 and
 >     earlier, a call to opj_jp2_read_header may lead to OOB heap memory
 >     write when the data stream p_stream is too short and p_image is not
 >     initialized.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2025-54874
 >   - https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
