Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4564CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A3D68264A;
	Sun, 31 Aug 2025 15:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LIJRT2QrbOl; Sun, 31 Aug 2025 15:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B14825FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B14825FE;
	Sun, 31 Aug 2025 15:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D670CD2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2769825E8
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyBmim58yiNP for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF7068257D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7068257D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF7068257D
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1522232956
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 Aug 2025 15:00:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1usjXt-00HN4h-0X
 for buildroot@buildroot.org; Sun, 31 Aug 2025 17:00:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250828102441.1455178-1-peter@korsgaard.com>
Date: Sun, 31 Aug 2025 17:00:41 +0200
In-Reply-To: <20250828102441.1455178-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Aug 2025 12:24:40 +0200")
Message-ID: <87jz2jfsdi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Nwz0KdbCxVhm74Q0YbT0PrRDNzsPfdMwoGoX9Ehydmj7IB86uP+U1E425DTVLWTNiEpuIHHl75elQIm1sP0eOtThl3G04VP9MUQP6J9MeVI8aY46pno/4/ycFKgoMuXvhNCA06o1y76u5aD36S1BpGgM1HwQlMAjfWCAW4rerMWoK/U17GNrILllrxF2qpPr0OoHCkGSQi7g+OFPsRLcLLi0ysvEiH7ia0ILzRv8XItZ+k3r7SZkezB1aCAKFy7wyC2lFZyRkpih5QX+moJ72zOf9EpRt6Ol2ivl8QmsrFnwmAS7maXCrPGr82SC+kv7pmlOnu/oJaJVOBVVdzpafA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=IzjoeX19M/uOu0G8U4BFgDZrixneMJSkClxNV2V6aYk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Nwz0KdbC
Subject: Re: [Buildroot] [PATCH] package/squid: bump to version 6.14
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

 > Bufix release fixing a number of issues:
 > - Bug 5352: Do not get stuck in RESPMOD after pausing peer read(2)
 > - Bug 5489: Fix "make check" linking on Solaris
 > - Fix SNMP cacheNumObjCount -- number of cached objects
 > - Do not duplicate received Surrogate-Capability in sent requests
 > - Fix Mem::Segment::open() stub to fix build without shm_open()
 > - ... and CI and documentation updates

 > https://github.com/squid-cache/squid/releases/tag/SQUID_6_14

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
