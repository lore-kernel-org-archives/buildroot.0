Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B6606A31F
	for <buildroot@archiver.kernel.org>; Sat, 28 Nov 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mi8gt7Lr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3vQ/DQC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD476065A;
	Sat, 28 Nov 2026 10:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d96B0_XdecdG; Sat, 28 Nov 2026 10:01:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C66AD60628
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795860065;
	b=BnE428yABSYxbsSTrRiF9uT3Yiz6hoJy/q0avgTjWr7q5OFmKu5/jbYaYLXtkcq1PDbh
	 tnWgvsfhup8R277WnmpDNXYf4+/UdTO9TyPCw85yGNkMN5aTZsJAqo/WwUFK334DsIzYE
	 Bx0+BGIwZ9pn5UgcJvPsI93jRcNXdA5fNSvpd6Wbml/NHWunJepqHBCv+TVXEQM2Vqb1r
	 5czirpihEcU23Ngr+USWZ0l9QoGnulGSNCt2ZhnlID7Q50wu0lKeXUHlQ2f81bUR+UbfI
	 JalDUAYZ0SzyRINxgYV2xhtrif5G+O+6LxbXpe0Eb4K+R9vvjnEv/YUDprArhUQIbvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795860065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i7PtcWBSeFINC+7YQaAocTnYaDkZR6Np+4O+FcA642c=;
	b=R5ptBDCLP3k6V613bh4DHGPrjcQuM70vFfodJsZ+H8eVkwtdWh39ZGuDvYDeJwt73rrG
	 Ic1VFyZCsAHD+IOb5b8nc6hdMAHWqNfqUkciZizuQANHCeUIo5W1NHzJSX/psKw7qD8TV
	 OY6i4pJS5IrIiShL1rV6Sv0XMAZlzTxubGlrxohOCaAFE0ZD2oj/JHdj+OAPq/K7fig4T
	 m5vON7hPXrq48D8IMC859nsnsu6viA8yNEVyTOxouGayIITrrcJ0aLaqeRDW3T3eB21CQ
	 fAPV+YEcyINgHd5iqAK80LntQc20d9KKDXuxEZviFKV0/PwWZ9gvbycZWKSiLI9ijlQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795860065;
	bh=i7PtcWBSeFINC+7YQaAocTnYaDkZR6Np+4O+FcA642c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mi8gt7Lrg8mWQDiu5+5smy0+Z+PGsbu3WwJ7qsjWUTnIGEkvzgXkwN4IxiMo1obfg
	 bohnVw8BYuhW3ziwVLxGaAAOf2sRmODX62SNXk67P0I0Ox4vhn5+VMruciffVpaFBf
	 RfcvWDPPAId66ntNW6CnDHJireM3nVvcnysIvockK4P9cTBhr70+f8CGgJy7TJfzIR
	 PQ8whTFv/WoiAua8xzhlZrjN7hHNZ8YW31RdR3vzNVHChaa+wlXs9rDqjPoc2GTDj2
	 diP78vkyMIXk4fQa8dYFnB+OgWWeLE/BPQZ6i9MnOXqp1Ole0snHWZSQrjiNVnwcjg
	 MF0vrsJZkrD4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66AD60628;
	Sat, 28 Nov 2026 10:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE05343
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FCF440836
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW82UmA1_R5V for <buildroot@buildroot.org>;
 Sat, 28 Nov 2026 10:01:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 75BDC4076D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=wiselord1983@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=F3vQ/DQC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75BDC4076D
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 10:01:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so6054393f8f.0
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 02:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795860061; x=1796464861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mbAgttOsDTeGqrxO3lnenKHAc0Prw+mrpRiipC530Ms=;
 b=F3vQ/DQC0cjWX/SKPdP+SsXi1m11uBiU7mS3YNgBh3P8/dqOzUJPpDZnrYJwBEz4Cq
 ICcI24WjtJelMWAMMHGKAoAlL8cs0OCrreIA9NorVHB+qZ+r81afkJMausuwJ5Kizl6r
 DnWjBZ00YphpcNEYEkHaAAdUVf3jsZocdBg6Jg+tO7b+G9mhVKmnfeZqJhhLxP8p/OW0
 ZiRMZ4XaKnzRWTUYLRqN9wMo6VMzBUA4OPUxje7qu/UObdGg4lYQ2GZuTwbgUVy52dMO
 K3Xzucdk6xdXHqvHl1iVcAbBXY+NBBqzUxhGVqdSccUBbuuSqKYkN0CVla+iXswTKqVk
 nmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795860061; x=1796464861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mbAgttOsDTeGqrxO3lnenKHAc0Prw+mrpRiipC530Ms=;
 b=F2piVEa/qlmYrzutQynAaDco9aRlwrLtAbEPeGUbb7AZVEtgoClDT9HABVlcZUIwaV
 MwH2WIz5yRU4wagby9ERy0WXhjCHX200LFsVsHZlrZEc9QhEl47TdQQKzQZvxIlvs7eV
 gOUJVqf6wdahKwFB8qU/jvsrqlk5G/KvRdhKqSGAKJfpEAX2Tk/5lcp9W5jbTLdBVqYp
 e9LGzFK+1+d6oYRkgWo6udle4eExouplAzRpesHe4JfgGHQBrUBjTlGe3o3af2PdbJK1
 tOvMgoqF/ZPaUT6gagV4FJ4I3LxY/ru33fn/cPl7xDDAuQk7d6q+A34iGIk3s0zXPqZV
 hsfg==
X-Gm-Message-State: APuU4Z/akxW9iCfdSGUAEZhN5AiJYj3vkEJsnb0lxJXZudMbz4FbrxeN
 KV7qGh1klDqcqDtwzka3kCDXiTiNyZhOvufM+vb3HQEU21DFalelNmjrG2f2nSg76A0=
X-Gm-Gg: AZFdTZe4zhhwJbt1AO4BJH8JjOiBxtrvoW3N6UUtkUvkKYRJpGaFY0YcU4VZAuzEzhw
 UUvOO6Tdsu9lE20o11dAhVG/Ft/LomV8RXWpZZbMl9CP7/wCjlkh8NCouvJxzjeUIFNlfgUUvJ+
 YJ8kNaCr1np5Y7+cfN3EeOtD6qxXq16awFSOLB37/QbWYQ+bMk4CaRJJYhttlY2qjRdzPquMvBu
 9m3jjgn+eY3rKJbUYy3aFPv5DYm5coKQG4MmgB/s32QZiYiYT1wfeznGApy/uXwNOUvVl+v8eG0
 5ojt+NamNoHkUJ4Z0FmEOpNk9kE76uP3IndfFZDcZTzdDzT14J7JHRt1vBVV/2BjTzs80slf7Jf
 zq5Wb2Eg+gF2KQFTDi9WPIEi70LZpnbqInZBeLolB4XJY3aRoi1xr3mBYRee/2bZ+m35CyDtRfu
 /ACkZ2ZRYWNTmqVpgeNjelkBXPG6COTR+wm+/L5N60jLMhytW3RFEoYIm5NU5Q4UvMJ40v32ndi
 bNn0RjV3plm49wwoX1smJFqRkVAF28CWMohCEr5ORNLE589A5Yfni3dopeRuEsNAi6p5YmLz4C0
 URK3gqE8ivhSew2IjnfEY3p3xrbe0z1l+5mlf7xVQzl8Zfhwvd0v6llwwlYCeQKBahJ/1Xidop0
 1
X-Received: by 2002:a5d:45c9:0:b0:49d:f98f:4666 with SMTP id
 ffacd0b85a97d-4abb0f3c85dmr41377567f8f.11.1795860060900; 
 Sat, 28 Nov 2026 02:01:00 -0800 (PST)
Received: from home.localdomain (mm-44-208-124-178.static.mgts.by.
 [178.124.208.44]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c340df4sm59743967f8f.55.2026.11.28.02.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2026 02:01:00 -0800 (PST)
From: Uladzimir Bely <wiselord1983@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Nov 2026 13:00:51 +0300
Message-ID: <20261128100051.1509171-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-mpd2: bump to version 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Uladzimir Bely <wiselord1983@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Switch _SITE to GitHub as version 3.1.2 has not been uploaded to PyPI.

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
---
 package/python-mpd2/python-mpd2.hash | 6 ++----
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index 0e5d9206a1..0286fdd2a2 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,3 @@
-# md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  b218d6f233c23da0bc82c372308bbf8d  python-mpd2-3.1.1.tar.gz
-sha256  4baec3584cc43ed9948d5559079fafc2679b06b2ade273e909b3582654b2b3f5  python-mpd2-3.1.1.tar.gz
-# Locally computed sha256 checksums
+# Locally computed
+sha256  8db24c423381625d6ae91aeb19de668e8d0c2a55f2f4c6b19b7775f4323d9123  python-mpd2-3.1.2.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index 2d2784e89d..16596cfd99 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.1.1
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/53/be/e77206eb35eb37ccd3506fba237e1431431d04c482707730ce2a6802e95c
+PYTHON_MPD2_VERSION = 3.1.2
+PYTHON_MPD2_SITE = $(call github,Mic92,python-mpd2,v$(PYTHON_MPD2_VERSION))
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
