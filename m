Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E1606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 23:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fS7CjRrH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A204460A81;
	Fri, 23 Oct 2026 23:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B84iVyK5KFq5; Fri, 23 Oct 2026 23:30:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3332560A5A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792798212;
	b=L5CdTNPiHx6S3cCPlxyoM7Nm+BGXYRSNpP7FVPHx2Q/uYJYlbw1a+sJoTdKfcHccetLX
	 Tn5uQullS+o+6CYwIbCM+7YfXz1AYqLpgN66PbE896FNDz8f7BH11RUL/BQR97OaufFLh
	 uQylOwuNXtjxXA1YBzjgSQFDoAm9WjssKFFC1NZUWlk+mBoculiFntt+jn2c0AzhOJ6yn
	 J06N/y2THwGqWSfNnWseQH76xzOeteTgIs7VXgX+gyC3PQTDMMo0Ale5Y02fRiLOA726k
	 qgfr4zZYJU9vhNamt/2kbgz1pIjl4kqqKP5EzR0o7UasWMORGBEQ4mV65Af6Gjyyjbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792798212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pa6go1JcH/Rd63KFBLw5/SLel23CPd5nuSUVvz3Er0g=;
	b=rvzk6psGBxsBXi+UTbskJu9JnNKt6S3lrnhwUoCIpQJhwhRwSkfdOTmrEMV5zP8qDG+z
	 ebTmsEHj6fZCEYIvsCijX5iZtQDO5RQIkrgOxxvpe4foWDgO+ZVUC3zrpmQiJJNUXKeot
	 CWMHCg2PAxlzKtn2uO4o6t8BiuhFp0kwTBXFZ+uvamiIvC3m1vieVNxgcdjO9NAxsT8zW
	 aeWlcNdZhpGk1XUl2jfv40673idNBxjGG88gqMd17rtgF8I3ET0cmLv43XW8w14S7sSwO
	 k7LVytqVemMAQFfiPoJw80tcT3mqD6VI50Cmu7NV5P0WTNfcsscwwLWTrM2s1s7o43Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792798212;
	bh=pa6go1JcH/Rd63KFBLw5/SLel23CPd5nuSUVvz3Er0g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fS7CjRrH27Pbf+iU6NeyQFL/IP3lfP8vICkKxoPkzrvtYIzDmq1PZgfRVXVsswtYZ
	 GF735ag5en+Eu2jO/T/ltpEToLC0pOHgAxDzwQ9G5MF2IFd/RzRPUzfb3YvhRPlm21
	 fHGVetidaQ3C/yb0b8I/l25uYMF2X2q+PffLuVovvKvBukcL6ntb0KuqoPLBFWgCM2
	 XUQCRtKQOvPFM/NGC1VD/C6ehs1vWB724DlFWBrrmmqrZE6BYG3QhcqEJTewzOa5YA
	 MSiCkgvMv5z1n/WdMRA6W044oWVaX6ZsAYrH1fEfzj/tZheZlIHZcPo73DE6klQQ3w
	 CNfJBOvu9iB9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3332560A5A;
	Fri, 23 Oct 2026 23:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1033F43
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0207E60A5A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh7xq60UdYuz for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 23:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDAAE60666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792798209;
 b=nyZx7Yh6Hgu42L/13EqkXGxdvEEMuD8Sb5aaa0hKFqGV0JNAWhQXiIGV+XsT7kegHi8w
 TKSlV1Gd2OH0C3bjad95gfvkfUrcddPBVV9JlUz6H8EKz3G9KEpbIy9iDLJcUcwN+ftkZ
 T61UIqX/8Kw0ChdLX8Uyk4tp7QC3lXX1hVtGTgeiEoQP27vBM04Q9R+q3hGwBMziNqTiH
 TYjk6nOh+FSKjD42eBIKdXezkTunzXBvXlku/IH8BILeyJIZWSMmcc+SkqB7sZWBrDmBa
 R08TL0lUxL6TG5eg5APAnhC1cnP5wPCbNpFSLQoz9bGWyTI2+4sZt8esND6QpHuXGVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792798209;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S19y0AHL8XW1MWU1j63zJJMie+kf8dIfEIuHox4w44I=;
 b=EjBChTkAI7j9MFlpIR236O3p9www3UfkkpkIlxHsu38uyHFrFeFu/VulgOk3h8aYMQW4
 S7PV1Q7rY9uDx232dRP11s7qA/zdy3bEXoLobbujZ3U6DuhBJGDAn8YiX8QigW0yjIeEu
 ip+BjrX9nYcLa7atzIh5mefXM+LUU7O3IhYjK+vwfch2ckWlFmpwai5KkggxolWAHz4Xd
 NmfemeWhwYrNEo7Vd3+9GXDRMDPFFMVe7wM58XaPlXy418qKC7nmjaMruwZZR9ueYUZou
 HNhKpUVYJR6CT7qnFusm26DqxPMMZKjRQQpCJ0gKdb6aPz48y8hR7xAMxPXj6Jr6iXg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="RSUS/WMw"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDAAE60666
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 23:30:08 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6acb9c018ffso1887177a12.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792798206; x=1793403006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S19y0AHL8XW1MWU1j63zJJMie+kf8dIfEIuHox4w44I=;
 b=wDcTxdwLhxKKzukVxr5akEKZmyhj+jzZBXsFR9B0UjitgfYYTPmUo1LRKaJaTfwxTs
 ek8mZJfNYpY2rf48Od9x5rdRyECCUExqiqH3VzuCz1cmp7JWSSgJBOD02zuI2zGqrlG3
 uc9/blTLiwnpCeOgo5RW+pOTwzkFp20cRKv5kepBvWvYu+bAbEs0jQfvXuMi6djw4Sic
 c9O/tpmiCgj+yeJzmUZSfne7QMV0jGyMrc7Kcg+r2QrqcGtGt+4vq0FgMvOz0NlSQmuU
 E+zGHURwta29HmxHu9ZFG1CVjN2ykiMd05ICZfm7KPnliEgBJuiZEAjslhUB72Jf8h8m
 qylA==
X-Gm-Message-State: AFq9FYKqpp601CUS0hliEUm4b9B8rCUVD2u9DsubNPiquNyCZrpnEFKN
 UTJZSuMXVRyuvaHxDkKixGyUgGTtPQbF7q+FrRg5oLWOxkTP2M78o3Z4/BgeTA==
X-Gm-Gg: AYBFou2dPg5UPs9kUBOzSgYfKOnabgJ9CU2lQ4F4FlCh8jde71hyUQwlwUi+RaUFZ+B
 JVToutd/5AI0m6DNdXIvPElu9iuwq3yOyMQHgCwzzTA8nepbLYvJsa4PKVA+rJcewNlT6eidFAy
 A2Q4TPOH35kc8+ekTBwn1OFbQ22eDXimsY/pAdWEOY+B4V01pxg8mwTNO70aP71masajuAJ/gSv
 6HQNuSL3XSomS+cOHEh1+BwPuHBE4bNtyUwHeYU7hYP73noVQzI2rRVAQ8ntMt39G86cCZVPpe+
 oYHUPylbKQwHyQNxznjOLwD3Vkot7Y6XQXRzfYi/XzmihgV9q28Wg/NWXVoaWO0dc463MWr6Tim
 0l/aGwEP03EqqxcOSnG1Q145RRtDsU2eT0MV+6YxRSaizY/ewJA0zx5K8uZrXAhyJ3SS/3cn/y7
 fjYuD8RxD1lpQ0besWSldEX8+R73sraJOc1CVr1RABb/P7/XJDh8p37I9kv3d1ZL0RBu6+XBioi
 TFU0bvoaCcTyKUAca6pFUW94bi69KoEh7o8HnQqY/BE3LsPYDaG0zpdlha6jJiJzg+RvoJ6UbBK
 q0jnk/6ra2IDrvbw4+UDJnnoROhXUWDWAKk=
X-Received: by 2002:a05:6402:e08:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b443a2fee7mr753482a12.10.1792798206221; 
 Fri, 23 Oct 2026 16:30:06 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b44595e251sm173982a12.12.2026.10.23.16.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 16:30:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 01:30:05 +0200
Message-Id: <20261023233005.2692911-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rtai: fix download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RTAI download area has been removed from www.rtai.org, so the
download fails with:

  ERROR 404: Not Found.

The website now points to a GitHub repository holding the former
rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
Download it from there, pinned to the commit that added it, so that
the URL doesn't depend on the repository branch. The tarball is
identical, so the hash is unchanged.

This is not caused by a Buildroot change: the download URL has been
the same for years, and upstream removed the files. All maintained
branches use the same URL and are therefore affected as well.

Fixes:
https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b

[1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/rtai/rtai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6b309ebf85..6e189bf27b 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
