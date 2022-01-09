Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E53C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 03:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9EA60B08;
	Sun,  9 Jan 2022 03:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyqvsbERon6q; Sun,  9 Jan 2022 03:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4411460B04;
	Sun,  9 Jan 2022 03:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC1E1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC314058B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXpeqdE5Q_H3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C3F4401C7
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id l3so12828894iol.10
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 19:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkwL0SyLLaqYrVqpCdPhLz2K/1CqL8Gxftze960DeI4=;
 b=Jb6nqiXmFs+nxbok7YUV/0W6RWzXMVZnZgA2bEH1FKh4KxusMiycrGhNntKnnm6GVD
 h9dRAdMhWuGPOzMyC5injWiUg+V8XzQImEjXCnF9QxbunMaI2o2E1x0KtF8hWjOnXX1+
 zmytNUo43Yytz23/PnP3aZiAUZFy3o3tvrFGxShh8rUpVHvApgVRJg/IzWy1N8TIa+Ry
 /ZQqhOKrtYYPTLa3KEt0qEnBfPJU4CS/tJRiAFwz4Mwq8FBeVL1kiF9t9LBal9BiiGuS
 2+1MYq2pgmghWGO909+wYAvh6fVr+cm7s7QxqWlFeyMDPHjAbG4lBEuBeEVv8+gbNHcc
 ug4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkwL0SyLLaqYrVqpCdPhLz2K/1CqL8Gxftze960DeI4=;
 b=o1yVUjY78ox05IeM8ISWGuEbQfEjey8Razc8xnCrX3VGQJMo8Lp0WfdWh0gM9gyigd
 fZBtswgEal21pkjtzOfBkrYZOgZVZ7MVzHSTXSH96e1xCcqZQZqJFCdd8qraNPXGpEd9
 kWry76qCMTf1rCS7nxYw3yCFuYIEXn0jIIeQ2P8bH2pGSoUxgsdc0DNY1NH3bUQJ7KQm
 o0DVEz6Q7z1vVSt7LeesSdTaFfjsDfo9aF2N6Er8WvWhcIO6WemySrG6sTkIZCVRYkRI
 ahBJK30csHlMX7phCt5yDl5N4t75Lq41fSOHrBXQ9/GvkWe/1TPm0TACmfAbppEZjl2H
 b86A==
X-Gm-Message-State: AOAM53180/92UnyNI52IbRXSazvW6HsJS+F5oNnHlbXIqZ6g/DCew0Qa
 cngvnU0iQbotwzNRV5gYqAUVE5Z4Tt8=
X-Google-Smtp-Source: ABdhPJyZmkiTKIBXY33Ld5xDLtCsqSKRg/XY0xo+lNXzUO6WsLjGfrAc6SUGac76K/p7q2VqfzTJjQ==
X-Received: by 2002:a5d:850a:: with SMTP id q10mr34300233ion.171.1641700568352; 
 Sat, 08 Jan 2022 19:56:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id l11sm1839833ilq.74.2022.01.08.19.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 19:56:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 20:55:58 -0700
Message-Id: <20220109035601.2483360-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/3] PEP517 host packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds host packages that will be used for PEP517 based
python-package infrastructure in a future series.

See:
https://www.python.org/dev/peps/pep-0517/

---
Changes v2 -> v3:
  - rebase on master

James Hilliard (3):
  package/python-pep517: new package
  package/python-pypa-build: new package
  package/python-installer: new package

 .../python-installer/python-installer.hash    |  5 +++++
 package/python-installer/python-installer.mk  | 15 +++++++++++++++
 package/python-pep517/python-pep517.hash      |  5 +++++
 package/python-pep517/python-pep517.mk        | 16 ++++++++++++++++
 .../python-pypa-build/python-pypa-build.hash  |  5 +++++
 .../python-pypa-build/python-pypa-build.mk    | 19 +++++++++++++++++++
 6 files changed, 65 insertions(+)
 create mode 100644 package/python-installer/python-installer.hash
 create mode 100644 package/python-installer/python-installer.mk
 create mode 100644 package/python-pep517/python-pep517.hash
 create mode 100644 package/python-pep517/python-pep517.mk
 create mode 100644 package/python-pypa-build/python-pypa-build.hash
 create mode 100644 package/python-pypa-build/python-pypa-build.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
