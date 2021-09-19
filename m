Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7509C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209B061244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 209B061244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E4883E9B;
	Sun, 19 Sep 2021 12:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mFrs0fDZlQU; Sun, 19 Sep 2021 12:45:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36CF283EA4;
	Sun, 19 Sep 2021 12:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C485E1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1329404E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-Z6RXclG5VK for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5020404E3
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:45:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A0A6AC0002;
 Sun, 19 Sep 2021 12:45:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 19 Sep 2021 14:45:13 +0200
Message-Id: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Misc Python package updates/additions
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jeremy Connat <Jeremy.Connat@orolia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

A small patch series that:

 - Updates python-smmap2 and python-gitdb2 to newer versions (must be
   done in lockstep)

 - Adds a python-flask test

 - Adds a python-flask-expects-json package, and its associated test.

 - Adds a python-git package, and its associated test

Best regards,

Thomas Petazzoni

Thomas Petazzoni (4):
  package/python-{smmap2,gitdb2}: bump versions to 4.0.0 and 4.0.7
  support/testing/tests/package/test_python_flask: new test
  package/python-flask-expects-json: new package
  package/python-git: new package

 DEVELOPERS                                    | 16 ++++++++
 package/Config.in                             |  2 +
 package/python-flask-expects-json/Config.in   |  9 +++++
 .../python-flask-expects-json.hash            |  5 +++
 .../python-flask-expects-json.mk              | 14 +++++++
 package/python-git/Config.in                  | 13 +++++++
 package/python-git/python-git.hash            |  3 ++
 package/python-git/python-git.mk              | 13 +++++++
 package/python-gitdb2/Config.in               |  4 +-
 package/python-gitdb2/python-gitdb2.hash      |  6 +--
 package/python-gitdb2/python-gitdb2.mk        |  6 +--
 package/python-smmap2/Config.in               |  1 +
 package/python-smmap2/python-smmap2.hash      |  6 +--
 package/python-smmap2/python-smmap2.mk        |  6 +--
 .../tests/package/sample_python_flask.py      |  7 ++++
 .../sample_python_flask_expects_json.py       | 18 +++++++++
 .../tests/package/sample_python_git.py        |  1 +
 .../tests/package/test_python_flask.py        | 29 ++++++++++++++
 .../package/test_python_flask_expects_json.py | 38 +++++++++++++++++++
 .../testing/tests/package/test_python_git.py  | 11 ++++++
 .../tests/package/test_python_gitdb2.py       | 10 -----
 .../tests/package/test_python_smmap2.py       | 10 -----
 22 files changed, 194 insertions(+), 34 deletions(-)
 create mode 100644 package/python-flask-expects-json/Config.in
 create mode 100644 package/python-flask-expects-json/python-flask-expects-json.hash
 create mode 100644 package/python-flask-expects-json/python-flask-expects-json.mk
 create mode 100644 package/python-git/Config.in
 create mode 100644 package/python-git/python-git.hash
 create mode 100644 package/python-git/python-git.mk
 create mode 100644 support/testing/tests/package/sample_python_flask.py
 create mode 100644 support/testing/tests/package/sample_python_flask_expects_json.py
 create mode 100644 support/testing/tests/package/sample_python_git.py
 create mode 100644 support/testing/tests/package/test_python_flask.py
 create mode 100644 support/testing/tests/package/test_python_flask_expects_json.py
 create mode 100644 support/testing/tests/package/test_python_git.py

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
