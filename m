Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83EF606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h2+NhTu1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hMR10W+Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B991240743;
	Wed, 28 Oct 2026 22:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUs0zmxs1I39; Wed, 28 Oct 2026 22:32:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA94140786
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226725;
	b=r0iTfKT6W0m+3XSQ1QU0jCjABolCLil3ahWu4uh+WHsmf19LI6j+6vGOATmDc0evpGyT
	 zGe4MIxcYRpDlTpg4y69vdIMRJwyadrFqXSu+G8gbUQbJskjSMiNRuQ0RBnvZk++jPyZM
	 Hh0KCw0JDqg3GewNGQJGPLUMbKmfI6aqWHSTWoUN79jBPsoWfZaBgeHmr+fUy+YB1k6OH
	 Jc3sgMRm1ZqbPrS13BTkiqURpYG16/4vAmQBbrNrfM0CshVQ/m7ssRRgeqSYQfA5vhWCZ
	 Mmx8YjzUgJ0dfD9XiKmv4TaSNvEo2pustOvI6vno4XLb0woAmIGqM205BEHkV8++Zcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	b=Ui+W/gXC62kPxLi5Aul3lnV3HLHljIBNJhTJhm6as9v+haJTGZJFlA8Jnf88rdPZ5CKL
	 Eu8r3k5DQZsPtrn2nFKGACKTXwmEpZEkwT9VpXZtaX8dWQuumtudZkK0DaAbCtUu6nHTZ
	 Hd/18k7mS9wArHl1AQNEhXRpSwItTRkFLknr9DAIY2mC8HgRgdi1/OczdJGWlFdrCZYwf
	 LW3AMgACvqwc1LIuKCGxPqmRq9sTJ9b4VLxkQzYIb1mIcy2zPDt5gliWTtr5pxfL+1Eff
	 4DvnsXaDLu9yYrhxCpo5/3TbxpsKWnXIjFGCLzpb7OdFbgOuTaYm3namtX6Fx6ecDWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226725;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2+NhTu1EZpz1Ca5fRrSJRrO2AznYKbJs9o3T/AZicAa6qhkclntH0Udi6/NK5Sxw
	 79PNEwNQVRKgiUmeODsZOBYm7zIgDzmEKguqPW0J5hd5mKdH4fn3i4uL3TQcHSH4O2
	 vKEKFhqDsQlfSnAInk6qN0LEWLtxzqQWGkxUTpIqa6EtU0FCbPS3FQ/+n81VDLFLto
	 Xmc53PlUZtRJpRXNooq8DFwuNOd/YpprCffxuRYdmCOtb6PU04dUeXFQ9i06GSMZka
	 sw/26aUosfRUzP5Yu5X9V9FtFlg15rJu3OLfU85K+JAawcQaWkNQIT7iG4YePaH+6x
	 NMqKAB4/9QCVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA94140786;
	Wed, 28 Oct 2026 22:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F952A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B368400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEdJlRqdqpWV for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AADF24004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226723;
 b=h835iElR6Dqcht0hzDPjVbiic+5OPw+AQOz1zarwKAG1l7Kj9RBnQ8LxwoO82sFE1Pb3
 zkbrW0VtjCNA3zAUKt/eOlAGhzByBWcWWa38m3OCNjbUuYP+DQH3kCYb45gG4haM/8Cy9
 3v556PHjboA8PlzoMh8kAR7QX0IrrclgqXKrUpUxVGesZ6M34kT/qOIFtRJl4x5ZLAe6Z
 WrfZQ7+y/WJpZnxxCgCX/mO65byu1m9N/zvtjWti3f5bQyPyMhA8XwDZN81guMpeKAw7a
 2JEWKstAXKI2YYPLrNrWheKVooh7NJuOGRd+TkEywkwSXQJR6G+DatX+pCMQ4tOFk6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226723;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 b=MlLO24CPVazZJOkKaREgb/ipi5pz3aYOrruOgh+vmqfHu4n7TsXsG9SxQHxI6gP+nn6e
 UGgpX9nDLRAMOFPu5hpakp+YWhPL9YDgqhzTAj4DxZdDXqoYfiXe67bVy7NnvY9QsZYEh
 rC0QyrB1SW4jGnFyZHa7NB+MbCFytbkpwgd0D4fD5sTVbrzxcFCQcK7iIWP32E9wPXlim
 1r66gtAa0d0YUSEZwb9hCPosmoRUTxZOhUtPFhhXYoaxEoUm4e39M3U253M9LrtGnzJI1
 P2Jybx7/5RRzUqRxbZFzLWqIo91c57zR4mh7nuDaaX05GXbm0b9DFn6hFVOXTJJkXxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hMR10W+Q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hMR10W+Q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AADF24004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226544;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hMR10W+Qk9Me8hOWehDo21Ixdm/MPY9w7XQM4tfCPAPuntv7pr8qlGJPr7SA5SwAw
 o746HPrxkAFhsgeYYDsG2nTlB2o+nfreZWkfF8dlMP9WdkFsyvSFXaVStnHneKpQQz
 f/jIdmG47nUNXQpToVtkphGPeSic0ILN524HDsSkRCoTKklk4OTOHK1ao7nVcY/O8b
 aEgIYWtgXxxME9HYSfvBfovIp5bhi/i7u8MNfGasMlOqCfmiwM93CoVFlfRDIxiXYO
 1nWYtmyYtrghpmNI2MEjIo+U8Xs5Qm+LLz0sAIJIBRyfzNfOLsuYEzznSokL6eeU72
 txVwNozg3PWXQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 IomPhyd+9Y0YImrDOPKgdh3uh7bUWvyHbYXEofwVYNjCJ2SnR3mnCRNRa0IKdEkuI3XcjaIaBM+
 4wC3hXnMcIG58n4tg+LH1Ug6FM1UNf2Su+QtNKoYLRFc+9AGBJDfKKu6+xjmPtjogIlY56JrOPu
 LFmTpOeX8PoT12WemTlQuVwAe6YCj58A8KyEH98cVi1PNWJmQCe81O889PxS5udd3DIhpApSxM5
 7ePJPS/o8hb/XlhvoSiwS1tz6i4JBAbA85uXKSpModcozML0NCkfUAvXxZI7Cl6SAS76/T9QcfN
 Rys4hmAcCoCWm4kYz+TEaiQzPrK8IUIYzOGVIlvqvU0d/ub+KaTe+2xCh7hiUYA7dPFNGXVRFB4
 W9kmgb5i+t/H6moIHY7Tu0fqs/EEyfJm/DhxPO/eCej8p+Fg1hQ6k0VeWkIMl7meFxcu0fTSH8T
 PfeUpjKC5+QS+l2SlG8iFscrB6SeAy1wTYS7XQm3b+QSLkHh8fz3xKyeR9z817nnpFWpEPzBSxq
 hS6FOiDsZSCGa3A2pkss88Iz2INWs38shQiAQV4+Cod2HEXqS1ze01mtZ1ks9NvJ+mUDTuzHPuH
 PHogXw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37C8DA4C6FDB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC8A-000000001Tt-11HB
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:17 +0100
Message-ID: <20261028222822.490779-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 16/20] package/kodi-skin-confluence: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9cde584da2..9974b4a3bc 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
+sha256  8043658a939e141305d6acd426a5a5be3a35ec1b94baba23fde069e4a1ff0f00  kodi-skin-confluence-da60e21de4a87581a8526c9409625e9f21cc7a33.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 31d6b37380..2a83eb5994 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
+KODI_SKIN_CONFLUENCE_VERSION = da60e21de4a87581a8526c9409625e9f21cc7a33
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
