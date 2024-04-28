Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32264C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 20:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D001F605C9;
	Sun, 28 Apr 2024 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPA0zzGIgHqL; Sun, 28 Apr 2024 20:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDB7D605DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB7D605DA;
	Sun, 28 Apr 2024 20:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7862E1BF370
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6540B605DA
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvukAB1FWXUr for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 20:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 978C1605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 978C1605C9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 978C1605C9
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 20:12:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80BC920003;
 Sun, 28 Apr 2024 20:12:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s1AsY-006hia-2k;
 Sun, 28 Apr 2024 22:12:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240401172051.68246-1-ju.o@free.fr>
Date: Sun, 28 Apr 2024 22:12:06 +0200
In-Reply-To: <20240401172051.68246-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 1 Apr 2024 19:20:51 +0200")
Message-ID: <87a5ldb621.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fix trace-cmd runtime
 test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The trace-cmd runtime test has a typo and fails with output:
 >     Traceback (most recent call last):
 >       File "/build/buildroot/support/testing/tests/package/test_trace_cmd.py", line 53, in test_run
 >         self.assertEquals(exit_code, 0)
 >         ^^^^^^^^^^^^^^^^^
 >     AttributeError: 'TestTraceCmd' object has no attribute 'assertEquals'. Did you mean: 'assertEqual'?

 > The issue can be reproduced with the command:

 >     support/testing/run-tests \
 >         -d dl -o output_test \
 >         tests.package.test_trace_cmd

 > This commit fixes the issue by removing the extra 's'.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
