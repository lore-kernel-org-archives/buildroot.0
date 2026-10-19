Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E18606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jb8EREVe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dcFSSCga
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF4806075A;
	Mon, 19 Oct 2026 17:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHDEGjV4UMk7; Mon, 19 Oct 2026 17:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6B6D605F1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430350;
	b=XBc+TksHroeL5US+PepQjuifKCC+K//3afKiMfHiCrlENU5A61hFkM40DkKDUYlX6FSQ
	 3Mk38HLNEBnf728prUo6d7zH7cR7PNCp9DTCPwaHT1F5JTBNWzcOPz3TYiRUxMwGscYqz
	 FiGHRnSOug5CKBX5AC56g1K+rNdtqQkjsCr/nt0oN4DV+JCfUAlnd71+8jThoTpDjfkDY
	 NJqq9sZhmnwvpY/1wAuvADv2MQ5Szr1QLmnR7YGtsu+BuQK1jt+vJCm5TaAZhSi2fjp61
	 NAsW3A/3pR77L+R/vjhB8haOYmygK5YLHUBdliDe1FcTFcU7AQ3bx8DtHG9V2aweXqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=h4fwlxxXDQiNkq4UuSn3d6HH3BPodx76gnPVZjuQ5iY=;
	b=PB965fX9YNch7kebr7GrqSQn9PyZSQc0ZvFKDz8AJoc7MV0lj5SToG9+GIJmktEss5p2
	 EJLe+CdIjup8PDTfTfcyfbBybpLa5zvZKqjJSr2ieIrd1lCm2DGnBlE9sJcKPa6eLCkdU
	 EwTIpvNE5o2Ijz3Q8ll/aiZ68L8xTLdplmtrWwKD1Sx4p9lZIfNNavn2/ZSnNhMwM2iTe
	 cyFWgINladIm5aEA3Vcycr0qdGnQghSD7BUat6J14/7YBt4Q5WCM4myH0E8pq5bNuOJvI
	 TTxHoWEa2bNLbFfhzdqhb4H9Aoo4ajZgEAMTReJSM/0tLJ1OsTtupy1Qoii0pvScQFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dcFSSCga;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430350;
	bh=h4fwlxxXDQiNkq4UuSn3d6HH3BPodx76gnPVZjuQ5iY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Jb8EREVegotQYFeY2TGGDmLNuSiav+GOOWS8FH9RFWAj4sombelJ9DX8XC5yuINGR
	 elvX5O/eKbBOUn/LW76tsqQEEflfsq8C7y1aU0mm3yaaoe8Y3JgVNlqsH7fF6259Vs
	 n7nNHvVrNXkFegk6AmIElzcirfeqB3L4PNu0vk3zOJ4VYAObTscE2HRkdfcZOpJ82f
	 PyE2imXZxh5h30ct8YRs8svdhyyk/pA4eVZWgt1fz2UwGY5Cp6xWjg2RUNA3P91xWL
	 UhMY7B/C1sjP+1uOJ9W6wUsqSfQe9PS9r62gz3dTgWSBzpzOeQp/9/h5o020b9ME5T
	 tJwpOCROmI0FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B6D605F1;
	Mon, 19 Oct 2026 17:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD641E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D54F605F1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Crq_XMOnhp_y for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0CB7A60741
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430346;
 b=IpV9u8TVJfUsvOr39q7ES6SKserQk+sfT4h5x3WY43MpdCaGq5H3WD4hiisC/ubGDBQM
 nvafTeCjd7AH9g6zKGqkmv9cL+cxVTbXUKp8M/RhwPpwUE08V0bZob8qurAxffzwSQc1r
 AOghDmxgERPzlNOGRpO6hzqX+fWO36RY/sVQbKvK0IRP8c88/Tw/9Wf87v+0jZUUC7sKP
 QC+DvssnAT98MBvZqSSMYikDSuXdGh/ShBz6tKxoruN+1eYN+sd56bm9LelhKeawrc3LY
 RY+ktP0z/+bj5kEY0k0x6ATsRc3VWb/Dc7NIh89mz4y0JJRx+ha/64vJa6RymUpPNxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430346;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=RtBup88Q4FPyxyilLnxJEJ4h3hQJWKmDMzSFiS5AnKU=;
 b=kpRIdjmrd7ZxqjbMzcVE/AKH6E1ocFRltfElJCq+Ytmn7KgSZhIF8fF+QSST8ZbOpH8f
 rIzk8sidspk+h83ryEPB+PqHKtpZgJC5jPOJ/d9GUBree5vP4twBWZdBsEmpHmTBA5xPC
 qIsgUreKDUCUc2elNOpTG13YYhvW6R+7Fqas5f1vLPjK3ssY/sLvN19YfKxznERsjBjB1
 cVW9hur5xY7v13aPoqfvha4zlGkPlnEfrfyn9/VRxlerYuaaQS8WlrvgeGt7arMR2emS7
 P188+uCyJPAwbK7CAfxv+0FGr5WpSg24TuWgQ4GAocdBTqNtxjJkCPexWPFp36yEXaQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dcFSSCga; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dcFSSCga
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CB7A60741
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:05 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4b190cdc9feso2016321b6e.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430344; x=1793035144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RtBup88Q4FPyxyilLnxJEJ4h3hQJWKmDMzSFiS5AnKU=;
 b=dcFSSCga6gZeW2PkXdcphooozl+1F7DhldqGMl58Rv4GAAgiJMHWFTMHhsMRmlU6Sw
 P/kvZTR+rV8YhLTxaUi96nyNC3Tuz2um5q1aKDcqXmEnQ7+Qj/gZjewhe0YQ/KHYl9Ga
 ROZyFfk5tfC1PN0TZFJN1K14q1GvZRwyh6Xl990kkObt0ULslfCjz2VBN8tNKJvib1Fj
 ypz/579XZK5JjUjAi1xoNgNQAT/wO6mlE+3i39peWhOBhbyl5n7+m3NI4i0fNIp2Alzx
 NPmxl7H0nzkqqMy1Rq7wS5lT2wG65sgflWA7yXGoNENsRsWMD7NOGDVy41TqonSnt9pU
 rYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430344; x=1793035144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RtBup88Q4FPyxyilLnxJEJ4h3hQJWKmDMzSFiS5AnKU=;
 b=I9Hpt735VDOc/QTJEF7T8a/PcYyPRt2b3sG0VJ3C8zpPkWcoemuuv8ZxHsFY1H76kV
 Y83GMKKfEvcKvNipLqoZGLhW2nhaE3ra9xB9ZUZ/kF9lACgqID92QUHlgmjt41SwTwlu
 eMCRr3sjOQ7WPMUZKfVWn2wq/SEV9GafkrUIG9xPeCuvAGUe2Ki0D6OlqIxHI6owJ+2F
 KAIB1J1yQC4pb9AFrj6FuXEGzKdemjIn1C46dUzkYVL+ycJqK5TpKUkZYUf/4kEtT81A
 GwOK/kflwT+adTSrvxQ56son8R+ji9oFIN5F0YoEfMURa8RQbzQQ9iA+S5P1dKSzju26
 4avA==
X-Gm-Message-State: AFq9FYK9qP4JSMRgZXXhkCGj1nL9Da3QbMKbiYz9yzyPt0cORsoXPSgP
 qBC2zy3VhUTAx8Pv9BEbqbOsPp2vRDQZECeL2IyxtV3ubaFSif3f/Kntce6rxA==
X-Gm-Gg: AYBFou11Gc133OQnPYodFjcfHp5tyhDGlUhCxggzNy3Ce62wz0C4GRwZ7X2RW4Qn7qm
 nu7PTOjwyd0g3nOerPkAfL5qUXlFa0Qv7vZc3w9vVMNBHK2kVGMVV/HjnEp2A8EP1qReLVZvJ+h
 vZrCXNuYHrQtvWdp6/8nozJfRwr0c+/TOu+CxJKwrY4lcxs1970WYAk6A6bdtKVsPV7NS2sZaHx
 G9EkTIKxixZbq7OCsDQ+oNwyWupTlcmPdT//LlK1tp9hmebeZ55Kw7qSgEm2WTu1Fg9gQWEswTX
 6YNWsfnGjVOYspJ7f9vulWQjG1H+e/f1kXVz0RLIHx2+AUaTsgOmvqMgLr9MGFCzfxJA/XXqdYz
 zccCxgTEatGmsMKn/GpGsLjPXC0WeD64KLpqJtjGequ0Yf5ZOa2e16lnDPWwRP9yK4qkLzurp0r
 psYUfOYja2O68bWdhMDa/oX05Ql8zb5JRrPDM5gQH1rMb7WDLj9lgYK0y79eTAQLgNBEaD0jovE
 Ua8HGjvZYG03/U39jiHYMIqeaztl27g20Ngkrx1sOJCXnxDvDa4ahf4ddrb0XZOzz6OAbdn0mIm
 yGI90YjaqatxyXm5qj3CqY4+m7tTUOZRBPzuUdKaJy+AXRGY7nmswcWby29w+Onk60fIHF41ods
 ji7rh6lfoJnDnwayo1cayTqs8hzYckv72wsAF1CsTDcKwj1qNcQNs
X-Received: by 2002:a05:6808:1645:b0:4d6:308d:4ca7 with SMTP id
 5614622812f47-53cced20326mr6952809b6e.24.1792430344456; 
 Mon, 19 Oct 2026 10:19:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:19:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:45 -0600
Message-ID: <20261019171854.734871-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-jc: bump to version 1.26.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 9d317ae5f2..d27a6e99e3 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  7d418aa0fce75da0e5623acd5833165c  jc-1.26.0.tar.gz
-sha256  576b5615b5677c7bf4aacf97dcc6c6b4bf437bbc420c7db77b43ae1785372c9e  jc-1.26.0.tar.gz
+md5  dfa209538fe6eeaf2f6462847dedd131  jc-1.26.1.tar.gz
+sha256  fdf1a58d05db351bd597438cf3b67ff7a9653cc0da4c63234ce77fe26051a4dc  jc-1.26.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 2e82109fdc..b5eb2c08ae 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.26.0
+PYTHON_JC_VERSION = 1.26.1
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/95/5f/9e6e8dc65cb15662fcfc090a52ed4fc4334ab7703b42107bc992777d19a1
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/e8/e0/ac16e68e8e56d0c63eb97d6d9a0f1d0320dcd16763ab288de4ea950eb7ca
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
