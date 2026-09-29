Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106F2CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4CBE811B6;
	Tue, 29 Sep 2026 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIwVcT-wTD2k; Tue, 29 Sep 2026 18:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E3AE1811A8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790708376;
	b=SX2z6M8tgI21sK0S6sI1CHi3E4fixta/8JlJg4ud24U6sjvmWfAZBuC0rN+9cDBjpxFG
	 SaJRMKX3DnswzD0OSrchgAK+CpeZPAi2LqQhDLSIzfABqWcMUrZ+VUjHb0RDVOpZilijB
	 eKjemkqc8ArcQlzpF82Nq4BxJ9bbwJ6jzLtUDcrCqfu7nd3wJ3GLxM52EJbpb3stsN7pu
	 HxGt+HRVl1hadH+Gr+70JcBSdipZ1PL30Z5L/bb+GSvC9natIiO7D9wwpDosZuSBgxCya
	 +j30YiuSyOomJOvZ7733tQEFBfDEtnxGDmJL0JndsnFgQqHiBqO40II6uwTlIHbzibQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790708376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pPnB4KsnTXtM57IAsJ3hQCZRo7qeevg0rY8j/+TXCl0=;
	b=qxVyirn8QhX2UGu3x+Rbg4ICMox42T1mHnPh4AypTZ6Mg1zTfiG6mAPQbGJ70+WbdloR
	 p0px/RASWFS2HICofGDgBSGf86uJbBBIH8KzDokgP8+LGFxpvyJFiapbTaXpJd9LTFEig
	 y1hv8cAyzJRAt7eVX+vWcbpjDLUKMVWPgyIVVfaEW6Z7DEcm0bDaoJJR+6qpMFhPI1fy0
	 W3BYFc4s0TryFWLqCOaJevyqbTGcG7o2wj6P30gaB0gkO9W8J2rGqnP/UaAIvTnf0LTOz
	 KikZmxx4Rd48vOu26y/p8uGMakoV6CmcFrH43pfZKFMGaAx4eWfUPFBfAbYEf90AY7w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790708376;
	bh=pPnB4KsnTXtM57IAsJ3hQCZRo7qeevg0rY8j/+TXCl0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AWHO4eaJ7gqg/W+6LXCEG5xPgzA9fDPNji0OIOMcTX+JsEUq20u2SrdrFG8gy17qm
	 QUPjmfzxchFCzTqG25DAHe+vbodjSSXDMAZtgJO3IFFdNNhzjwIoJaHARgiNrpDc6g
	 3H9IG+hnTZprkuCaLiG+wXygemNzYwhmTYX/2FyixNW8EhXlDJhXDqHo3ERT59bMgv
	 cuwKfP6K3136ZR04G00fljp5MOWcXmohLQk6PnxN3jkdzhx8Mn+9VDsWnPNG/TlIsG
	 IiULPGy0bJ96psLF7qV2eWY7DzsRyXTR7IyIgmq+xM7gRlBPgLb1vrsY9LgW8CZAVV
	 TL0D+3aQKBa8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3AE1811A8;
	Tue, 29 Sep 2026 18:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 127A514C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED26A4032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4_tVJfrghZq for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E1E3E400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790708374;
 b=EnutsbZFev9ZwPhbG7biszS+0Z8WwpOa/hJ866ab1gX047rymsygntArKZ9BFBrohcdA
 H0JacsZpOYrCcGznE58ierc0fz2HSzL/PPPTvwPnbuRNMXzIcM+cfprOFO9uvVXIWopbd
 Git2hkegBcn/EaoKkiAKqEUB2S30ZxqXWwhz8dK4glezpgx2EZ3zQ4vdVKKZ2mFhHDR+g
 TdMRyy0Su3gojDgG0MBt6d9+kiBNdpkrJ5isEaY53NwdyZ5NAiFSOYTZLobD0dT0z5z0K
 AG5assD8bfL/YRqI/y5vVOglKzat6Tu8El9WKN+X25QyWoyNHvU+G5FG5wQwSQ49T7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790708374;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SsxXiCFIW5hNN5FmCn8hg/HyyZeo2yv3T34VzUJm/z8=;
 b=BP47SQRZ0f1a7iNd6QdrhClEDAWbsgtIARhv3vRvQzjA0rrlTGJAJzOtnz5K7jLr0wEq
 l9OCK9bkYyTc0I9GXbuof77JRGbAdZSvGbviD8J+GcVqu2QN4HMw1IKhbu5iCvYmap8pm
 5B32L6om5qwYGxZyuT5eH1GVhApY0J2cBzUs3u2tMo3/EG2wMvM1MHb4h/JCuffUekuOf
 9ySyLnvUq825xOuLOiUNKoLbIo+ZsorQKSvpezObV4tr/y3xqVwL7pTJ543IQf2kUlEoT
 a5pnyRu2XxR5X7gHnibuZQVbY3VAQFU/q50titD502xcB738dRpBxhD5c7NuT2pEOig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Cm7R/ovf"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Cm7R/ovf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E3E400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790708370;
 bh=SsxXiCFIW5hNN5FmCn8hg/HyyZeo2yv3T34VzUJm/z8=;
 h=From:To:Subject:Date:From;
 b=Cm7R/ovf+4Gi1HoNEAhsam8Fx8jLqMm4bvVh12+EOjwX1ajCEsSdO1YpdlFpuBZC2
 QiZRBDM3Wwo8AUpf6MJECfrJCsx9+MQ1vi1uWkdorFnivtfzBnWShMr+9IiU+EiYLv
 fsyPrdx3zZBoRlXf1OUCU7Z2+pA1QWoWYR2n/IMa0ifnJO8epTzUgLJg7DXItTpx5Z
 JLhfQERZnLEu5Hu/ZqDg8B5Cz2JWl02vq3uEBrNRu1WwmLZlc2NAQpvE8jPgRHZ/Jy
 IgLbPAuEgrzN3pWWEP/LHBYPP/C370WhQUnwT7qBOHNBr6ixpqHn8cLbtLDUMHgV80
 EIusAqeMdwVEQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 db+Buyr2stmUC4ufyGNHEgIAcYJmTQAyNV8Zl7SsbcdsC8U4wQUZ/jc6M8/2lNYtzR7wJSqUMiX
 ln/bgQJrpdF72PB8I9E4DEDs8a2s1axfhjnCI50bCZyCYBMlLCsruIHv6E0lAtF7NmGnMf7srAW
 HSZ7gpgxUWxMeFn69H43y5IPZcfStn9uAPPqvZOcMI1NC35IzAhLMh0/EuMGXk5ZtCAeXfsRHeU
 bGqU2eeCXlPRC0/TutsbQFvlJ9reOuT+uGLZUbP1oFw57kgMHjxJaChNhyQ63gDqykwf1GgwYYh
 /6Xv4H/XXVaqmM2CHoLPI4OXuYvzseDOUQSk6zPGtq7oYe1ABsGaqaI5fxJduy0A2eaOq/Z3Q5G
 lGfjCVcGvZLXwfFEDyWeWPlVzJ47tzWIm9ziElPM7nG0IWG+hAp3L6nCc2u5LbohfZBNdyJ6qWN
 J9r4OBLdTPv6QF0Y8hmliUtHiNvmBpIgcYTQJvo2MsQ/kyS6++VVwNMZ5txfOkjIISq9Nhm/UiN
 XiVXV6OjiALIgeJwYwvmkvGNHOo6Xj969Db5JgJlultadBPdGxbwFbOMgeQz4J9Bk3OWgUKCeBT
 uOm+aA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0E49A4C4F7B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:59:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54978)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBd34-000000001xL-1GDr
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:59:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:59:29 +0200
Message-ID: <20260929185930.1897670-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 21.5.25-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.25-Omega
https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.24-Omega
https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.23-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 4b4768af82..cfd0b62fe6 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8c9132597fc5d047657f10873c09f9f6837b73f140b7a59b8d72929d37fc79f2  kodi-inputstream-adaptive-21.5.22-Omega.tar.gz
+sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index c03c8e81ff..8aab0c88e8 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.22-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
