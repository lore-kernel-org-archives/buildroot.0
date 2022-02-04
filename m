Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A41C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34B160E5E;
	Fri,  4 Feb 2022 15:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYPUgW_XOK76; Fri,  4 Feb 2022 15:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA0F60E4D;
	Fri,  4 Feb 2022 15:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 054A61C1162
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022D44177B
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzXHBofkmRwh for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 649F441773
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989592;
 bh=brkKux7O2cgHKqwMYD8lmD52/560HLlx4HOGM+aisX0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=EFxZXo33k0vSqa2fqSOTxm5aHM3Jt2ENavFN4v34se+r+hroGYnkOycxvwZJvzDdr
 KVxKqFscf+tX+VyikxENRUviF1KnNGni++H3EqjzzRP4rib0OAQiOa7ms1vb8Dwjke
 jrcMJVY98XSYlSi/ssmx8rnFxy8bnhAenwp6gI8E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6lpG-1n8sBK18ne-008Fgb for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:19 +0100
Message-Id: <20220204154631.17814-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:bsF49ZWMsuLAh17fLhgxbanxP3I5PsV+n8oMNffl+BZUmwm2qhn
 FcRzPSTkBb5mmAJUdWMclX6asR2bo0hrEnL82J7vvA74r1Ozu6FA1tJ3F8AhR+esz3OZ/gT
 lVYRVKl+TdKkltWmRi7+oXsMIG3+cN45v6akt39iWwN3tEdeb5iyc3/xcQEN+oIasHBL/x5
 UFmIVAT0BAvH7rhJHiE5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iIVkxGl+tRM=:E7HvhUB2u9MW7kkYWMVi44
 GB1o+SM6cOSO2V6PV6zHU5drzQYOiOLbcBe8TaaIaNc5cFSzEow/DCvkXGonROjhHRIfVmcMR
 nwWsksu5mRrfcOrO7W+UsvIlWUqsWPvMf3OBHeTb1GbBVIuUPF4/1+WLFW4UFdYYt88kgSjZE
 WlrJQiPQALSDx3ZniGMJCDaS8+GRHAbE86XVHtFTRmoUXGz34k8UaOo7ZqnxTCPzBXHkol48m
 CgdPxFEEyNPAbdF8Kr0PAo9fffiWtVuNbe9Va6qlxsXkzNreh9CnBtv6pNEGFSXQhvrWTFkAa
 wHpH9vBm+uYj6W0RvMjIqU/zyicvipXVDi3seEHjfcQOWrCU8XTBC/VhkW0SnpFNVTmbjXyvq
 iVPwEf6qIwggMrIKkiOBq92NHZd7ZIWKm8HdUtRrfm/MEAxAk0YLyaooLYzhSXd2ZFZ0dxTHU
 D1YQe1oTRSXPJaK9buSV/rstbB5FauaxsrSS8Hx3rfuVbqMid+kEhs7tA1jZ/oyr0/NnuCFXk
 m+TfBgjg9uiwFMoYCd8kmKLWYnbIu5LQshmCZwWmX7eEcU1WIN0EFtona5HCIPvQYkZHkD2oq
 IyYtDsgr+gic/L6RSmCaJEeec+kzNUQ1epHlFPPnidebyqOEAaNvgqf+nkc/XY/baKmGUTL+3
 fpoYdB7MLBzTUtm5NDUssMDIir217LDM2GGEYRDhWh8cFDuer19QN1rOZKGxGsaPGUiBBVEH9
 TrLFa96yEj93kMD31lwi9GLmaYt+lvKX1dDlu4EL1rbWWUQq4U+U/vm2uVGB8KxOnR5b2I9LO
 7ZyEYMpXVnhwr9IdqzpnTvEnXaPw+59zJn3bUD0vNXCebbMeqOdAnWYdFnUcRyamBCFJR9BJW
 1zKBUv7i7LbHwVS7mInWu+qFoAIOOLuE7O6TS4lfFrQaQny82FHIuhzH7HAMn/hqbs2wpvy0d
 46ewbE4anAurquYB0cto0RQyGtuvBcT6QAZ+Yfyp1yaDnLhEPxUWPc8EXq3sptvQpiZYk7hTc
 nqTckXdaQxg/E86to1S+1jyxek5DjTPZzOERkD5KtU9ERGthSU9OUTQ6stuFq2KBGtVDmtxzT
 sNKk8v5JvAp7XY=
Subject: [Buildroot] [PATCH v1 00/12] package/gstreamer1/*: bump version to
 1.18.6
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

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-February/079533.html
[2] https://gstreamer.freedesktop.org/releases/1.18/#1.18.6

Peter Seiderer (12):
  package/gstreamer1: bump version to 1.18.6
  package/gst1-plugins-base: bump version to 1.18.6
  package/gst1-plugins-good: bump version to 1.18.6
  package/gst1-plugins-bad: bump version to 1.18.6
  package/gst1-plugins-ugly: bump version to 1.18.6
  package/gst1-devtools: bump version to 1.18.6
  package/gst1-libav: bump version to 1.18.6
  package/gst1-vaapi: bump version to 1.18.6
  package/gst1-rtsp-server: bump version to 1.18.6
  package/gstreamer1-editing-services: bump version to 1.18.6
  package/gst-omx: bump version to 1.18.6
  package/gst1-python: bump version to 1.18.6

 package/gstreamer1/gst-omx/gst-omx.hash       |  4 +-
 package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
 .../gst1-devtools/gst1-devtools.hash          |  4 +-
 .../gstreamer1/gst1-devtools/gst1-devtools.mk |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk   |  2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  2 +-
 ...eo-gstvideoaggregator.c-fix-build-wi.patch | 45 -------------------
 .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
 .../gstreamer1-editing-services.hash          |  4 +-
 .../gstreamer1-editing-services.mk            |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |  4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  2 +-
 25 files changed, 36 insertions(+), 81 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
