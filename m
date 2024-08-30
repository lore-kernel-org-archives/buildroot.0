Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA393CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A6814114E;
	Fri, 30 Aug 2024 12:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42rKUYy-QKyL; Fri, 30 Aug 2024 12:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5A2404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E5A2404B6;
	Fri, 30 Aug 2024 12:26:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7231BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042BF841D0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk138cb7PMSk for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53F8B8414D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F8B8414D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53F8B8414D
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:26:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.139]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4Jqb-1sjjjP0g1R-0035n7; Fri, 30
 Aug 2024 14:26:50 +0200
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:26:31 +0200
Message-ID: <20240830122637.3722450-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:j4Eski7fE2tOMhh6ICyfCdwVuUthaz9tPUKkvrpJpPbyg57Tq7c
 96qwrnQvQKel1sgs8T+WdW19eXnbqGf7Lwjb7I353NE0mx/rL2HqKCTpF3v+gE5zIcmgjBh
 5DnvdMrnapmh3B1BMxWsKkM8azowZHOTmVa9hRu63xW7GgM2t6ngVaBtXoDFAtx43CsvZdF
 aqqBdk1R13lZcglTkkjtA==
UI-OutboundReport: notjunk:1;M01:P0:03o9eyZ1kGA=;XNY3qEKfkGN470dvm/3+vrwOsB1
 y0rk1wTXoVhqkkPctlUJKIfCiulThzSPCdvONDTRnnq04zwwCg8cKp8lQ5sS+Wkt/FVxIDV7c
 DrHwNrJxKnKupKDw7p7BSdX/mYqJyu2y33prvMo+w793htJ7X5mRj3kSPFJroAdB2AVQtLoWY
 fIGwOXTkSwLejphgJzMWZES50SJHZDYuHQHBerGGmN+X1ciGSKFy1/CpnMkgyqV8lXLPGgNog
 0zKxIcgDnQyd86UJj34taq73Kf5WtZk4AWbMl6CvZirAejm552XA6c0ivJcDirJZM8mnsEzSP
 JEelUrcJyvahWJhOzQ/CXdO2bOZD8PPOzPhlioWN9ZIolRb54m2ovB8x7cWZ0jecQ0xdv3EvW
 M/xfiy5WPEhBAGDZPnCQm3gu9n4n0DTB+tUdOiYTtVfMvFAQ93B8cH8RyNoC2aL/yAoP3Xmmt
 gZS7/aODcbV/pwWysaDmg2gq13RvLz6s9DhHwsP4FbXiXtMK4Z15DY2QFQTOArSyt2l07Hj+b
 4eH6qaKc+ssuW9BJDmyWLR5lTWFtApijorpTXX0hxiEq1wyUB8dzJBNU10goxFrP70d8ka6Rp
 PJ4kJpYW6BoExZx4f9WSpDDKGoiOXdZ4Uks/d94cdF63JyCfWDlCfY1mKZrI2gwwlgG5FzbfK
 oB8kUosb36AdVkrhZjcPj//s8Lum595aKJj5UjRwbrndIPY7EA23l34sBwMbstXYN/OTRXhVG
 d0eyqI71ZHPAf9FE9gk/h/goyf8oLk6Gkotfh9pZUz08U41WXx5/9TTP0U6VI1pV4hGdLzrGz
 x8litrUC5rFzCuLgdVRC9FLg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725020810; x=1725625610; i=fiona.klute@gmx.de;
 bh=REWAs+FgeGwxynWCWkuHKdh4PD+4xrNtdVv/FtDRbjk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uU307DVdsqKRZ6Qkc/fl+LBUjw8dalqBuq8d0pawiFHNkdSUG/xDqbAbGh7LM8nD
 lWw+N20swM/H1RmBhHt1QtrD9zA0viaTv6H4qoeZjct+wRfWkdr7n5Pe1LW7OwWhl
 3ti4/PpVMnW6nPhJMq1bDKCKKpTrhsSEG3dRvHNnGmSvtFPxP8Jqgxk7BPxLCW3e+
 zo+x2ByK8VslaSgHRRJMnyIzv1l0m63re2zuNpXHJ1cQcOu4hua0iOFhN1HwBnGGm
 kA/LDOj1AD0U7b8q9IYYdXo/sort6QXYSvRq7yX8WQMBngoteG2zqgHIQuxJs7t7n
 rRvdPO593owgPCN8Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uU307DVd
Subject: [Buildroot] [PATCH next v2 0/3] libglib2 2.82 series with bootstrap
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

Open points from my point of view:

Do we need to support BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS in the
Meson exe_wrapper? If yes, how? LIBGLIB2_MESON_EXTRA_BINARIES does not
allow spaces, a wrapper script might be a workaround (but should
probably be part of host-qemu if that's the way to go).

Is there any way to check if host-libglib2 should be built with
introspection? There is no BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION
option. Skipping bootstrap for the host package would mostly be a
performance optimization though (skip building gobject-introspection
and the second libglib2 build), unlike for the target package where it
adds the dependency on Qemu.

Thanks in advance for the review,
Fiona

[1] https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438

Changes v1 -> v2:
* Update libglib2 to 2.82.0 instead of 2.80.4, drop one more patch
* make building introspection data for libglib2 conditional on
  BR2_PACKAGE_GOBJECT_INTROSPECTION=y
* skip bootstrap for target package when building without
  introspection, do not depend on Qemu in that case

Fiona Klute (WIWA) (3):
  package/{gobject-introspection, libglib2}: bump to {1.80.1, 2.82.0}
  package/python-gobject: bump to version 3.48.2
  package/network-manager: optional gobject-introspection

 package/gobject-introspection/Config.in       |  8 +-
 .../gobject-introspection.hash                |  4 +-
 .../gobject-introspection.mk                  | 11 ++-
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 38 ++++----
 ...rmat-in-gio-gunixconnection.c-part-2.patch | 93 ------------------
 ...documentation-generation-with-gtk_do.patch | 96 -------------------
 ...ion-of-a-system-provided-proxy-libin.patch | 53 ----------
 ...05-meson-try-iconv-in-libintl-lookup.patch | 53 ----------
 .../0006-link-with-latomic-when-needed.patch  | 52 ----------
 package/libglib2/Config.in                    |  2 +
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch |  1 +
 .../libglib2-bootstrap.hash                   |  1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk  | 47 +++++++++
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  | 21 +++-
 package/network-manager/network-manager.mk    |  7 +-
 package/python-gobject/Config.in              |  8 +-
 package/python-gobject/python-gobject.hash    |  4 +-
 package/python-gobject/python-gobject.mk      |  2 +-
 19 files changed, 119 insertions(+), 386 deletions(-)
 delete mode 100644 package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
 delete mode 100644 package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
 delete mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
 delete mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
 delete mode 100644 package/libglib2/0006-link-with-latomic-when-needed.patch
 create mode 120000 package/libglib2/libglib2-bootstrap/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
 create mode 120000 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
 create mode 100644 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
