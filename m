Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2480606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ofxt52of
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF41811F9;
	Fri, 30 Oct 2026 14:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QpmgYZ0Ysza; Fri, 30 Oct 2026 14:06:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF26F8116F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369215;
	b=W1g2uVSaZMp6fijUTtjW0adW4KJicdaX4VKINgMDcNVXvDZzdli13VqaFHnGK5+Ex6Dq
	 xY9UHjX03Vxj3KCZxp98Ly5C8yzqOY7bjJaxruizf74VezXlO2F63K/kptv4zaw3evu4M
	 7UGV+PguMEhl9yePCTlxWjxhIMD+wXXQwd4NVvMn23RJwlpB22te56G97O31s/CFR+QXH
	 9q2F08u0IjlrQsefstVFyHtSsZ+nP70pV7BBp1eQp4aTfgdUhsAuRmvAjZ7Em0XnHl9jM
	 z5xxD81D1+FgNjvnW/5AmYZDaX32P3R564x7jXPBQKt1TgJx7IhXfwWBSMSzGRwdLUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wydvXmoJUyOqpktKv41ZCUWgCuHvzXvqMPBpiQo9BYA=;
	b=oEjmQo+M+zgpvbOKkYfpd5y6+30q5OtqAp+ousGIxUFR1LwfJfSHiTWo3n0EPYfFT2Rk
	 Di52heqfDvg1eUBjgRM125DGoEK9tiCd82pbC0ZVE+CFi6EkbCPWC6cyHbencaLyqv4jQ
	 Gk3MWkTSbyvKpKLIfjSUpGwhugoZszdZcyyTfiz2/Bo+aIKRtVj2OhF0+FybhE/Xnempc
	 1IBjkMl0zy5kksSUbtWN3oj45UfqdohYFyvBmwVp/qyvOPQsBNQ0f5zlDZDtsrd7ZAO7s
	 Dzzgd7TiXu0IXh6hRLvO50vhwvK4WaJJ5hKyag0v186J7Nb60a9iLy5PnUJduToVTcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369215;
	bh=wydvXmoJUyOqpktKv41ZCUWgCuHvzXvqMPBpiQo9BYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ofxt52ofw2lLFCtxQVZbxI6IH84W76P9S+1tqrxmk2ujmVIVmAG9S434vEwQ+edAs
	 4+LkRfqUeWGyqZovsFBvDhd8I9ZgbRHGQ11C/5MgSmluJJl3OnBdNBbUALoWWZnRJQ
	 U7tgReatgaKBKlTM+5cv6YizUSPtydcJAVocvdJ/IxXcxmgb7XxUyFn66JHCAnhqoe
	 SreBzG34Wml79wQi5AKC9B/5jqu8Qmn6krsDBh2akt40JC/7p0kPGbjnw5fBGZKesk
	 wwaFqa1xabTvLzGe8T5NApjHeTOCAoIn8fJ+HSGTDSv5WutYLa5eRLz3yH/C241r5a
	 LB/2wUGXSH4GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF26F8116F;
	Fri, 30 Oct 2026 14:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A99362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93AD340B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZt77ULgGipl for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D303640B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369163;
 b=FwzLykknhWYeiZqJGnwFai8OJCxykSk/287x03I/O4mNLkMfm9+3YEj4nxeuW7m9/whn
 TWxzpE2zx6EoB2ff0RRU6m6RJ2OvijDIdf/eNlMM3h8I9s3AzJ/e0V4ogRwy4xx9na4Rb
 bEzYS0Eyfjd7UVZ2PvAwgQSlLgVfKOnjSyOsWGxrnTICuFWswXz3ACKCpeLq5eWNEywML
 6//wg0PXwIdLg2YrojRiOabkHsZfJh2iY3cxNOBcHoPs7AagE4+x7EqwuxisSsLaAAvLO
 5ekpAE0EiLkvCeZv3s7jEQJaqn9QTT6n4M2EVi0iEc0jEX1djfuPInQRC9NLNd1wsiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369163;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xh2NxW+43SWFfKV1qG/QZgTWpBxxe6qZZsVDC8Rnq40=;
 b=jvult67s1LOQdkGa2nHjUrbYTTsWGUB7JCZljW+YAydQf4SXJGzZKg8HflcX2AFUtgDQ
 vTSI4SqkQzWtlSePf9LCHGPFkoyEMuCPoIc6mq/pTqaFZG1izGQHcs+0kWeBaqD446isu
 WzGU/H+0oil8B2wO9apIpmwyvmdammtR/C0dzwZ5dZZLXY/fHbuJnBKpM3PEHEHJ6c2dp
 WC1wNDgj3LLYXV9SGRzaCCd2Egc6sWAloIU97J+qCy/XTOPOQ73bEzY1N2azefZgw5gPo
 m8iotDddasL3tod4mGICFs0mbHrdZm9rcNyy2g8qGAokAXnnYckryu0LCp4YrvTqnRw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D303640B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6CBA9D389; Fri, 30 Oct 2026 14:04:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55c5a93b5d9136859c39ad1472029e0947bfb5de
X-Git-Newrev: c62da4f51a4262d9db5a748dad92ef70146aa8d6
X-Patchwork-Hint: ignore
Message-Id: <20261030140435.E6CBA9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pip: bump
 version to 26.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2496241794308055996=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2496241794308055996==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c62da4f51a4262d9db5a748dad92ef70146aa8d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac14a83e91bf00034d83933766e4611e8c419f06)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 3ce6073701..427cd14ddc 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
-sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
+md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
+sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..74c789e097 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.1
+PYTHON_PIP_VERSION = 26.2.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt

--===============2496241794308055996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2496241794308055996==--
