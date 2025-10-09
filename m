Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0779CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9414840EFB;
	Thu,  9 Oct 2025 19:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzZGPiCxvK19; Thu,  9 Oct 2025 19:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FD140E5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FD140E5C;
	Thu,  9 Oct 2025 19:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E569014B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1DFC61396
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5iP9Tw6cqua for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7CD7612F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7CD7612F4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7CD7612F4
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:46:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1180255749; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Oct 2025 19:46:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v6wb8-0087IP-2I;
 Thu, 09 Oct 2025 21:46:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
References: <20251009155602.224265-1-fancp2007@gmail.com>
Date: Thu, 09 Oct 2025 21:46:46 +0200
In-Reply-To: <20251009155602.224265-1-fancp2007@gmail.com> (Scott Fan's
 message of "Thu, 9 Oct 2025 23:56:01 +0800")
Message-ID: <87zf9zx3h5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JSuBd3ICh4PmAGV5CHsPUeWD+3GJ6Q9svCDoPedJbRU5LzlucEwA1PzHblTSBUZFi2GhQUaPRoS9wZ39WlOeGNsZ/HPGIztAEFXzkIqOo/XQ55CwrCuejEIBHCZN2HrVeGmQveLaYOspbYfRQoslKm6Z863AOgEjWRQSI0LXwA6EAvNB91t0G8O2SyaM4cxc9B54dWOcoaIn2lTubFE+gYfG3J13N2dacD108sOHqDC1aLmFYoBvIWV/i8jO2pG0skfX03n4p3HFsdU8qCeMZ+U2704iCWBMIBWC8WrcdCAQyHRm5jGgmPBwabDyolE6aD3Kv9gsJ396+PYFxoMC9w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=US8AQf1Vjl/eJxKkf/0rcQ5UealKHFT0SCk1MARsUoI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JSuBd3IC
Subject: Re: [Buildroot] [PATCH] package/chrony: bump to version 4.8
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

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > Release notes: https://chrony-project.org/news.html
 > Enhancements:
 >   - Add maxunreach option to limit selection of unreachable sources
 >   - Add -u option to chronyc to drop root privileges
 >     (default chronyc user is set by configure script)

 > Bug fixes:
 >   - Hide chronyc socket to mitigate unsafe permissions change
 >   - Fix refclock extpps option to work on Linux >= 6.15
 >   - Validate refclock samples for reachability updates

 > Signed-off-by: Scott Fan <fancp2007@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
