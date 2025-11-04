Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E64CCCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 21:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7C940EC9;
	Tue,  4 Nov 2025 21:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvYwGtPl3tmM; Tue,  4 Nov 2025 21:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDBF40E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDBF40E14;
	Tue,  4 Nov 2025 21:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2AF462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCD458330B
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFIjkmkR-sQn for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 21:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71B5D81A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71B5D81A81
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71B5D81A81
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:31:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1539206041; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 21:31:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGOd0-0043Lq-22;
 Tue, 04 Nov 2025 22:31:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251103211146.57344-1-thomas.perale@mind.be>
 <20251103211146.57344-3-thomas.perale@mind.be>
Date: Tue, 04 Nov 2025 22:31:46 +0100
In-Reply-To: <20251103211146.57344-3-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 3 Nov 2025 22:11:42 +0100")
Message-ID: <87a5118oxp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eWo43AnHa213GVB+beZJmnKsvJnmS8IBhktVeySZSpWeVVEBftbiajwJN+FqbBvaRuNpLhKQSSc/I2VpKJtPCtSSujMH9Msuo8vG/GtKwjnlqpzTShJqNM3fXzfQgz1kXvx75FTrf/YoZzpu0q1CHUs9trlgzHD4ox/ddeqU44PMrVQ/EFFEE8IVJn7zbnsel/E0YM6EXmpvgzI6VN3b+fyzkWOk/11W9GbVY46rWoSvWCtdp6xRf8WQvsi3ZPR+ZwklPh9qYkzChTgf1PS4p0UJvIB7vxExgR5Kt3kdLJzZso8T5XfCs25XUqChaNKqm30VEZTa6rHUXPRSpO7HuQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=BG4EwuvaH9ZKj6uy0ovHvJQOF2IKrdUaoEyWrApK7Fo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eWo43AnH
Subject: Re: [Buildroot] [PATCH 2/6] support/scripts/cve.py: fix CPE matching
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Given the following criteria: `cpe:2.3:a:oneidentitty:syslog-ng:*:*:*:*:-:*:*:*`.
 > The former `cpe_matches` implementation would match with the following
 > CPE: `cpe:2.3:a:oneidentitty:syslog-ng:4.71:*:*:*:premium:*:*:*`.

 > The 'hyphen' ('-') meaning is "Not Attributed" (NA) a criteria with no
 > attributed software edition shouldn't match with a CPE with an attributed
 > software edition.

 > This patch also create a distinct 'CPE' object that aggregate the
 > function specifics to CPEs like it's done for 'CVE'.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
