Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FCD3515E
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80798100F;
	Wed,  1 Apr 2026 09:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GaB_PwqBhD3; Wed,  1 Apr 2026 09:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306B980F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775035409;
	bh=G2DXF28O/jXSHx3nKncHaBCETZ2Zl8WxJbWNxSg0UIk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFoMP9tB6EGCT7FU856gGHOlV1yvUr8fQMSdFgcgbeWmsofC7eLOlTuTZ3mbQt+qa
	 rvQz+yFNJgyu4XF5iGBOY8wEb648ntsuAIGFwK99qP1PhtmVgizuRA+61YCBSujvze
	 5Wazjgn/kFZaqTxG5K+N2cdoEJ0WzrAIynX8VT7TYyDtiiLw+TEqpZ9MQrrF/92qwi
	 j9xcMkZVQvvzh1/CFxQTmGq937MwLC+QXQqAg27+qVokJjIxW7bdOc8dSwZxfXSPLW
	 MtWzOnU/Ds4ICliB1IoD5qxF0fsZnh5uVPLAVPF8qafLYxEwrxqK+anzuMadDET4mI
	 GU4sSEKSfnBrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306B980F8D;
	Wed,  1 Apr 2026 09:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 635E02A2
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4926F80F8D
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVZikeJCwwX5 for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C75C480F1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75C480F1B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C75C480F1B
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:23:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 125077073; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Apr 2026 09:23:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w7rnG-00000005lpx-0jOQ;
 Wed, 01 Apr 2026 11:23:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com> (Luca
 Ceresoli via buildroot's message of "Tue, 31 Mar 2026 13:05:41 +0200")
References: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com>
Date: Wed, 01 Apr 2026 11:23:22 +0200
Message-ID: <87wlyr5911.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=laiM7+EBbQrtoimsjoOFh2gXLc2kt81wPzrSWk0UN1RDnNHtkk3uPcCQhfZytQWljE1NnUeY6iHrVg1DCA74bt9LuG8TOAhILpx8sW/L3lG5wuQI3NukJf5Sbumuj9aKv0iwj4y7iiU0AwXwB8VliJeZcKVqUsNd++tQ6EtVJh+0+zbxogX0M4FyAHvKqyRozBwIQXSG0feBXQdMADXJnmtEpG4TdjtIeVDGIVhMQF9gPRMzBEmNQqfnPjZ06O5sQ78MNRBnkcE4/yATRSmg9AiKO2OHu+WQekSx92SNd2kPl62b0CDNmehiGe+bMwGiYTICqmqD24BR80uj8k+KWQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LxRy2l7UdA7q7GxsBoBbnFCC4wl5c1kQGiYpx0cou+U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=laiM7+EB
Subject: Re: [Buildroot] [PATCH] system: fix typo in comment
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

>>>>> "Luca" == Luca Ceresoli via buildroot <buildroot@buildroot.org> writes:

 > Fix "TARTGET_DIR" -> "TARGET_DIR" typo.
 > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > ---
 >  system/system.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/system/system.mk b/system/system.mk
 > index 52e810868a82..3da9d3b2ddd1 100644
 > --- a/system/system.mk
 > +++ b/system/system.mk
 > @@ -60,7 +60,7 @@ endef
 >  endif
 
 >  # This function rsyncs the skeleton directory in $(1) to the destination
 > -# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
 > +# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)

Heh, who wouldn't like to get some tart? ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
