Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DBFCF8864
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 16:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B1C40F01;
	Thu, 20 Nov 2025 16:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8IbhqhoCO19; Thu, 20 Nov 2025 16:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42834092F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42834092F;
	Thu, 20 Nov 2025 16:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 809B137D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F076816E0
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr6dRB-fL-2x for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 16:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B14181353
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B14181353
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B14181353
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:01:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1665796346; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 16:01:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vM75t-00000003pKU-1jNI;
 Thu, 20 Nov 2025 17:01:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20251119214302.3248072-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 19 Nov 2025 22:43:02 +0100")
References: <20251119214302.3248072-1-bernd@kuhls.net>
Date: Thu, 20 Nov 2025 17:01:13 +0100
Message-ID: <87cy5clmly.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BpjgZTTnq2Q2piOaoYwMnBWOA/0RwiA4II32osWJQnnhnPESDRhm7+cUpOs/zwlwUTZT0mnIDtNKq1YD0jrr7aa/O3QwUk2swc1cR2oCilt1SY22oYBRhi9yufz4Lq3kIzwqOkaNFM19+uR6cDT4xbcaKuASalcuZQ6Z/54a8YLhr75dlKSS+RrcpsNKCV/WhgAk2u8oBeqGxij/xPJjIHZwQN1RqP77HsiAD1+sOaBtqSTZ9NOle70j/5xHKJXTajkClC6LodJd7A6kSxdgalmv8FjpfTrPG+dWj6/J3tWwCbPLrJPfdQG5665E1oKgk8zfv1Dzo0OEHsH3UIcEYQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=CyJdrNJCkcZzXzATDRxVtVB62w1+c1WsT03XHPX1sEU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=BpjgZTTn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-scp: fix dependency
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a added this
 > package which selects python-paramiko but forgot to add its dependency.

 > Fixes warning:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
 >   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
 >   Selected by [y]:
 >   - BR2_PACKAGE_PYTHON_SCP [=y] && BR2_PACKAGE_PYTHON3 [=y]

 > seen with https://autobuild.buildroot.net/results/423/4235283218bc49f53bf7cafd4a67f380dba659c0/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
