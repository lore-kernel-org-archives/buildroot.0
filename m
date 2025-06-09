Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA16C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB1F81377;
	Mon,  9 Jun 2025 14:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id verwkfHz1YVO; Mon,  9 Jun 2025 14:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7159F8126C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7159F8126C;
	Mon,  9 Jun 2025 14:07:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F8CDC8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6EB8126C
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuVcWQyYLzM7 for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 293D981268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293D981268
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 293D981268
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:07:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -104092012; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:07:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOd9R-00EFai-07;
 Mon, 09 Jun 2025 16:07:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
References: <20250608074442.21390-1-ps.report@gmx.net>
Date: Mon, 09 Jun 2025 16:07:00 +0200
In-Reply-To: <20250608074442.21390-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Sun, 8 Jun 2025 09:44:42 +0200")
Message-ID: <87qzzt9fgb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JUCwvkLxW6kKU2h0+DqylJf6XnBFa10/ahW6JqpUNPuk/6AlQgAqxrehdgEib/J9wHEWOkhw4OUWFZh11WCBRS+iZiGLYRIRkOkbntax34TPvV12vdeBUSLceFMWxHGl8djI4UkzaDvLQ1MwWNpBKi+wRw4mCL/nt6a1VCPg5ZJD1aXWnXBttPJvV+yRRqvDb/y4QDCf3FekBxUB1qaot3PxVwAYeLVbqQssg4m/evHlMqlHF6pxr+/urvEdornbQ3eWg1ZP+GrR5pQRQicqjhfxEaI9AWKwipjnMfsaxtTETFHsWXIhFuFGedaJnUBXiUNL7JvQRepMzW5f6OUBtg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ft9uA4xEBDC8hreyV+PA/uJpPUmqRT4LUYK1H9y3IG4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JUCwvkLx
Subject: Re: [Buildroot] [PATCH v1] Revert "package/lm-sensors: update
 LM_SENSORS_VERSION"
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

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > Revert back to the hyphen version schema (as actual returned by
 > https://release-monitoring.org, see [1], [2]).

 > Fixes pkg-stats output.

 > This reverts commit 521afeab9b7c0b07a849355e8b1c1fde0965c84f.

 > [1] https://release-monitoring.org/projects/search/?pattern=lm-sensors
 > [2] https://release-monitoring.org/project/1831/

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
