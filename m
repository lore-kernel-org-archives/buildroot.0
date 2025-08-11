Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE3BCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04BF61467;
	Mon, 11 Aug 2025 16:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id On4P_doSwSlv; Mon, 11 Aug 2025 16:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EE96144A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99EE96144A;
	Mon, 11 Aug 2025 16:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F967138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45DC261431
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftLGlgL0Pi5p for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2BC761068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2BC761068
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2BC761068
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:18:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UV8-1ukwzr0sfy-00CF4S; Mon, 11
 Aug 2025 18:18:25 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:18:02 +0200
Message-ID: <20250811161809.3641323-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:/rfScFGqsfOpP2Lb7TOZjgLdP6EjhUz1vrTKCVazdL8xTbBHPtA
 TXEmHgZhxh12ZdHApsk2JjXGtDbEkTIsmiNH6WMex9t83TcYT6cN4kRu8dFVBhmPIhUiJt+
 Vqpto9zcC1d/+/Fxo6YhAHjwEdz0JDIU+yni5nginGfsjRmFm2fKx6BmTId52YfjJOb0E/u
 iQoDDXow0eqzuq6ZiBc/g==
UI-OutboundReport: notjunk:1;M01:P0:Dvn8zbzZTEQ=;eJnrRm6ugTKGfMmaPtmUSd7qxD4
 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
 7ibqtxhpwQebLcH8+vAc2kWTha/sOHDU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754929105; x=1755533905; i=fiona.klute@gmx.de;
 bh=+Uj3PVOksjGEmL+2jze4CwRCdWYDKZyM99XK+JZd0m4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YhvUAsisB5QF9JBpU7DzM385X1hlickHrPKv4SjrBMqi4M8dVxlkMrSr1Qjj3YBC
 UNMAlk/Y9vwHWlKfCUHmqxQ+YTPj3kDpYUpDTxV/4oFSD+6UxyW0yfBp7l27TQFf9
 ObmA9XXB5/5dM+3BPcSOTr1c9UbtQf6e5/0O/8y6Qc/VPpmXckPTSlCk42mmH7Mcz
 w7O7HeqX+qfWb1iQ15HPhfa6+HkFPkztxqawKFFTeG1B8b7jSjCs/USUDytaBFen1
 vQufHgOCIFa0fsR9sRRAXZ8iAGDh4MGkUn3reOjgC9HpmXW2g+BXEZOStFimiZWQj
 c8lLSh1jpTCabehIIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YhvUAsis
Subject: [Buildroot] [PATCH v2 0/7] Add package/python-memray and
 dependencies
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This series adds the Memray memory profiler for Python [1] and its
dependencies. I needed it to help reduce memory usage of some custom
tools, and figure it might be useful to others for
debugging/optimization, too.

The individual patches are fairly simple, mostly a bunch of new Python
packages. Memray itself includes a binary module that needs to be
cross-compiled.

package/elfutils gets an option to enable building libdebuginfod. Note
that this only enables building the library so software that
unconditionally links against it (like Memray) can be built, it does
not create any infrastructure to provide debug info for download.

Best regards,
Fiona

[1] https://github.com/bloomberg/memray

Changes v1 -> v2:
* package/elfutils (patch 1): add option to enable building
  libdebuginfod, instead of building it if requirements are met
* package/python-platformdirs (patch 4): add missing dependency on
  host-python-hatch-vcs
* package/python-memray (patch 7): add a runtime test
* package/python-memray (patch 7): select
  BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD instead of indirect dependencies
* package/python-memray (patch 7): select BR2_PACKAGE_PYTHON3_ZLIB
  (missing runtime dependency)


Fiona Klute (WIWA) (7):
  package/elfutils: new option to enable building libdebuginfod for
    target
  package/python-mdurl: new package
  package/python-markdown-it-py: new package
  package/python-platformdirs: new package
  package/python-rich: new package
  package/python-textual: new package
  package/python-memray: new package

 DEVELOPERS                                    |  8 ++++
 package/Config.in                             |  6 +++
 package/elfutils/Config.in                    | 11 ++++++
 package/elfutils/elfutils.mk                  |  9 ++++-
 package/python-markdown-it-py/Config.in       |  7 ++++
 .../python-markdown-it-py.hash                |  6 +++
 .../python-markdown-it-py.mk                  | 14 +++++++
 package/python-mdurl/Config.in                |  7 ++++
 package/python-mdurl/python-mdurl.hash        |  5 +++
 package/python-mdurl/python-mdurl.mk          | 14 +++++++
 package/python-memray/Config.in               | 19 ++++++++++
 package/python-memray/python-memray.hash      |  6 +++
 package/python-memray/python-memray.mk        | 22 +++++++++++
 package/python-platformdirs/Config.in         |  7 ++++
 .../python-platformdirs.hash                  |  5 +++
 .../python-platformdirs.mk                    | 15 ++++++++
 package/python-rich/Config.in                 |  9 +++++
 package/python-rich/python-rich.hash          |  5 +++
 package/python-rich/python-rich.mk            | 14 +++++++
 package/python-textual/Config.in              | 11 ++++++
 package/python-textual/python-textual.hash    |  5 +++
 package/python-textual/python-textual.mk      | 14 +++++++
 .../tests/package/sample_python_memray.py     | 10 +++++
 .../tests/package/test_python_memray.py       | 38 +++++++++++++++++++
 24 files changed, 265 insertions(+), 2 deletions(-)
 create mode 100644 package/python-markdown-it-py/Config.in
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.hash
 create mode 100644 package/python-markdown-it-py/python-markdown-it-py.mk
 create mode 100644 package/python-mdurl/Config.in
 create mode 100644 package/python-mdurl/python-mdurl.hash
 create mode 100644 package/python-mdurl/python-mdurl.mk
 create mode 100644 package/python-memray/Config.in
 create mode 100644 package/python-memray/python-memray.hash
 create mode 100644 package/python-memray/python-memray.mk
 create mode 100644 package/python-platformdirs/Config.in
 create mode 100644 package/python-platformdirs/python-platformdirs.hash
 create mode 100644 package/python-platformdirs/python-platformdirs.mk
 create mode 100644 package/python-rich/Config.in
 create mode 100644 package/python-rich/python-rich.hash
 create mode 100644 package/python-rich/python-rich.mk
 create mode 100644 package/python-textual/Config.in
 create mode 100644 package/python-textual/python-textual.hash
 create mode 100644 package/python-textual/python-textual.mk
 create mode 100644 support/testing/tests/package/sample_python_memray.py
 create mode 100644 support/testing/tests/package/test_python_memray.py

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
