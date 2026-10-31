Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eqfd70oO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hA7QOcD1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CAD60725;
	Sat, 31 Oct 2026 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCVPeUhjW-DO; Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2DAF607E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467266;
	b=SigYxYdj+3kstiPoUPkG10JyD5FIR37BpdDWpgTXdT/4h0sRWdCar6lK0C4qA+3UUssr
	 KTGT0jt12UJ6L0i5TGs7sR879/F19s7YE+QFZDMAIeyn5YxUrrSp29NMbeSZyJdkT6aCd
	 SnSroSV5hRnnG6RY+iB6w4/CSacWtoC5MdCizWdwIYPKA65/LGION5Jv/LLLD8Vh/r3g0
	 m7FOKbot78KwRejpTOpef0C34u61vB3oPzgE+qWpLiowgMyUrxKF9n93LReNX9XDrAofG
	 LT3un132Uflwjgg3f8wlzmqL9NMVvcQuT/H5KnBI2TSJJIvCCjrFhDkWkreBlcMfu1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UdFwufMCVskbagRwmEktOL58EUNCwgJfOFGHYPRd+3M=;
	b=TdzZTHCY9LhmrkrAJkMmErOLL2hQYT2Ni0vOADah24hstQA5l5Eo6Y4CfwxOY32lOUGZ
	 t8rnRpYqqbeuEH2ADsyoX3QxYGDEt/cOECCjJUwhQ5cUIhGIJdgv7ZtVkqoehTce13dia
	 RbjkmQmNGYkA1o/vVZMnVEHolvqkovAifJTx9OvhptsQcLrNs5uNclgv7c7CDbJGBbBcf
	 Z4BYXsFpnMSJd0QZz7hmA/4SBVvr9trUKG+dbMCR5dZKq8etwojioVPj8Sz9/cKtXYRv3
	 V9RNmK8efR/QSN1zIp7Vx7XmuK5jqKKhANWPeWKULGdMRpwUMuoxqOU5qBJFWdLwQpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hA7QOcD1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467266;
	bh=UdFwufMCVskbagRwmEktOL58EUNCwgJfOFGHYPRd+3M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eqfd70oOdounIZIj1by5UCF0ONnknJ9Jz9VHxxkzKbRN4TCy/bpY2qGMaiT2/tsSi
	 SMpKRePEdOgmppH4J0AFX41dn4EQmFUY+Q+MOyGZus2b0oI62yG3p7j4kkbMY/Ad0u
	 9TDai6aGhTnlQ6TL0tObRYqsKB5RF1r45nxeUwmJYpigI1Fyf82Qbs3pUF6xvNS0VL
	 gKtWd1H/brK2wR3qEedQ2AxP8XeewNYdmrZYDOD9pHHR0ZVnyNI3nkUhl/PEiAhEfZ
	 2u0bxuSjWYNgHx4yvxiMmhbx2a/EwmLq8n6oIEHnWP3kRytRfIEN05cCxcnHPphMrQ
	 VDSjb5Ub9yowQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DAF607E9;
	Sat, 31 Oct 2026 17:21:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DC064E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F09B60763
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhqsY6eR2DPB for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2ED6E60766
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467252;
 b=YHQRiiPOIFmiuyRaMEG1uxdpWOermgJOD05HRnDJjogWpAghXH/DmgrdeuP52n00VDID
 z5SIDexLEg5rDTk9Cd2fSWjFrtU7pYIBSTsxbW56esTy0KCNm3nZaIdUvxICOuvqCRPSY
 c7Ur9VNjf2crnwn1uhcm7Al4BfS4Nw43pKFyo+FVLXWojg5EB9kG1zSfJcGp3Uw3LqVYP
 1JnOze3NyWvaGfq18LlEaC5TpP7NsHfOKET9vIZOT/knoytZBu5ASZXmbh677tO1aLPu3
 cRKO4LZCpAdWyINup4CNCOJr7H1SLh7KQzUlS/ljQAvpYibELGKvf1mHdEo/YRgACWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467252;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5ksTft5bfwx3Eu79JVpWegXYdXUF+fPwbpcDuQecGmM=;
 b=FoBXSjHDRjdgsrLMjW6KxO4xVo1JpyCB2wL+m2Woesn7ojn/wFi42TDIg1ZHHJrNd4c+
 rEukft+BkUBtjpNlgaRvsFRrxtXYhCXfO+vAqY6anBgm9WqRC8hrmUnLHUJRiGfIReHRY
 udQAXTgTvw3qN1P7wdVhjgL2FWiyMb7Lah6KCKpOrMeY3qXVKjm5R/2ocOM07rtGb9ocv
 egFxGJClUo5Y4ZncSme1HGd0N8Mr+VaMhNbvkPHdLp7CmYRb5ANf9OW+N1b0Inom/5lIZ
 rUxDDahdm5DKgjj2tzrCsUtIWBB/NezZFqKGy6Pxmq7JH8bD1qglm+M/XT3diVpF9XQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=hA7QOcD1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hA7QOcD1
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ED6E60766
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:51 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-854b6e2e41fso1098887a34.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467251; x=1794072051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5ksTft5bfwx3Eu79JVpWegXYdXUF+fPwbpcDuQecGmM=;
 b=hA7QOcD1E9+OMHQKk2GeGhucMxQZ5QKWljhjEgVfJoM4HlEhn7Ghqe/qXbIGtFzUgs
 oEQ+UTcgyKau22+V2eF0YGp9/eEdzzN1No4fqfaR050j57Pa6tRZpdaKuYd2apFfBp/N
 cvZL3tBLJhPT4cBuELcWc+DeUh28Zmn1b55sk6Yr24hWoUx75vwVxTOBHRJKE8pM3aRi
 vjhvsPL1W3ESeyLm+97COlTUzGwhpK3jWEl7P9xG3iqRHgGenODU8B1JAFvEIePaxi3q
 oVqX7KQAX4o2bEo+KOyQWsydCEEwN/gyt+sDts+VMriQO9axaOf+7Ma8C0Q1Wtg6LOsG
 erDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467251; x=1794072051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5ksTft5bfwx3Eu79JVpWegXYdXUF+fPwbpcDuQecGmM=;
 b=HT4qBEmLXnhzlljdcVnigiGkki2SJkIwdDsV/s4IQLOo/1MX8IewTxs1lbVeRir2b3
 ZQ3QPLcKZejPIYS84j+dbXapBetGDG9z/jGQop8PtcGnSNShwXACJIQn+vi7Pvil0jJO
 ktMIuFMXsltGbcMmeNa7Mb8gSRKM1f8tAvD4sUUcTZCh1H7B4HJKpVQS2nPwrEapgtZw
 56W5nsxZo9L4Pai/VMMd3rgHHuUsSCihJoOJVb1YIczyJFCsX6c+XDl9bwiZQEUyZPy/
 aF94FYwm2C0lTn4Qx2mUzcf923b/7+vIqALZLqFB2oWatXnJkTLvtFTSDYg9l4pbQecE
 HWmg==
X-Gm-Message-State: AFq9FYJyalAEiM+w6qH1bDSlyAwWwLKA5unhKd7KHn3trza9RBUq8tS6
 duAEZ2Thlwe7ZIEnrLNcwwA4cNU5xZMrh7ZA7JzLECG1Ih1v4UTgAnyftRkXew==
X-Gm-Gg: AYBFou111puCIhdn5mtj8GMrhxU3F6PukWim+g/p6auI/4mYa1INpWHgpI86EqjxWK0
 ouKeXDks64be8qdDq2oMu5kbEB1Dngce07SC9Z+f5OZhrdzyRhN6ld3PAiEmZxfX0oecP550ASQ
 TRqrzbnPRYdDBHFDUAu9ujKvPJbhS63CzGs6PF395Bqb0kPeyUofc7oUhq/wH6zVgrRCwRNQo9a
 MwUOfl4c6v967OyYhJfRF9WilQsZ8xBJtVJhHVyYgUA/w2wCLdx3TXpnG80tUaSTFdIyRuZZ0do
 qxgVuqveEKPanBxcGM1zgQAJ+C6k9Dx88PfIw/PVQn74ewO9p/i7fBznthdJ+taXP9X7oKvO3b8
 fZ5IB4z4Pez5Z9PChsN4sEBeU5fyZpl2dMauAfRgLre0eEycLSRqkKAxF43wwXrC/pYsAntHzpC
 9v+M1KR/3sIrtJffPfAbLVTW3rECUKKa6T7eWqWnoX3j0O422smcBaRjXqrXhmQiVqm4MiT++Xo
 NMn1RE+iqh/IghjFrBbR8CaEZycME8sZs07PIpku3qPkPfZRvAudUr04Eh7hv0q06fcy4j0VymO
 GjNIi2qqZKVvnJzUcuN128HxDHQkm9sTKTnibWHH6MZ1esu+LhP/gmRFFLrhOn0PlvF0T9OAOo/
 MLyMxQdsK5DLKXbQgWiyZx7LOmkIvir3ibc/hCIwJi2xy9gi3c3/FFy+Lhma9AcJBNmslE5D530
 S+Z/J+eKmL7g8tG8Rc8u3XHxSGRE8Yz6Srl0+ZAaJscAjJmLFoZ5hMoIwyIaWUTvIzhW+yTpzrc
 Q==
X-Received: by 2002:a05:6830:905:b0:812:3ec6:58a2 with SMTP id
 46e09a7af769-85d364fd8e6mr5474534a34.12.1793467250929; 
 Sat, 31 Oct 2026 10:20:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:46 -0600
Message-ID: <20261031172019.2683287-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pylru: bump to version 1.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylru/python-pylru.hash | 4 ++--
 package/python-pylru/python-pylru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index faa9575119..c491513528 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  2710118d4618067047400d3f63cd5167  pylru-1.3.2.tar.gz
-sha256  ad610b227999da4e2cbaf68a6adf7b57ff69a3e3839ff0f86210dc2f5ebddcdd  pylru-1.3.2.tar.gz
+md5  c808033f18a2c2d95913956d2ba2f998  pylru-1.3.3.tar.gz
+sha256  c540c0f3aea3e03493b520807fbf2d67e95f4f97532a919989960707e2fabb2d  pylru-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 761c1e7d87..0413547378 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.3.2
+PYTHON_PYLRU_VERSION = 1.3.3
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/0c/88/dc306f0b4dbc5cd89c5153bdf5b2141d0f9107dde8b26edabf4f6654e65f
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/ed/d2/a944dfae27670a4d230301acc83115eb8a5004f8c71549a3cf5d35a40fe0
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
