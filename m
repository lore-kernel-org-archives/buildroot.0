Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC674CEBF93
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3EA413CD;
	Tue, 18 Nov 2025 07:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJvmW-X_V74b; Tue, 18 Nov 2025 07:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0495040ECF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0495040ECF;
	Tue, 18 Nov 2025 07:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB651BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C667400DC
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_VvJkJypeHT for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC1D240063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1D240063
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC1D240063
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:05:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1408324002; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Nov 2025 07:05:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vLFmj-00000001klZ-0KtY;
 Tue, 18 Nov 2025 08:05:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117215250.1938011-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 17 Nov 2025 22:52:50 +0100")
References: <20251117215250.1938011-1-bernd@kuhls.net>
Date: Tue, 18 Nov 2025 08:05:53 +0100
Message-ID: <87ms4j7rce.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XCY5fysCdgYSkAk689cawwKUappOdGlYOCLCqtOtL+wVQwo6YXAu6UboAChg5naY0SKcOkimhyXz4JkOZZnhHha9b0+8NpBYHbMabUNtROeEhmKGcCNslYGA5DliAp5oTcBNKoYdbLZTOmPyDVaI8/ROsoMj/xHMtuzhy/HazIh41ZSfUkePOplXfvqJWzjxkSTd0ZKH6y1fwpLWfxtwj+mFc6ni0/PENUozl1+5zVRvk0f/L+UvYMRmzHW2Q+BlDm/z640kli2rY9J1GAbrtGdgYi/Jssj7cdUGFo5ju997Ve0TTCy78k56kUiLtO+ZJqWompt89r0qqOXUvADLGA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=iTkQmSyfNWQTHHJpMLEG59OAXbiZXOCiIyZdWRjdwaI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XCY5fysC
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Julien Corjon,
 e-mail bounces
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

 > <corjon.j@ecagroup.com>: host ecagroup-com.mail.protection.outlook.com[52.101.166.0]
 >  said: 550 5.4.1 Recipient address rejected: Access denied.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
