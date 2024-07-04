Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45DDC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A3EC847B4;
	Thu,  4 Jul 2024 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeCK96KCjH5Q; Thu,  4 Jul 2024 19:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0815E847BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0815E847BD;
	Thu,  4 Jul 2024 19:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0051BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4651F405D1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHrHHd-vNpqV for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B30DC4042E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30DC4042E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B30DC4042E
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1sd99k1oEQ-000C45; Thu, 04
 Jul 2024 21:40:38 +0200
Date: Thu, 04 Jul 2024 21:40:29 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-3-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1131;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=4knVE3dxM1rPjtS1GenN5R0MvWXqdGa+3kNqGn5ysFU=;
 b=EXoRbu/r74s4yzKm/egshwdrv2Es3bwXlSRSJlmLn7K4tapWjKI0vmIgTBy+OhnWuh08G4V5P
 cJnJLpd6h47D0rrfN+B4RXDQ2uCKCCk47/HpYp5THmFYNQZy7w7SQUM
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:GA3yQdIo+mQ1cBY8dl0Jpwljl/352+5wj7RL7Tv0KM35+VLjFNc
 L9t0nyTmjXsh4YVwx6X4oj1fNogsIpBfd5fUq3WrlQ3MvuuZTCs+vxLbBC1Ik6D5QKkhn3t
 nNcMjc4Kg8GTv+DwggMC68AMK9NiPtFnhpqxhUfc4ZeeuZmX2L7fjtrxeho+bmr+oDhi9o9
 D9DFYDpI2j3G1ZJKkS5NA==
UI-OutboundReport: notjunk:1;M01:P0:ccOQsbHKsBg=;4qwbMdH5bM5Sy5i0sPyiGX4RYS+
 UPJ3s3xOFB7XMBES2J3darOgOlRUzvHpw68H0mZ7VEPzwui9dLfN/FKAl8vArV13Tm444zdLt
 XfBgzuV0nmDreocutMOLNZd/ZNfNKGqgfT3wNXzSrVFKZ9+EIAJC1NkzvBtYiQzf+gXYo2vhO
 UCko72oLSBjhFnqQ9ZINTT4RnNpYRFfHlgXKdnSVMYeZ+FfKXdwu/A2GXbj/MjMLgNZ2R7jGt
 z8qpgeelu8IkZy6k8WcIFABpl/a8FzD+hSMbIbx0xNAYI4DE68N8NJaM9wGArJE2Om6bOv4EZ
 InReEIYI6ejc6PCiesLrJSaFeSvzCoNg4/U/8HJbaqZ6KlDZ8Ux075WXLU/QjuLZCBhWljAkE
 PymRzIMicDoQPx6EBiGcMVd7mfdyq7kcySpWjgdLtBbNT92cXwJYfzVeylxJWHhaGBPx8GzYM
 7B0lyI+U5/EL+TR5XjMNB0fJDktdhBfe2fq2Qb1iGrpwEijHi+JDWmZfqpK8NFVMF6YkP6uYz
 yU2cn+dyIQpalY5GFDMwYXw67flBO0x3niRZkxdH96OH+DjJI+WPgtU3qa/VrhgHrkTzsWlLN
 6KQxIrzJXPYBAo57FtziVYJB+AArJUSxfgu6E88VMhopomXMlQlMWI9nA86Ndaw/eXfBAGnPE
 PTl/iN8Aowo5/dUcZmxBi3yOqsVVZUhC8gKInXDnb0yvGsa4bTWo21SMoxPvmBLFuoaL+kcUT
 jp/tor5ZOP8xXmJ4tsnA9zHt62H2CtSCchVQ+SfF1Vqi+YAxjlUowIvrx59/Cf/1GXBzcl7rg
 VRkB2oisSaNLyo4g6OnHpqH/z4jqdj26HgrUFPZyjLzWk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122038; x=1720726838; i=j.neuschaefer@gmx.net;
 bh=ibI8neANXhIT5zGMxyd1mDlCQQ0qLFLUXMrdeMPHiOA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=I1IrXz1fmtnem4Xgiy3OVGh5JhfhK3k3VvdSxFDY2oWJMjWCXqKwbzsj4rZJmSaU
 ojSEr5n+3LN/B/YEsUvMZhKydGXoP0CanCzQPx9iVVuhqIZqYUfZpvljjwxb/wahY
 ZnWvGlVA/+RTg2MMCH1/OYfZzl87ohTM+cPmN4socwhVUSilNia2LVu39u6+jC7p8
 P7N4Zt8J8mGtt4Yi8BI3imlDp5zUa6F1WFvDv1BHJYEV6D8ql6Qiv4/VTWuaJJCpZ
 5Wo/NXKekhwLGQn1O1ec7IiEtGC4ZfLkIi8AZbX231nqSsH9ros12tjDUEvjIrfGx
 sMkhrDICWvubL/Rb0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=I1IrXz1f
Subject: [Buildroot] [PATCH 3/8] execline: bump to version 2.9.6.0
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 3f9ff8a138..76412978b9 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  df750035d0fb21c7265bffb7ed7e1b661de1e842944a2252bdcddc32d0d97217  execline-2.9.5.1.tar.gz
+sha256  ba2a27e97c5eb6bd7ca6a0987a8925e44465a5be996daa0d18f8feca37d7571a  execline-2.9.6.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index b3d2d98216..ee38d3ed3c 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-EXECLINE_VERSION = 2.9.5.1
+EXECLINE_VERSION = 2.9.6.0
 EXECLINE_SITE = https://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
