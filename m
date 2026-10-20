Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150C606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G6rdX/gw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y08ONefw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDFA60712;
	Tue, 20 Oct 2026 22:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3Q0kR7uGxvv; Tue, 20 Oct 2026 22:12:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B347A6071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792534357;
	b=hreWAX79i8VzUhChBtPGfEnQldhQ4dxtwu/tdrGmmaK8e0UD3SrnygQTkfiuWS05pJbe
	 NEceTqn/FVS1oMTTfMkDhgabpTJscqcc/sIRFUvbaT0RvgmM7VexmqGBiw+GIHD6qVoJZ
	 xvQlfe9Mqykb76/5PWzA2NOXetNh7m6JshQ+Zfw1KSdIQP5rA4FqKFqoNnbEfMpw3UMUN
	 XjU86nwxZfAQtduCEIhcLWIxKGmg2Nk3d6npOSs/wBQreDxWCgoG0+F8KWPqi5xe8BSUz
	 vi2NCXXtI6svv9VSI+NKc43hJZz1ZsBWMJitCIdmxsRCKufJKURDH5MTb9WvoSc05og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792534357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NlwUja/PfYPyEd3bZ8xaS3HXI2DyQQ1fIph/O5XjbQg=;
	b=Jg6eG5URgT4WYCUmJywIlldFnvLVrS0Oi1sl23O5vMeG6Ge6OAJoWmrlu+4Kt9TcSmTO
	 leHGEJ7aK3Lr5ijAJTKKFhJ0CG/0nYG4cJ6IYN4sPC+Vu7OhvWn2/aDdINw6/CRtxR2ba
	 oW3sIVysCgcjBYJyyb8GCXzXn+nE/5T3KjWf3TpaWpgtz7L9JTsLuMru4J3CMrz/9O5oP
	 DWKPmlaVwhX8eYODY4hqT/ZUqtVh+/nBlFiXyYEq+ycNK1PyE+wF2p4TbWAyshZ+Tcj79
	 Ams5Ruqg8qjiVUCaZaEAMs7hTbpvN714cDfudNBLAlWtlCHLUcoZcAt6sIDE5NSgrgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792534357;
	bh=NlwUja/PfYPyEd3bZ8xaS3HXI2DyQQ1fIph/O5XjbQg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G6rdX/gwQiKQbwsjMf0uadXdlbavQaOzqUtbwy1DCbK6CTJzxglDlGuiOe8tutfhK
	 iXTnudO1/QCs+lBrKSvGBYFxXBovIP1g249Wz4MFg+rWBkFZD9in+0jm0HKd4wtbpq
	 VRNTkewY6EZGTfd0RsOojkzzzQcm+WufH19buI2pVz3+NTd/RQy1WvcDgNQlBM4K78
	 IMlSiOz3wURXBR6SNpqaxUQNLupgX1zVlMyIcx0vfzZmxn+1uonUngZy+/Hpg+ioHd
	 uECrh7MeVDS6bHPf4bljdG8h9P7a3DlYnTAPkmuB/Wckrcz/c180DMYrhuRtGFogdH
	 KDlZo2MjDJSBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B347A6071D;
	Tue, 20 Oct 2026 22:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA38A769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFFB080F90
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKsPAo7UZs4L for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:12:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0CB0B80F9E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792534356;
 b=gPZ+NPZTwto5hfz6rLNNgCjIVJND37tf+ojWJl4qJ+tu07fyEa+HVlkZcKl/nafsAbWG
 fqEYLRRUGbw20+gGKS2PDDaD2yEivHdIb/HB4nCiwrDp7nz4xaHyJCi6RA3me0hLGmVDS
 hBWGD/msNuqbFgo7ysaT2O/PORrrwpWoImGFTV556nBX9YuV9XG9NE1wWCqZHQr5f125D
 zOH8k2FuGL53QzlED0L0nYvmq/Drl1AjfpQvnUFGtlEfKlKm1N9amW+RMsTvhTWKUVrK0
 1pM0n8VUf87395UVx6lB2JTGPG/wbRMVXhhDeRL8GnJrYWrRZVVgCSQAjdHxPsEquBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792534356;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=iitu94DfyLoKEjwki5Ls0K7V91OhJRwIHTsEkMOllEE=;
 b=P3A8ougQ6mA0RHMBM0g6BXOiO8Nr6N2XJsFCmXKjTaO/WImq4NBYFTm75XsDsBn67oe3
 XTLxU+Ok9fpZ8e13NEavaLShNRQkWN0i+rsNrYEj2mwa2b+/FvuAqDaYxNPs0ueQsyXOT
 sIw7fPWpNa6VVMOc3fWaJmrxCFbW5eNARkpqZfaicw6KNP/Ka/pB/H4O8IYfq7HQ6DXLx
 L5bA3H78H3Sy/LtXZEpxEoMIzhQ4zkKyf+rdo+HgRARd97OJ5DMN9SUn1ZiAe1JQC/X2N
 Qa0ebCuEE/FvMLLmuOWlLa8hdoHv43JYUM8dZUDOPkFwxdTBs1hmwwIoSuYz9Vi/e3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y08ONefw; 
 arc=none smtp.remote-ip="2001:4860:4864:20::32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y08ONefw
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB0B80F9E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:12:35 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-451a49abd8aso119794fac.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792534354; x=1793139154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iitu94DfyLoKEjwki5Ls0K7V91OhJRwIHTsEkMOllEE=;
 b=Y08ONefwRx452JbY1ZAbKKZ0CtQnkg+QSCYPuEbTCbou7T0mPDalzYMgGGOxnpj4M5
 vqtuiI6m2rgo+cPElilb+ZC01KzjPUTq0DN/NYgZeptVYiQWjMRhL9Q2OU0ILqMGN3qd
 i6A0tAPJfBkYa1GSpWUDFEyxCyS0iLIncqnaH5iU11ExF25Jor+T4NqbXE4o5T91uaXG
 kKoOul8AQakWoZgESt4uyvAsbUj/JOF97L0B5mkAk1U+M70sH8V9XvCOZcW5LdmfMI5n
 QDbQsjPZimKhkvd3j0V8azWW5j8Sv00q2UroleUXUMLpZgEbODlghSuxLrh+1+869cSl
 fuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792534354; x=1793139154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iitu94DfyLoKEjwki5Ls0K7V91OhJRwIHTsEkMOllEE=;
 b=vxILx57TteY8fW8eWYoj+vzHQHpmuIw1S8Z4t/niYKxToPr9OrBDSevu7nV6UTdWds
 vM7WLdgdSYIlLNP7Mhy+o6fPqqf+lZLUBguaxZE5sZyRPy/+hU+fOOY4hHvEwWZYehXw
 zGOpELq+tJ9w+bd9ThLXRbEDoAohcrTEJSu7kLfomuKaYG0eN1MUzNlIWhauE3t+o9PO
 Ya50XnzSR5wm7FSRB6+LcJkX+q3Ccfq5e1u1spzxivXJeJiHuufOTsjl88kvucnONDen
 s8Mg0a4VOvX2fJIUxWhUkMBY89sawtSTOtCYbXaTBKCiYikOozHpht6+HUXCTrDo2j1m
 Nacw==
X-Gm-Message-State: AFq9FYJ36DCLnXXqTgtFjUYBD2vSZadBp/Dvrlh7Hnms1+u2m7/eeGog
 FZECzkYQ/3nzZ2G7GZ86R0/OUunRL0KmO4746+OsWiwyYBweMqj0BIxrBK1v+A==
X-Gm-Gg: AYBFou1rkybLPExfw/HZ132e28kzhzl0vFUeKEeqckaIwPX3cmyqm1O9Rp4z9LoDGkn
 V3gawxlr+9nA45bycAXZIYG4JcxglPHla8vUH5XzBKxonllK8DVQ9CPuFvoYoeviS2AA50Ey+5k
 5UCuPfy+xUmG97xwBabBv1P7YF+t/Lx9ToDD8FyDCso4W7FREjE8MSO4I51EA92nr8Hj8AKH3gu
 ezwh4VeiTNiVF9gk9plTCEp12p2asnD+DI4CZxza382VcX6ILv3xScW1XFNueqp5PPiLwL0WIvw
 OGq7tNQeNVNnkqm+bHP6RVW/66kquwJ0EfVq8x+fXjEfVZkix4+9aUE3MD+FYgaFDWi0J3PzP2l
 5qAVyka8tIwlkoOXMn09svJaA13nocwJkVvwjo0Wc4pUS093ad25bDjH62uHyg/mzwAcg2WqX4O
 S7c7ZMzdwTvnpEFxdP+zw2bCaa7p5uTlDYr80EIOJtpjnFoL8EeuHQPkI6y8FbvPdIXKQUQi+YM
 Oh8rcrOIF2wzNtJjgfWcaiPdwcJPARESLoEKZVEEfx7iH1uLAFl4VRy8XYrJCe0igmn2sxA0uvF
 yr9eiDUNHkZv28gbFvY8kROog2dQCJmrkCKZfcbS9OntOSFUQzMXBo/iSqWXZTav6mHyUHPGQcl
 A/MtBPp91W8DOsOFNVQ59WeDH4HEj/v6OTotONXbTZQ==
X-Received: by 2002:a05:6870:aa8e:b0:48f:e0e5:a1f8 with SMTP id
 586e51a60fabf-4a7dc225504mr42308fac.44.1792534354469; 
 Tue, 20 Oct 2026 15:12:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a7d61ce790sm594912fac.11.2026.10.20.15.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 15:12:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Oct 2026 16:12:32 -0600
Message-ID: <20261020221232.1579432-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tailscale: bump to version 1.104.1
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index 5683610ef2..761fc9b1c4 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4c0e5916bb4cf5a8a46791788534e8931a622ffac32dbff5bd8f21df7272029  tailscale-1.102.5-go2.tar.gz
+sha256  40e552cdf23c09c413fbb2f8f9744502a1a923bbb7a899708912dd201c689240  tailscale-1.104.1-go2.tar.gz
 sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 9c24d6aaf3..ff4c68f0fd 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.102.5
+TAILSCALE_VERSION = 1.104.1
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
