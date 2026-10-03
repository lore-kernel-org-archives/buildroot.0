Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6CECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59947812AC;
	Sat,  3 Oct 2026 08:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhJTHKfAc3AN; Sat,  3 Oct 2026 08:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6C4B081289
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017680;
	b=eBPtubgb8nI3zgMODtlAnXTjQj21Fpo24a7NfesANYAarQ7M65TWI/bXNLOhEtrp16MY
	 LccTmhyFtD+0TuNlHYdhuSRwFj/HLK3q+38lhNJso+obF054ZT9FuTIB/STr2pm0wgFPx
	 ZPZuGvFxL0dSgIRCTkXnaKA+oQ7406SUf7xSETKnpziPTaTM/Sp7OpXC0G65AB4J4vn4t
	 u1PxIx+wOGCmbeDSHZPeIfko4HZ3cpEkguCbWAlIs1psifLZCu3A9zPNnEjyjlfFTFEsp
	 Xe2Tw7wDKaKDTimjEJNgulRmTwFbuk0zmKEmZJSa6Dsif1go1w0uT8o/XxupkxyMdow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y8MQR0mlpfJRYIff3KpSWYDloUBZ5mquCLj5a2ypkZo=;
	b=gLKoPtLmy2VB3ixios+7EbZn2hqTwZ7rpZqrRQ7tI4rUtjuI2DBDm8S2ZfdynuKGvOFW
	 a4KiwWHjC/wYBLR3Sa9KpZK2diZDEMKCIXF5jH44cUcafNZ5nQ+4pHnaquAHhhsY+k04k
	 NpcYVGL/v9sFhk2uq/FmXXcrbcNjoMsriJ5mZd+b8bx7HF2g5n1gWkHfZiVHrTsTVjJTm
	 pUvIb96y1P843nHCApEvohflqZHXGoxdK0a39Kqv3vv5ii4xJ1RqZBNMNk7/ZsssJNE+2
	 ueX9eU950yQub1vewSUeosHGCXb0SPSQSqnCb0eSlArNnES7dvddzBPRhTIBAAxjEsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017680;
	bh=y8MQR0mlpfJRYIff3KpSWYDloUBZ5mquCLj5a2ypkZo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JKPpRaAso98hCIs/LX/JGUHM/KbDjNXDIUWPq3GyqKvukVFlbAqSB7Wv+HFA2IH9k
	 MD0MyCA8ANvHBxot/Ci684T+8aex6yZdAtalrQB627z86oPFvjOourNvu6VAPbP3ft
	 rnkcnezTxupbhrXGXFKTuF88JfM0ZhSmjETtW1rIuIMaK7SNuOXtafDzLU0IXehl9e
	 qH8jeSBGCCXQrZAtaxe41/7ut1DSY4VGZUp1+fJv7vLuJZiSbvWIBdUwcKV3GcbD+R
	 2zJ2aw5FhvfypQoIlphSG+xQ8i8M92NRwTKQ44L/WuQX/mgmQvL8BQIYgcv8AftVVP
	 jyIHK4/QrxNRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C4B081289;
	Sat,  3 Oct 2026 08:54:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3A732F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F113E410CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHh_Uftqu36C for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D60A8410C8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017678;
 b=SbGq1O8g8MGsRCfo2GZOU/9ufANmonTDGhnAwaXq9eK1Yqlt9tCtem8N0wRyz3NKXvw3
 rqiqWGYfaA1ErCYumhgj+PRquKI7dNqWBljtSfWigRUDCXErCqo2HFc8VXxIesMvkiYTB
 eeaQCS1ph01fNaruCKjZV5oN29K0BQoIor2IC+zmSL89KpXZw/igc09o/x+Y9Hp5SLfkz
 4ai78F25ibBaZR7VfqjGyKC6MHmNN9j8pCTG0ojuCIpPadDcusscRAGuQ8FS8e5NBIXiN
 14TJbYcwTVIcJOFhdf3DabpIAi2/yo47zNU/Ic9/+WvzGHUzGgDVB1mCMO3sbLUfKRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017678;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=jXXUGQoW4uadNpswk9UFvRDIthHRc+95BAMNQJmqN3s=;
 b=LvIXFcT15ZOSGetMLREhwWGEGOAJL/Tk7CNUFHv/XLLweWrlRyXys6beqCiN0EvIRO80
 f3eNY8NBTh4UoE8ROPJf/2T2md9WdROd4Qx2FT0M7WK0FeJs3R1XVrIHSpAMJEc3caoXO
 bZUIpAGcpc0a5UAp5ixrrHiNboJ3+VBsFUzIV8K+psnfPAJrjxq4UFx3oU4PAQEEeYVJV
 LZ3Zc1pmWTiYA04SqUe3GhM3/hxD9uBQ6CT8cv90oYz8ku8q8wxHzvCfiub3O32XZonMN
 vgyeXxYlep+hhUAuYTbrCZf82BAiQCu8csw3jO2tUnXrTTplmb4eERBhEhbnHPEVx6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eDTSjcAy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eDTSjcAy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D60A8410C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791017675;
 bh=jXXUGQoW4uadNpswk9UFvRDIthHRc+95BAMNQJmqN3s=;
 h=From:To:Cc:Subject:Date:From;
 b=eDTSjcAynJJMImRbSlxfd9Aq+SsQ6+ku+XeoKwpU3ArcW+EQptEfrouNhFGFXFXxL
 yNrFHnbvs6bPkXworpQ7ZuJc1TI21oPafIKe+RanT3It7gXhonf2YxUM3/4eMSt9yV
 8D2eFBozuAV+PtW+DBcC7STaggQSqmxZonHsZ9+TGbm5tqXmmT4EdO0qpoDN4iXl6e
 RVB5A1uGI223Lp+CoGkTigKdJTEdFw9oaCdzUj/kmITIvPNqw7X1yrgh8iV+iOsdW4
 Cl2KTNprGJBZnvcQOi1ptXAdfJMcQ+P2TKr9IbZburPwcW++T6KEOQLtEe1UjNp1fs
 e/gHvnu7TERBw==
X-KAS-Sym: v3:f51bdf72230551df:ovjtVWi/4YQWIzAORb+3fcoyG8FQpBhWNV7oAw9NtEbMd
 wg35e3TSUqmSXtrtB2Nug8L3nK3h+2wDnWaGdT3QdcvZmsHSa/Sh+dXK5qu9I+1sdE1HLrIwdMc
 DX2wOZdLu+yfWxEOnB/kZNFBGLZoNAX+5qRbTUeyyMsAtJ7phNaj+bNW3Ulm+eI3B6a6wBle6oH
 TFJjWZRzAdUCyOzofK8mBuHorvC6HjesIVO8n6v5aQA7kX/k0hmkIGOnebyxiUuM9BDCyIKYTov
 1SBvVPWLMepqgaxQUXcX/PBn7fV6l2PRGMIzVG+bDqusGGWwckWNt2Pcw+8HSMJY+RRu5apw==:
 SybsKX04vO92jonkw0o4D13fTBKE65Yppl2o9cDtONwId+dSOOKCQH6ud5raneTXGJqAWCs2/6L
 xYB2ujtgePRyDN+UmU4YQGm7FUwkUYdvAYOdzifKbtbb5x7iSGzaIEyfs01QqP1LXz2eLnjZQl1
 MSnJRiKAnjDzAuro+jaJ9qL0XkJowGAa7lw9ventD22XcR61AiutRIwOB0ayiQOBFOAep4wcDgF
 EJ0o/SFyHpADuBwEUggMJXWL/ElYhduFgkzyqmjx6CvTgO1DIE4ofGTPVS72TyjUOoiLA7KUm/6
 ylcS2XWB+AL5fsh24s9AkCgyi/hY/rKjqlMhazQChlWu1D2ZihQnLDBFetAIm65OXXKTazpPMD3
 u6zYll8MzLL1uK50OXLj396xAhiKTp+ws6Jsg2LaOMC0faWofVQ0JQTAqn0ZQS3TZO6B1nfSWZc
 X4Jwc1ILOfxPh8VdRGLlCWs5dqNY07O++BzhsO709y4zmaAWa1JIryk+Iivjvr141YaXXWhqvSJ
 kKrABFl2/8RGLg9HUG/omOQXefjy56ip6aZMytYMpfYEoSsc/9wsdiKD2XT+9K8H//jXlL322t1
 TlRJZAweVqhqr43V6h9qw6fJKjstQYFkkzQUcRV4wdgNEOUZYY1dqmxpvdDwxd7Ux1umF8ZCgOW
 o/Y2u2FNE+Qmy9QTwrg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EBF7A4C26F7;
 Sat,  3 Oct 2026 10:54:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51152)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCvVr-000000002Ds-1m13;
 Sat, 03 Oct 2026 08:54:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 10:54:35 +0200
Message-ID: <20261003085435.2467456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump version to
 3.12.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ijl/orjson/blob/3.12.0/CHANGELOG.md

Upstream added code which uses the MPL-2.0 license in version 3.11.6:
https://github.com/ijl/orjson/commit/f12e56208a4a9e56cab3a48f5d761c146393be24

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-orjson/python-orjson.hash | 3 ++-
 package/python-orjson/python-orjson.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f4443fcc9b..14e6c2800a 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,6 @@
 # Locally calculated after vendoring
-sha256  cd415890f20e7f29055b5057d3ff5af7c673ffc3d7e659ec68e9377f13604065  python-orjson-3.11.5-cargo6.tar.gz
+sha256  5cae5a2c983f959e634ddd719faa35ea10b692bced61b4df74d81e281e514fb1  python-orjson-3.12.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSE-MPL-2.0
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 9b5016c9e4..15a2cb7873 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.11.5
+PYTHON_ORJSON_VERSION = 3.12.0
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/04/b8/333fdb27840f3bf04022d21b654a35f58e15407183aeb16f3b41aa053446
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/0f/f3/742fb1f62b825f2c010697eaf4e828004bc2a81e7e806666989c132c7c42
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
-PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT, MPL-2.0
+PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT LICENSE-MPL-2.0
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
