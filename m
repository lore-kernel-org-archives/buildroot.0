Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA63460B50;
	Fri, 26 Jul 2024 16:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxNzin99uTQW; Fri, 26 Jul 2024 16:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5ACD60B58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5ACD60B58;
	Fri, 26 Jul 2024 16:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB6531BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89DC406E2
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWPKipj1JhGt for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7241406DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7241406DF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7241406DF
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1rvLB201e6-00jc0c; Fri, 26
 Jul 2024 18:20:34 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:05 +0200
Message-ID: <20240726162013.2183792-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:e+R+l5+hB8MflD0azHDJooUNF4KA5L71rtxbzISQbIdPs3fUT/b
 hiX5qkZv9mkiPafQbd4Hizg1mzYFVBhf7Cmfxh7llRMizXk8uWtBE6tknIzzaOLHIPKm3Da
 Mn184ZlTcKgZSImmevV1pj3dbVDV1L7OZ472Jo/4KhgYgV+azUmdxEzjIabLzDwYlvbqEOb
 FZkg99UZjNyIrWx3/Jkyw==
UI-OutboundReport: notjunk:1;M01:P0:iFc2MNRgQqg=;oWSTHxaCcVegIw5LELNl4Q58qZf
 ksyHcTgaQeyFb6P3Vf2UG8iIpVoQdlEBBmc16mFGJs+mhSGo9uzxoz49oZNEZGK5bMtArVKss
 whFwx7KvJ0UMNq63dMw1AVH8IDroUMscOtXyB6qynkYiRNZROlSpgSFsbyKWa6R3eCz/56/aQ
 9yYTcWv4kMblKjuL1G8UjBQT7cMRk0lkC4yfxmSKJ/tif3DAbTAkjja0A+oC7oExKSVOnW2IK
 mlzx+DHAE0QuIRytUvjI2biRMC/Cw0h2BURsyTC07ID00ShgZB7YLB+uJqaT3as7QQynbBP+u
 0gqjp9AjezZsM5C1QqPIEfwv3N9+ACFTdz8p8RP45fa1bckLdj3FZqjKNhK+EpCrOuOo3EITX
 lgvVzp8/NJ1kDCL7qqhJT+Du52ApJGwsTpsEpmkH0tubUsR5+DQnMPHMx6CvYlmbJebV23ww5
 c14Fk/TISW2WpARQyz7grE5DE6iM8PKZsHiaLyfXJVGt7pppKi3bhvAMvGbMzFFZF/qH3Fmt0
 BxtUu2iYEJKRGYELYlW3ZDY3CS1lLeFNkU7IlB12XbprIkEDjIPqbJ3dxQeVMk5fTWlVXGQEz
 VJ4XQ+v2Eqlx6dYYIeYunol2wtFLdh3rBy3FdczYrDAcqGl8fBLCM/EjksanYtkgMIJVsjbDB
 uFCHxIhNlIzxie1cyFwbzwD1myNfVDlJfLnyyB+wFwfTzupTBtB52rjoTaSXAYcEzLZRlyimv
 HPqUpTokbhFLHTC1XVP7Jw8qpjt/myzbgYGwrBAq/lfoeBlDwkXXTSYX5nwc4eNtXLsziYFTq
 ZeFX3pGon/JnInnS5lz00ZJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010834; x=1722615634; i=fiona.klute@gmx.de;
 bh=eCwuwF1cb+Z8/RWdS17k5C1FVO+Wy/CWpxf+OPVllL0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tuVdGhIdY2aqez7MiiNK7aqXpFqsFVpJpEC76n4+j2upGUnwydmv7UFtJhP9ZtU4
 HZCbatouDeA8UouRNUWGgWHcpqzGoqkkeuItNQ+ZbnHXwaIKgGy5DgcrWnacFKeZV
 /NBQXrtyHXQjebpCbO2+kD6orHlsuNJ6l6naL3mGkiNjry0+AHYOq58UwVRQQEaF6
 RSLhDXiOktZlp5jyjjAXcD+paXWVApy5eAGpz7xGNJeeS1vb98eB8J6jd4Cr7CcJ2
 9lnhSVYV0NA8ZEPfbcqLYUOQ+Om5fBCs7Qe+PLFSmRl4gVV8x0kUSm2Vf2YmOwMVt
 ix1N2j6IqpO//rph6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tuVdGhId
Subject: [Buildroot] [PATCH v4 0/6] Improved nftables firewall support
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

Changes v3 -> v4:
* set ip6tables symlinks when selecting nftables compat

Changes v2 -> v3:
* move change from "iptables -F" to "iptables --flush" to the correct
  patch (3/6)

Changes v1 -> v2:
* add patches 3-6
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
 package/iptables/iptables.mk                  | 13 +++-
 package/nftables/S35nftables                  | 66 +++++++++++++++++++
 package/nftables/nftables.mk                  |  5 ++
 support/testing/infra/basetest.py             |  4 +-
 .../testing/tests/package/test_iptables.py    | 18 +++++
 .../testing/tests/package/test_nftables.py    | 37 ++++++++++-
 .../rootfs-overlay/etc/nftables.conf          |  8 +++
 11 files changed, 169 insertions(+), 10 deletions(-)
 create mode 100644 package/nftables/S35nftables
 create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
