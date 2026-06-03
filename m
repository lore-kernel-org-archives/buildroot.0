Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECFACD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548EC61AD5;
	Wed,  3 Jun 2026 18:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRPNDiF_5bg0; Wed,  3 Jun 2026 18:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F36561ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512356;
	bh=ClaCKNw0e6Lo3UzjI4wGIert+I7mbiPFF5Omk1t4usA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KqgXEIiBxjQChBCOf18YjkshYPVk7iLK4PgE8tazB2IVGjeWkTEDLHKucpCMJqNz1
	 5rNls+NrJJiKwA/1KXt6TdgOnWYBfyY6XmiphC7xfR/eXrRA47AplzjI7LlAJeWtRw
	 szt8/eEyLT+TCbZgHSUoEUopSg00BqFkihIEH6t701rupDdwkgA2dBNwb4acttWFtQ
	 leOOphx86w6d1/n6xA3bME5L23Kc+gtCkjom1srhpXSCTc9oKftRiE/TbU6V8bnbfc
	 hD+e8m2mc+MHrOs9iLpdkwO3nyddaYphLpA025aBSQhd1Ujj5MoVgTxPAwci8LruwJ
	 saQMonr0xJpzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F36561ACD;
	Wed,  3 Jun 2026 18:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 694F8192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ADD8843B4
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlRGw7-skGjl for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A09A821EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A09A821EF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A09A821EF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:45:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -639261542; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:45:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqb9-0000000CfPK-1oNl;
 Wed, 03 Jun 2026 20:45:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260602124101.287936-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 14:41:01 +0200")
References: <20260602124101.287936-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 20:45:51 +0200
Message-ID: <87o6hro42o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mgQIPhn4c83LzMWWOA7r11wXVkpskzOGJ1bXFt63B3ort58hG8uV0AsyJp5ARU168fUw1Jwt1JIdgpiE5WIriu3900Sik3Dji/9i3I3eECB2WamA2UMi7tXbRo1zh7PzLaV5CICPJAPsjVOqyPCvw/k+8Bnjmt4jZtbF/1C7Aqtea+zkBAK1nyI+UtAzlMn6c+UFrMect0ZJ0smODmS2Z072WdAgi/MpBwYheyY/rAzJLCPmxt1DcKK5uhWyIjqBZI7B/+U4nvx/e7ma/gftwdtity2N9kSSFWgm5wRVRSaAWmGKBiCOciwnnvfQXqSkJwLTAd1MAli3OV4ud1Nhgg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=zdSsmjMqZQIaOyCqGssG1uuqpeYEAYgbaf5RTOQgnaQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=mgQIPhn4
Subject: Re: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-good: add
 CPE
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

 > The CPE 'freedesktop:gst-plugins-good' is correct for this package [1].
 > Also used in conjunction of 'gstreamer:gstreamer', see the package
 > vulnerability history [2].

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-46470
 > [2] https://security-tracker.debian.org/tracker/source-package/gst-plugins-good1.0

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
