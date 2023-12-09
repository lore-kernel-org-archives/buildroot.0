Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAAFC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37CA60EF9;
	Sat,  9 Dec 2023 14:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37CA60EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMHQom_7O3li; Sat,  9 Dec 2023 14:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1843660B77;
	Sat,  9 Dec 2023 14:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1843660B77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD931BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63CA760B77
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CA760B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdL59cbdz7-Z for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:55:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71DD360EF9
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71DD360EF9
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB9F71BF204;
 Sat,  9 Dec 2023 14:55:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rByjR-000AJj-0Z;
 Sat, 09 Dec 2023 15:55:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231207190515.509423-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Dec 2023 15:55:05 +0100
In-Reply-To: <20231207190515.509423-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Dec 2023 20:05:14 +0100")
Message-ID: <87plzfpgs6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tesseract-ocr: bump to version
 5.3.3
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop patches (already in version)
 > This bump will fix the following build failure raised since bump of
 > leptonica to version 1.83.1 in commit
 > a4e713558dfd9a6fd6c0677b4b094adc216b720e thanks to
 > https://github.com/tesseract-ocr/tesseract/commit/27b1827ccde6014df1231e1cec6263ee108066e9:

 > src/textord/devanagari_processing.cpp: In member function 'bool
 > tesseract::ShiroRekhaSplitter::Split(bool, tesseract::DebugPixa*)':
 > src/textord/devanagari_processing.cpp:130:19: error: invalid use of incomplete type 'struct Pixa'
 >   130 |     Box *box = ccs->boxa->box[i];
 >       |                   ^~
 > In file included from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/alltypes.h:52,
 >                  from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/allheaders.h:35,
 >                  from src/textord/devanagari_processing.h:16,
 >                  from src/textord/devanagari_processing.cpp:25:
 > /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/bmf.h:48:12: note: forward declaration of 'struct Pixa'
 >    48 |     struct Pixa  *pixa;        /*!< pixa of bitmaps for 93 characters        */
 >       |            ^~~~

 > https://github.com/tesseract-ocr/tesseract/blob/5.3.3/ChangeLog

 > Fixes:
 >  - http://autobuild.buildroot.org/results/46d3ffc8885245ee9a56a528be055b0b27a18245

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
