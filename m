Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6B9EDEBFB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7775A60723;
	Tue,  3 Mar 2026 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJ3sksBm-11d; Tue,  3 Mar 2026 21:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1431060719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772574520;
	bh=ReWaYsI8iHJXhrUuvyk+MeubpmuhSaY/vpBt22VHbHs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGdPhGUUuWcGWCTZBwDnrMP3cjESlWuL8c3H5RzAQ3vyNUy65/M+HQQyguWL3g+To
	 x200kZt7mW9TViJR0L67CGYewIoNOQmhtwhZi4b0wrwLMS58bF43G8/OhGgwmxMWuO
	 jtvSv0qlPsVuX2r+S1kJ+SanPocqH89Wx6ncBt8sryHlBpgI1PXPjKs1ZBlw6C21XP
	 ordCK+8UU4f+vfkpS/MM1JrymqMUzAwyNx645qUoA4bugUxgtUnZc6IRhgcKlUOH2E
	 NgnAYQ7w7aZKLQo8+g8lgYFEwJvV/+1KlP2GieacN9EUeQGRNDTEVRfeKhfa6zGM1y
	 R4pojY9vvfAvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1431060719;
	Tue,  3 Mar 2026 21:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E792225B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCF464023E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnYlgRC9TprK for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A86540236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A86540236
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A86540236
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:48:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 677689794; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Mar 2026 21:48:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vxXbW-0000000Goa5-1XCy;
 Tue, 03 Mar 2026 22:48:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260218015427.1986765-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 17 Feb 2026 18:54:27 -0700")
References: <20260218015427.1986765-1-james.hilliard1@gmail.com>
Date: Tue, 03 Mar 2026 22:48:34 +0100
Message-ID: <87ikbcinyl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SGbMF9qnDMXP/L4RgbqWD2E6J2h2z4XtfGs4+TV0iUpU/DlV/Ycg12bBEWLiPdD2QrOrwipjwq+6w1MXYyhHcmGPaq/tV25r+hDpaXDAUJcRxzffEkG5vQZhNn8hfC+JLh5WlT5alfrRAA3OKQbzXjGOiPOcgnBYSi+Zkak4irfIvsvGv2ABjC2aSXGmcQqhpTaS5Sv5/WtRt3HG6peaRd0GaGhvHPdAOkXRvoLgfuKOhbiKfQRLVo02Wr7vDdyuiQymJ3PozWc6hdI6lRa2/rMmK+S+b5J+2XJUDNKKvHJk8vnZXuk50Ak8Jv+uRzXdtGrKWZAnjZmUTF9LPajDlw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=x+nJQUuFOHbudwjH7/LqZnXD3dcNWQnX2Nom/luHDww=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=SGbMF9qn
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: disable zjit for all
 builds
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > The zjit option introduces a rust dependency and due to that not
 > being handled appropriately it can cause build failures if this
 > feature gets incorrectly autodetected as being available.

 > This feature was introduced when ruby was bumped to version 4.0.0
 > in f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
