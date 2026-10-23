Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA791606A326
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GBCxcJTE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C598C816D5;
	Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3geZ15_50lMw; Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD1BA816A3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792333;
	b=fVfUS3xSLjt764BBfoSv4DPA8dBCxGRLNLbsEwA++7og9XKDoZ0xj6cvN085jiHjlBBM
	 pzRUh+vl3rnEkBf+ShJws6bSPg+Ize9K03bpkElCD81Kj0A7OHLvBjyOe+qTp8O53xufD
	 l75l2o2iGymSi5ORg5OmoID4UcikhztqOpmS2DqzfvOd/MusbqGvc6ou89+HIqs5tLsW6
	 Q8teEHWcgqj6xgXGFO07wfDmUEBzh6kBU/ngMyA2pT6Vw8JUK+GepKkxnaq8uJ239b2ND
	 JDVC06DufGkmvKS9am14TsAZeikxzA+nnCc5AcZL6MGxQOwmYjvWwA95SHm1B2Gk7vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	b=fHfG1K4AJTTuYhwG+UILqHxtQypn5b06wnAxGdIvkIzcj+7ZHFPjLlaQ6rkeJx/UxXyS
	 A8F/Tr4XLz0QYiTZCNmkFKR4gwWdJrK/IySEdAvULQPecNPI96ZTotVIZKfpaL49RbCCv
	 BK5WuJtLshn6nOmFwtDIEk833NBCtJmGc/RRQWMvTkxMRGnRfmveZz6WM2HOpo4yWn8En
	 8z4edf5W7zqoLG8qq3iHuCGCPjSIwqopK0QFOjj0WRvNwJrzlJ1woEacKIG5QmfNFL33O
	 7r1JpZLhXdcFoqrvCPNVPOLYx3bW9tr+23l+P0AmEEb9kxPjNKGGP8n45yEkLrXtcnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792333;
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GBCxcJTE8der2Q+IuxB8+xnVXsVrYVn8aAdKGfKIrkjcabL32zqh2KQuBZ4sWgr6Q
	 KbdoMT/dv+CdDYn8SNd+SIXMcLJrVyyg+CF5rTWu3jCmtKFxWlTAMBfNNF7ioyrxUq
	 8sbE+75URC7Owl/ZhHSB0DUDegQvlCBkNcFxTWPb/a9r1dbLuvjpBlSK6K/bbrSlQ/
	 7nDeliIY+XDPgShPg1oihfoLmkgMRBsljKfJXagzDCsyNJjq2WEEcjPBl+5v+u5vfj
	 FRJB6EAX9pGlGF7WBBHjmVDJ270SpGwJSIC3liaiALhSDnQxcwxBQ3DLJLUnzQ0KIt
	 c+KzAh30UxywQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1BA816A3;
	Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E109479F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEC138168B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-1dEwA7GBen for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 353688168A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792327;
 b=dp+kkovf6uuoigcAoSGkgMh9CY0cmf2UCuupMFQ19d9LJj2WkbBcwhINgnnVu7zE9vVG
 agxh+C5L8h8cRfk90blqVQ4314/feQQWtHjDzL6yV25IiBEs+OBSFnYZKhz5EgbzxDiak
 UlcFQoZyaCkMVFKGLNcCcU1JZQCY8zDLi7yBq7I7Lgz39G07OUKJUfPZUwMspyZNrMcQ2
 Z5iTV79xyNpLD9CGlBKPulR5GCnQYG/T8B/h618N19QJ0Wtwl23KUQWzZ/Tw9XrHU+fND
 5sZ+81EaVnm8aQeTv5NYkTmjXJw1aEzCuUueW6iHdbkcphE3HElAP+yqg30ZJX0hM+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792327;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=aQuDGQ4bZCyE4uGly2a6pn+Ts6rcwe9T78A5jJaiYGRg0XEQFdQ9AimrW17OQyjaCtVz
 e/Vb7yZL8cXcuDK0FEh8RlXXn2F0I00j4LsU5Jj0RK1i4oIlHrNH+nP7PxdQwyHYCx44w
 XFf+uBzpdTmHDWJ5wkICJ/BUqDJC/Ben0hzJ45fH2yFbVqUBruubMUydcawDb3iIOHcHQ
 Qw1hO676vsrhFkthsaPp1QKeJCNx71Mos8fJOUPQDvTE7VqWbuAmCwxnURK/vOdEZI8fT
 zKCP7PLqCRQ3QTWC/Gxls+S3owaWIu7/hRc2HB1q9GSijtIY4QeA2UHFnmT5zMGf6ew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=cVRGaAqC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1362"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1362; helo=mail-dy1-x1362.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-dy1-x1362.google.com (mail-dy1-x1362.google.com
 [IPv6:2607:f8b0:4864:20::1362])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 353688168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
Received: by mail-dy1-x1362.google.com with SMTP id
 5a478bee46e88-3535a54bed9so2083082eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792325; x=1793397125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=c9WGUledIYeINBI403ORt+YM44+i12D1wOvPppRKYNzItM2WHfxR3lWQKXLOTu4arO
 3uEdyvYh49mm8Cvi3EZU9RrAgeT7Zy7cmVzQi2Hwu/0qmrvRFuFaqGWkd0orb0b6UY9e
 65/zJNt9vx9cQBK0Q0pFqDkI6wtz8oBJG/mhQAIng9OYjJn/xILKqAOmDIfp5tvJfKOj
 k/N2okz7vi3nt9tOMSn/96J44X+xAJj0hjL2qQwXbSfGts7Mx1KMI2oq50G1RbAQP4ST
 2yOmt8YaBXBTMRnkh9XMV+RkJczGZquvdZOaQn7UTPRuFrBslAsanBTT6mTGlK33WpH7
 K2mQ==
X-Gm-Message-State: AFq9FYIrN769lsnJ6eOkda8GFMEaN94DoeeU3Z68OHq0O6uGaOxEWylV
 DPpn7nh4mU0mJxeAvt3CIZe/l6ONpJV6C1CwV1Sji9xNhSTX15hG9/T2MTH3usNS4El2amZjtJ6
 rK4Wzw+r4vQa+oc52cOZUfVhSSpZB//EwN+LRl9+/Hm7f+oPmt14TgfMvCNAQxHQH1/NfQTgWms
 p1CM73Agtob7bTzrH0lRuVeIogPbJXrYuPyHJfFm22GBP/ZAo+K9wHU/Cc4LMHMHouugCT4nAsi
 aX1ldmdqfrEDR8CH/rv
X-Gm-Gg: AYBFou3amX7dstbq4R8n0N6yb8jkp1t+/I9o0sVuJYQ37NwfDlPW1fHh3cQG7HJl/oD
 FqtRLEc1TTQulF1OxsxagKZwzuZfqqrNVVlSwQ09nfZFsZOmwbMMmf7572nG49ndJDjat/hnfju
 fy4efs1XvKipeTZ1QTO9l7WY9BGMtIfDfwHsrLmgWuABVvYKKV28JgMm+DP4za4PTJWHHSlu/AF
 lxY7PLibutTGKA8ZqSpgD7w9etzWUUtdHr9DCKCuBbLe0/66jMUTM4CI1SGpzElKVyInt59+On0
 g3y6WvDzZrl56F6lpVQcnXRVMLM/h23SPGQr9rcZmPxdE69m8ttR7LBUW3MW7lSxCmgOUGfUpx+
 2jeFwbB5/6AGzigO6Ll3w0ck4daNU0qpiHfu2+0vavTQqZ7kpgsBI5j9308hd6Yh2DbWNvZnHu6
 DQZPnEajJr46oRYtJVH6Kp4JNZHma/L/HcDbAKO/dI64k=
X-Received: by 2002:a05:693c:2802:b0:367:41d7:9deb with SMTP id
 5a478bee46e88-369e84bd8bcmr704733eec.33.1792792323748; 
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 5a478bee46e88-369e8f028dfsm5187eec.9.2026.10.23.14.52.03
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3510d0baf63so3211500eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:02 -0700 (PDT)
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id
 5a478bee46e88-369e842b438mr697895eec.13.1792792306259; 
 Fri, 23 Oct 2026 14:51:46 -0700 (PDT)
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id
 5a478bee46e88-369e842b438mr697777eec.13.1792792303954; 
 Fri, 23 Oct 2026 14:51:43 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:22 -0700
Message-Id: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 07/23] linux/linux: LINUX_VERSION_PROBED should
 run from build directory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

LINUX_VERSION_PROBED would be constructed from some configuration
options, like CONFIG_LOCALVERSION, so it needs to run from the build
directory, where Linux' .config is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0323ef5ceb5b5968eb9f6f00cbe26cf089a4d252)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 75294cff1842..a90e09afe906 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -197,7 +197,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_BUILDDIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
