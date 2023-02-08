Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21FCC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 23:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414E56112B;
	Wed,  8 Feb 2023 23:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414E56112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQG9Xe6zoHnb; Wed,  8 Feb 2023 23:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8BD60C16;
	Wed,  8 Feb 2023 23:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8BD60C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBFFD1BF2A6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2AFD820C2
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 23:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AFD820C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDfdqxQeeYdt for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 23:07:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DD6820E4
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41DD6820E4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 23:07:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PtX7pysl2niHoPtX7pTp8I; Thu, 09 Feb 2023 00:07:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 00:07:19 +0100
Message-Id: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIRFQOlkk/yCs7FD9zHu8vxTS9b5oBfZHGy0azkCJP0CvnMrpAIl25pV8iSbRADF8o7zMJWOW6p7jXmwniJDLuBNWwshYaxXOhP/YYvyXl83ukaB9rw7
 5K4r0GxNv1qDUPwH+di0Mdwnin1TtHYC7JZVXlk4JXa2ZdIntS7ALXqfOMZ3SvyXDC2Fn6QNQ/gGVLgWFWKxWWGhq+whV85rmkpAS0owxFSr0a9JXXinU4PO
 qj4mghoRKmWdeebru3WPRf3zbwVdItugl3PcAVwSmofMksIo+ofmOcGjpEo+69qEhfxBRG4Rf9+twMC9GUIjg7O4tMwEgrLQfowRcYHEtYE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675897642; bh=gWsldjoXGLt3snXaHZwNMCHepREA6zrC2IL78q6cvZc=;
 h=From:To:Subject:Date:MIME-Version;
 b=lUWiVsYIr3qQ9qWZOB9PjyfBEHEo2seFhgEDzjtv8ZnDqGmwI0NgPukWRwpm72ot3
 pSFeW6c5vrmhBryJQbuZPjMekRTPEs2aFOP4iyGgTYm7y3U71T+Jld3egbDY7YhprJ
 +3pjB4sPkGJKph/uVNl3uTRPSUjiRBQovk4gGe5qNTWYXel2L5it+Ezeenv7ZzEe/f
 cdCmC9S3VThm7GAb4euscrq8T4Mn10RZyp8diicWzMMceQhKCU/SUpcqAaDd5dMsnl
 +QBZbcmpO3T3ahCH5Mow43v+bMu3Xwamoj9kh7wH1p3K5G7KetvmhaKqT+LGJdS2/6
 rXVdOJifKDh+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lUWiVsYI
Subject: [Buildroot] [PATCH 0/2] Bump Harfbuzz to version 6.0.0
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building all packages that depend on Harfbuzz(listed in harfbuzz
patch) I've found that libgtk3 has a bug that shows up while building
libinput because of a bug of a local patch of libgtk3.

Best regards
Giulio Benetti

Giulio Benetti (2):
  package/libgtk3: fix build failure on libinput due to the presence of
    atk-bridge-2.0 in gtk+-3.0.pc
  package/harfbuzz: bump to version 6.0.0

 package/harfbuzz/harfbuzz.hash                |  2 +-
 package/harfbuzz/harfbuzz.mk                  |  2 +-
 ...h => 0001-Remove-atk-bridge-support.patch} | 31 +++++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)
 rename package/libgtk3/{0001-disable-atk-bridge.patch => 0001-Remove-atk-bridge-support.patch} (59%)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
