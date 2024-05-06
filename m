Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1848C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F449608A6;
	Mon,  6 May 2024 14:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDjomxV5ztgI; Mon,  6 May 2024 14:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401B86087A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401B86087A;
	Mon,  6 May 2024 14:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5E151BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FDD781FA2
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6Sjdz_li6Tc for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A24981EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A24981EA7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A24981EA7
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:51:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRfv-1sb7Qj0Acj-00brGt
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:43 +0200
Message-ID: <20240506144555.31709-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:hAkNE6L3GorukxqUDtp4TFKaWRLxL9J7tIr4iAZTDRsgnXi/wbN
 ywvrBpFme2rWVnMgzQx3dZLIev4Z7TMRgJHqVQMeJ0fgHc6kS8R3/jUnu6gJpDw1M1vs3W3
 dub9OWlwtEPTbnoErM+hXkTBhPHWG2ozzn1z1/E47NpRntF3LVBBtX2azhHzPeeznEMuEnf
 2g8N2kkWGATfcwfzAL/KQ==
UI-OutboundReport: notjunk:1;M01:P0:CTY/X8Mm4uc=;CmvarT+wGOR9lH0lbUuyiT0pCGJ
 Tp0+3ualHGfqysugMk5phASSk+xXyjctb+1w+n88oia/3qcCcGJeOFeLfX5beyyCNdFcUNnMF
 ZVZGzn+5Xn7b3icmdmnP+VhoILHSz6Dc/EliITccvrDIrRFB1WxZCpMcpYGJm1Kuxi4t8iJuR
 P0sh7cKrmTph3op4di8L8HvQEM4BinfaDXYXiYcCq5DZ0R81etYTIpYAD7PjWIZ8hwNbSnmkM
 UCBSpluNA+/KLHEZci8qsCOkzwjg5iKDuFpytSUo7PTEF1pkAkAJYDHLF+ddJIzputXe3TH7m
 kjaLeH0zAWI012R/HqI3zCftiDYTwJXhg+HGl77KnNON4w9VyrqWCpqitcebSF+H45jgR9zQZ
 /xp87ri78ipKJ26TtqqS4qvqRMrPht5reWqM15RTnhLBSBgDIcWFVCF3T6NVea4f3tMIW05r6
 gv5uEQX1lX9k1oKBvuTOK9FibSEf9ceZTfOGX9sFOlSZfdWI0VR1bJIQCbtq/sgo5617CLk1I
 lDnaTWomNswfNYiS2jPAJUINspo3lxe3ZKn9eFECflnRuVkZThSgT1ba/e+GOU/AXhAJInhQs
 zmWE5Pgb6ZOmrTjFYB+ZIvhNhH6rc8tH9nkT/Dq07AYsKI82OkzEaY7WsXtjdi05bv2HMFA+d
 BNDRlYP8jf0skCHpDk1IyR8FBV1ShRuYR4V9ql0Sbw9L8uoM0X+HkhIWxlt9fsU/4nR7W81us
 jbRuFh+6Ai1j0QCjy71j5EITH9MjoElS5Zi7hLFQPFK7G4yo0JXdu4itYrKNJNVp9bI+iUlUm
 q1afh/N9lRIqlpe+XDZYQ6TURiWXRjU8l0Nk2IrUnQ2Xg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715007060; x=1715611860; i=ps.report@gmx.net;
 bh=zG2nU7ox1Tup9pGNdW8zzK2RFEVwAtYWzfVUWtqvaIA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jgnAplZQ5RFbHRafY3aeJsx1d+bFAozJ3PQvRGlhIaTdflDD8U/Tr/+JmkIsdXHg
 yhydTrtpM6VlbxY3ScJTphuN3tEdVqz+C3VRlKJKwbPWUrriZOdnRdSKpVzvrVREf
 7geVW4mb0SD3PsovPndZQZGvQt/tAxJaveOqwQ1kyCMvXwBHq8XC2fF+eBCz5RQhn
 Se4zvM66LKlw35dVGnXQUM8J7fUlttDlfUpvmndRRwKVGpkGZUSj9L/fiH6CdP4HC
 9B0zUfVZyjkqYqSbofb9hYMvM/V5hBdDVALm+nwxrEqZTJrG+ChXYhSAwL8IOFpWI
 ad3HVmNthaUNfURNkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=jgnAplZQ
Subject: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to linux-v6.9-rc5
 version
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

First draft of updating support/kconfig to an actual linux upstream version
(6.9-rc5).

The patches are orderd by the first 5 handling some minor nits (result of
the new kconfig beeing a little more strict about the syntax, can be
applied in advance):

  - boot/barebox/Config.in: source argument needs quotation marks
  - package/cmocka/Config.in: bool argument needs quotation marks
  - package/dovecot/Config.in: source argument needs quotation marks
  - package/python-pydal/Config.in: bool argument needs quotation marks
  - package/x11r7/Config.in: source argument needs quotation marks

The kconfig version dump itself:

  - support/kconfig: bump to linux-v6.9-rc5 version

And two 'real' changes due to kconfig language changes:

  - support/kconfig: reference environment variables directly (remove 'option env=')
  - package/openssl: move libopenssl/libressl source statemetns outside of the choice

Works for me despite 'make defconfig'...

Regards,
Peter

Peter Seiderer (8):
  boot/barebox/Config.in: source argument needs quotation marks
  package/cmocka/Config.in: bool argument needs quotation marks
  package/dovecot/Config.in: source argument needs quotation marks
  package/python-pydal/Config.in: bool argument needs quotation marks
  package/x11r7/Config.in: source argument needs quotation marks
  support/kconfig: bump to linux-v6.9-rc5 version
  support/kconfig: reference environment variables directly (remove
    'option env=')
  package/openssl: move libopenssl/libressl source statemetns outside of
    the choice

 Config.in                                     |   51 +-
 Config.in.legacy                              |    6 +-
 boot/arm-trusted-firmware/Config.in           |    2 +-
 boot/barebox/Config.in                        |    4 +-
 boot/beaglev-ddrinit/Config.in                |    2 +-
 boot/beaglev-secondboot/Config.in             |    2 +-
 boot/s500-bootloader/Config.in                |    2 +-
 linux/Config.ext.in                           |    2 +-
 package/amlogic-boot-fip/Config.in.host       |    2 +-
 package/cmocka/Config.in                      |    2 +-
 package/dovecot/Config.in                     |    2 +-
 package/erlang/Config.in                      |    6 +-
 package/flutter-sdk-bin/Config.in.host        |    2 +-
 package/go-bootstrap-stage1/Config.in.host    |    6 +-
 package/google-breakpad/Config.in.host        |   12 +-
 package/jpeg/Config.in                        |    2 +-
 package/kvm-unit-tests/Config.in              |    2 +-
 package/luajit/Config.in                      |    4 +-
 package/mono/Config.in                        |    4 +-
 package/nodejs/Config.in.host                 |    8 +-
 package/openjdk/Config.in                     |    4 +-
 package/openssl/Config.in                     |    9 +-
 package/protobuf/Config.in                    |   22 +-
 package/python-pydal/Config.in                |    2 +-
 package/qt5/qt5webengine/Config.in            |    2 +-
 package/rustc/Config.in.host                  |   16 +-
 package/sam-ba/Config.in.host                 |    2 +-
 package/supertuxkart/Config.in                |    4 +-
 package/ti-cgt-pru/Config.in.host             |    2 +-
 package/ti-gfx/Config.in                      |    2 +-
 package/wine/Config.in                        |    6 +-
 package/x11r7/Config.in                       |  420 +-
 support/kconfig/Kbuild.include                |  273 ++
 support/kconfig/Makefile                      |  375 +-
 support/kconfig/Makefile.br                   |   10 +-
 support/kconfig/POTFILES.in                   |   12 -
 support/kconfig/README.buildroot              |    9 +-
 support/kconfig/array_size.h                  |   11 +
 support/kconfig/check.sh                      |   14 -
 support/kconfig/conf.c                        |  562 ++-
 support/kconfig/confdata.c                    | 1358 +++---
 support/kconfig/expr.c                        |   29 +-
 support/kconfig/expr.h                        |   49 +-
 support/kconfig/foo.h                         |   12 -
 support/kconfig/gconf-cfg.sh                  |   33 +
 support/kconfig/gconf.c                       |  100 +-
 support/kconfig/hashtable.h                   |   48 +
 support/kconfig/images.c                      |   34 +-
 support/kconfig/images.h                      |   33 +
 support/kconfig/internal.h                    |   21 +
 support/kconfig/kconf_id.c                    |   53 -
 support/kconfig/kxgettext.c                   |  235 -
 support/kconfig/lexer.l                       |  460 ++
 support/kconfig/lexer.lex.c_shipped           | 4103 +++++++++++++++++
 support/kconfig/list.h                        |  254 +-
 support/kconfig/list_types.h                  |   17 +
 support/kconfig/lkc.h                         |  117 +-
 support/kconfig/lkc_proto.h                   |   33 +-
 support/kconfig/lxdialog/.gitignore           |    4 -
 support/kconfig/lxdialog/BIG.FAT.WARNING      |    2 +-
 support/kconfig/lxdialog/check-lxdialog.sh    |   93 -
 support/kconfig/lxdialog/checklist.c          |   26 +-
 support/kconfig/lxdialog/dialog.h             |   76 +-
 support/kconfig/lxdialog/inputbox.c           |   24 +-
 support/kconfig/lxdialog/menubox.c            |   35 +-
 support/kconfig/lxdialog/textbox.c            |  330 +-
 support/kconfig/lxdialog/util.c               |   41 +-
 support/kconfig/lxdialog/yesno.c              |   21 +-
 support/kconfig/mconf-cfg.sh                  |   55 +
 support/kconfig/mconf.c                       |  529 +--
 support/kconfig/menu.c                        |  345 +-
 support/kconfig/merge_config.sh               |   91 +-
 support/kconfig/mnconf-common.c               |   53 +
 support/kconfig/mnconf-common.h               |   18 +
 support/kconfig/nconf-cfg.sh                  |   53 +
 support/kconfig/nconf.c                       |  297 +-
 support/kconfig/nconf.gui.c                   |  329 +-
 support/kconfig/nconf.h                       |   62 +-
 support/kconfig/parser.tab.c_shipped          | 2189 +++++++++
 support/kconfig/parser.tab.h_shipped          |  134 +
 support/kconfig/{zconf.y => parser.y}         |  467 +-
 .../01-kconfig-kernel-to-buildroot.patch      |  115 +-
 .../06-br-build-system-integration.patch      |  103 +-
 .../kconfig/patches/10-br-build-system.patch  |   66 +-
 .../patches/11-use-mktemp-for-lxdialog.patch  |   17 -
 .../patches/12-fix-glade-file-path.patch      |   14 +-
 .../14-support-out-of-tree-config.patch       |  202 +-
 .../16-fix-space-to-de-select-options.patch   |   19 +-
 .../kconfig/patches/17-backport-kecho.patch   |   26 -
 ...fig.sh-create-temporary-files-in-tmp.patch |   19 +-
 ...e_config.sh-add-br2-external-support.patch |   24 +-
 ...fig.sh-Allow-to-define-config-prefix.patch |   31 -
 ...-positive-matches-from-comment-lines.patch |   32 -
 ...config-lxdialog-fix-check-with-GCC14.patch |   43 -
 ...llow-only-config-comment-and-if-insi.patch |  956 ++++
 support/kconfig/patches/series                |    6 +-
 support/kconfig/preprocess.c                  |  580 +++
 support/kconfig/preprocess.h                  |   19 +
 support/kconfig/qconf-cfg.sh                  |   40 +
 support/kconfig/qconf.cc                      | 1199 ++---
 support/kconfig/qconf.h                       |  163 +-
 support/kconfig/streamline_config.pl          |  104 +-
 support/kconfig/symbol.c                      |  374 +-
 support/kconfig/util.c                        |  122 +-
 support/kconfig/zconf.l                       |  372 --
 support/kconfig/zconf.lex.c_shipped           | 2500 ----------
 support/kconfig/zconf.tab.c_shipped           | 2488 ----------
 system/Config.in                              |    4 +-
 toolchain/toolchain-external/Config.in        |    2 +-
 .../Config.in                                 |    2 +-
 .../toolchain-external-arm-aarch64/Config.in  |    2 +-
 .../toolchain-external-arm-arm/Config.in      |    2 +-
 .../toolchain-external-bootlin/Config.in      |    2 +-
 .../Config.in                                 |    2 +-
 .../Config.in                                 |    2 +-
 .../Config.in                                 |    2 +-
 .../toolchain-external-linaro-arm/Config.in   |    2 +-
 .../toolchain-external-linaro-armeb/Config.in |    2 +-
 .../toolchain-external-synopsys-arc/Config.in |    2 +-
 119 files changed, 13182 insertions(+), 10621 deletions(-)
 create mode 100644 support/kconfig/Kbuild.include
 delete mode 100644 support/kconfig/POTFILES.in
 create mode 100644 support/kconfig/array_size.h
 delete mode 100755 support/kconfig/check.sh
 delete mode 100644 support/kconfig/foo.h
 create mode 100755 support/kconfig/gconf-cfg.sh
 create mode 100644 support/kconfig/hashtable.h
 create mode 100644 support/kconfig/images.h
 create mode 100644 support/kconfig/internal.h
 delete mode 100644 support/kconfig/kconf_id.c
 delete mode 100644 support/kconfig/kxgettext.c
 create mode 100644 support/kconfig/lexer.l
 create mode 100644 support/kconfig/lexer.lex.c_shipped
 create mode 100644 support/kconfig/list_types.h
 delete mode 100644 support/kconfig/lxdialog/.gitignore
 delete mode 100755 support/kconfig/lxdialog/check-lxdialog.sh
 create mode 100755 support/kconfig/mconf-cfg.sh
 create mode 100644 support/kconfig/mnconf-common.c
 create mode 100644 support/kconfig/mnconf-common.h
 create mode 100755 support/kconfig/nconf-cfg.sh
 create mode 100644 support/kconfig/parser.tab.c_shipped
 create mode 100644 support/kconfig/parser.tab.h_shipped
 rename support/kconfig/{zconf.y => parser.y} (56%)
 delete mode 100644 support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
 delete mode 100644 support/kconfig/patches/17-backport-kecho.patch
 delete mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
 delete mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
 delete mode 100644 support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
 create mode 100644 support/kconfig/patches/23-Revert-kconfig-allow-only-config-comment-and-if-insi.patch
 create mode 100644 support/kconfig/preprocess.c
 create mode 100644 support/kconfig/preprocess.h
 create mode 100755 support/kconfig/qconf-cfg.sh
 delete mode 100644 support/kconfig/zconf.l
 delete mode 100644 support/kconfig/zconf.lex.c_shipped
 delete mode 100644 support/kconfig/zconf.tab.c_shipped

-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
