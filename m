Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07B0C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D24380F8A;
	Tue, 23 Jul 2024 10:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPZUTIK0eSFP; Tue, 23 Jul 2024 10:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA50081271
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA50081271;
	Tue, 23 Jul 2024 10:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD0391BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A71607E9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVqWQvVcuSSQ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:28:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B7FF607E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7FF607E3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B7FF607E3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:28:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1sns8X2ECm-00VasU; Tue, 23
 Jul 2024 12:28:49 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:25 +0200
Message-ID: <20240723102832.2522307-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:pV1uL90miOs/+Xp0/OOjZ6P30O3TdBA0Ta1VAG8xtN8wK92hB6Q
 tuyWOCkEeInNN2IcvwEVmJJktbqQKJgtfW7u7JUzugV78Ge4TBplF+q6mp6bgzYPhExdjcP
 c2ii/VMj7z998WoWP7dX6IIXe8ZHHXObEQdvOldyuyznuP7XesK+bMfK9I5d/50y/6pjevO
 m4wNuJN7VV5lZSKy9ZQuw==
UI-OutboundReport: notjunk:1;M01:P0:tNwTRb+U6kY=;pN5hFkKHUEbcqQcRm8/Q4GM6Ba+
 NwKCSKT1NpsmoFv97C3gNALeJTgvXmyTafptD4MK3MZLE7in/DHt58rTiZ4prLDGKrCxyppLd
 FT7S6+TQDbzHuWFTUO1hpFRoopbUu50OQ4NBqiqYuNqMLHGtuh4Frzr/lbe49FQOUpfmb89uO
 JFBOPmPuHiNUCW/iQM799KXwW0SOa1pYAXjPka1z9+NXTCGC22SYOiA8uiBVTAhd5XRyZrgpk
 cA6uWkXWk2ZrQ3BWFYSLdWXmTN0pjnEbjcPEroAT1ZgyuCYBAHoFrVDsKrdrdTsNre51WygdU
 /4zAQAWx9SVz/CvXgnY2km3ZOpP4A9IlAE7MmS+fa/DgwXOtV4lJSWq5BE1NojKibF4pue6xZ
 5gBjh6xS7/kou1oqYGXB/0sY4SdYjA+WUXQuEAxbcaMbroyponMbmjioKzZx46/S9mUnIenP/
 Cz3cnluFTqS2OpIuVh0PlRAYgO13q/ZI3w7VcWC8oJ1Uv1TZ7Uevd+sfuBzL03qYnm4H7bLni
 NCsy5xRu46/N7HYbQAfEisT+5FbVMdYS/c3D1E7XEhEyy6AncP0/pyGhzFYzduS27cmlmgD7f
 60ZDRZf1R3DYDOUHLBm+NmlJBcr0PAcDEueAYDX2ZYnYu9is9Fy8UMP1kx6MS/EnjLOGwUeKt
 I+UlIi0rY/6uXI17qvevZN2LXcLKvm/HlCoqUAemYTCzn9d8y18FBHNdFsTi/MQxsdAihmnIP
 VTlCybX887J8zUFMCxSPwj9MXXxF/7cOytv8imSF76ZY+xpzuVtVR8foyHGd8pE6OlBpo0V0X
 k84uimK2DVT1fRqKqAf0uerQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730529; x=1722335329; i=fiona.klute@gmx.de;
 bh=BWn156GroJubvjuPMF7Wmz5egKXEKh9Flh6HIeDWciU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qiI3rAbXDhAJrL8iHYsNh2m7K7DHA4DKoVJGvG5PVIPwbkzLU6Epzb8EcVnSukkp
 BM6od5VYr4w+90AMRLWfugeEqAuB0OBz9KdtjJKVATMooMg0oAQ4CxIOf9Src0m7l
 oE34u1H+phFRWxwLW9ZBzSC9o2w7LrV3yPJ0bu+TnFPALxVN/WxPZW4UQAPR1pjwi
 Y7vGEvbDkZQE1KRErHeCN8+Rt9/cl+H8lJDEKNeLrTaHPM0RWO9Xlk22Dyltf5UCM
 ks1l8q0Of45dLuQfnWyVXrYgP3pE21ZMbc2S7ICpLJ+7+LKXUccCTciWU9TQ0qzgq
 O+2UPjG6JRlEBgejWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qiI3rAbX
Subject: [Buildroot] [PATCH v2 0/6] Improved nftables firewall support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series builds on two patches I've sent previously before, with
the main goal of supporting firewall configuration through an nftables
rules file. Offering the choice of iptables-nft as the default
iptables implementation (smilar to e.g. update-alternatives on Debian)
makes it easier to integrate that with legacy applications that rely
on the iptables command (e.g. Docker).

Patches 3-6 have been added in v2.

Changes v1 -> v2:
* clarify comments & commit messages
* nftables init script: Warning about missing flush in ruleset on reload
* nftables init script: check for rules file only on start
* nftables init script: return nft return code from start/stop functions
* iptables init script: start only if rules file exists
* add tests for init scripts
* use long form options in init scripts
* fix typecheck warnings

Fiona Klute (WIWA) (6):
  package/nftables: add init script
  package/iptables: optionally default to nftables compat
  package/iptables: check for rules in init script
  support/testing: test for nftables init script
  support/testing: include init script in iptables test
  support/testing: fix MyPy warnings about BRConfigTest

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  1 +
 package/iptables/Config.in                    | 12 ++++
 package/iptables/S35iptables                  | 14 ++--
 package/iptables/iptables.mk                  | 10 ++-
 package/nftables/S35nftables                  | 66 +++++++++++++++++++
 package/nftables/nftables.mk                  |  5 ++
 support/testing/infra/basetest.py             |  4 +-
 .../testing/tests/package/test_iptables.py    | 18 +++++
 .../testing/tests/package/test_nftables.py    | 37 ++++++++++-
 .../rootfs-overlay/etc/nftables.conf          |  8 +++
 11 files changed, 166 insertions(+), 10 deletions(-)
 create mode 100644 package/nftables/S35nftables
 create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
