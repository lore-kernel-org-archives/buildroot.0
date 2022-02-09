Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2111BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DAED60AEC;
	Wed,  9 Feb 2022 16:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fd7FIIz5Mfeu; Wed,  9 Feb 2022 16:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAC4608D8;
	Wed,  9 Feb 2022 16:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD2E1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D40A608D8
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXm2RtiQqva0 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:08:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0EFA6061B
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:08:48 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar27.francetelecom.fr (ESMTP service) with ESMTPS id 4Jv4Yp3FBWz2xj4; 
 Wed,  9 Feb 2022 17:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644422926;
 bh=31MoUrx/34MszUGgxcNfkQC2eH11VuR122VgXEMBkFw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=plEsSeCoxA8h546+5Hr+L8k7PslEivKYMxN3thTfGKEMWz3FAw/XSqy9C0dc8cPuc
 RMWDV/dUbdM3LzoSZXaglpepWZKW3WTRMRR5mc1pEMiFvqZi4k0m6908r9OhKDWX2n
 RhBEmvMk0+vFz6phY5+basj/lsS4h2yFGXSEAwJ47MjxzksNBN3MPsLz2i0EitbfNb
 nmjc4X63MF8uxh10Y++FHhGOfuIIcYwNKvIiIPVqQsoNBqT4g4vc9R4tAjXh8dqR5F
 KxBGfpIe8G8DxJkcOlha4yWiqaWuCLPQIMs2m8fvnRLt1Rejy779hUviyKa/IbR6Kp
 Ae2yQHH/4u8Ew==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 17:08:43 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 17:08:43 +0100
Message-ID: <24539_1644422926_6203E70E_24539_404_5_cover.1644422916.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 0/5 v2] package/pkg-{cargo,
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

Changes v1 -> v2:
  - fix conditional in the sub-directory patch
  - add patch to allow building with override-srcdir


Regards,
Yann E. MORIN.


The following changes since commit 1753d7e667163aacf2ec1d495d2ab62fb384d52c

  package/doc-asciidoc: fix build for out-of-tree documents (2022-02-09 09:58:47 +0100)


are available as patches in this mail series,

for you to apply patches up to a1a52ce7fd9920435f8cc9e82513d62f9badd738

  package/pkg-golang: host-go is also a build dependency (2022-02-09 16:39:52 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/pkg-cargo: allow packages to define download environment
      package/pkg-cargo: allow building in a sub-directory
      package/pkg-cargo: host-rustc is also a build dependency
      package/pkg-golang: allow packages to define download environment
      package/pkg-golang: host-go is also a build dependency

 package/pkg-cargo.mk  | 22 ++++++++++++++++------
 package/pkg-golang.mk |  6 ++++--
 2 files changed, 20 insertions(+), 8 deletions(-)

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
