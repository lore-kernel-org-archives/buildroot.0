Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D948C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FAA34056A;
	Thu, 10 Feb 2022 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id presXL8ByZaf; Thu, 10 Feb 2022 15:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CBDA40393;
	Thu, 10 Feb 2022 15:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 021841BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3C5940393
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5PrvMN0SwQz for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:29:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8E0A40184
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:29:28 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar23.francetelecom.fr (ESMTP service) with ESMTPS id 4Jvgdz2XrFzBrkL; 
 Thu, 10 Feb 2022 16:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506967;
 bh=1sNrFLiazvHcomWPHhuvCKt9ttyATP1BCabnoIjuZcE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=ijz/Belo+zn2y+vcRxxAsAI09OPntDy813u/dZhr/o6XSuOS4qwP8JXrMARj0mvfW
 VTD6m9NNZvlga5LCcBXjy6EvbWvYvMQal36dW+V7fZYg6m6A5m6ZbwrMfoe4AzZZi+
 b1eP7VDvXZp9AJxykkbzZGr7bpQ0CWccMJSq4zHEgaQFvTmcoS8nphGje7+qW5Q6NM
 EmhkPWcm3UDLAUv5hwhI52gxXvQWLRZrr/40HzBbXEru7kHjUqtKV9omiuHnfDXbHN
 zbL4uZS6ovn1XUm6vBUJieDseg86E/v2zJYfl/rz9oBE3noJhQMRoUzaMJS4hyQa8N
 XhwXwanKVdz/g==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:29:25 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 16:29:25 +0100
Message-ID: <3778_1644506967_62052F57_3778_468_1_cover.1644506959.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 0/5 v3] package/pkg-{cargo,
 golang}: enhance build process
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This five-patch series enhances the cargo- and golang-based package
infrastructures:

  - allow building cargo packages in a sub-directory of the package
    source tree;
  - fix dependencies when using override-srcdir
  - allow passing arbitrary _DL_ENV

The golang-related changes are not tested, by lack of a go package to
test them against, but the changes look obvious and simple enough (note:
they were spotted as the two infras got in simultaneously recently, so
it looked like a good idea to fix both in the same series).

Changes v2 -> v3:
  - always use _SUBDIR to find Cargo.toml
  - add _SUBDIR for cargo infra in the manual
  - carry tags from Christian and Thomas where appropriate (Thanks!)

Changes v1 -> v2:
  - fix conditional in the sub-directory patch
  - add patch to allow building with override-srcdir


Regards,
Yann E. MORIN.


The following changes since commit 4419123f9c5e93fe6247e522c6b27800a36893c5

  package/doc-asciidoc: fix build for out-of-tree documents (2022-02-10 13:44:03 +0100)


are available as patches in this mail series,

for you to apply patches up to 1cfdf4aa3ac96d2d2cf246385325f93b451d773b

  package/pkg-golang: host-go is also a build dependency (2022-02-10 16:22:45 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/pkg-cargo: allow packages to define download environment
      package/pkg-cargo: allow building in a sub-directory
      package/pkg-cargo: host-rustc is also a build dependency
      package/pkg-golang: allow packages to define download environment
      package/pkg-golang: host-go is also a build dependency

 docs/manual/adding-packages-cargo.txt |  5 +++++
 package/pkg-cargo.mk                  | 19 +++++++++++++------
 package/pkg-golang.mk                 |  6 ++++--
 3 files changed, 22 insertions(+), 8 deletions(-)

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

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
