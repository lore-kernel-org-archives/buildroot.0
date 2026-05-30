Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B52CCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD59852A6;
	Sat, 30 May 2026 10:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_FoApa5_2Tk; Sat, 30 May 2026 10:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 289C18528B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135345;
	bh=af+EWgNWUjPR9l9xw03ab+JL1Won5BLA+wEpoYFVjOc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqDRVTe+6fqtr1l9L3/v01qGRsHUmgis2BNNUinsepz13f7MKod6fxgk0kVVS+fp6
	 ocu36y70gv5kmCXBFMDX149fBfOy7WsfLiDdDmT27kuzGt7Axh/PLJ6ql2u+RsXT/K
	 w89D3NdF6SU1loBdjI7Z/fq1c+Ovmi4pBkOdOzrad40xYbH74YmaFxE8WxpEESpokz
	 YWAP8PV4VDUFDYl5IMlkjONfoJL0t7qPzmel0YdAkOH1/Rv7KTVDVeqr75LK6uMRhj
	 rviCukfdIraRHDojNK0KwapSEYA+6E8h0T8c4QdbTiAtJblr3WiIBuJVbekTpNlxVD
	 QZDUCUJe+ztvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289C18528B;
	Sat, 30 May 2026 10:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE27E12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AF3B40879
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_XGnLNSZUXC for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9266B406F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9266B406F0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9266B406F0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:02:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1100300399; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 10:02:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTGWJ-000000057UZ-1YB4;
 Sat, 30 May 2026 12:02:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260530095901.1219858-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 May 2026 11:59:00 +0200")
References: <20260530095901.1219858-1-peter@korsgaard.com>
Date: Sat, 30 May 2026 12:02:19 +0200
Message-ID: <87mrxh6wr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=b5BswCf84FUyZMOwj9IZ8T7qGxCCAGKtqJTjGmi1Adw+gSJMIquGSTY3V7r9fZ0DKr9VRKyszome+xWgsC7ZYQXkABrJaB8P+FCT6aKydMPEyRqNWO2clgkhf3VIa6AFBtZXndbHZkFChO5Ezi9Idjxe+Vzu5rlaPWfNwkSgqrZoS0QkR6t2ajK+iTJTZIeKrEVT3nQUoDuZi4ZYaqvAfDKn2af4wRKYdnHtVJoseqvR5nIDoEdvkeumMavfg791x4MkplRQKPpkDCHboHTIt1pmgvICArnWNYCsMwk5ZUjMUDHKFpbxPf4UI9aC/27Vo+AEqPei5MCSWunV82NSyA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=WZ1M9XncU+FISeZt/i7kEIrK8LFSPPEmEYOmwRRsw4k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=b5BswCf8
Subject: Re: [Buildroot] [PATCH] package/libhdhomerun: bump version to
 20260313 to fix download
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

 > The old version fails to download since March 2026:
 > https://autobuild.buildroot.net/results/ad8642f9fc399c721cac4fd18f45ef4244db7059/

 >>>> libhdhomerun 20210624 Downloading[27m
 > wget -nd -t 3 --no-check-certificate -O
 > '/home/buildroot/buildroot-test/instance-0/output-1/build/.libhdhomerun_20210624.tgz.sW1E2n/output'
 > 'http://download.silicondust.com/hdhomerun/libhdhomerun_20210624.tgz'
 > --2026-03-14 23:54:22--  http://download.silicondust.com/hdhomerun/libhdhomerun_20210624.tgz
 > Resolving download.silicondust.com (download.silicondust.com)...
 > 172.67.69.187, 104.26.0.94, 104.26.1.94, ...
 > Connecting to download.silicondust.com
 > (download.silicondust.com)|172.67.69.187|:80... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2026-03-14 23:54:22 ERROR 404: Not Found.

 > https://autobuild.buildroot.net/?reason=libhdhomerun-20210624

 > So bump to the latest release. For details, see the changelog:
 > https://www.silicondust.com/support/downloads/software-changelog/

 > The upstream Makefile gained a special case for darwin, so refresh the patch
 > to apply.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Alternatively we can drop libhdhomerun and the reverse dependencies, the
affected hardware is quite old so I do not know how useful it is anymore
(I do have a device in a box somewhere).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
