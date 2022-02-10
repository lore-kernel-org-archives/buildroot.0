Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0513FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF7860A74;
	Thu, 10 Feb 2022 19:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jJuEv6mY6pE; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95B260B36;
	Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5531BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3908381990
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rde2cOny0-TG for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCF7B817A5
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521346;
 bh=p3BErJdj+XQGqfTF3qKPaqDS5JUgjL/4HCb1h56CQDY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ghRcK20BYMu4C4irOKRBmw2iYidDRaX5EZ0IGCyFCoiFxU8+Dr9wfSDhXkOq/yQtx
 Cu5rzq+H4pUop/4IV5RrS7mpoZF8PyVKDllEbs3cg8Q1k5c/cT1jSMUT/x15FwoORy
 +RmB/z0iHTe5qzC4N+ffoH9UAp9kbS/mfCZo0rP4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNJg-1nnVGl3v2g-00VN87; Thu, 10
 Feb 2022 20:29:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:52 +0100
Message-Id: <20220210192905.4500-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:B3U5NbT3WuW1WQZv3PQ5UB7ayLQx33Z2eGVOCCpkKopXJFJSNru
 LDa58bU37VygeD0guep1Sjl8pZV03Io7YfLOOT1WSyyHUB6wJSobSAmA89yrAGw06Vkd+N6
 b1aEHS2BFfoeO9ODHTgi+aii10RpgJgrwjASLE+Q7CVa8Dy+5fHAx0uXjlDCiIimC0q7UFT
 nFigzSO2rHVjHQpBkcW6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yWD76zvu0GM=:4P/NHzJSvb2jKwijBRDHC3
 nFz4W+6BWlEyBGVwoL1C0mCHBSVc4RFkpqn0hf87sFJ4DWEkT02VVjAg/upKfOdXgog20+pLJ
 sGgyqyzG0+Hth8/5nlBbdC0tDfJzP483yjDhrILHug6FhKjT0mzQo3ehJvmBADNnbgLmruTxG
 OTXdcW4H7XMyWm24upWgZjQ4AaJyNmaEQ7VHqWt2C7KYP/osGmMnWEAl7crn4g9/1TvmYlEeq
 a8I5XtIVIAypYR8dEb4aKN/IwF4I/psu370mYEWq981nQ2E7c7dQBSAnnlwT2vemWEKiQCCek
 GDHLJD4CNIlfSTQpoz+kmuD71IVSqjT2n4F+Q/c3hsZXdO5SJDe6SCh9HR77lsgUy4NaYDWQp
 aQ77xdUTwvCdHQAKIWEAZZcj4Gjo0nWIq6r2NpWPPayY4w7HiMo1zkjS8iKDqbyB7wqvyhP3V
 2IPz2oJ52+O0Rl3nkPee64QzMqE/EJiMFZug6OwWz7WPxC7hLAv07rawiuHk4AwsQNSdPViXA
 o9nAnqpJGecYmNiHjZq6OXtb7PAC6S2uM2PdjB1PWP/yDZbHGv/AtILE5FcpYC3CbEb/zAyIr
 eZdSA0vnNWQ+6s/PsjJ7+/F3csCNqO+gkZ064hHtNJS7JE+NVlmTkf9Q8kBFYDZg5uRoYRf2n
 fVvGlgKa8tdWppKc2ZGlFOeT/NXEo+grVR4LCBOt0xXVop7ScazEWCh9WMNGsvigVL/2VARRg
 XOjyuolC8VbRuA7FnCb7eZX32bAOcDHTfQk7omNB6YqCOlhwMtrMZ7fMHmQiKAjQ/9Vefv5zI
 rQJwQy3WjWVkQtRqIN5OD3WRyRS9uaLn3B98LjZjxL3Qx8W8mCbJlnkT6/AZOee7Tq3jnU6oe
 /S1Ox8Gz/EiOS4TRwcW1HexeslMD7PofQSRhDffL4PlrIKHCFk7UMqkmc1JZl7InGD2nbFn+Q
 8g7kW0Yc0NUDnDCcNYCNQK6g10YWmAqOn4s7jop6douXmnMARAa8hKJpYS0XEVuaeFqLJvCf4
 dS6rZOSsnGzLS5T8w7LQD/aXQWcvBUrbFYYdltbhXRSzDab5ISmiI3cvlhBhPNGkGIz6tIlfF
 F3/+uCXctJkB0I=
Subject: [Buildroot] [PATCH v2 00/13] package/gstreamer1/*: bump version to
 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-February/079534.html
[2] https://gstreamer.freedesktop.org/releases/1.20/

Changes v1 -> v2:

  - package/gst1-plugins-bad: bump version to 1.20.0:
    fix rebase/merge artefact in Config.in.legacy (Baruch Siach)

Peter Seiderer (13):
  package/gstreamer1: bump version to 1.20.0
  package/gst1-plugins-base: bump version to 1.20.0
  package/gst1-plugins-good: bump version to 1.20.0
  package/gst1-plugins-bad: bump version to 1.20.0
  package/gst1-plugins-ugly: bump version to 1.20.0
  package/gst1-devtools: bump version to 1.20.0
  package/gst1-libav: bump version to 1.20.0
  package/gst1-vaapi: bump version to 1.20.0
  package/gst1-rtsp-server: bump version to 1.20.0
  package/gstreamer1-editing-services: bump version to 1.20.0
  package/gst-omx: bump version to 1.20.0
  package/gst1-python: bump version to 1.20.0
  package/gst1-plugins-bayer2rgb-neon: fix plugin install

 Config.in.legacy                              |  8 ++++
 package/gstreamer1/gst-omx/gst-omx.hash       |  4 +-
 package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
 .../gst1-devtools/gst1-devtools.hash          |  4 +-
 .../gstreamer1/gst1-devtools/gst1-devtools.mk | 13 ++++--
 package/gstreamer1/gst1-libav/gst1-libav.hash |  6 +--
 package/gstreamer1/gst1-libav/gst1-libav.mk   |  4 +-
 ...n-Allow-building-against-neon-0-32-x.patch | 29 -------------
 package/gstreamer1/gst1-plugins-bad/Config.in | 31 +++++++++-----
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      | 36 ++++++++++++----
 .../gst1-plugins-base/gst1-plugins-base.hash  |  6 +--
 .../gst1-plugins-base/gst1-plugins-base.mk    |  5 ++-
 .../gst1-plugins-bayer2rgb-neon.mk            |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  3 +-
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 ...-rtsp-server-meson.build-add-gst_dep.patch | 41 -------------------
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  8 ++--
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
 .../gstreamer1-editing-services.hash          |  4 +-
 .../gstreamer1-editing-services.mk            |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |  6 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  5 +--
 29 files changed, 112 insertions(+), 139 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
 delete mode 100644 package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
