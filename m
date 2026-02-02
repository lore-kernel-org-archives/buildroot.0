Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F29E73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3132640A6A;
	Mon,  2 Feb 2026 10:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdyeRUQroS5W; Mon,  2 Feb 2026 10:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B604840872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027935;
	bh=fcr1Cey1iNm8RPF/XrODLs3K+413aNg7Kb74ehfKg94=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHZlZsqS14VcVuO6SvN0eCqDSFdGjkcSK0OpcsaL90ihXq6MTwShJiylUiarUIQgm
	 NsuZ0ri5XW07jwHI7gjNDyU1oiYtgukVMiRlymEq6rwnCK+Kn9Qk2qe+wL6dthKmj4
	 fCkF5oDAQK9T/8guw73nNjgtgpLCuwP3pH9d/r2YexnJJOEUvmoRQ4M9lzYJebfSeY
	 NeiGVEKGf9fJQEK6nl2V/WGjFEyQK7+n+Y/iFG+t5mzOm3ldZt8bpvfmXyack3tDqD
	 5K4BbXpFdSHfia50h0mMfFnymWDqeBB5FdWiGROCFbnsqrO1//ks8In8CRwokqu3OV
	 ubPeuny2WC7DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B604840872;
	Mon,  2 Feb 2026 10:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 653B71E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A31D60714
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuc-STDH-Mj7 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BF82605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF82605DE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BF82605DE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:25:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 468821021; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:25:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmr7Z-00000005sRw-35Uk;
 Mon, 02 Feb 2026 11:25:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260119210554.1508535-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 19 Jan 2026 22:05:54 +0100")
References: <20260119210554.1508535-1-ju.o@free.fr>
Date: Mon, 02 Feb 2026 11:25:29 +0100
Message-ID: <87cy2n5tnq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EA27PxvQdXzQo/JSvH++c9cv4ThdIwF299tblWdTo2ZAaP7MW2v+KnCt5B/iIDPtiWxef9+irXtYLXYSdqcRVzqV+pN8QZ43uWsVuEGiD4eJaA5eNNIaq3SoOsjiCKxXmJzN4cIsQwOKP4tqfrPzAO+A1IIEfxUz/TLL4vzZiAMgZYCqynGdMLOTkK0BtT7dxEZWkgKC1Q5fxYsI3qSugRnRbOXx9E/vcXMi6C3+OF0mzyZpfnV6EkxjhJWD8alFQXsjJC4HY8IvsDStrJIjSOwam6OB/+DxEXFL5stS18UCg862vDqB+4AOYS8a8kvfF1gdnxUzSKEisOWVuJCciA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=464YghfFkbrRSx8eJf9fHZ/N3pmimSkPqh8D8mzUVio=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EA27PxvQ
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.11.00
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

 > See release announce:
 > https://lists.ubuntu.com/archives/fwts-devel/2025-November/014113.html

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/12771511806

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
