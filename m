Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F940606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RFKOJj1+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ftn953Ey
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0769607DB;
	Tue, 27 Oct 2026 16:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mG4RSY2YwML; Tue, 27 Oct 2026 16:40:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 045856073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793119229;
	b=AE+TCdTG8M8KI6yhYuAe0EgsGmeKmXY8yeO8kVrT32yE8pfvfcT3yYHNgW0413kYS2NV
	 LNFvte4D1bnWdGj2k0jhGi8bjfBVrew6g/qJ5/ekGqBoALlJfVQWzgit4EWTOe1qNIF0N
	 gDUeMp5q62sYCv8ko0+lC0iE6xk6NkBb3xG+gZ5x3Z5Mvj0y+ufpIB6+Vl4ZHY3vzQW6N
	 yw9mQPYqNSaZNpYLxziRryCkEirZjszwYBFjemlQAhKLTyhsCxOta8rs79hUjXQlGb5ny
	 pf58Ho+U9FAE4/sgU4wi6OkqM5jz0HFjzXC88XtebAs4/WncLUNA8BVUjcIhLgDh4nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793119229;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Osh3kSfLtSIcGWDOLcdf3NRBuMuVhvZLHqhIDPz8emg=;
	b=ohhZ+BR44JqZcx+VAovr+L415hmlffUEDjNdzTY1VynWMCCzejQOIxlhcfVhcMktT3r6
	 twMXiQ+nlu+rKbcmd8MizUCe5C26ZL8JfVyJUKFLegwljobrlfgFYnZx/4AfJrg+EVb8K
	 B6TFQ2CwY/FuKiZdgignFxMTNGcHbZWXN4IWQaxs2MPxwZZBPzVY+lFprC7mh2pgwpsz5
	 Lj6Uhbj7TllcJ7uJBk7Vu6DaxJIptwsoBL7PjcQJ2ffYbAagGWWsJDbRwXjpuxcQBP0aL
	 qgvTAA5ErpH928daCIi5dZbxJQQqZpIBjqyT1ZnXMsHudTjeDQsDot5Ejg+x2uAGwvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793119229;
	bh=Osh3kSfLtSIcGWDOLcdf3NRBuMuVhvZLHqhIDPz8emg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RFKOJj1+2t3TnpKN5MhPbSmDG5vcWIvWvQvHPg4iZjq9+JlszuAoEI/mIfSrBpu31
	 t2u5F5oFEuZNHqRucxYSxvx4efC6gDIVuavm81c9hEP/zMob2FBykHoACfU+rwMP47
	 Vn4J6wr/BMRd40M+LV9qilC9UM+mvZ3cbUxqn+HNNTy3x8+PpXKQuwZKIPfesnU+WB
	 8NzWQ9fi7ItvyZUG1F/La/wLzwL9C2bK5YcFZa2x0WHPcjR8+zZz692szl4aZ+dOu1
	 ajd9clmcE6KtYrLWpnVkFEEtA7ufkCjXVeWsHVKvaErrMUGq0WOLV7lw44Tu0KuBBd
	 lNyV6Y1fE4E2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045856073B;
	Tue, 27 Oct 2026 16:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 742BD72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A34740534
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoD1f8n9Bv8u for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:40:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 217CB4057E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793119221;
 b=oNIXjSYbJk9IgTdoH3DNp9Ary1obe2uLchzOX8Tehh0EByJ12JMtX0ZOiMcHmBMz+G2c
 z3r1BEZQIKujORKQX6QKeC2ZbaiG9c5dGAdrHeFuviFwg5wWEEJH4jkRzKs6xTS95vEFx
 5v+V4KjVpDdCLoJnGP84aEhxI3pne5zBhZYKWmThj7cTT18+rafAaBAtDyfe9BOowPzM1
 +NBWbPXGreUjKpkWHjI4EcmKt0SeFRuNXsDdxJNzTkHBGSHa7jjRq+ULy5kl06CMvZjE2
 88QG7v7iqYjUw5sQHxjiD6jUdGwq3KRr9OcD1az2vTEYNENeRhC5ZINrKBsXIEPsZfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793119221;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yI4o22e7xe8K/vq35LvkacHTryQ+qlGmIy+RYvb6nzU=;
 b=qfMKIYSxA0A1YYhhF910lUQVSDLVGv/XWt7cpoi7eMxqcAffxdVs522I8+0Iy2IacZ+y
 UL4wWZEXcVOBr1QXrarIFlZa4eNqWDcoXTo1GhCA6Q+zzySjg12RLnFDIJmT8RXEI4frd
 m7HBOxwPcfOUQErIxgpWYan0M1vY9EiI7pa154nUrlQX1w4fMm8HKIcVxQ4aK8I8AE04I
 ssvE48svc5JoQXGpoN6Mq/f4tdf5php10mvD2sWyIgcpyrA8TUgcSdjln5vfzE61wvAZs
 Ns1gY5p0+ajHjX4osbW069wj9aO2yHRLNy8ip7ltbjLBgHz68B5FNq/sihuipJeU/rw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ftn953Ey; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ftn953Ey
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217CB4057E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:40:19 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c38ac078440so7566b.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793119218; x=1793724018;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yI4o22e7xe8K/vq35LvkacHTryQ+qlGmIy+RYvb6nzU=;
 b=ftn953Ey4pIfhmZfAkAuNDD+D4G6BuEJI+4eHm+wuT4SlEmtCFu/IPDbHIPJcikC0F
 0am5YFfMb6JVM62CkCOLvRwcCqO/ucTQ0v7jjGMITwDWHXNsN4E2ExIAOq5FXt5Be3HR
 SvVzxps7GWBTYJuAVTJ6TnwpmjtElCsjn8+As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793119218; x=1793724018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yI4o22e7xe8K/vq35LvkacHTryQ+qlGmIy+RYvb6nzU=;
 b=DJHVzHC3VrZFb7uIi1lE8tUZFCRNUl0HL21e6Kmjt/mXD6MaQ5HL2axVSxqPz+M/v6
 s8uR6n68ovkFItFIg/SHm8VpEZdu4RF6IrxWaI7VPXrEyJPBnnCp836vb8P1hO0uywYz
 eIUk2gIIZm1fkdAAAWWBSgYnVi2cKsIg36TDSkLBLdN7p9q8+4kIpOjk5ptygfuxo3/t
 Pyf3DJz2zH+jb/RsdMN+nO+/x0Kb79rr4ts9u+/Ocnn9gypocDY1wq611nTdSY5DyIdb
 uJ4VvjBWy1ZnuRB1MaDJVoEW0sPldX1eTZyPvjn5H4XjHb7uTFMw8hzpJu5CL//zVl51
 j4QA==
X-Gm-Message-State: AFq9FYLOYQ8AiPYfakFs2AIKNeTZBu5/VygS1vyo4W04rhGwR2BkrQuE
 0kqCgsTazvN8qsfcTcAHNcQZ3poKCqGERKcqW1tNRnFFp1O6SJEddM17jBN4UrRGZ4qBM7KpVNQ
 iv8kt01A=
X-Gm-Gg: AYBFou0pKendi7jHRRraAlcoxBtkFu6cdO/DYIgRlDZQXJWE3OdelRuhwYYwMeP3a2X
 NbWSA+EqJLJbxX21Y9vKMz2aGGsEc+2/Nn7NcC3+kwMhJfE2ORI5TE9T97hmAbwwrAS1+Hc5Iu/
 zMrJJK83yDtgpb1NT6bXwcDJmc5fiOHtjSyf53worap11BBa6C2ChBwMsG1/8W+bXre8cJ9rgm4
 yaOKq/Ag8q3r6LRFDBrnmARXgFtqsBOzJEPHfIyzd5M7XIfR51UzMHBilnW/XVpmPg5XxFxjqSG
 p9omcBMKa7Bo2RCJk99+j6vCstkQdDeYahKdNFYUoxh+yfLoT+Cgkfo0HmkSwF5LyNr5hq7d0I0
 fq4yo/XtOmQK5s5uPbXK3EGzuhSysuOg4Ffa2Tx6PmnoxNkMq32S4nHM1ZaLva6SEJD31HfHFoE
 jlskJ4wcvPGO1stvXfv6iqEQCaA5lyOKrwhDKQw21MvASrnIfStrmPLHnNbh0m0RWyv3lzlJcEe
 Sv4zzJfRB1jJqANKlFd/OfA1rkmmaoEc4HFzspiv/pu+6uh2ZsxYk49iPV5W7xecf0d+J/6Mjq0
 r/s6NrrLd733Cr5AfEXVOeQ9RDmy8M0NzU3nf10ncIkuLDWNyVIVT7jtGimw7uXD0sK0XpsE/K+
 +gDb8g0yXNVgBFsT9f+PsDLf+CpmMxAdQc+wH+lg6Q6xM3Z9iptO/V7xL8fMn/g==
X-Received: by 2002:a17:906:9c9:b0:c40:b477:df98 with SMTP id
 a640c23a62f3a-c46bdb90074mr1176790766b.2.1793119218030; 
 Tue, 27 Oct 2026 09:40:18 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79683csm479171966b.69.2026.10.27.09.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 09:40:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:40:01 +0100
Message-ID: <20261027164013.1602502-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 04/14] package/mender-grubenv: bump to
 version 32e10c0b
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 2 +-
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 06456f6818..1780c8a180 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94fb6f  mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz
+sha256  88c9cc9ea375b8391e6a2ab716e758c3ef1d10145496d7abcea0f1a7a6867a97  mender-grubenv-32e10c0b33b26277099b5ce7047896202cd18781.tar.gz
 sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index d93159802d..9604958fbf 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4
+MENDER_GRUBENV_VERSION = 32e10c0b33b26277099b5ce7047896202cd18781
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
