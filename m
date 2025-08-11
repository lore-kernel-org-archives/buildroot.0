Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E11CA0EC7
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 09:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376F583673;
	Mon, 11 Aug 2025 09:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2RAibISyN37; Mon, 11 Aug 2025 09:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159F583D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159F583D97;
	Mon, 11 Aug 2025 09:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D0841C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DD4B41213
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVC05bDez3NU for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A4F4121A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73A4F4121A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 636488738F; Mon, 11 Aug 2025 09:27:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 11:25:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8a2cb8d4124a1b11302f681f2fff844d7082b73
X-Git-Newrev: 0d09bd49e8a2e20ff59c9e61bb7ff7bb34ab9f36
X-Patchwork-Hint: ignore
Message-Id: <20250811092755.636488738F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ufs-utils: fix hash file
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2573753370547621004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2573753370547621004==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0d09bd49e8a2e20ff59c9e61bb7ff7bb34ab9f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following error:

wget -nd -t 3 --connect-timeout=10 -O '/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.68J1WJ/output' 'https://github.com/SanDisk-Open-Source/ufs-utils/archive/v7.14.12/ufs-utils-7.14.12.tar.gz'
--2025-08-07 11:07:32--  https://github.com/SanDisk-Open-Source/ufs-utils/archive/v7.14.12/ufs-utils-7.14.12.tar.gz
Resolving github.com (github.com)... 140.82.121.4
Connecting to github.com (github.com)|140.82.121.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/SanDisk-Open-Source/ufs-utils/tar.gz/refs/tags/v7.14.12 [following]
--2025-08-07 11:07:32--  https://codeload.github.com/SanDisk-Open-Source/ufs-utils/tar.gz/refs/tags/v7.14.12
Resolving codeload.github.com (codeload.github.com)... 140.82.121.10
Connecting to codeload.github.com (codeload.github.com)|140.82.121.10|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ‘/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.68J1WJ/output’

/home/dario/projects/buildroot/output/b     [ <=>                                                                                ]  77.76K  --.-KB/s    in 0.06s

2025-08-07 11:07:32 (1.32 MB/s) - ‘/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.68J1WJ/output’ saved [79623]

ERROR: while checking hashes from package/ufs-utils/ufs-utils.hash
ERROR: ufs-utils-7.14.12.tar.gz has wrong sha256 hash:
ERROR: expected: 96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2
ERROR: got     : 96d15ce4b0990049d812d24afc2a62240c1a4aa534ea6aebb5aebd34dccb2dac
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
wget -nd -t 3 --connect-timeout=10 -O '/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.HYpqKm/output' 'https://sources.buildroot.net/ufs-utils/ufs-utils-7.14.12.tar.gz'
--2025-08-07 11:07:32--  https://sources.buildroot.net/ufs-utils/ufs-utils-7.14.12.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 2606:4700:20::681a:25, 2606:4700:20::ac43:4838, 2606:4700:20::681a:125, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::681a:25|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 79619 (78K) [application/x-gtar-compressed]
Saving to: ‘/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.HYpqKm/output’

/home/dario/projects/buildroot/output/b 100%[===================================================================================>]  77.75K  --.-KB/s    in 0.02s

2025-08-07 11:07:33 (4.96 MB/s) - ‘/home/dario/projects/buildroot/output/build/.ufs-utils-7.14.12.tar.gz.HYpqKm/output’ saved [79619/79619]

ufs-utils-7.14.12.tar.gz: OK (sha256: 96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2)

Looking at:

https://sources.buildroot.net/ufs-utils/ufs-utils-7.14.12.tar.gz

with hash:

sha256  96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2 ufs-utils-7.14.12.tar.gz

and:

https://github.com/SanDisk-Open-Source/ufs-utils/archive/v7.14.12/ufs-utils-7.14.12.tar.gz

with hash:

sha256  96d15ce4b0990049d812d24afc2a62240c1a4aa534ea6aebb5aebd34dccb2dac ufs-utils-7.14.12.tar.gz

and running diffoscope utility on those two archives, it points to the upstream commit:

https://github.com/SanDisk-Open-Source/ufs-utils/commit/989dcd297223d6896c5892532d14984326fa093d

The file dates are also different inside the tar file.

On Julien’s suggestion, I opened a ticket [1] to highlight the issue and
inform the ufs-utils maintainers about the problem.

[1] https://github.com/SanDisk-Open-Source/ufs-utils/issues/76

Fixes:
https://autobuild.buildroot.org/results/b69/b69472d2eaf27dfcc97c300b96868cab52068ce9
https://autobuild.buildroot.org/results/429/429a28669d98c6f424f33a211eb0ebb48c6f4553
https://autobuild.buildroot.org/results/01b/01b90bd7d78a34ae732191b750efc69f195c78ec
https://autobuild.buildroot.org/results/a09/a097e48314be2f522238880e9ab4529cebeff47b

Co-Developed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index 89053996ab..e322759502 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2  ufs-utils-7.14.12.tar.gz
+sha256  96d15ce4b0990049d812d24afc2a62240c1a4aa534ea6aebb5aebd34dccb2dac  ufs-utils-7.14.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING

--===============2573753370547621004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2573753370547621004==--
