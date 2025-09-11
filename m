Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74686CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D0C840D3B;
	Thu, 11 Sep 2025 21:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPRxB8cK_-Er; Thu, 11 Sep 2025 21:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4E4421F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4E4421F7;
	Thu, 11 Sep 2025 21:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 717B312D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E0B84D60
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPtNJs5Jz8l1 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAF7B84C3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF7B84C3B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAF7B84C3B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:45:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1265003598; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Sep 2025 21:45:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uwp6q-000Uxb-1T;
 Thu, 11 Sep 2025 23:45:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20250829165238.3082564-1-peter@korsgaard.com>
 <20250911192117.2671506-1-thomas.perale@mind.be>
Date: Thu, 11 Sep 2025 23:45:40 +0200
In-Reply-To: <20250911192117.2671506-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Thu, 11 Sep 2025 21:21:17 +0200")
Message-ID: <875xdo64u3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=h38O3X6aR4zHusbxxP07MuNyHsCjCtSnU0Ur+TrUFfCuxxF1FLHa2ZEKUbARiEjRd+/BscC5IZkJCUIJss27E56NCOgICIINT+p6SnZ+txYXPBBZ7afFZrYakMBhe50R70A1rIWPa353XKaaSqFeHNVViJTM2xi7j4mTP+2yQdiC4lvpD1ubtBH3swj4gRV3beiJ1DO+cWZn5ixPpIDVtgBbRjhVzGA64Wn5OTN3OxdXRHuSEOktSIVJORRU9JpS0u1Uo3MXJkhYPlfG1mNwUw0F0Z2eby7z6LspVkmpfE/3dVS5hG97UJzTabboqHh075gRpAHOEjZNVEWv+Cl2cg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ZWgDK2gfss6nCw0duayJTOuJDbB2cEVGAbrig0xfs8A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=h38O3X6a
Subject: Re: [Buildroot] [PATCH] package/mbpfan: fix build on musl /
 uclibc-ng
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > In reply of:
 >> Fixes https://autobuild.buildroot.net/results/9526503fe8e756bd4444f1fb1e9cf1391c461901/
 >> 
 >> mbpfan uses vsyslog(), which is not in POSIX so only exposed by <syslog.h>
 >> on musl and uclibc-ng if we define _DEFAULT_SOURCE:
 >> 
 >> https://git.musl-libc.org/cgit/musl/tree/include/syslog.h#n64
 >> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/sys/syslog.h#n200
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to 2025.02.x & 2025.05.x. Thanks

Notice that you also need commit 717138c83c857 ("package/mbpfan: fix
musl / uclibc-ng patch").

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
