Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83554C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23CE8401DF;
	Wed, 16 Mar 2022 21:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDPAv_L4DksK; Wed, 16 Mar 2022 21:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A7640179;
	Wed, 16 Mar 2022 21:37:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 086741BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04CF260AD6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8vqeoKwuoug for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B9F260BED
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466575;
 bh=tsjDD7hFVSUb5c6+fkOXiEiTH1/dpq6sd2WfRhH3c8w=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=HiNKI3U3a6wKft4VBysTRAs/mIeQ1L99cNMYyajVZmRfaFJ+Vyq40MGsayXegHeSG
 SvT+TEd7tQyLtXY/GqOi7Gdjj6SBCIYn+faGaDuIxGmjYqUZPv9Etlv9PItetyifVz
 +rFPkpE1z3NsUG8BAP7hVvxXysx8+oVz4lH/LR+A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MkHMZ-1nxdg60OU5-00kbqF for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:02 +0100
Message-Id: <20220316213614.16878-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:VyaZnaTgsatWP8pIY+zgRZaA6G/YCtrGiqvjbhqaPA9klAelhlC
 zyllcnY42YP2zUCrxQ+1WMV9XaMl6A+IEjsHX2W4J1wmZwGM373Cs9Y+eVlaKRQd2AFlNpD
 kqYGvaWROL/OZNOoZQ+vZOigQ31ojOOAXdFbgJEo62meQv5XhMQIa/w/Q02AW/ZVgvkqHu8
 Gg9vp5o9epkOuMbYxqWEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KnObkEfPFMs=:tqmu+Dr1vCgBe8IeWfBqvr
 oETXTJDQjPUKVhVptjTUIR/6uyhmTCuPy0b5fR00TMeUC6XFK8AdGiLF56Ee1Iaa359csbrpT
 b/bIk7fwhfkGPjUyxEH85y6+gwS8wGasnT0cqdBM+Cwrb/oIbBuzAVFO82N89TnL/D3VJFI8C
 7+i7iHnfDQvuS4JZiVw+1Y5FWeeGQMDCY6CrC9Itrv4HYjDKSUuKEBXuikIMKbzVWP3k/ZhHs
 F6Qqa95LWl4nTpgppW0FB1fyYSRb+dctymPNZGSBiHNSpm1yr6zF//B9lntXhISgo1RfRp//P
 o7SE1y2NnQcSYUxqLgiA4BrMeDU5ySGaAu2Eg3xrMt9AVcc4PyaxK94BhCNlbx/LzFtvkv4fk
 IAFI54s/YYwj1HkOyazRCBsuDccgkj1EEsVT/Zmzdy+beTtb5vVu/TT6Pf+3l4PpArtnJ/qXd
 49mR2qWBPbttQX3aLa31/faDePOMb+O/B+szuNHciLZprtakgPj3MOxYjovhFVRXOe7XSJFc7
 B49fKzxyw2VbmGXf3GeDIJTpL39f/eVX9AMvUZdFTlvt8mKnllxrK7aIrhXFnCos8je1EluRK
 pvXol9i6+et+Ze/utl4HQYuIq2+Hc6fRn7Tk9Ww1QgaxOROiJ6ZjHDhbz9TCv5te8MKgkmc+E
 pp98DNMfBgfJi6GmCYItA4EXqOeYwn0fl0h4PqOIo7LuaHfrLkUu+K/yi5bdfB8+lUwhr8Nsx
 kWDndcfcYixnlH83Nwop0ZD0slB7c4NZnEUTaZ2h2/pO78MuhI21a6YdY24JCwzCFIzbqN1Mm
 NQYoZ9+IXXMzYEvueYJZDlismJMux71LxGefUl4Zg8XFOqNsdr0zhx8hiAaZb/jb7pK8l1qf/
 dK0tC+JJFz57xDojooSWgSRRBb9pLMCGwdSxCTTLZ6cL3FVdKBZ1lDnK6Vg3NgHWcrdDDnkhu
 X9k0u4x/enSn3/utpqfYReYoBSwgQB7qK6RGzfqno7wkgkEHVFypmu60fXcH8SZXnkmLO4VHc
 rGcu30CezEFnrbLS/otHL0Nzfq7F7342JR5ku9D2qcVVMheCbHYv43Apk1BNN5pMOnksY/Jlt
 qnrEg/hUx0FJfE=
Subject: [Buildroot] [PATCH v1 00/12] package/gstreamer1/*: bump version to
 1.20.1
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

[1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-March/079724.html
[2] https://gstreamer.freedesktop.org/releases/1.20/#1.20.1

Peter Seiderer (12):
  package/gstreamer1: bump version to 1.20.1
  package/gst1-plugins-base: bump version to 1.20.1
  package/gst1-plugins-good: bump version to 1.20.1
  package/gst1-plugins-bad: bump version to 1.20.1
  package/gst1-plugins-ugly: bump version to 1.20.1
  package/gst1-devtools: bump version to 1.20.1
  package/gst1-libav: bump version to 1.20.1
  package/gst1-vaapi: bump version to 1.20.1
  package/gst1-rtsp-server: bump version to 1.20.1
  package/gstreamer1-editing-services: bump version to 1.20.1
  package/gst-omx: bump version to 1.20.1
  package/gst1-python: bump version to 1.20.1

 package/gstreamer1/gst-omx/gst-omx.hash                       | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk                         | 2 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.hash           | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk             | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash                 | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk                   | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash     | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk       | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk     | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk     | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash   | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk     | 2 +-
 package/gstreamer1/gst1-python/gst1-python.hash               | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk                 | 2 +-
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash     | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk       | 2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash                 | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk                   | 2 +-
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash                 | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk                   | 2 +-
 24 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
