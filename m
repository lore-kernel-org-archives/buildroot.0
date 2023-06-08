Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CA2C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101474241C;
	Thu,  8 Jun 2023 23:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 101474241C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgOOkJgIqLxY; Thu,  8 Jun 2023 23:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E790C4207B;
	Thu,  8 Jun 2023 23:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E790C4207B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A33551BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D7C4241C
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D7C4241C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvMoRTmmdaYG for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D5C4202E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31D5C4202E
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30af86a96b4so904330f8f.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266943; x=1688858943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxWLGKWdkbEEHYD4B2gTM1hw2Kp2+9zlY0MTYfyOLtc=;
 b=ZKW3DOf9++wu/aqGB6rHs29wFInHk7S2q8GwpLsQHcgY+GzWfyXjuOYF1nYBzMJiIU
 9kl6RYuSbRSZOuN7zUxnRcnuf/dMLNoDtBktdpkJoUMoTpbEnK43jvIHfr+vibCcuLl/
 0FPfswAw5Oke8B5Sn2JvC2hJSxvt46vxqzVxkrtPHM9vf0QQ7qfdluAIRxcM3tnXxtSg
 gw+lpRk1kxixX+oQYr8o6usEdw/hrfV/3JAJsOIQhJ+BA7MYQdLefBSMrkYtcbe1q8fD
 4SVRCdrXa1luj27670Pm2uaKrTUF5hT6y/SPXab+EW4gLFDXKaiGvsv2J5pZxSgU9VVT
 bRZg==
X-Gm-Message-State: AC+VfDxyXnVY5W7yCzZ17h3jAkUVzgqt6JnOlN8aEC3Op5ftqKGIl700
 LHVNADsL14h/PLq+uoJSKZNvBl3h/EY=
X-Google-Smtp-Source: ACHHUZ6sXrwoFkzyfG07Dsk3BwgY9fffiIx7LytQ89d7Aa1xY93yIZwVvTrfvOofc2Hxr/m3ti3ymA==
X-Received: by 2002:adf:ed51:0:b0:304:8149:239b with SMTP id
 u17-20020adfed51000000b003048149239bmr7131361wro.50.1686266942844; 
 Thu, 08 Jun 2023 16:29:02 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:02 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:43 +0200
Message-Id: <20230608232859.1245497-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266943; x=1688858943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oxWLGKWdkbEEHYD4B2gTM1hw2Kp2+9zlY0MTYfyOLtc=;
 b=n+DfPC5VQjmaqdYG7fDvCoAQ85e4FpSXrwRRSrWvpOeJY5tE0wJn1nRzju2RHrs9l2
 jDDs4q+5OdXEgdAq3NTHabeTf35bz8bCfTtb2aIcnBp+crL7Fh9k8g4cAkNUbdnl/okk
 DtpqJtnjBBSGJtwH2cyfTVrUukeRH1B+t/gXrDpaJlgTFjpa5vxNmL9BDCXuY53KQ6T1
 tMQ5gjwEQwYuw2vFrc1pB99aI489LMMb8zApwNWtFkV+Z4mO7wovfPGkIowqvJQ5eaD0
 IS8/vx9mvOPWY8V+ZAONlmYd4u/YjqDQY0Y8YXtp9FzV0EZSLEQSnfhURTSu5eog1pjP
 rEHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n+DfPC5V
Subject: [Buildroot] [PATCH v2 01/17] package/python-iptables: fix
 _find_library()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While the commit [1] already fixed some runtime issue with
uClibc toolchain, the same test TestPythonPy3Iptables fail
with Glibc toolchain.

  xtables_version = 12
  if xtables_version:
      _searchlib = "libxtables.so.%s" % (xtables_version,)
  else:
      _searchlib = "xtables"
  _lib_xtables, xtables_version = find_library(_searchlib)

  _lib_xtables and xtables_version are null with glibc

The implementation of find_library() rely on the custom
_find_library() that try to use the IPTABLES_LIBDIR
environment variable (that does not exist in the context
of Buildroot).

Within the scope of buildroot we can determine what
IPTABLES_LIBDIR should be at build time and replace the
calls to os.environ.get('IPTABLES_LIBDIR', None) with
the correct value.

[1] d341ec035067120b456f669a826e26eb594c0237

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
I don't know why TestPythonPy3Iptables pass succesfully
with a uClibc toolchain but not with a glibc toolchain.
The current python code searching for xtables, modules
and libraries seems fragile...
---
 package/python-iptables/python-iptables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 0ccf064217..9cb4285ec3 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -15,6 +15,7 @@ define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
 	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
 	sed -i "s%os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")%$$XTABLES_VERSION%" $(@D)/iptc/xtables.py
 	sed -i "s%os.getenv(\"XTABLES_LIBDIR\")%\"/usr/lib/xtables\"%" $(@D)/iptc/xtables.py
+	sed -i "s%os.environ.get('IPTABLES_LIBDIR', None)%\"/usr/lib\"%" $(@D)/iptc/util.py
 endef
 
 PYTHON_IPTABLES_PRE_BUILD_HOOKS += PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
