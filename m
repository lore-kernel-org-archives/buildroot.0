Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28F2CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664586060C;
	Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFlqpz6mGh3R; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7720460611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333466;
	b=Ex0iIvJ9Nb7S0as+I0KEXgqx/T14pgcVx0aIn9zJJfwZMXdB7He6DqVv1EltP+Bx8CkG
	 VW452r4csXgX5bD61iXijZf9Q8WumrfcKbgkSjXBpgm0SAYKhMH2PjlVK6t1wzQ6epWsy
	 fpH+Ec9prZ5c0cW6Qw6JOFWrzbpBHx4HZk6tN5NK965gDRQl2LGruHKNeT2ZWB5PD/jxB
	 ZYXsqXgcPapjfJAVOllOivX6uh73H3RZpJ4V7jQFqhXkjKwMCECVx7oEVkBuOcSl4uCqx
	 5Jw1fTIIFNbVgGfq368m1u/e4zQvH6d1ix4WkgMiF6yWsOk1WGVWRxRSL5yP/pPHt0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RXMd6hEvE4Zsdn8WyhVPXs7/vZQwQPyEELlSSh1RDCo=;
	b=EsznO/uv/M178GiWIEDoqZNNRekPDQKJK6Z3rYDAUV2PWOobkThG9eFZj7vCGWrtJSx9
	 mB+c45rYfDLNLPezQ3nyOfg3LnyumJ3plm9P0y+5FgrgtE8BL5uEnYT1pDKD29xyWMh5P
	 aHAEmSTssnLLTWxTiwNMK+FUSBupNtqLVknT2jO7+V1prRHXq/UtdUoxtgHlpVdvHObCQ
	 r/HJhqYTak5Z1zpBOIcWUJv+FKcUGFgdIIKDlFF5j0DMjEJmDG36agO2n0cIfDMY1ilVp
	 GU8hwzkF0/zn226IFDlTs5NFbr234dlnSoOgV8plHmBKJOv7cJDzIY3jDIygYIC3iOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333466;
	bh=RXMd6hEvE4Zsdn8WyhVPXs7/vZQwQPyEELlSSh1RDCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A6F1c0VxO/qdNHaxttSceAyUhWrZgFvvKu2r+B0M8tE38qoInI7roMqyP9b6AJEGx
	 UfLw+nwIJ8Snh/O12+e53KV5UbW4qaqIwfDLj6bjNc3Rzkr5VI1EeV9KehnLN+oReG
	 m/LFeKnLOrQJcXX0JWnPILmn/vnMCEGd9gOU5lnCm/iKxrGpnCBmEhXpRYliMkInm5
	 JvuTTYU26oEmiAlU7//d6vjP9XRP0m2V8qA+pNJ8NOdm3+LqGpzHlh4Ely7dFQaGCd
	 7N6j0Oo8AEQ7hcyjfgYV1lNnHohAOU/sAXCgUeQSzWOfzBbjI1BK9mhCTwgHMQ7veK
	 hy+hyf4XejdBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7720460611;
	Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF6A255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9624009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13SsLwV1sADk for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9B8F74005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333464;
 b=gdhvCjK73ijo7baAajaUxiyoj/JbQCtfeHFqFOqEQp9kb1LBED0kri0Xbq99auR1oF7Q
 IGEFZM9l5jTsrexcV3QYg3QqNsmkzvFKtPATzjH2c0lNYK3DRhzmyQP+Dps8s/sDjPjis
 G4OTd+nVGCDfabw+C6/GrWhwR3A+P0AW9d/jgijEFAS8yx/u/bc3/KBdtLDk2f8tJONng
 5whmvyV2NOG16qtymbAdKRKUTdiCtZCw7LIqqdKreoTjmLWw5v2KqHeOeF4j2DVmbQu4V
 EfpRhscmC6OYH2aYy9relL34wgcaC/XUC/6xilqVSSSzfQUv1hJ9JE6ysT0IrVgiUhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333464;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JFV4HqmxiYUERw4Nod0w85YHdVZ5EzO2UjlU0xpe4GU=;
 b=UZBTNTG3XDTFftb8k66v8awHjK3w3PDLCfbC+zp3i2e/EHTfz5GkcbdgLQ5snOrQXteH
 TtKUg/whjY6dt+a6U4O44DYKOYmzp+wki19o598D5YGYhbuQJYdIra4PoTjEdoFKODeTS
 Jeh1Fls6a3c7eQXvtY6phCx0HF7Lti5nFD0ST+O3iASS9z2BUBIx5bHLYTgRefPvOP4mQ
 YyLrciiTbYRMUgi0I9EWWjJLAIskjOLS/6hrrmbZGsdXai6LdM7S1gHVnMoHsElxTrulz
 sn+5FA0kThYbgxMZXr4Q8LHMTm2o4B1XuOVVyvpdT+Q06uKBOyRg9VlI7xRMhcoPVYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B8F74005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B2AD976B0; Sun, 18 Oct 2026 14:23:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:56:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fbaf7df1629140acface1fb4c27fa2cd0cc0186
X-Git-Newrev: d0230d3b8ef9c21873593d2318efe6da525d1c84
X-Patchwork-Hint: ignore
Message-Id: <20261018142302.7B2AD976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dunamai: bump to version
 1.26.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0230d3b8ef9c21873593d2318efe6da525d1c84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dunamai/python-dunamai.hash | 4 ++--
 package/python-dunamai/python-dunamai.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
index 87a591ec1e..97e3f89e69 100644
--- a/package/python-dunamai/python-dunamai.hash
+++ b/package/python-dunamai/python-dunamai.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  f9ab2ba10f2995f10abeeac80c9d0f60  dunamai-1.26.2.tar.gz
-sha256  84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c  dunamai-1.26.2.tar.gz
+md5  0ea05213f91571a94f1e081d95615be9  dunamai-1.26.3.tar.gz
+sha256  fe2f732186710ee5048044fdbef6c76c6afbb9ee7de4f6d00cf34256e9ec2e7f  dunamai-1.26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
index 3051dd24a1..291c1a9861 100644
--- a/package/python-dunamai/python-dunamai.mk
+++ b/package/python-dunamai/python-dunamai.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DUNAMAI_VERSION = 1.26.2
+PYTHON_DUNAMAI_VERSION = 1.26.3
 PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/12/18/020d3b27a10450ddb11429f637404e8ea67ecf4d9fd999d4f1d553f25506
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/c5/62/edf5352d8ce1371129ccfe971e6de3a1ce4dc7f9bdc80390fb79856b78d4
 PYTHON_DUNAMAI_SETUP_TYPE = poetry
 PYTHON_DUNAMAI_LICENSE = MIT
 PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
