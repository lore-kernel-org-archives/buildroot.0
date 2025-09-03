Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD17ECA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9434541061;
	Wed,  3 Sep 2025 16:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33vHSaPi7_CN; Wed,  3 Sep 2025 16:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B0C40FB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B0C40FB7;
	Wed,  3 Sep 2025 16:26:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F4E12BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4464041577
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcoIMtmHN_Yg for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:26:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FF9F40D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF9F40D6E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF9F40D6E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:26:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1446688860; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:25:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqJ3-0010iA-0l;
 Wed, 03 Sep 2025 18:25:57 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  "Wojciech M.
 Zabolotny" <wzab01@gmail.com>
References: <20250829202817.2631156-1-thomas.petazzoni@bootlin.com>
Date: Wed, 03 Sep 2025 18:25:57 +0200
In-Reply-To: <20250829202817.2631156-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 22:28:17
 +0200")
Message-ID: <87zfbblcyy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Ic/63zkQDAdkF5q8ipRrc1sOji7QgFLxW77tv9XVRfmncvLWhIvdEcGni38HLQeP3GjLSJUNo2JK7Vh7k2LWPQa1Xfgw2YnFnPPpyST7fJDF5V/k/8gPBa1utAOxWsspIaexMvfI2hk+sZLirQjKkqU5lEQ5ToxRDWIPANS3wEj4KEiUboq5ULwvQ5orrk4WxErkyAIWddzRZaX0xlj7ujTD9wI8gOFlJTlcaIbSD+hNoOrfNYI6Mnd2BKVEeAp4oqy8zOyt6hh6jc6gjKsBj02PAe5Dz3u4G9R8wE7244nGgLRpjq0vJNXrxojvLdIPnHcHWpJ5rpohoyziHTwxlw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=7ncHdx5NqDtDiQZLGOre+hbblTnnM7cP+sVzLif86pQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Ic/63zkQ
Subject: Re: [Buildroot] [PATCH] package/avrdude: disable Python support to
 fix build issues
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The build of avrdude sometimes fails with:
 > avrdude: installs files in /home/autobuild/autobuild/instance-1/output-1/target//home/autobuild/autobuild/instance-1/output-1

 > This is due to an issue in the installation logic for the Python
 > code. However, our avrdude.mk doesn't explicitly support building
 > avrdude's Python support, so it's really only by luck (or lack
 > thereof) that sometimes host-swig and python3 end up built before
 > avrdude, causing avrdude to build its Python support, which installs
 > at the wrong location.

 > In order to address this, we add a small patch, submitted upstream,
 > that allows to explicitly disable Python support, which we then use in
 > avrdude.mk.

 > The actual Python issue can be investigated at a later point if
 > someone needs it. But in any case, being able to explicitly disable
 > Python support if not needed is useful.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f18d47289d8b4dee768275a468c25b4f4399cf8c/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
