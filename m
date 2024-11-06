Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06A0D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6A380C20;
	Wed,  6 Nov 2024 20:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeuokMJCANrf; Wed,  6 Nov 2024 20:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7289D80BB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7289D80BB3;
	Wed,  6 Nov 2024 20:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3EC44C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9467E40281
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdTRIe0AnYKS for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDE0E40260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE0E40260
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDE0E40260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1tNIks06DD-00IDoC; Wed, 06
 Nov 2024 21:49:53 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:49:38 +0100
Message-ID: <20241106204938.4040083-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZsmLjeSZUaRaxYcUjNmruEPm0M8qycaAxySAEpah/sOx3+Ta/dV
 aTiFUKwbfGgQGjFG77udwgrYcClju/3ccG9Kw7m+oMgl0Zn/6YpqCYnpQlyABSKCk5k4KgH
 0DSLiDyrO/4vv+k/AEX0gNn7BehWsXSKx8TAKk/+Wr65nqqLAaUZg3NJBvIoLXK6E0Ulx3c
 sOetTlQJf55DcHBnjhDgA==
UI-OutboundReport: notjunk:1;M01:P0:ckgVhFT4rc0=;qCmriVlCPCSJpnp/z3IkXUzjxWe
 2lepYle6rUWqhkof5gbiuRXH0Kin/D4vJ9/vIfB3DIxHsQ8qOjsH8jv7I0/QH15mAgN51hPGh
 0Lj7r2ah3cRL/oItQKW0w7Qw/md/eX9WGgEC0gOtv+xad66AdXc2RNy8Zd9UDU2isW/8TOXre
 /yVYX1NRtVIuN3DKqdSa+jah/AJ3pXMKYML8JMGRr0O+Ut32n9kmY/JEC6V2rC+IPu5SaLEwa
 T4sPlvu0K9uk5ZucdiECtT8qsu3AjSHk/aCtPhqM3X+XJe0ElOigqISfX6mCxhmRdxlSphbcJ
 wfUUflyYob18s3AMF3t6DoGtedP5abxveR8Cu16hTevpnC3QeI1bcqtdGU/i8gQZxbZjoapJm
 CRjy/Szm/go8uQKddpAWZuoOXdAgSMBP//QhT5FIHXQeHybt7GPRWL6+2EkB44V6mE3/trN3z
 2KunWnuK/BR5o9Mprcl997CfQoCw0ooTaNQ4iSPbssmCk9pDAbbKLhnXJ4QojqbN8iSDc6z8y
 ZVLIr6qMLEu1GD0AIwhV+8JjBdN5vA4ZLFH5Oqps/4cEeDXxCoCUEu76U44VfMSUlhb86IpmP
 S85LosFD5mDxXh/cncPFxZf21BljC2ekvUpbOrXeLq2Rq4zQKeS33WF993jDq6N8HA7GpQAex
 OnPLzOGWBWwEtnRulwQPP7bCSvG/RRmMw763t9YfhDZaxG6QtUo3JI767oefUDwSDayL58XG6
 yjmd/92UQhQVKL6KaCu9GNBi+MrMiPaMhBhzVUokoSFUD0hj3peS6iEr9xLxBPBELy/QbCbSU
 3VK9oIolUWy1wAH5T79MP640j7rSDjLg+Ks3eFfSw6Ilqw/WNT8CkRbgRvVwR2L0FdN1u40sM
 f0qD5ClJs+OrCTgv45BpcShuwRiMBbe8ebEO/fcnqPxCJ0ysXMyJS7kVx
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730926193; x=1731530993; i=fiona.klute@gmx.de;
 bh=C4jqmX3khJA+lmb4eVWnht+JVeodYgd/jHJkvj4BeNM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iOFvy5U3XKO/1jo3vJEYe6J1td8fPyXy9nN0VA8DjYd68lzFDgHtSF9N8VqWCASu
 FCAL7i3GtsRinETopRvI/sn8/22QTQOAKcF/vJC3QqaDHwQY//5apDuGIJX9i8gGs
 Egp6d7KF69vpO4NA7AXmMuEr8oPJwMjLmKfQG4qdkLt5VRQkoh2qCS0RDErZlcO3R
 sma1tgFnj/gY50Hdzj6uffEGmMMnINewkqIQAktjPveUzqKr1bUFVPGQ6w7wVY0Mi
 +2pOZKK/yhP/EZONhdEDYHET1bbidi1E17kRis1M5B6+K+pVsnKEM98UXnQFX8ELi
 3HpY4zJBjYWRTWcHsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=iOFvy5U3
Subject: [Buildroot] [PATCH 1/1] package/python-aiomqtt: use poetry setup
 type
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
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Aiomqtt uses Poetry, though host-python-poetry-core was pulled in only
as an indirect dependency of host-python-poetry-dynamic-versioning so
far.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-aiomqtt/python-aiomqtt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index 291547f11f..80cecea9e8 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOMQTT_VERSION = 2.3.0
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
 PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
-PYTHON_AIOMQTT_SETUP_TYPE = pep517
+PYTHON_AIOMQTT_SETUP_TYPE = poetry
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
 PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
