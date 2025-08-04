Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A742C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD4681206;
	Mon,  4 Aug 2025 19:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuVzjr5pMCYh; Mon,  4 Aug 2025 19:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E5181183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E5181183;
	Mon,  4 Aug 2025 19:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C1DD118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233EF40C75
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXDGljsR3gOx for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57A3740A25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A3740A25
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57A3740A25
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:39:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 560964087; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 19:39:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj122-00BJiR-0g;
 Mon, 04 Aug 2025 21:39:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20250804185310.3345166-1-bernd@kuhls.net>
Date: Mon, 04 Aug 2025 21:39:38 +0200
In-Reply-To: <20250804185310.3345166-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 4 Aug 2025 20:53:09 +0200")
Message-ID: <87h5ymlvut.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ExsnjAYg4iy/dLIomwnfhL6Nu/GmIW/AyfIODWYdCf23KDcFW/oiOr6M8x/Yt9XuWiTynBZvkTLcrFqIXoj3GLfk8TZkQbymtSzN7tJx5WSakmyct5qpofeFRp0KiUCdbC3j+WmuvNIwOFvO26T/wWBxgqAWgl4ap0RLuDDbUc/dBWqQdkn/ZAgNkLomXa6tsVpi/E9M10PMWgQAxDht61eZqu9j7GqJ24OtT/KRHKU03R52nYYcRd50Xg5pwmxbTHGfzz3cfy/2E5JQn7tpX+tENK6zErFRuFq5OIaZ5MjWbM81PXe1SUvocz0+mI5PQ5pg16Qx/5DcHvLB53uP/g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ExsnjAYg
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.3.1
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
