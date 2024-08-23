Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E0C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1007840F3;
	Fri, 23 Aug 2024 17:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM0EZ0Rcgxpr; Fri, 23 Aug 2024 17:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B5F8188D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03B5F8188D;
	Fri, 23 Aug 2024 17:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 385321BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B89540D9F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu8cXdoQCzK1 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE5AD4130A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5AD4130A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE5AD4130A
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:24:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.118.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1s9rM8432U-00glrG; Fri, 23
 Aug 2024 19:23:59 +0200
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:23:37 +0200
Message-ID: <20240823172341.1035485-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:R/D3OPhSYeLHZyzqnrLb3lS4s8ewnYPrUikc6kE0pPNDyoppp0p
 mosdP3gv1Q9UUTy5+tdCeRm3PYM40Dxuc8AUggBPt3VT0NT5hPgSH0QmtvB3dYXLPfq+pmi
 SgqWgbuO6iMDni7CkUmemGo0AOokUnrO8czjOma7iMmIxm1LPB5olbywWFD9rr7/hb41BAy
 qUzVRmN9/bwk8LX9MWsMA==
UI-OutboundReport: notjunk:1;M01:P0:DmrthEJA8o4=;1G+hXZHfxs2Jlz/6WJhGwRm4TZN
 SG9uFQsomuinQ+lmibgqPDEk4WSUVKWTC6mSHsfSAvt/VCLUzxbvaTQSSTP7VE6Eyk5l1RZ1k
 QCoPA5u6VVIP+GsB8pPz7lC4IUrWNBaVRPf/lXSeqT9gCL2Ifpf9/WMwxtuVPGHschDDJqcZI
 GpgP3oTzZZxfOI7/8HtETOIa1OdKec/iXaxabLwUrW7lfz5ssTJ4Y/7uUdE3VwOvkLqyF/cOg
 RzyNL5hrs4cpLyFCIU310C7u9ucBzQLrHvGRM5N7LeF1MjPBqZ7B7vnDACQE0bar2gtyhUmGT
 kYUwbrwqRggTAAHbvccx/Bl9WhhQSxhxil8ELV824jB900weBrvc0Ad1iuuqpH8g1zw315/m5
 4yWWt2vRZGar5eoBAJVdmGYAYMmt6lDWR11JHYKZxBd+GCK27r+PaIgnh5y/helAzj4wUbaih
 GGoeAdGymDA4oBw6re0p6GH6vLxPIpKMWocXRta9pBoJA0d7mVRwO/hYNW5E8JMAvHxQb+XWj
 DKfIY9MbwtjjT4hbCD6QmhmRcLFpMl8Pk8C2r93Pot9A2uYgrp8aI00bK2nMtqK4x3+jI4PLw
 DnYqj4EQqieZsqdcjNKlSrpS9V/1E7SIkY9lDmRk4z7xj/mqa9iIOiB7C1dP7WsANVuZXIAPL
 4Nj/MLjm3HNKbx5luw7BLohvR25jGZF/ta3OoTeqqQqstyyHOvGu50lLNdj0DIJl3p7on1p+S
 sFW36ii7Kt0BwFd8sUcI1k88zbJP7WzdiNBXqWclvMd12vAJNNyxd+J6l/NIq0M8Rc+AQEG2C
 mYCz7s0oYXpEVe0kYess/P3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724433839; x=1725038639; i=fiona.klute@gmx.de;
 bh=kJybcrD49ORPcaoQVYCzzi1V44v+skoikkkWPzhP+T8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SogDohH772daONlf9aLWC4QgYGdw66MdRRBjy2rmpBdtshGlN14yetmWAbW7iqDB
 7L2oBHh7bZplYtBUbstZA9B0wRXJnhdo6FZkxv2kdd7qPm/cu66eHoGgZ8MEAKAzr
 T1+5dxtJauCEa1NWwI6yB1hxHWIIEkRa9SzU8Y6js1q2V4U2OmBFd7B+tBzGIrt/w
 ySTD0sCxqZvSApoWKD69+MHQFUZNhOD5azza+zDZ2pDmOU2EZOIhS8NfKyB+OkIpb
 e3uiojnu+ren0lXUzfSftDrdKvwkHMwr1lXZ5/bTln34ya6A87yzn1dFAS6j6LSek
 +lZGcH56E2tg4BnEnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SogDohH7
Subject: [Buildroot] [PATCH next 0/3] libglib2 2.80 series with bootstrap
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since 2.79.0 libglib2 needs to be bootstrapped without introspection
support before gobject-introspection can be built, the added
libglib2-bootstrap sub-package takes care of that. See NEWS at [1].

Open points from my point of view are related to details of the
bootstrap process and dependency handling:

Libglib2 with introspection depends on gobject-introspection, but
adding a "select" would create a circular dependency that can't be
disabled. How should this be handled? Should libglib2 be built without
introspection (and bootstrap) if gobject-introspection isn't enabled,
or otherwise configurable?

Do we to use BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS in the Meson
exe_wrapper? If yes, how? LIBGLIB2_MESON_EXTRA_BINARIES does not allow
spaces, a wrapper script might be a workaround (but should probably be
generic if that's the way to go).

What about platforms where BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
isn't 'y', so the exe_wrapper can't work? Should those fall back to
building without introspection? I suppose that'd be a point in favor
of making introspection conditional in libglib2.

Thanks in advance for the review,
Fiona

[1] https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438

Fiona Klute (WIWA) (3):
  package/{gobject-introspection, libglib2}: bump to {1.80.1, 2.80.4}
  package/python-gobject: bump to version 3.48.2
  package/network-manager: optional gobject-introspection

 package/gobject-introspection/Config.in       |  8 +-
 .../gobject-introspection.hash                |  4 +-
 .../gobject-introspection.mk                  | 11 ++-
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 38 ++++----
 ...rmat-in-gio-gunixconnection.c-part-2.patch | 93 ------------------
 ... 0002-link-with-latomic-when-needed.patch} |  0
 ...documentation-generation-with-gtk_do.patch | 96 -------------------
 ...ion-of-a-system-provided-proxy-libin.patch | 53 ----------
 ...05-meson-try-iconv-in-libintl-lookup.patch | 53 ----------
 package/libglib2/Config.in                    |  2 +
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch |  1 +
 .../0002-link-with-latomic-when-needed.patch  |  1 +
 .../libglib2-bootstrap.hash                   |  1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk  | 47 +++++++++
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  | 14 ++-
 package/network-manager/network-manager.mk    |  7 +-
 package/python-gobject/Config.in              |  8 +-
 package/python-gobject/python-gobject.hash    |  4 +-
 package/python-gobject/python-gobject.mk      |  2 +-
 20 files changed, 113 insertions(+), 334 deletions(-)
 delete mode 100644 package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
 rename package/libglib2/{0006-link-with-latomic-when-needed.patch => 0002-link-with-latomic-when-needed.patch} (100%)
 delete mode 100644 package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
 delete mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
 delete mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
 create mode 120000 package/libglib2/libglib2-bootstrap/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
 create mode 120000 package/libglib2/libglib2-bootstrap/0002-link-with-latomic-when-needed.patch
 create mode 120000 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
 create mode 100644 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
