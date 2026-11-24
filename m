Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAD606A32C
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lkowi7KX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mmpMnoTw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2A46083A;
	Tue, 24 Nov 2026 12:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbWv_H5XdmxZ; Tue, 24 Nov 2026 12:04:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 824216069B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521896;
	b=YkHoFOPmEMswsGh5YfEPZTNeSp+8gnWTtpBVufCf/jP9V+/gqci9c33KSXHuXWWPU3iS
	 GZJ6OTh4F3VXbXVHvzyukvjJPXX4kDzWPyiUUPZvXgAB3cWCNBDOsmk8k4NA8ghqx2L+j
	 VyJGH5PucU1QwZWPH5KNBckt7jdYZTv4VmedQy8FqbS5kCS6DNK0MKFbsDf/9moFXyZi+
	 RjfIBsfIoc1imTAA6btpx9wncS1C/jdeTQxQwze4pHNaV6y82uIblRZunYZ5BYtodNSbr
	 /G6p/LQNUSa/4fDWXM1mZ387h8nReiDWl+mGFLWOigFU9LNjaEywjS1ZdD0kJ2Erhsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1aIKh4HlF7uOgVRsCso9uVijV8JWs+33177/WjRpaxY=;
	b=kqtV8vELtMmOuGYyHMMbZNNLJ20/BylNi04duTb0eMKAFnQ30xUxTbwtJrn6uLyC3ofr
	 0BpTLLUzImVx6Feom2bbcuLDX9GLvVLKRibCnQm2T+RQtpkg76urY0nQo6OE4b8IxSMMr
	 Z9zgQDm/EyvhG4gEeXpXGlMg9TFneo5dmv8Cy4vFgerrWGU4q0s2T/uw729Uq4aXbIrC4
	 KOu1UEdTiAgqr/by1SXfJFf0Qv8K9cDYI4quvzX0a3+mubhhRW5dZ477Qs2QH9MYZ8gPL
	 Q9ufXDD10QCZ3AeS/tnLG0Gd+DCJjh/mDmiBoeQK/w8uXJKzb6O7xb9Ajjiu8RGFpWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=mmpMnoTw;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521896;
	bh=1aIKh4HlF7uOgVRsCso9uVijV8JWs+33177/WjRpaxY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkowi7KXQmGqpA16TCxOKYAp+xGBKuDAt0J54nyluj4sk/A4SvRUhBiuiKz9DmRcW
	 4Ljd0hdb6IdO3GyXKOoNy+hIrHKAdNcQwwp1KwxiIxJjcEEYa9i9Cf4uGGklw68jGS
	 xFJio01Z8Zlz+DEm6GSSDT2JzIA2Hq4v1WkrqHSsQoC5H7rxFxhev7miwl9tEw1qp3
	 iTxaVFsIgOtijUZuXYCCE620ZwQ7e8FriASzzXxY9ktWqlli0MbUw/3dgwnDOz+uj0
	 lP0mgl8U2oYaYYJjpTM+GHsuCPTmm6HT9tc0mYM+q0iG29dQffYBwqNSsDg1wqKEBE
	 gAdKx5NRcjaQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824216069B;
	Tue, 24 Nov 2026 12:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC0D3A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D921607C7
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfT-Hi5TSALv for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42CB860664
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mmpMnoTw
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42CB860664
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b54c019db4so646806a12.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521888; x=1796126688;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Kc2l1ABEY9KK1y4G2SHZ1K2ot2x4FnJjZ+4Hp8LQeUM=;
 b=mmpMnoTwhSP4iQzYRWjC2MC2szy8AUEtfmIDqO6jfQYL3ZIK1O0NSii4ISKGyKPJL5
 /jD/UPG0VB/uavF0M1QpDxu6/2d9Q3DsDiYhzvuacd+MrthyRvx5dGUUsvaaReGuSCBw
 gu3p1ZX7Y3svUBLraGNynNTCD+Dyf5DD3sIus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521888; x=1796126688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Kc2l1ABEY9KK1y4G2SHZ1K2ot2x4FnJjZ+4Hp8LQeUM=;
 b=Swo1H5Xadt636gErg3uNEzf6d8mliK4TO3hWWofBm9C2ciuwhTtjLvrmnB20jVaXbj
 AhzjlFFHGgPK/uP7u0/SgbSvS4bD1abDL2ZJt3s+ePxDIdMKDv/Lv8tUxlI0y3ln09Oz
 Pf8vTbRNlbfXdhZ6HJeNdYy7caQ+e8/izdnKzW88r9sAJ3nDMr2UPZhJhjUmL8mCl4aB
 hpm+nxkPZNeW46PdEyrpR3UwXKZYOORBPSErDn4FTUG3kaPLOjmskeO7u5uJs77Y3LLm
 g1CqHhQ+ooU9BKJW+L0my0nQIeMA1mDwlOlwGp+PY75YgljekM5j0gPmaIesClEA3VZV
 ZPpA==
X-Gm-Message-State: APuU4Z+6nFeFapgd3PyLLDzD+RWPUVxdg1KX+ibCpkQ3rPoAVy4Me2fv
 ky39IOBRv7bbhEepipvPNvh5QL97TEuQCQWfs3APzwZJbpoV7L5rI6jUNxZj8GwDeD1WROtavXE
 7b3WKMv4=
X-Gm-Gg: AZFdTZe6W9Tcsz2z3kNgLyraXRu7sTqMnWgL9sRVRyiLRThjr9KRZysUFcRy7jpmZd3
 tjugvzMK67bL6J8INpCgZkfWq83YzMdk3cRX+oFRPi8etQktRr85lP74prMwHZnQXr+0ebmWWTy
 /Cdkm0Y3lIQhUGGJmlupxVGlf0EG0reJdvJuKexRRzub6BKLlcgtD+y7ddy6sIhzDA9RIjsVrzL
 cAdQ7Je+BpF3jrnmgjz9MNODYYPqR+Lc8hKiQ3M5Uo4yyLmhl1oUGI/f+xYJZCCj7QyYgPZ0DDz
 enVe2tCbdBETdRiiiUM6jDf+cUA6IYytBmy4pMNGsuro42MB4KnE4vNK8VVSR8lI0deYqIsznLH
 jzg0cwoQeLIPBSzH7bVVnFxIcFXS0Poewj91PhCBDk7q6nx0EPuWx3u7MkP12EWcIoCo10DVfaq
 J/NaBVEvEfT5dJegaxgJ1p9b8GQtwDLjCvbFpcek00EhBPLnLe4iSGr3cYNtv7pIY1B7+LR3vAB
 VEBubZaELd8v2u2S5NQgrqKKsCsTI7OCaFTm/lri9bqQC1ZrpxSrj2lWMvANKWVmCwOv84pSzUp
 UFizpY0x/0GSLonst+wcS1wSPxM8yz8olpE7YFPo6kq+vbHAGf//hm+MBZQD8F84369iyN4tDwD
 oA9q7ORhzVyzUJMV6MK3QhvsClN0SxislWKi6wijTpaYBntAnsmcSR0FxjEqrIQ2uskrgQzHNis
 WjhcuDcQVbdrNbO3z8nePNgZ5YqcflQoBLT+o+3LB3L0z47DTgxRSnHlbwOq3QRVjvBJuio2rHa
 QI5q7sh2htur9HKrnePbA==
X-Received: by 2002:a17:906:91c8:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c513a829d8cmr1054662266b.4.1795521887716; 
 Tue, 24 Nov 2026 04:04:47 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:47 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:38 +0100
Message-ID: <20261124120443.1909297-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/9] package/depot-tools: bump to version
 25e7767e91a5e7f3209c947b07c52e7a45dda6b5
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop both upstream patches:
- 0001-gerrit_util.py-fix-importing-socks.patch is no longer needed,
  as gerrit_util.py no longer imports socks;
- 0002-Replace-deprecated-ast-types-with-ast.Constant.patch is
  included upstream.

The LICENSE hash changed due to a copyright header update:
"Copyright (c) 2009 The Chromium Authors. All rights reserved." became
"Copyright 2009 The Chromium Authors" and "Google Inc." became
"Google LLC".

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...1-gerrit_util.py-fix-importing-socks.patch |  32 ---
 ...precated-ast-types-with-ast.Constant.patch | 244 ------------------
 package/depot-tools/depot-tools.hash          |   4 +-
 package/depot-tools/depot-tools.mk            |   2 +-
 4 files changed, 3 insertions(+), 279 deletions(-)
 delete mode 100644 package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
 delete mode 100644 package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch

diff --git a/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch b/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
deleted file mode 100644
index 46a1fe78d0..0000000000
--- a/package/depot-tools/0001-gerrit_util.py-fix-importing-socks.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e52f67026d7ce5b30887e1cfe486ed994169119d Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Tue, 4 Nov 2025 11:58:37 +0100
-Subject: [PATCH] gerrit_util.py: fix importing socks
-
-As of commit 1a6ff781792099e9e14d7beb610bd99112b17b07,
-httplib2 removed the internal copy of socksipy module.
-
-The commit message specifically states to install pysocks.
-
-Upstream: unsubmitted
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- gerrit_util.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gerrit_util.py b/gerrit_util.py
-index eef2f5749..d866bc47a 100644
---- a/gerrit_util.py
-+++ b/gerrit_util.py
-@@ -35,7 +35,7 @@ from typing import NamedTuple, List, Optional
- from typing import Tuple, TypedDict, cast
- 
- import httplib2
--import httplib2.socks
-+import socks
- 
- import auth
- import gclient_utils
--- 
-2.51.1
-
diff --git a/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch b/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch
deleted file mode 100644
index 09e88d04a2..0000000000
--- a/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From 7d467257a7cd57e746885ea73ccbda903450b461 Mon Sep 17 00:00:00 2001
-From: jj <jj@imput.net>
-Date: Fri, 5 Dec 2025 11:47:42 -0800
-Subject: [PATCH] Replace deprecated ast types with ast.Constant
-
-ast.Str et al. have been deprecated since Py3.8 and have been
-completely removed in 3.14. Replace their usage with ast.Constant.
-
-This change should not have any functional impact, since
-according to [1]:
-> Changed in version 3.8: Class ast.Constant is now used for
-> all constants.
-> Deprecated since version 3.8: Old classes ast.Num, ast.Str,
-> [...]  instantiating them will return an instance of a
-> different class.
-
-[1] https://docs.python.org/3/library/ast.html
-
-Bug: 40283283
-Change-Id: I0ed8ef3910f921483bff118976f516c5a935e0fc
-Reviewed-on: https://chromium-review.googlesource.com/c/chromium/tools/depot_tools/+/7228507
-Reviewed-by: Gavin Mak <gavinmak@google.com>
-Reviewed-by: Yiwei Zhang <yiwzhang@google.com>
-Commit-Queue: jj <jj@chromium.org>
-
-Upstream: https://chromium.googlesource.com/chromium/tools/depot_tools/+/80d6ca1b1ac55fbd9dd8f506417824591251b8eb
-[Romain: backport to 097e2072377]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- gclient_eval.py                | 72 ++++++++++++++++++++--------------
- tests/gclient_eval_unittest.py |  6 +++
- 2 files changed, 49 insertions(+), 29 deletions(-)
-
-diff --git a/gclient_eval.py b/gclient_eval.py
-index f8a05d78a..94874e3ce 100644
---- a/gclient_eval.py
-+++ b/gclient_eval.py
-@@ -101,6 +101,24 @@ def _NodeDictSchema(dict_schema):
-     return validate
- 
- 
-+def _IsConstant(node):
-+    return isinstance(node, ast.Constant)
-+
-+
-+def _IsStringConstant(node):
-+    return _IsConstant(node) and isinstance(node.value, str)
-+
-+
-+def _IsNameConstant(node):
-+    return _IsConstant(node) \
-+        and isinstance(node.value, (bool, type(None)))
-+
-+
-+def _IsNumericConstant(node):
-+    return _IsConstant(node) \
-+        and isinstance(node.value, (int, float, complex)) \
-+        and not isinstance(node.value, bool)
-+
- # See https://github.com/keleshev/schema for docs how to configure schema.
- _GCLIENT_DEPS_SCHEMA = _NodeDictSchema({
-     schema.Optional(str):
-@@ -316,18 +334,18 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
-         node_or_string = node_or_string.body
- 
-     def _convert(node):
--        if isinstance(node, ast.Str):
-+        if _IsStringConstant(node):
-             if vars_dict is None:
--                return node.s
-+                return node.value
-             try:
--                return node.s.format(**vars_dict)
-+                return node.value.format(**vars_dict)
-             except KeyError as e:
-                 raise KeyError(
-                     '%s was used as a variable, but was not declared in the vars dict '
-                     '(file %r, line %s)' %
-                     (e.args[0], filename, getattr(node, 'lineno', '<unknown>')))
--        elif isinstance(node, ast.Num):
--            return node.n
-+        elif _IsNameConstant(node) or _IsNumericConstant(node):
-+            return node.value
-         elif isinstance(node, ast.Tuple):
-             return tuple(map(_convert, node.elts))
-         elif isinstance(node, ast.List):
-@@ -349,9 +367,6 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
-                     'invalid name %r (file %r, line %s)' %
-                     (node.id, filename, getattr(node, 'lineno', '<unknown>')))
-             return _allowed_names[node.id]
--        elif not sys.version_info[:2] < (3, 4) and isinstance(
--                node, ast.NameConstant):  # Since Python 3.4
--            return node.value
-         elif isinstance(node, ast.Call):
-             if (not isinstance(node.func, ast.Name)
-                     or (node.func.id not in ('Str', 'Var'))):
-@@ -366,8 +381,8 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
-                                                      '<unknown>')))
- 
-             if node.func.id == 'Str':
--                if isinstance(node.args[0], ast.Str):
--                    return ConstantString(node.args[0].s)
-+                if _IsStringConstant(node.args[0]):
-+                    return ConstantString(node.args[0].value)
-                 raise ValueError(
-                     'Passed a non-string to Str() (file %r, line%s)' %
-                     (filename, getattr(node, 'lineno', '<unknown>')))
-@@ -594,8 +609,8 @@ def EvaluateCondition(condition, variables, referenced_variables=None):
-         main_node = main_node.body
- 
-     def _convert(node, allow_tuple=False):
--        if isinstance(node, ast.Str):
--            return node.s
-+        if _IsStringConstant(node):
-+            return node.value
- 
-         if isinstance(node, ast.Tuple) and allow_tuple:
-             return tuple(map(_convert, node.elts))
-@@ -627,8 +642,7 @@ def EvaluateCondition(condition, variables, referenced_variables=None):
-             # be evaluated.
-             return node.id
- 
--        if not sys.version_info[:2] < (3, 4) and isinstance(
--                node, ast.NameConstant):  # Since Python 3.4
-+        if _IsNameConstant(node):
-             return node.value
- 
-         if isinstance(node, ast.BoolOp) and isinstance(node.op, ast.Or):
-@@ -696,11 +710,11 @@ def _UpdateAstString(tokens, node, value):
-         node = node.args[0]
-     position = node.lineno, node.col_offset
-     quote_char = ''
--    if isinstance(node, ast.Str):
-+    if _IsStringConstant(node):
-         quote_char = tokens[position][1][0]
-         value = value.encode('unicode_escape').decode('utf-8')
-     tokens[position][1] = quote_char + value + quote_char
--    node.s = value
-+    node.value = value
- 
- 
- def _ShiftLinesInTokens(tokens, delta, start):
-@@ -793,11 +807,11 @@ def SetVar(gclient_dict, var_name, value):
- 
- def _GetVarName(node):
-     if isinstance(node, ast.Call):
--        return node.args[0].s
-+        return node.args[0].value
- 
--    if node.s.endswith('}'):
--        last_brace = node.s.rfind('{')
--        return node.s[last_brace + 1:-1]
-+    if node.value.endswith('}'):
-+        last_brace = node.value.rfind('{')
-+        return node.value[last_brace + 1:-1]
-     return None
- 
- 
-@@ -821,9 +835,9 @@ def SetGCS(gclient_dict, dep_name, new_objects):
-     keys_to_update = ('object_name', 'sha256sum', 'size_bytes', 'generation')
-     for index, object_node in enumerate(objects_node.elts):
-         for key, value in zip(object_node.keys, object_node.values):
--            if key.s not in keys_to_update:
-+            if key.value not in keys_to_update:
-                 continue
--            _UpdateAstString(tokens, value, new_objects[index][key.s])
-+            _UpdateAstString(tokens, value, new_objects[index][key.value])
- 
-     node.SetNode('objects', new_objects, objects_node)
- 
-@@ -855,7 +869,7 @@ def SetCIPD(gclient_dict, dep_name, package_name, new_version):
-             "The deps entry for %s:%s has no formatting information." %
-             (dep_name, package_name))
- 
--    if not isinstance(node, ast.Call) and not isinstance(node, ast.Str):
-+    if not isinstance(node, ast.Call) and not _IsStringConstant(node):
-         raise ValueError(
-             "Unsupported dependency revision format. Please file a bug to the "
-             "Infra>SDK component in crbug.com")
-@@ -880,15 +894,15 @@ def SetRevision(gclient_dict, dep_name, new_revision):
-         if isinstance(node, ast.BinOp):
-             node = node.right
- 
--        if isinstance(node, ast.Str):
-+        if _IsStringConstant(node):
-             token = _gclient_eval(tokens[node.lineno, node.col_offset][1])
--            if token != node.s:
-+            if token != node.value:
-                 raise ValueError(
-                     'Can\'t update value for %s. Multiline strings and implicitly '
-                     'concatenated strings are not supported.\n'
-                     'Consider reformatting the DEPS file.' % dep_key)
- 
--        if not isinstance(node, ast.Call) and not isinstance(node, ast.Str):
-+        if not isinstance(node, ast.Call) and not _IsStringConstant(node):
-             raise ValueError(
-                 "Unsupported dependency revision format. Please file a bug to the "
-                 "Infra>SDK component in crbug.com")
-@@ -897,15 +911,15 @@ def SetRevision(gclient_dict, dep_name, new_revision):
-         if var_name is not None:
-             SetVar(gclient_dict, var_name, new_revision)
-         else:
--            if '@' in node.s:
-+            if '@' in node.value:
-                 # '@' is part of the last string, which we want to modify.
-                 # Discard whatever was after the '@' and put the new revision in
-                 # its place.
--                new_revision = node.s.split('@')[0] + '@' + new_revision
-+                new_revision = node.value.split('@')[0] + '@' + new_revision
-             elif '@' not in dep_dict[dep_key]:
-                 # '@' is not part of the URL at all. This mean the dependency is
-                 # unpinned and we should pin it.
--                new_revision = node.s + '@' + new_revision
-+                new_revision = node.value + '@' + new_revision
-             _UpdateAstString(tokens, node, new_revision)
-             dep_dict.SetNode(dep_key, new_revision, node)
- 
-diff --git a/tests/gclient_eval_unittest.py b/tests/gclient_eval_unittest.py
-index 03decdf30..3aed06156 100755
---- a/tests/gclient_eval_unittest.py
-+++ b/tests/gclient_eval_unittest.py
-@@ -30,6 +30,11 @@ class GClientEvalTest(unittest.TestCase):
-     def test_str(self):
-         self.assertEqual('foo', gclient_eval._gclient_eval('"foo"'))
- 
-+    def test_num(self):
-+        self.assertEqual(42, gclient_eval._gclient_eval('42'))
-+        self.assertEqual(1024.0, gclient_eval._gclient_eval('1024.0'))
-+        self.assertEqual(42j, gclient_eval._gclient_eval('42j'))
-+
-     def test_tuple(self):
-         self.assertEqual(('a', 'b'), gclient_eval._gclient_eval('("a", "b")'))
- 
-@@ -40,6 +45,7 @@ class GClientEvalTest(unittest.TestCase):
-         self.assertEqual({'a': 'b'}, gclient_eval._gclient_eval('{"a": "b"}'))
- 
-     def test_name_safe(self):
-+        self.assertEqual(None, gclient_eval._gclient_eval('None'))
-         self.assertEqual(True, gclient_eval._gclient_eval('True'))
- 
-     def test_name_unsafe(self):
--- 
-2.52.0
-
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index cd5e34d26e..c9ee861843 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d281138bad9dab92f3f67f5d62f8d7fe02bccd9bef1ab2dae4acf93c712967bb  depot-tools-097e20723774957f21ac6d1808fcd0a91e8c7630-git4.tar.gz
-sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
+sha256  6c877daf63411e8378f7d44c542e624745757e90d52cbff5b35ef458a469d289  depot-tools-25e7767e91a5e7f3209c947b07c52e7a45dda6b5-git4.tar.gz
+sha256  023c510d6670baddaf6114f5aef8c82d495b1cc5d56abbdc5f099d6d9c0158fc  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index a6d57a6e3b..cc4b8638d5 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 097e20723774957f21ac6d1808fcd0a91e8c7630
+DEPOT_TOOLS_VERSION = 25e7767e91a5e7f3209c947b07c52e7a45dda6b5
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
