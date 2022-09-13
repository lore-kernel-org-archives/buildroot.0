Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41067C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 17:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F40BA80B44;
	Tue, 13 Sep 2022 17:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40BA80B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXpd6FJDd8TD; Tue, 13 Sep 2022 17:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAB080B43;
	Tue, 13 Sep 2022 17:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAB080B43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8DBB1BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82F0A40173
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F0A40173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hpoH6psO12f for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 17:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B797D40160
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B797D40160
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 17:41:40 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1N5FtF-1pHMcM0rfZ-011AVm; Tue, 13 Sep 2022 19:41:35 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 19:40:37 +0200
Message-Id: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:YqlxDaPSEyZzaZrHakY2LIk1MlBuaaCh4J8VBJM3YKELcLBDq20
 5KthCg8THRctcfiPpxxcg9Mxg2sHWR7RuHueZeS97xwUMaqjXstwxC0CzZWiFf5ZbW1duct
 5gCRwy7nwszq7PgFoETodPvTpvLzmMQFd2IwXL8cBo5od4mztv62p/GwwQjHdysfTdVCZy4
 ko63BiOyVFwzOcOn3wxXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNVBDWvFVL0=:K5dxhcI9uBiuGUHtqUZcIl
 oNCQKZZm9uviRHvYZE0UI9u/BeKr5hoAUSVhALrPHhUUwSiVCw2ut0hM49IQy9hqTHt9cyhO+
 YnI7CaYuaxp0+8gHM3K6rd7XDqr3iHiLCDcz8Dc+FmWMisMyHUVehQ1PsNqWvebGxYea0epZR
 YoPhT85YHL2XfLyElqxUbRDUvEhdNLeeqI8qh0HpNGafReEmMUZOpBjdFXU5R7dLrC7/6hz4c
 71Ti4rv8A0T+BoI5XeD6szeblgakm5ym0ooivfm9WzCriNvO/Q6mavxwudjeU7px+J2+0ZLGg
 7Ea6NPkR7idtGrckOyse4sR7beTjjnTTa/rHR7HI9A3H+8eqfM0G+ORJ0TMd9yvzDlBO4axL1
 /KjH+UScQIkPZtXDuHHoUF9U7VTQMigxEpkhSjcmY9+e63zAjRRMW1iTaBOmybNlRjHL1muoj
 MwIftirs0saKN+923ML44XUdK+rS7mAUextV8A7FNQP3E16QIxthMOCHVgkyKl/WRmG8Lvb6T
 6NNh3flYS0/BVcAlhnNOKQHNWujD3+LQfe/oqBjbqrPjEBl6Ou9Ayh3FeQmZ1PtGnVGdPjkgO
 FnBzqib5Es/Ous6yW/O5kJX4wJhifWML3EwkOP92dqGQAsuV2kvmWvnNuHYwnaRGObxk22iiT
 /bMsXk9I/nGSM93Z4Pbkn1nEOPLf6kv5PlAg76Sg/IaNWwI4Z/Gk6YlZBod3JxutfWWarCZEz
 mPLDA8qhivhKyR1RqgKTR19d4QStRNUAmm4mSSSeBHYU8M8YU1GDFlmWROT7w6hfEba3GatRc
 jYw/zTSsS60EvlbAuJYesMWnDW3XJlOKv8IF5X3K5k62VKyUtc=
Subject: [Buildroot] [PATCH 0/2] Update host-nodejs and build vuejs from
 source
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Martin Bark <martin@barkynet.com>, Johan Oudinet <johan.oudinet@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to bump vuejs, I wanted to get rid of the infamous:

VUEJS_SITE = https://registry.npmjs.org/vue/-

in vuejs.mk, and rely instead on host-nodejs to build the JavaScript
library from its source archive on GitHub.  However, it turns out
Vue.js relies on pnpm [1], another package manager...

... Fortunately, Node.js comes with Corepack [2], a transparent
wrapper that takes care of pnpm, but one has to enable it at install
time.  Hence, here is a series of two patches: one to add an option to
host-nodejs to enable and install Corepack, and one to bump vuejs to
its latest version, building it from its official source archive.

[1] https://pnpm.io/
[2] https://nodejs.org/api/corepack.html

Thomas Claveirole (2):
  package/nodejs: introduce BR2_PACKAGE_HOST_NODEJS_COREPACK
  package/vuejs: bump to version 3.2.39

 DEVELOPERS                                    |  1 +
 package/nodejs/Config.in.host                 | 23 ++++++++++++++++---
 package/nodejs/nodejs.mk                      | 21 +++++++++++++----
 ...ode-build-commit-to-v3.2.39-f79c4236.patch | 13 +++++++++++
 package/vuejs/Config.in                       |  4 ++++
 package/vuejs/vuejs.hash                      |  2 +-
 package/vuejs/vuejs.mk                        | 14 +++++++----
 7 files changed, 66 insertions(+), 12 deletions(-)
 create mode 100644 package/vuejs/0001-hardcode-build-commit-to-v3.2.39-f79c4236.patch

--
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
