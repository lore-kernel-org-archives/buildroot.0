Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D84EDEBF7
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FF381521;
	Tue,  3 Mar 2026 20:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2yNalHMwq3L; Tue,  3 Mar 2026 20:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9EB81300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772571166;
	bh=j1d/RleD1AwYMo2A0ado6wWe8fPKxLPK2zBeUVVDI2Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPjmIhdrfuYPburcmLNk0IRqmKrtad6v+XpaYH90X5hKVOd6KsrJqM4hwyZlKfvtG
	 FL/lAt6GabJV3lke1DoEnuPnUIwBYm1pISH26B4V90SkU1rJYJxTsAw/1at2X2EHkS
	 5qEZUyMlP+GJ2YloBm8coykRwxuWeCW6gWIaTIgca/VgcE8Sx17AM6UGUn9G6z/uX7
	 mrZ/eYgAI/o+4sUTAR+0m5NdS8vw+ayICk8lHS5+vjAh16gBh5NJ/bU8HwuatC0aMu
	 1uN8xHSu+qkEtxazFLczh9RwXdmBTTipjM1PEJF2BKryDT8wiCgKia1xjrpnEPfZ9o
	 MF3nT2wF0PjGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9EB81300;
	Tue,  3 Mar 2026 20:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 028A6231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF6A40B3D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ptI9K3gd5SS for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 660C94096B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660C94096B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 660C94096B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:52:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1879775626; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Mar 2026 20:52:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vxWjO-0000000GhVQ-305K;
 Tue, 03 Mar 2026 21:52:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: William Sherrer <wsherrer16@gmail.com>
Cc: buildroot@buildroot.org,  William Sherrer <william@sherrer.com>
In-Reply-To: <20260303161540.2906268-1-william@sherrer.com> (William Sherrer's
 message of "Tue, 3 Mar 2026 11:15:39 -0500")
References: <20260303161540.2906268-1-william@sherrer.com>
Date: Tue, 03 Mar 2026 21:52:38 +0100
Message-ID: <87wlzsiqjt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=e4h2bOs097saCa4IQjeGwtbIh4k8EzQf6mk+7SQZ93WmVoM9xjrrP/wdwaeZ9knDjNdKqxGTxstKaCpctiDu8bZJ1L9VO6U9cV+YYkSqH3jiCpQmAn2NnWxYaUnFDyYKnY+I69fWNAPX8/a3m8tWKDs9DC74zGQ03f2YgW9E/ESQ7ZxGCnK8AvYZwOlBx+Vboxc/ytDiyUTMK4Jz5dQZdHFvGOm7d1eCT5WCK0s0m8A9KQCQZDGieQsS6qvUfpQbWY1X5/hdcU4MPB2yZyqwfCz73+UNPBWHeGuR28DwKodYgKS8SaL0WLp8yJ9DID+A2ZskEEtCP2Pz1ccvn1EheQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=FWwyqCLJ+6CaN23Be83wk64yhUmwGJDJjaQy2DBCorE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=e4h2bOs0
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: fix extension dependency
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

>>>>> "William" == William Sherrer <wsherrer16@gmail.com> writes:

 > Signed-off-by: William Sherrer <william@sherrer.com>

This is not really a good commit message. I have rewored it to:


package/ruby: fix extension dependency after bump to 4.0.1

Commit 127f36b406 ("package/ruby: bump to version 4.0.1") adjusted
RUBY_VERSION_EXT, but ruby 4.0.1 still installs its extensions into the
4.0.0 subdir:

ls target/usr/lib/ruby/
4.0.0  site_ruby  vendor_ruby

So revert the RUBY_VERSION_EXT change to ensure the unneeded extensions are
correctly removed.

Signed-off-by: William Sherrer <william@sherrer.com>
[Peter: significantly extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

And committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
