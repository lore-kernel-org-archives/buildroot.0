Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58577C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31E660F46;
	Tue, 19 Dec 2023 19:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31E660F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id keoWVNyLAXFs; Tue, 19 Dec 2023 19:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4105160F65;
	Tue, 19 Dec 2023 19:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4105160F65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD4A31BF3BC
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D9A41E47
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 19:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D9A41E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pwe9TWWvHT8 for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 19:36:49 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09E0141E3E
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 19:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E0141E3E
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Svn4r24jmz9spt;
 Tue, 19 Dec 2023 20:36:44 +0100 (CET)
Message-ID: <b8cc9bad-dc9f-4e61-ba0f-e9511ba00b90@lindra.de>
Date: Tue, 19 Dec 2023 20:36:42 +0100
MIME-Version: 1.0
Content-Language: en-US
From: Ralf Dragon <hypnotoad@lindra.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
 <7f309df0-ae17-419b-8bca-c52d9ec48442@lindra.de>
 <20231218205156.619643b1@windsurf>
 <f329f198-4cb1-4e61-8e47-0653cab03893@lindra.de>
In-Reply-To: <f329f198-4cb1-4e61-8e47-0653cab03893@lindra.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1703014604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khk+RmM/Me08rjLxafZgOUxJ/QNfQYkxVvvqlN+KoFQ=;
 b=vJIRoBGDQlfK8kS84z29Xdxauk0LTsqlUpDsRbloYN1qTOWbx3Wagj5/NhkaV+3lSXLmH9
 e6cr2gjQTCJk1GOD/Q+daXDbgHNhGbWOfRTrxxQgE19tbMMk33pAT1ybFYK1x0dWGDeB9y
 BOwx7aPrulri8dcb/f7qRbTntzfmaSMf0qR/FZav479T7bOZJ8AylCqf+lLLU/4wZydLyr
 3Ph8gJZ4A6nnckIf3Mc3t//LKvWQoDikrwBLN5IIa8HfINNfiSW+h8RufCAEQZTIHDUKY/
 TGcB8fvHgbNNE6dYY+3BQTJoaCJCKTfwB33GP2mHDP/IcsR9IMwPHOPHauQBIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=vJIRoBGD
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Thomas,

 > Thanks for the additional research. However, we need a bit better than
 > "I think". Indeed, we need to understand for sure since when things got
 > broken, so that we understand how this fix should be backported.

PyQt 5.13 did not mention this module yet in their installation 
instructions [1], but for the sake of backporting it is apparently not 
needed to know when the incompatibility happened:

Not ok are: 2023.02.8, 2023.02.7 and 2023.02.3 (PyQt 5.15)
Ok is: 2021.11.3  (PyQt 5.7)

In between these, the only commit touching PyQt's hash is b36ce7e which 
does this PyQt upgrade in one step. So all LTS branches which have this 
commit are probably affected. (For completeness: 51c22b4ba905f8 and 
7e346f494c1507648f6 also touch the directory but they look both less 
suspicious.)

Unfortunately I don't have the setup to build and test these branches in 
an automated way. Maybe the author of the PyQt5 upgrade could clarify 
whether he used this PyQt5 in practice.

Best,
Ralf


[1] 
https://web.archive.org/web/20190717063706/https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-the-sip-module
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
