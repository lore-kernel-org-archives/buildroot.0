Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407F981424;
	Thu,  2 Nov 2023 16:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407F981424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6e55YBXvX-i; Thu,  2 Nov 2023 16:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C48981326;
	Thu,  2 Nov 2023 16:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C48981326
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45F1F1BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2D6705B0
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2D6705B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1U8wo0QdLqNA for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:30 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D9E16113C
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D9E16113C
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:27 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:27 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:25 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:23 +0100
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; d="scan'208";a="60837509"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:23 +0100
Message-ID: <cover.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941370; x=1730477370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/XAU1Gc17rNXPyqUXCj9CbMD5G4bhhjHhWYIeU3AdkE=;
 b=ka8XKWOjqRcJS8LAsJoC4DqEGmvbuZUQRINq7tVWiA9vl7wPlUWcJM1Q
 GaV9rVzUkw1kCvRq1Rg9wRw17Fwuwq/tyAMUX6am+4tgn704VviOx6p8I
 TZoIy/xkR9C7FHcjNEW5Vizct10Oyj9E4EJtK/CU16IlHQ/10HdoVv2y8
 h2YdHegzy446F7Loo39chfDk/JKQTGWTnwoZcejYZj9vf5l/tSdiLy4DC
 G9QTPpKWIOl5C0ZaS39fJtyfaDuAGwO+7wlf4lM3r30MW0xctPef1fE/p
 a2ny6dFbzeH8DXddXvxmman1kiU3hM0VDUtSkUeWKfqo72gFD2BTf0L7h
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=ka8XKWOj
Subject: [Buildroot] [PATCH 0/8] package/skopeo: new package
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This series introduces a host-only package for skopeo, a tool to
manipulate OCI and docker images, and push and fetch them to/from
registries.

The series is articulated in three parts:

 1. fixes in the golang infra to properly manage legal-info for
    host-only packages (and cargo while at it, as it has the same
    issues)

 2. adding host variants to a few dependencies for host-skopeo

 3. adding host-skopeo proper

Skopeo is expected to be used from post-image scripts, to convert OCI
images to docker ones, or to push them to a docker registry, or even to
load them into a (possibly remote) docker daemon; there is no new
"filesystem" format introduced (no fs/docker-image/ for example), and
thus needs an entry in the host-packages sub-menu.


Regards,
Yann E. MORIN.


The following changes since commit 8a4e81ff9d54ed90dbbf02b056bc9f97ce9425a4

  utils/docker-run: propagate user's proxy settings (2023-11-02 08:52:50 +0100)


are available as patches in this mail series,

for you to apply patches up to fb85e4dd41a441b26ae93b621f8f2462ab0eeafc

  package/skopeo: new host package (2023-11-02 08:52:51 +0100)


----------------------------------------------------------------
Yann E. MORIN (8):
      package/pkg-cargo: don't expand license info when empty
      package/pkg-cargo: handle licensing terms for host-only packages
      package/pkg-golang: don't expand license info when empty
      package/pkg-golang: handle licensing terms for host-only packages
      package/libgpg-error: enable host-variant
      package/libassuan: add host variant
      package/libgpgme: add host variant
      package/skopeo: new host package

 package/Config.in.host               |  1 +
 package/libassuan/libassuan.mk       |  6 ++++++
 package/libgpg-error/libgpg-error.mk |  6 ++++++
 package/libgpgme/libgpgme.mk         | 19 +++++++++++++++++++
 package/pkg-cargo.mk                 | 15 ++++++++++++++-
 package/pkg-golang.mk                | 15 ++++++++++++++-
 package/skopeo/Config.in.host        |  7 +++++++
 package/skopeo/skopeo.hash           |  2 ++
 package/skopeo/skopeo.mk             | 22 ++++++++++++++++++++++
 9 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 package/skopeo/Config.in.host
 create mode 100644 package/skopeo/skopeo.hash
 create mode 100644 package/skopeo/skopeo.mk

--
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
