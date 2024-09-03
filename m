Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53341CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD156059D;
	Tue,  3 Sep 2024 19:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vb2y_pdD2fNB; Tue,  3 Sep 2024 19:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 248BE60683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248BE60683;
	Tue,  3 Sep 2024 19:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38BCA1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2672680F5A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iiyDMFDpdHp for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 285F680F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285F680F4D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 285F680F4D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:31:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9C99C0002;
 Tue,  3 Sep 2024 19:31:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slZFh-005vfc-0a;
 Tue, 03 Sep 2024 21:31:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240807082251.59331-1-buildroot@bubu1.eu>
Date: Tue, 03 Sep 2024 21:31:45 +0200
In-Reply-To: <20240807082251.59331-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Wed, 7 Aug 2024 10:22:50 +0200")
Message-ID: <874j6wleji.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.0.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Django 5.0.7 fixes the following CVEs:
 > * CVE-2024-38875: Potential denial-of-service vulnerability in django.utils.html.urlize()
 > * CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
 > * CVE-2024-39330: Potential directory-traversal via Storage.save()
 > * CVE-2024-39614: Potential denial-of-service vulnerability in get_supported_language_variant()

 > Django 5.0.8 fixes the following CVEs:

 > * CVE-2024-41989: Memory exhaustion in django.utils.numberformat.floatformat()
 > * CVE-2024-41990: Potential denial-of-service vulnerability in django.utils.html.urlize()
 > * CVE-2024-41991: Potential denial-of-service vulnerability in django.utils.html.urlize() and AdminURLFieldWidget
 > * CVE-2024-42005: Potential SQL injection in QuerySet.values() and values_list()

 > Further release Notes: https://docs.djangoproject.com/en/5.0/releases/

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
