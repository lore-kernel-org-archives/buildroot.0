Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B9DCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 23:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB75A824B4;
	Fri,  3 Oct 2025 23:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyNaWTKQsVNa; Fri,  3 Oct 2025 23:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7458254D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB7458254D;
	Fri,  3 Oct 2025 23:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C33D7226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9CD540EF4
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1FKiSNpEGwq for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 23:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B26814028B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26814028B
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B26814028B
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 23:05:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4ojHv3Xq63rWi4ojIv6q2o; Sat, 04 Oct 2025 00:58:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  4 Oct 2025 00:58:22 +0200
Message-ID: <20251003225823.3871690-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOWa6HJjUKMFSwDISPyvw1TsribDny5Q6s0LBCpNFAV9aqFeVV3kXJiTsygx/yaWtPzKbaSpdqC/5m+oyiRlxszSK+5i6ixdu0ZJPs+sJv/BgDfxiV8m
 /CDi6gAhWnywqkVH8YIRFFIcVl5J9tujYIfdxapkXo7jPpKMQgd0QeBFfRKUlzWjN8zQr3bNog6fy4zPeOh+d12cP0MFj5JyifRvaI4jEFOJ5B7p216/+/H8
 xW/8xUfqMFnNaGBXeH7PP7E9I+GdipnYuQ8XGL6ZbBE98UyM1h6bds7nm7dYPzLm1qI3/X3AuAJNlwtiEXF4eQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759532304; bh=GEs1f5HaZLFfSdyfOBJGGSdqCFXm4pnD3RHO7+iczjE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Sk6nwfgXtgm4eUeWuhNNk2EVo8o3w5mD8SOsfYMTzSMVnX5MxcC4RZAHw38LM15Cm
 YdzqtqRuoYmFHQ85QOUaAXQkg+jJrWNqTyPvtIiIJm3vaqfj7EenN1AMblmdlja5Nj
 bUz5gpqA9+MsLMMffxjz8C7XKuFX+5Pl+J4u6t3Fjrct4wAzMXBi0KiZTH2z+aGGjx
 aiWrGG1qtuZ5+klC8S3v/mxgjR5qjuINL8eUmlQ3gJa0SDDIRc0yU3LY+ZuqRH2LCm
 kazyU/rqDBxLV04mUhD3Ku7dJqZkUU8PZWkgYmL/ZH99hLOFdxLnFlZBunF3e+gSMH
 4FuS3WbNvp32g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Sk6nwfgX
Subject: [Buildroot] [PATCH 0/1] EFL bump to 1.28.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While bumping Harfbuzz to 12.0.0 and building all packages depending on it
EFL failed because gcc-15 now follows c++23 rules. So after trying to add
local patches to keep actual EFL version I ended up bumping it to latest.
I had to add not few patches anyway. Hope a 1.28.2 comes out. Harfbuzz build
needs some more fix on other packages so I send following patch for the moment.

Giulio

Giulio Benetti (1):
  package/efl: bump to version 1.28.1

 ...es-drm-meson.build-use-gl_deps-as-en.patch |  36 -
 ... 0001-ecore_fb-fix-build-with-tslib.patch} |   0
 ...es-drm-meson.build-fix-gl_drm-includ.patch |  37 -
 ...ec-move-to-Eina_Bool-from-bool-for-c.patch | 198 ++++
 .../0003-eldbus-silence-gcc-15-warnings.patch | 106 +++
 ...fl-all-gcc-15-break-older-c-std-code.patch | 857 ++++++++++++++++++
 ...5-ecore-file-silence-gcc-15-warnings.patch |  40 +
 ...5-break-adapt-to-new-keywords-in-c23.patch |  75 ++
 ...-gl-full-builds-after-gcc-15-changes.patch |  30 +
 ...5-breaks-builds-new-keyword-constexp.patch | 155 ++++
 package/efl/efl.hash                          |   4 +-
 package/efl/efl.mk                            |   6 +-
 12 files changed, 1466 insertions(+), 78 deletions(-)
 delete mode 100644 package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
 rename package/efl/{0003-ecore_fb-fix-build-with-tslib.patch => 0001-ecore_fb-fix-build-with-tslib.patch} (100%)
 delete mode 100644 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
 create mode 100644 package/efl/0002-evas-fix-etc-codec-move-to-Eina_Bool-from-bool-for-c.patch
 create mode 100644 package/efl/0003-eldbus-silence-gcc-15-warnings.patch
 create mode 100644 package/efl/0004-efl-all-gcc-15-break-older-c-std-code.patch
 create mode 100644 package/efl/0005-ecore-file-silence-gcc-15-warnings.patch
 create mode 100644 package/efl/0006-edje-edit-gcc15-break-adapt-to-new-keywords-in-c23.patch
 create mode 100644 package/efl/0007-evas-gl-fix-evas-gl-full-builds-after-gcc-15-changes.patch
 create mode 100644 package/efl/0008-emrbyo-new-gcc-15-breaks-builds-new-keyword-constexp.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
