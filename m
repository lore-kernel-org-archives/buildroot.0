Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C233A606A324
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PLPn0jkY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A046A40517;
	Wed, 11 Nov 2026 10:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tB9nu_3hiOX; Wed, 11 Nov 2026 10:56:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3720340519
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794394583;
	b=Gnpi7MhOHelGeF+bqlGzvKC1/xHvTelsiW2CPQrNgE1CeI8lARN3pHZ4WvhJXFz1b0QI
	 KbF/N0N7uhynWfBjxecla4m1IIpIKAb+dAZYQrDqKKgVHqhgNd3JqmFD9IpJMQhR5c54d
	 KjoR9HqRPTZpZvSvD5EVVsI9K1WQiLEaJte91BJuQCLoEtgkIeuC6tecTvG1h4jNWC+be
	 SWR4qqw/EKwS/d8IqcRwz3Iy/hSzI0Stji9GGApuGy1Th+bSe+rDk4L1DurHPNOymiPv4
	 ohi85/RISbusdUK017oAjRt0RdhcZ9QtrazYNGbzMEmH1hCqHpNTT6OiNtwiWfjfv7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794394583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FmaPbiIuR1B76bPY9KhOWyyjRF6sFvJ596hM5D0Crnk=;
	b=NNH6BHOUG06wTXdKmdZDR2d+VA+/40Axg5enrfdxGW8eXLqh9LPicSqo9etuSnM5xtnp
	 im+VO7TGtHF7OIXX6AskUNcgBm/fkKnxGZSIo7DvkWMJcGDMfFPMXp9IKead2eJL4T1i/
	 UtFuy340MsERfnF64JTXTNhOhP3KUIR4RDcJCNUyNDkISyFWqhHeBYu3+sfZoCHu3R2sP
	 WKvRDosgfsbUbbr/12DQCnfGl+dcVbKj9O48ekDxaIWFHvM7ESWpd+k4SYnpRHhXPnELB
	 f6S9BAHOs4Hr0htMHKOiG3Jy48FU6H7DBYxENiH0OZa1s2zOkHOlKVo06bFZs+AwvkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794394583;
	bh=FmaPbiIuR1B76bPY9KhOWyyjRF6sFvJ596hM5D0Crnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PLPn0jkYMUn7dJ/tEkxB2cE8YWGP2v8p0rkm/5MFiQgx9c5envwe/Q7H8oMGYYmCu
	 hMByJcLpav7S+q2zo8YnC1TzxVUeXR13p0xYZmt8yr138uwqAD9vqvJLqo607sBcri
	 FKmTix5urxjlLVdaNXmbNrms4xCqfmQil2tcxy6betN8s1bRr1GapecvK+W6Prh8ZQ
	 y0C/FWfowTnXo/u//ACbHmdy5IbbcSyw/rI19kvApthg3hWnzk/XTK1Cxca8JJ1hxs
	 zIvesVrElurXyYlHXZWd/dkzVOnblBrSBqOZ/eziptQEbRs0ECKtw0Hg3qGXcIQCCI
	 rxaozbD87gZYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3720340519;
	Wed, 11 Nov 2026 10:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC472731
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25C7606ED
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frPhx1tNuSTm for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 10:56:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CEA7606E0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CEA7606E0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:56:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso499618366b.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 02:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794394578; x=1794999378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u5u/BmFV2aXDLX6Ma/aGxAzo51vXMYKjfW9PAGdwAQU=;
 b=gDfssv5W5PF4yDoBkItCtTPdKGB8+zC/biX975/utzFpSWxI5auVaL5F9wjzxrzuGm
 /Y2hUb6b/F0pUM18sDjVFFmBEW2Cpy92DmHNKZ5llOOfvNaazT9LCQVjldg/foXk2wBm
 jlIi4qo9kCdJlDxJA/KbwJ/v/IySH2w67+uZTY1KWTLtebv6V4LBYjRvmp/1TP5e0ziT
 gDHmkePd7IrBtWJjtbjHjsg+EwpHciK3EzTNd74rInJs817MdMlP/hpUdV6zAoQjOhBj
 L4MLAlHN5YuaCZ5nFNeK0FOWPw7RJ2Ke40uvyFNcHIECenJo4JzdOMYM1usTMQe701gS
 L3yQ==
X-Gm-Message-State: APuU4Z/eXmwWcmXKZLVtvJG0csf0rKOtuIIDiktJrF42L+86aU3Lh3F3
 zouw0JT+5F9Ki1IJT4h2XaXKBHQzimZ9syIM+uQX0uxY2lcpJesTKp7tbk3vXQ==
X-Gm-Gg: AYBFou3e0eQSqPW6ghUbV5NbHoK5ZAEOjKTchAt+rl6WloK9IhQkSRmQXwd81VeutV6
 vuU4f8Bhs/W6An17WEU+5zBitWtR0avIB8lSBDvzX4V9MdqddXUsetWWFGchJrpHfLEbrIc3N1q
 ETMJhOaeMIK9x7tavXthnTbrP1UbdCiQtlh7UQ44kQ3xboxzjVcAGAtHBT5QpoimkzLpgAYNs5i
 hp1meHuMwBZPXVzW+1Qox2HZjhEI5QQ0xlND6n6pR+bcISqkipYml7qWM2OIAFbzghZBA6EJZ0v
 sOEKo86UuPEqnIhSvsKE84b5qSgWDtrkw6H/tchWjQL76hr85zPvO1c/bfrIkZfO1gNwPqx36vp
 IIkJSqmOt7vj9/85gforvrJamkjy4z+FaXrC2OunZdv5B4T2voi461Y5uIcs+yd/fcv50WQbAYD
 Ez8yxbO3z05GnvJd/gcbkWgsJhz3plh8AK9vx3QiG5PuR5Onwd4WgmlnhWflaKmg+PjVabmilDn
 uh9EeFG/d6YCGRH9F3jA92xbktkv6C6oX2k5sJbrzlNfQ3vk02ZkxXtQJvVrIMaDVkqeR004P/m
 fv9UeSKtDAc/32a+n7PIseqWDm/gKB4qrBmWzlT1Tk75zRcEZtrnvtLHfDjOMhyYnTnBEdEeIaO
 94vr6hvR+
X-Received: by 2002:a17:907:1c9b:b0:c50:5f6a:7009 with SMTP id
 a640c23a62f3a-c50668614bdmr141655466b.7.1794394577453; 
 Wed, 11 Nov 2026 02:56:17 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a5701a1sm219944566b.21.2026.11.11.02.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 02:56:16 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 11:56:16 +0100
Message-Id: <20261111105616.1040501-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/grpc: install utf8_range_lib for
 host-grpc
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On build hosts whose linker does not default to --as-needed (e.g. Arch
Linux), packages using the host grpc_cpp_plugin fail to build:

  PROTOC   collectd.grpc.pb.cc
  .../host/bin/grpc_cpp_plugin: error while loading shared libraries: libutf8_range_lib.so.56: cannot open shared object file: No such file or directory
  --grpc_out: protoc-gen-grpc: Plugin failed with status code 127.

Since grpc 1.76.0, grpc_plugin_support links with grpc's bundled
utf8_range_lib. Our patch adding the gRPC_BUILD_PLUGIN_SUPPORT_ONLY
option, used for host-grpc, was updated accordingly to build
utf8_range_lib, but kept its installation disabled in this mode, while
grpc_plugin_support and grpc_cpp_plugin are installed. As host-grpc is
built as shared libraries, the installed libgrpc_plugin_support.so then
depends on a library missing from $(HOST_DIR)/lib. With --as-needed,
the dependency is dropped as the symbols are also provided by
protobuf's libutf8_range, which hides the issue on most distributions.

Update the patch to also install utf8_range_lib in plugin support only
mode, like grpc_plugin_support.

This issue has been present since commit 656fc0f78e ("package/grpc:
bump to version 1.76.0"), which made the patch build utf8_range_lib
without installing it. It therefore affects 2026.02 and later,
including the 2026.02.x LTS branch.

Fixes:
https://autobuild.buildroot.org/results/0b105f951e923ac1c8292a1655f6b87e73cb19de
https://autobuild.buildroot.org/results/cdb4dba11d1cb2854184da3ebe2f5d82a4745e56

Fixes: 656fc0f78e9f225136a0161998b328902ca514d2 ("package/grpc: bump to version 1.76.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...strict-building-of-host-grpc-to-grpc.patch | 28 ++++++++-----------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index 03ca1d7bf4..a74b44258c 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -17,9 +17,12 @@ Updated for 1.76.0:
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 [Bernd: rebased for 1.83.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Yegor: install utf8_range_lib in plugin support only mode, as the
+ installed grpc_plugin_support library links with it]
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 ---
- CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++------
- 1 file changed, 33 insertions(+), 6 deletions(-)
+ CMakeLists.txt | 37 +++++++++++++++++++++++++++++++------
+ 1 file changed, 31 insertions(+), 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index bc86c00463..08441ddbd2 100644
@@ -113,24 +116,15 @@ index bc86c00463..08441ddbd2 100644
  
  add_library(utf8_range_lib
    third_party/utf8_range/utf8_range.c
-@@ -4681,7 +4698,7 @@ target_link_libraries(utf8_range_lib
-   ${_gRPC_ALLTARGETS_LIBRARIES}
- )
+@@ -4683,7 +4700,7 @@ target_link_libraries(utf8_range_lib
  
--
-+if (NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
  
- if(gRPC_INSTALL)
-   install(TARGETS utf8_range_lib EXPORT gRPCTargets
-@@ -4692,6 +4709,8 @@ if(gRPC_INSTALL)
-   )
- endif()
  
-+endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
-+
- if(gRPC_BUILD_TESTS)
- 
- if(gRPC_BUILD_CODEGEN)
+-if(gRPC_INSTALL)
++if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
+   install(TARGETS utf8_range_lib EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
 @@ -4784,6 +4803,8 @@ endif()
  
  endif()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
