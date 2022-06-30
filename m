Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96CCC43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011E760F58;
	Thu, 30 Jun 2022 19:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011E760F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_Kqbj7rjqZY; Thu, 30 Jun 2022 19:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1524360F3D;
	Thu, 30 Jun 2022 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1524360F3D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4726D1BF232
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 19:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 214BD41A6E
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 19:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214BD41A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUeB-CaGOdJI for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 19:44:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1E84099F
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B1E84099F
 for <buildroot@uclibc.org>; Thu, 30 Jun 2022 19:44:38 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1o705b-00023n-48
 for buildroot@uclibc.org; Thu, 30 Jun 2022 21:44:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 Jun 2022 21:44:00 +0200
Message-ID: <pan$40d1f$9bb6df60$3b2de8b8$761e186@ID-313208.user.individual.net>
References: <20220615205026.117274-1-fontaine.fabrice__25682.1698903636$1655326420$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: selects
 BR2_PACKAGE_ALSA_LIB_{PCM, RAWMIDI}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 15 Jun 2022 22:50:26 +0200 schrieb Fabrice Fontaine:

> alsactl (which is unconditionally built) needs
> BR2_PACKAGE_ALSA_LIB_RAWMIDI since bump to version 1.2.7 in commit
> 4dc8563363d639255217ffc59482eaccf93a1b51 and
> https://github.com/alsa-project/alsa-utils/commit/
bbc74a61ac7c35e506c3d7f76ecf943cb55736a6:

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(fixes http://autobuild.buildroot.net/results/af6/
af6a2727e562bbea1f7a334a83ed2bd3b3e41451/)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
