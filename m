Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7ACEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 803926132D;
	Thu, 13 Jul 2023 07:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803926132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bK94-UswSmqn; Thu, 13 Jul 2023 07:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988CF61300;
	Thu, 13 Jul 2023 07:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988CF61300
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC711BF97F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04551612FB
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04551612FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PcHAFpMInGj for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF82611A4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FF82611A4
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTzfG-1qS8P52Ms6-00R2RC; Thu, 13 Jul 2023 09:38:57 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:51 +0200
Message-ID: <20230713073854.19510-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xXgmX6X3MGpgsOj+ClMivrvrLtNREy2BHVNlmZSkKk2ZIMBvIR9
 Qdi6W3YMN2zqr7GabhPMRpGp6uj+ELakWRE9ahQNsquLJUbzk0K96wH30kewePntj5pXQJI
 StaPvyX+0fY1GiL898/pebCfwgeDuOxhFAlfNSGpHNV2X9lZsw8KAqokvD8UD+1U9D7qnEo
 5ysDl6juSBXYzHaTmUV5g==
UI-OutboundReport: notjunk:1;M01:P0:vN+MBGnZD6M=;uCxN7Eu6Rd6/GMWhhDMjJOSh15O
 uJih3hN37ihDdAxAqCKq9DmgRhzMDf/WFKmadgLOW9BcpCeoQdK+9GWmYCxblYXlv5BGcV2DA
 yhHsc4UA5dnh0naMK/EDJUbkOncQKPlgess8pxSe+1zmK7CAiS99tQTJq+UHcWpXcy3e1e/fx
 95vvqBF0gHDQNT5I6KC1Rit2xlQNf7IT+cTVT7f0WH0VR0e4+6SqX5LaGE5atQ6T3YWqxXMKN
 YMQYe7no4XK7GDPENJAkMMz/g0VNXh5eQOY1sIXvcUfqZNgGPPa4R24o4qDPbW5wpTgRTCPyL
 EoMi2NiFXd82REQhivMr+Eu96n+4sgFlNrN2ldJbd86xCp8tkkdy/ucH1ZPnqlJUAKeLMh/Yp
 X/Vlx8QFqeCJF42lbSHKHE9yda4sSFy/ohliTHrQ+oFr4dHRMDzb8HOTzDxlqW4U11rfsP8eS
 pMi9SL38ehfH6JHWmrN7uBC8Fm7mLbRtfpbAH9TmVDAWfwwJl4AsFEiv1rORkrbMuBN3NKdg/
 m7p/C9OBqvWVu09zYMWRWXO++WaU6CsSoGQZexoxJHte9fns83T/4pq9ZC6S3qJ0kwrp+i0sJ
 kXo1A2wwlpHPKA7s020fF+wtkra7X57q6NGVG5Hus3MFcO/qVbYHDMUzcf/MJeZ/NGeDNvU5D
 Q4ZgkJ+aCtKMgmAnqCWZIEI8lgIEPaOtGfi5qAROKtywPar7beeo1hyo86YLHR1go+djBUPfw
 dLyA3ZFmnHbm5dEqgRRkbzcllx9p29f3OM2A9jmaFo5SKWUMGoDbt+qT5K0R1HVEwG9+wXwHG
 wg7xeoIcZ7wses/EacZGY/OXvjwiYxp3YBdepMa+QL0v8DvLjluIRQn+ZZFxYEykJP6xYp6Ef
 FCgJQqK0QXsei3Ryu+w7FsEqO6yObAczPw7/se0DvMotpMs5dLtRzOdEJNUlCElGWLAIFV5/O
 XO94cI1Pvc8G3OG1R+fKjA9C6pI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233937; x=1689838737; i=ps.report@gmx.net;
 bh=axS1aZqV0r38MsTyBOC2fICwBOCJhPxgzcgPmJwoWF0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NVZ+lC2NGvVXxJOe4oYAt3z1SJhZySBeilKtJZo1qFL2v7HGJk7qHsA2pCp0dwoA1XdFlfN
 1NPvzpr2Y2f2osPXgTSGECB+MYtPXEGPVlIhrNADtVUrEcEU89QR5U33FmP57CaeUWMz9SIfc
 8Y6dUaNIXPghb0kcJ3ECa1FaWnyWz3ABE0F5aE1rRkLFHEFBqccBNe3eweU1dpeElVl8ehj+/
 Lml1fxB+GhOiFmDhJPEfkb29mldfNtdnumXz+vHpM7JIB7a6laHZkNxsmXUvOOBEPQtVqCpNm
 EZ5RPLWgqcMltZ9dEqtUoiOdsA9LucVkP4BPCIxOi5wHT+2Gmjnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NVZ+lC2N
Subject: [Buildroot] [PATCH v1 6/9] package/python-flask: bump version to
 2.3.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update docs/license.rst hash (removed duplicated BSD-3-Clause and
  reference to LICENSE.rst, removed Artwork and reference to
  artwork/LICENSE.rst)

- add new runtime dependency on python-blinker

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-flask/Config.in         | 1 +
 package/python-flask/python-flask.hash | 6 +++---
 package/python-flask/python-flask.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 8a44bf2db4..19b2f0ae7b 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
+	select BR2_PACKAGE_PYTHON_BLINKER # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 9b6391750a..37ff0d70a5 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  c0d2276cb7d59a06d62c915da9c77ba6  Flask-2.2.2.tar.gz
-sha256  642c450d19c4ad482f96729bd2a8f6d32554aa1e231f4f6b4e7e5264b16cca2b  Flask-2.2.2.tar.gz
+md5  a5d5fe05dff5c6e0d28ece3fb03ef5cd  Flask-2.3.2.tar.gz
+sha256  8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef  Flask-2.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
-sha256  7535eac513edd12fb8e33f203c6a403549629e34b363418cdbd6c6ea5464515d  docs/license.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 1b1ffdf034..b0a38488f8 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 2.2.2
+PYTHON_FLASK_VERSION = 2.3.2
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/69/b6/53cfa30eed5aa7343daff36622843688ba8c6fe9829bb2b92e193ab1163f
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4d/00/ef81c18da32fdfcde6381c315f4b11597fb6691180a330418848efee0ae7
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
