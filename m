Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25CBC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91D960E43;
	Sat,  9 Aug 2025 22:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYJkldgWhT_I; Sat,  9 Aug 2025 22:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AFFE60E20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AFFE60E20;
	Sat,  9 Aug 2025 22:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97F5531
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ECBB40ACB
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylfmcxAgcMn0 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:45:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E478140AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E478140AC2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E478140AC2
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:45:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1vC37R2Rnp-00NadE; Sun, 10
 Aug 2025 00:32:36 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:32:22 +0200
Message-ID: <20250809223229.2307960-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:MkyejrIs1/IJT/IW6yjuiRtcWuoFtGsVbUXLmKRK3oQOlg+/FwN
 LSgYpDRJRkL+ef64TjIyetUdPBEqfunydpUPH6hZpKx8+gl/wr5lnt+hNm8hNEcQUyhSpSV
 ShPTMHIeENQklWXF9OgIDxL5yDbZxZmC+t1uJjhGbVq5egsBoypH+T3Tek+iwTzhj8hCV/7
 8KiQjk9mB8fXbk79/MNvg==
UI-OutboundReport: notjunk:1;M01:P0:Q9yOHywl5sY=;pkwrnHeCrCkslggLu9FC+D1vHMA
 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
 9XVjYfXjAU5yuyNVGtAG/2zK5f9NQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779512; x=1755384312; i=fiona.klute@gmx.de;
 bh=40oEl53IpFd69dsE1e7pw0GSgQeIBS9K2G2cBR3Nc0U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hQ02wq5L712Vojp46y36CzANrvH6XXSz3xnNSMhOW3KrIzo4Ybdaq1x5u7SdBYfH
 TEx3AgrSEuceQNbH/ENwJCmow3Zg4IP7jFvOo6fWK5iopTgspSNOCFTRjduEKf7nW
 NUf0k8eWiIIOQdX82ORc6QAaZzHdbBCq65wh7BlPN2PBKQQRVRxK4w4XWht+o22Pm
 jAgbNt2HgD8fhI9m1SPvT8TwaZ8fDPVwMVr26JAqNBBPmf8vbc9rwiEz8HTC1cSBO
 YV0BO670ILYLK7z/2W9FYQWx+aT+9ZF8x4x+EbMTuUeHR2H6MU2n6pV3fTnEnKwjV
 nbHCeA9nF7FdVwjHaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hQ02wq5L
Subject: [Buildroot] [PATCH 0/7] Add package/python-memray and dependencies
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series adds the Memray memory profiler for Python [1] and its
dependencies. I needed it to help reduce memory usage of some custom
tools, and figure it might be useful to others for
debugging/optimization, too.

The individual patches are fairly simple, just a bunch of new Python
packages. Memray itself includes a binary module that needs to be
cross-compiled.

One thing I'm not sure about is whether there should be a separate
option to enable building libdebuginfod in package/elfutils, instead
of enabling it if the dependencies are met. Having an option would
allow people who need package/json-c and package/libcurl, but don't
build anything that links against libdebuginfod to save a few kB (in
my arm64 build /usr/lib/libdebuginfod-0.192.so is about 38 kB), at the
price of slightly more complexity in the config system. I'm happy to
add the option if that's preferred.

Best regards,
Fiona

[1] https://github.com/bloomberg/memray


Fiona Klute (WIWA) (7):
  package/elfutils: enable libdebuginfod for target if requirements are
    met
  package/python-mdurl: new package
  package/python-markdown-it-py: new package
  package/python-platformdirs: new package
  package/python-rich: new package
  package/python-textual: new package
  package/python-memray: new package

 DEVELOPERS                                    |  6 +++++
 package/Config.in                             |  6 +++++
 package/elfutils/elfutils.mk                  |  9 +++++--
 package/python-markdown-it-py/Config.in       |  7 ++++++
 .../python-markdown-it-py.hash                |  6 +++++
 .../python-markdown-it-py.mk                  | 14 +++++++++++
 package/python-mdurl/Config.in                |  7 ++++++
 package/python-mdurl/python-mdurl.hash        |  5 ++++
 package/python-mdurl/python-mdurl.mk          | 14 +++++++++++
 package/python-memray/Config.in               | 19 +++++++++++++++
 package/python-memray/python-memray.hash      |  6 +++++
 package/python-memray/python-memray.mk        | 24 +++++++++++++++++++
 package/python-platformdirs/Config.in         |  7 ++++++
 .../python-platformdirs.hash                  |  5 ++++
 .../python-platformdirs.mk                    | 14 +++++++++++
 package/python-rich/Config.in                 |  9 +++++++
 package/python-rich/python-rich.hash          |  5 ++++
 package/python-rich/python-rich.mk            | 14 +++++++++++
 package/python-textual/Config.in              | 11 +++++++++
 package/python-textual/python-textual.hash    |  5 ++++
 package/python-textual/python-textual.mk      | 14 +++++++++++
 21 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 package/python-markdown-it-py/Config.in
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.hash
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.mk
 create mode 100644 package/python-mdurl/Config.in
 create mode 100644 package/python-mdurl/python-mdurl.hash
 create mode 100644 package/python-mdurl/python-mdurl.mk
 create mode 100644 package/python-memray/Config.in
 create mode 100644 package/python-memray/python-memray.hash
 create mode 100644 package/python-memray/python-memray.mk
 create mode 100644 package/python-platformdirs/Config.in
 create mode 100644 package/python-platformdirs/python-platformdirs.hash
 create mode 100644 package/python-platformdirs/python-platformdirs.mk
 create mode 100644 package/python-rich/Config.in
 create mode 100644 package/python-rich/python-rich.hash
 create mode 100644 package/python-rich/python-rich.mk
 create mode 100644 package/python-textual/Config.in
 create mode 100644 package/python-textual/python-textual.hash
 create mode 100644 package/python-textual/python-textual.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
