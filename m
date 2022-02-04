Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8262BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 01:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBD641673;
	Fri,  4 Feb 2022 01:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BCaug-lx5mx; Fri,  4 Feb 2022 01:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 381714164F;
	Fri,  4 Feb 2022 01:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C94C1C113E
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 01:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B58C605A5
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 01:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gs11j65xJ0GP for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 01:03:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE096059D
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 01:03:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fn0vnup3QI46dFn0vnxjpj; Fri, 04 Feb 2022 02:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643936629; bh=jGapZQlzZl+Ou0cNVJ5CT3sIvewRFcc6oy3LLTHFL1A=;
 h=Date:MIME-Version:To:From:Subject:Content-Type;
 b=dptnzw2Hv6yw+VorNi3ohl/hJCP05oVdumWRzU+VdR0U4yMLsysEP27enlqpgJ2p+
 44qntAH28m1qd414eud6/t8pM+i87urgezTPzbqtz9PDGa0vrZidO4xTJIWmCUc2cs
 rGfH9jqELB9f3Y20R+aRbqX4SygQq1or4ip0Zkp1M7lFGqy9akkAp3KT6+POcT4n3G
 PEQvO/4Gljk9sbyEKGBijSfLXARZk3tE2QU6N+H+ZQjaK1Ap8KI7PMMOcV4pFrqm1O
 MyaWYIblRaIr/3E3mgT5V48psfoBZjIUqwsEwCwpfbqBPRdO4Fwnyw6LVC3PGPcqm/
 h+8opsBfcR3zw==
Message-ID: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
Date: Fri, 4 Feb 2022 02:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: Peter Seiderer <ps.report@gmx.net>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfJV8kUWkRzugiLhOQtj9+QFKjJ+bdYG6vw6cwXaZ5W8cPfhY1CWN9jp5B6rR9b/pXuhrXs4W3jxGXbs4kRhRnRnpynfmGSPqFKGTjv5QSWtSp9CwZRSX
 hsT+YE4Vr1gmOMfCW4eFiJFe98yX9QAp3BpyxcvHdCRxMH6j2ib0JOmWotiP0wH0tSHrdtRK1XNcDBxIhh6fkZOLJIjSDEUZL4LEc4omB6PYkU5Gpd06L4Zz
 YT7e9Irs8zH8vYhUT4wJCkM9BZa+hoy/OOzkXvoOTSk=
Subject: [Buildroot] qt5webengine build failure on gitlab-CI
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter and James,

I can fix this build failure[1] due to qt5webengine, you're the experts 
here, can you take a look please?

You have to build using official docker as I've described in this patch 
for the manual:
https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/

I've tried this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
but it didn't help :-/

Thanks in advance!

[1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717230

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
