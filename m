Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01594E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68DA5607C1;
	Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLXYl8P9WaGs; Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2821860873
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2821860873;
	Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB2531DD3
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64B7607B2
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIP6L1jWmBii for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 367AA607B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 367AA607B0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 367AA607B0
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1tDDmj1vZL-00Lr92; Wed, 04
 Dec 2024 19:29:22 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:07 +0100
Message-ID: <20241204182913.4085670-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:noMpS4bOTfbcTV28OQM/sKkuUeeI82MJI7FAVrS3t3tX0RaV7O4
 t5otExk7Cz84Cbdct5Xm3NmKEqWj5UnA4j7byGVS/bL+wDLUdIlOJTkCgASOQcsrGrE62pQ
 udpR/GO9VeJIkSqfk4aS0xbE2/LXYzRtZspI2A9u2ujZsRqq7h6n+61eTRaQEr4Rljdq9eW
 zrN7xR/TauQ1GaRn8D/dw==
UI-OutboundReport: notjunk:1;M01:P0:J4J+LwA7IJE=;t8VOdnEkOZZ6z23Vv3BUFKRsGuz
 Aqxmt7NJ0AsMiy4DWqVSokA/OaVG9dXHCmDIMEMFePheTDV3/9C94rOXD187OiNKlOiBZe9uW
 T3hpiZIIehJkj9nsWFfN0JS7P5eG0okVMdy6aDLGrq2Y/RDhq3PFdcR1xXh5w5kj3QiAin5eC
 NTvDbc13C4KrtUNmhN4/codo1hME1Hf/RpDMkvpQO2uP47mh7VKdCy++ql7Ywj3HLmndfbc+F
 33MpVxScBRds7PmFUz1rHp7XRHsKruCHqVTMQcRiXR0n8HM6kJb5BBwXQN/3Brb/r8O9jgA0U
 moKE8WH5X4V0Qe5yuwR4GpWFZNnfTfWPtJuAdpFdwbH4lpnDrs+BeGXy9lDCm2gHZk61NIJE3
 aKMc1TNu1H6D8KhDVOWXdWSDEabAzOwzjy/0C2uvmNC3KnWlNNAFJeuPkLxdl65V5gmIpfBHt
 vAMoOvXjvk2uUopA+NwuInG9bQsruKYOuKkU+Fszi0vHpAVdy79fUA81sk1Yr+D/j5v5HGzpy
 uojdvDP/ZbmYgj4/IvnJhA7EMcpRGDi7pkqxv0rEESv5mbFdC7xUo3I3ntTCn2kMaY9CINKqw
 REc+3mDouguyUxy3xLIrJJaY+M0JYFqCxxRXTtfg22aitIaKo3jvsXsxfx04Zo8B/bkiCnLOC
 xYv33aXD3LMZytvqcaBhfw9mP69VtV49DO3t0Ebg5XgZqp1/FKfii/vqlvp0j4GjuBS3GXoj8
 QIotQrlnq68cb3VEs6o2ToJAdq5Tqyszre1coP+/OuxZtaIzUil86DbnCrWwYPbXD+ffWg/HK
 VNWjeGmQswqPy1Ok2kx2tG8FR8ey8ro9wPVfdkNDFKCWFmxnK/BlzxLr9kVdtEbHKQaW4SXm0
 V3IQcw/nvrxo5j6Cx1o9RrgNmiAJK5buuE3EWBlmKNd7SAvz4oG3vq2No3WtBinILgiTHJuWh
 ynmatJsq+99o7bla1O+ldhy0/+lAgS3Tc8dkOWk/SlUWqwvjzJw9Bma6bZrA7TbkXBU7gFDwG
 K0o1+e4B2JCNeVec3AhY5F3Bm3q426kuhp4v9fGtE1NMmxl9WwKe5lkw0jxwJV1wcY9EYylUH
 vGLrZGTmNClFN75hlH2VytuyVvTxX+
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336962; x=1733941762; i=fiona.klute@gmx.de;
 bh=1Dekuyq8XB1c7ju8hxCxG0KJv2MNmKgDuIsWjUYPvPM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PwebbNlqWs0tjmOmNAZayFiRASeCDZRjeSFpzOB+GrjaF6ACmbmC+eJYo0s/4ouS
 im/N6LsQZ9LYpu1kS3tZWQ+wLER6KpXolwyhnwPgaAOr3EUvjH3nrh9MNJoXX7uav
 MKzFx9czvlVKpo38SaAG+PqtbsDYnq5DviIjFUsFaeTfwWhY+djfrYkkrEgQinkwv
 OX4pYUAn/9cZEnKIwZOjhLQcU0Ghp+n7daBda/bn6h5fgZQSBLsYhR2tjCeS1Xt2N
 SgbiboYFt7LEl79nEy1P920Aq5+NE3jMhr5sl4MrWb0CxTaaIgIOknGYkOutXNiHG
 PfGl38FZXcAmCwvtgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PwebbNlq
Subject: [Buildroot] [PATCH v5 0/6] nftables firewall support
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

Changes v4 -> v5:
* nftables init script: run any target only if rules file exists
* iptables init script: run any target only if rules file exists,
  except for "save" (which may be used to create it)
* rename series to clarify that nftables firewall support is
  non-existent otherwise
* v4 for reference:
  https://patchwork.ozlabs.org/project/buildroot/list/?series=416810

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
 package/iptables/S35iptables                  | 16 +++--
 package/iptables/iptables.mk                  | 13 +++-
 package/nftables/S35nftables                  | 67 +++++++++++++++++++
 package/nftables/nftables.mk                  |  5 ++
 support/testing/infra/basetest.py             |  4 +-
 .../testing/tests/package/test_iptables.py    | 18 +++++
 .../testing/tests/package/test_nftables.py    | 37 +++++++++-
 .../rootfs-overlay/etc/nftables.conf          |  8 +++
 11 files changed, 172 insertions(+), 10 deletions(-)
 create mode 100644 package/nftables/S35nftables
 create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
