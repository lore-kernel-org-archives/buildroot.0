Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FFCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 945C84054E;
	Sun, 17 Sep 2023 20:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945C84054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5RnVI0siu2R; Sun, 17 Sep 2023 20:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9258740598;
	Sun, 17 Sep 2023 20:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9258740598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94CCD1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB8781604
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB8781604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1iY4aFnddYW for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:51:15 +0000 (UTC)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78AB88151E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78AB88151E
Received: from localhost.localdomain ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyjUqU2javDh7hyjVqmc5O; Sun, 17 Sep 2023 22:51:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:51:07 +0200
Message-Id: <20230917205107.366824-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230917205107.366824-1-giulio.benetti@benettiengineering.com>
References: <20230917205107.366824-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKZmtonaB9fvQAsVx3RO/+jZ5N5VP0VbsQ+ZUKIEUhclYvFpfBZmpezn/KoK3q/vRuo3rkl2YjqXX0EdA3fXaP0rjqJVoK2/luTXe9gy8ElfF1oCvdLr
 gNE4DIG0+BoxVIfXYnUVyd/mh4T92kxrhAw0BHZ6KPcUGoaQ/j+JxcvRfecKrVl4VzXVsyJc5v5nYL80R3ubELEZNbR1bG4ymzMPSe8icIfAnEwKh5T+pjxF
 VdI0yeokVG7EDdE5nZo0/zT4y6nGs1nF4aoQSlYQGJtWtdXWPF2qBKBDqONItUZryjlOwHmjovehWrdsKvRTiq9KlFOf7fjRcFYhYt15M88=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694983869; bh=YjH8zVeGWEL8eoOmy/kbGx35eNWjKgUTfrnOVv5L1pw=;
 h=From:To:Subject:Date:MIME-Version;
 b=lmY9RihGawypeW/fIrjOSuDLfpdLCEpA+ptTxq9/fjHvv6PZ360JUzD+QvO7y2orS
 uVCa7EoMNX8fyR9wxBTccnDYEClRAOUUwHWUjA8gUvilyfRLAjLCBr4o919eroHo5Y
 CejYRyYBbpTTJl2hbZ4tFlWtmD/R+AplV3v6vf8J1/4HrEoybarN3MaFlcktOpH2qf
 bcPVSjn9KiG0EJWz9xvwE3JpPhF9IquHJlS3tO/tI3VvkdpF8WpOYOZgNP7XdMsqo9
 UR+b+KHo18JHdDguzLTcjaASJiTo58QoMbN8tfDS7sOBYU6AtsPsJjpqWdTxzTdgMf
 QVo91Kuy7tJuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lmY9RihG
Subject: [Buildroot] [PATCH 1/1] docs/manual: add section to explain how to
 give credits to a sponsor
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes it happens that a Company or a Physical Person sponsors the
creation and/or the upstreaming process of a patch, but at the moment
there is no way to give credits to it. In Linux they prepend '+sponsor'
to the e-mail of the contributor in both authorship and commit log tag as
discussed here[0]. So let's describe in the manual how to do that as a
standard.

[0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/contribute.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 384fdb08c1..df3e0af4b4 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -147,6 +147,13 @@ Buildroot's Patchwork website can be used to pull in patches for testing
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
+To give credits to who sponsored the creation of a patch or the process of
+upstreaming it add '+sponsor' before the e-mail domain in autorship and in
+any possible tag listed above. For a company which sponsored:
+"Name Surname <name.surname+companyname@mail.com>"
+or in case of a physical person his name and surname all together:
+"Name Surname <name.surname+namesurname@mail.com>"
+
 [[apply-patches-patchwork]]
 ==== Applying Patches from Patchwork
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
