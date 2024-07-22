Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA2C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A4EF402B3;
	Mon, 22 Jul 2024 08:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtkysXlZ02A4; Mon, 22 Jul 2024 08:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87AAC40241
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87AAC40241;
	Mon, 22 Jul 2024 08:22:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA1461BF291
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E35AD40241
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKhQXkKI7k6K for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6681C40224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6681C40224
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6681C40224
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:22:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so2013391f8f.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721636521; x=1722241321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wknw/UpHNPTMM1PtFwMTreqN8ajRBAVlq1QwvX5aMUE=;
 b=s1DUAJdFAl9xsQqFt0QrPXJHAdZbhkiUcwdvyr5WPGO6zfuffsu+ezCfFrx6PabEJE
 J1AIHEO+myOL45sSgqdCc9NybE/7sPKXf7kePw05iV92tfDEWLGsHqUov/4Xz9ly3cbi
 PZ7K+irJwHekweA10+4hy9tA5wvD4R+zY+jsSYjHf/T99NV5pvPSCHN9K9o1qhM0f6df
 /s82lrE6twsvq1PqvutdTwZsAQbZwV3hUG8aL67VLHPBJxH4BTwfpEl8zfIHqTtfIVgW
 0rb2is/WKyiKljPJfO7Jq7+U+6mYlpsq17KD6JHg2MHvorIhOASnXz9DqXMa22e2UgY/
 kAfQ==
X-Gm-Message-State: AOJu0Yyi3q5hfXwOh8Bt82+NNT/wk1yaIQ7KnL+ixD8I3BpAsMdDRY7W
 nqYBQ3n31caSREQYXW34L4BKgYlOEViNw+moBPiV4GfjFjkNq84pvx4B0g==
X-Google-Smtp-Source: AGHT+IHsvXDQxMcUP+vTWoQ9vjtYVG469quxkQDemrspgbF1y8lVjEXKMdEXSZEzeXt8XPCW5jzxew==
X-Received: by 2002:a5d:58f5:0:b0:35f:48e:fe59 with SMTP id
 ffacd0b85a97d-368317c88ebmr7646568f8f.66.1721636520454; 
 Mon, 22 Jul 2024 01:22:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878811bedsm7820082f8f.117.2024.07.22.01.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 01:22:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 10:21:54 +0200
Message-ID: <20240722082154.721778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721636521; x=1722241321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wknw/UpHNPTMM1PtFwMTreqN8ajRBAVlq1QwvX5aMUE=;
 b=ZxqLnpDX+9jDWTudkybdfCqmCSoZRS1l255899CmXkvwfO7umwmskW/QO4mtrKQDLV
 ij7zcyG0IqJvfUJF0UM3OZqHBnd/MiVM4nzatk18oyktP1lPQaRsHuLp1EIPmEuEDGKs
 tTZzEgdXROGSL4v+i8ntJo2rkOmge8J88ajpBSRk9xOTBsjW0jdtbwggn9TgFZv2kfok
 2uTOb5ztRmakoOGb2OC4it96Z81Yfl7IlDYoSNtvRkr7Y/oo8Md9ffvfr6zES8EbkWT0
 ZZ47ikK/RbN/LT1dnof1JJXiY9tM8qSoaLjWbZAMo+x84o9nTxUfnVKB6VPOwELjsNAc
 68AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZxqLnpDX
Subject: [Buildroot] [PATCH 1/1] package/gtkiostream: disable octave
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable octave support which was added in commit
fab48302865e5c0c98d91b696bc90e75e38189bb but untested as octave is not
installed to staging and raises the following build failure:

sparc64-linux-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/octave-3.8.1'

Fixing those issues is useless, as gtkiostream is not compatible with
latest octave version as it raises a bunch of errors:

Octave.C: In member function 'void Octave::startOctave(const std::vector<std::__cxx11::basic_string<char> >&)':
Octave.C:85:5: error: 'octave_main' was not declared in this scope; did you mean 'octave_map'?
   85 |     octave_main((int)argsIn.size(), (char**)&argsIn[0], embedded);
      |     ^~~~~~~~~~~
      |     octave_map
Octave.C: In member function 'int Octave::setGlobalVariable(const std::string&, Matrix&)':
Octave.C:283:50: error: use of deleted function 'octave::symbol_table::symbol_table()'
  283 |             octave_value ov=octave::symbol_table().global_varval(string(baseName));
      |                                                  ^
In file included from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/octave-config.h:99,
                 from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/parse.h:29,
                 from Octave.C:18:
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C:284:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
  284 |             octave::symbol_table().global_assign (string(baseName), setGlobalSubVariable(varNames, m, 0, ov));
      |                                  ^
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C:286:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
  286 |             octave::symbol_table().global_assign (string(baseName), m);
      |                                  ^
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
   63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
      |                                       ^~~~~~~~~~~~
/home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
  354 |   X () = delete;                                \
      |   ^
Octave.C: In member function 'octave_map Octave::setGlobalSubVariable(const std::vector<std::__cxx11::basic_string<char> >&, const Matrix&, int, octave_value&)':
Octave.C:302:38: error: 'class string_vector' has no member named 'lookup'
  302 |             whichIdx=base.map_keys().lookup(varNames[index+1]); // map_keys returns a string_vector
      |                                      ^~~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/9cfc420a4e41503635792472176583a8f81bb2a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtkiostream/gtkiostream.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index 970644d6df..bc3d859d4e 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -19,16 +19,10 @@ GTKIOSTREAM_DEPENDENCIES = \
 	host-pkgconf
 
 GTKIOSTREAM_CONF_OPTS = \
+	--disable-octave \
 	--disable-tests \
 	$(if $(BR2_TOOLCHAIN_HAS_OPENMP),--disable,--enable)-openmp
 
-ifeq ($(BR2_PACKAGE_OCTAVE),y)
-GTKIOSTREAM_DEPENDENCIES += octave
-GTKIOSTREAM_CONF_OPTS += --enable-octave
-else
-GTKIOSTREAM_CONF_OPTS += --disable-octave
-endif
-
 # For the optional packages below, there's unfortunately no
 # ./configure option to explicitly enable/disable them. They are
 # checked by the ./configure script using pkg-config.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
