Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A2606A329
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gsY//jlC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZNXKf70R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A1C60642;
	Tue,  3 Nov 2026 07:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUSDc8CkdLlR; Tue,  3 Nov 2026 07:03:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 27F6F606E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793689396;
	b=St3w9u2tnLrw/T6IfGKbSLMZYvwflm8YsCJqKbs7R5eMhxI2pTDjHev4cs6CqxHpA0t1
	 5xvvZiKkww9XD1j9F5e0wVIl3D9SJnioj8VIlZlsP33zQ+HQK4keAm/jTaZQInOnOZCtT
	 bTLSbMXVllgrYj/rPN+hjkkerHY66htjtrJYEtGEhSaty9xr7qZtzqdcmvdVWusEC0kBL
	 PfEavFzqLFmtvDZkHwiBoK6dswBY1NHx9+NZAQfBHRxRiFAKqsZIMpbcsVnPi4lIfKBLb
	 M5QsPYWqXeY+fIGh243olhJkwwUckqTbTA0PvQMbNfhy61ke6x+R0KQe/Rx1KXUIMbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1x+rQWsM51SXgDd+g4ICiagdm7JYJcsPkQfUs52+Cik=;
	b=qghaIHiRnRQgeuJhHmJLDYgdZwQhZRp/h2hupjUEo6C4yBR4MrqZZqkLfr5AYG4GpMQu
	 IwCglwytDRbmadWNvWd7zDzV9y5p9EWsXbZ2HrmCzVJgmsGfJ8+GoDkjn5TY/IjY1pWS8
	 rNx0PU7GBt3WVSuWqO7+Bmfk1uD8vGDX+Mk4VdRfvwX/fvuH/rP+552p+dGJE1+7urhex
	 ZikH6Xopjg8qcCMq1fxK0WtTiYnFjjA1hq8iAPLJbdK+4mhsmV+gWG4JRw5GASk/aI+Vx
	 n45S9bIEIJq8fmtIPavWU+G1SIU8Z+YmN3TFjdrZdwZL5s7s1LKxciUnvdnj9ShfZig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793689396;
	bh=1x+rQWsM51SXgDd+g4ICiagdm7JYJcsPkQfUs52+Cik=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gsY//jlCTcMAW+5DJZyNcvlAZ/dmjRpU6BN1ZPD4J8kjqC1IQzJhSfVXSPPMO88Qe
	 OHUXibo2Mh6QBFz/+5/qbXLfcq7puX5TbTP96JE+gO/sdn3gvq4f4QyBqRYK7IP6iR
	 cWiJPgHDAGEBi1cVDpfI2xLLr7FrMGIoI77+WCVz6NbOFjSH5vnFxF8AVageg7fBKh
	 Bcv1T1448sC+Y/XX1OKyfJonl0Umk8zAeUllFoqqPHfcH2TYAUVdv7B55n12I3Mg0K
	 A0g98DrUY1fwZZW8LrZ58tK1fuJdHWoOCWV6xvvU8pMo1CWZBEIfv8ReldTPDIRmHM
	 cRQDn6ru4ek4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F6F606E9;
	Tue,  3 Nov 2026 07:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA404BC
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6063B80E0D
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLD-NKVgT7hE for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 07:03:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9C26280E04
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793689392;
 b=qcPP8lAJMGj//G0blP9PjTvv/OlxOxjFgwEDWCgbcrDAWs8cDVo8HIQTD/uXtd8LAtQN
 ynLtDpH116K8GGCbEeeTDFSBxb/EB3E3SSssdQVftUtSUIbyQm+B3PF5allvrhmAu04fX
 Pm5T+QYufaPEBkG9QowrHWBoOz4y9qAmsJ09XxdonHqtY41/m2azkEZ/rYJ6v1eyOdjhz
 kA5b7764TCdLuFzmz9rce29bM0E9f/OHf8nXON2Ry4lpIwxLuEqYNVwnby3z18KWGxBi8
 9DiJJeQpeWU2XT3vfiXoVWfJfonMomjiMkpvrQSBLd9fgt6qxVo0oCRtn0jkyZiRVrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793689392;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iCQOq0SuZ2QDwjcgdWIwS6VLxem3fRWcAKWc+HXmAMs=;
 b=eimX/6RbL+49QAC7t9ud2cay7fBLopLenkFPjuhKp95EhRn/7/KMcQZ7N8SBOJmDIy8+
 KVom2ULH6riFwNmZFV01mpoHjhbqH4wtiilK9VuXNFL7tyouJabUvqg9NLBzKHOXvdnwf
 CgEo1waPDWUbYQ2QHSPJwPAMrZeJx754EEwfBzA1MHHQvuHK25CK6KVMvmmvnfFZLbz7N
 w6KoMTBhjVcalfHMru2UVxiLCrL4vn3Bl93XFnS+LBXjWsTv3RySuaVkTLLl/e5H+X16D
 bpFLhZgcme0QnoFnpPWIgCYxQkMvRfjdR3gBz5epJMHGhPA4bunaxiXPK6pV8SoP5Gw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZNXKf70R; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZNXKf70R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C26280E04
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793689387;
 bh=iCQOq0SuZ2QDwjcgdWIwS6VLxem3fRWcAKWc+HXmAMs=;
 h=From:To:Subject:Date:From;
 b=ZNXKf70R1NLjjtHwQOaw//mth7aHTHdTQK1qrGDHbFUEqMqnwbf9l4wBBMvEMIEgy
 GjuPA7zcpKHUn1zD05iXUj4ypDd3BD5JcvaBvkzx4SN3bMxcvfruPM/2Y1wGjGfdf6
 MTuGgW1U3WFWe6bVj4q9MhDN46HREXwMiy0MaB6ZCCV+4mPqGrvdw1QMn8xI3UyxAC
 Q8qntidWWGABg9ChBIcsO/kF1IVuzALIzekKJ+wnG4jk1Rn9cdQ4u36o7H3fPELnE6
 h8y04gre34RUAx9C/dK8HOsnuhqT7K+8i+u9Tu3RcFgtbOlFa5r2cpSwbxySjSBAyu
 xrX1bShnHxCIg==
X-KAS-Sym: v3:f51bdf72230551df:c1dhsUUCf51VkUnvoOV8ClHi9T4XixYUUkBTIQGf4vbxX
 TOdv+mtEbPmw+PFaoKQ2/0gPCHOxkRKIZuNC7zuUW3VVpFTNXwZm/jeujcZwpf20NgZ1hRlNNEw
 ZAWvt/EO9nfT+sf8yqjWdcxagITVmLW6wtafCnqS3VVg7yFlfonlo7ObXJ6GN6ng8mMASNOd54H
 8wwG0a9cH/G5k4Y4Ydt/y+YiVs7QjWnDQfiXFishGTyFg/nmA9HE0jMoLOk+/fMsr0rORaQ+Lu4
 U9atvGSp1jdsrmWMjPjL5grBKFnD8GBJjr37G3PKFfgU/B5BQASl89Ye0IvVumY7bTEkrVkQ==:
 wf0T6wZlqafZtNWAqWlPbzU278OTnFdexUoPQoqCqE3YTOqYQkYfmKOl4z+hm4cqmf+0rg6hH0y
 DAiHTgNHJ+EN2JOXlih+GhTJ/dHrU9WuNi2dgdiNcf0SEaFPDwmR3goiLw3GR92Q6e7JjvFMOfc
 SvIORFpuGNDjGi7DDqKwk2GM+WcuBcLVMsBy8ybpZ4tA5FjRHTFGIxxdksxLS7Wr2j8J4MwOw2t
 PfcVbq29EdTZQdd6FNnaf+j1BQHxBPbKvycP424+sLMDTygNDJL+26eXfN/22DH34rOkL9ZtYLn
 kLxCxqBwGBP7Q/F9mq+VNkO+xZtOaA+vkGRkeWuEzL42fQ9FhnUVCvjtQE7Z3LuFWCr/UPn/KFf
 EvYdTv78O9l8bpRyJ4tdwM3Q7gSxP5rYzroD8EWq2Qmw/hHzZDJIw/7jGOzoa078cWQ8Ygs1yqj
 HjUF0xH1sDV7BQc0yKe1ZteK0HgEFLzRasKA48xyPDYPQmV9mgo0evXXuKG0x2lWBB3zVJTfhu+
 9yQZBxYWimHFCdC+Wh7kx0ekHndG3CqxekK0CzqQgbm1d9XWb/h7V/52M/tsXotjGdjF95MPo00
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F010A4C2E79
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:03:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55072)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xO8Xz-000000003wI-2mDm
 for buildroot@buildroot.org; Tue, 03 Nov 2026 07:03:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 08:03:07 +0100
Message-ID: <20261103070307.5311-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to v7.387.0
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://code.videolan.org/videolan/libplacebo/-/tags/v7.387.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b9117ac30dfa30624a4382d6d54c55c613028808

with the exception of an unrelated build error with ffmpeg:
https://gitlab.com/bkuhls/buildroot/-/jobs/17679040093

which will be fixed by
https://patchwork.buildroot.org/project/buildroot/patch/20261101191738.2091630-1-bernd@kuhls.net/

 package/libplacebo/libplacebo.hash | 2 +-
 package/libplacebo/libplacebo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index ef6d5bdd10..bf895042a3 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8fb4d54ad9339e3530446f13b6a670b3819a00e295a55f675f0515d9dd94f52a  libplacebo-v7.360.1-git4.tar.gz
+sha256  a50147da90e108c8b6b367c7740c2049d055f2512621ebd8f2f972278b5937a7  libplacebo-v7.387.0-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index c3a2822fb5..6c492c8678 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.360.1
+LIBPLACEBO_VERSION = v7.387.0
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
