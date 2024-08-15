Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC44C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 06:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390E8400B5;
	Thu, 15 Aug 2024 06:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCsyh5QQRXPI; Thu, 15 Aug 2024 06:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95384400E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95384400E2;
	Thu, 15 Aug 2024 06:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70FDE1BF82C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 06:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C1C81E5E
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 06:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAZxMpA8zp9d for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 06:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFC2181E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC2181E5D
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFC2181E5D
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 06:28:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53310adb4c3so159602e87.3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 23:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723703331; x=1724308131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ryqXQsrxGRFdUsyGpWPS64dh5R8jPS/j/v9hPmTbA30=;
 b=BCf3HDvr+YD3XrBysrZRq9fegix91sIjVcggXzyBxLQE0Kk4I8IoULfWOmQTOwq0wN
 3QuFsbLIBym6HrBlZkmvYWS7haoQLqZMx/m501QpgulM0YNkeNJ/S1Sr3jOkADa4d7YS
 8+qtTSGTOeovPdGVNYeDuQx0Rv0Ba/yhkCYeuOP8EuthQuJ1fFlWd1SEpeGnjLrg8XpA
 dJxY/c1jMMYH8mHQI2TNwg9Y9/H+TBVFOoEePYvK9+9AwtrMA8UOuqJpnps+vtIY40C0
 2ZRIlhUY2cqsuaQsrDCEe7+cXP8vGSx3hKF7vVQtO2Ar4Y7rIY3KzVQKGjVAkzcP5vMp
 yghw==
X-Gm-Message-State: AOJu0YxCVRJExN6/YB67LqwmkEYiQEj9r9Wt6YSbwsqxUb4VdOYKV3Pd
 I3vWAYA0zxD5YDlLWgve+FEnIpPvwnbXn5B3DfsuR3LQCSGzRTC90GZdEA==
X-Google-Smtp-Source: AGHT+IHVO9jahIq4p/pJuktfWrRiIrh9NhM3jcqXiP9XawA5jnQmH9AO1lhMy7yHa3XDYXgCfl0S9g==
X-Received: by 2002:ac2:5691:0:b0:533:901:e456 with SMTP id
 2adb3069b0e04-5330901ebf8mr1013378e87.1.1723703330740; 
 Wed, 14 Aug 2024 23:28:50 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d424f37sm101126e87.282.2024.08.14.23.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 23:28:50 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 08:28:39 +0200
Message-ID: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723703331; x=1724308131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ryqXQsrxGRFdUsyGpWPS64dh5R8jPS/j/v9hPmTbA30=;
 b=ZeAjQ/TgLtor0z/3OZdNna2zSQdUoM4eWwjX2Jd3/yD4F4a0InrPxOrlJ7q7Q0HICB
 OxIfPFgABFjsPxO+FBrkNQvKQxSNEBepNesulF13gM9x22zS8Y+F/PfXvYxkQU/rxLFE
 yxG51doPf6qFciLb74HWjgV8pvMcJ674L0n2AotODw5UPe8CVsBIVHrnOwVqWKo/1//0
 8TKikH8/4JGjejXB/H7XzA+LScG4U88FGJXe4qt/W3qiTpNYXSmz74eV++vu716xwDXG
 gHjhd+g2TYZeB4oKJgs2EH50qPpgFZM6an208TdNUxDque0sDvWOu0hWz6GPqBP92CWp
 d1CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZeAjQ/Tg
Subject: [Buildroot] [PATCH 1/1] package/qt6base: fix CVE-2024-39936
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://security-tracker.debian.org/tracker/CVE-2024-39936

Got patch from:
https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Backport to: 2024.02.x, 2024.05.x, 2024.08.x

 .../qt6/qt6base/0001-fix-CVE-2024-39936.patch | 155 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                |   2 +
 2 files changed, 157 insertions(+)
 create mode 100644 package/qt6/qt6base/0001-fix-CVE-2024-39936.patch

diff --git a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
new file mode 100644
index 0000000000..1d11eb9fd9
--- /dev/null
+++ b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
@@ -0,0 +1,155 @@
+From 627617b002a34a9a0a63bcd9529c655e93d6246e Mon Sep 17 00:00:00 2001
+From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+Date: Thu, 15 Aug 2024 07:32:13 +0200
+Subject: [PATCH] fix CVE-2024-39936
+
+Upstream: https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch
+
+Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+---
+ src/network/access/qhttp2protocolhandler.cpp  |  6 +--
+ .../access/qhttpnetworkconnectionchannel.cpp  | 48 ++++++++++++++++++-
+ .../access/qhttpnetworkconnectionchannel_p.h  |  6 +++
+ 3 files changed, 55 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/access/qhttp2protocolhandler.cpp b/src/network/access/qhttp2protocolhandler.cpp
+index 0abd99b9bc..3631b13dc8 100644
+--- a/src/network/access/qhttp2protocolhandler.cpp
++++ b/src/network/access/qhttp2protocolhandler.cpp
+@@ -303,12 +303,12 @@ bool QHttp2ProtocolHandler::sendRequest()
+         }
+     }
+ 
+-    if (!prefaceSent && !sendClientPreface())
+-        return false;
+-
+     if (!requests.size())
+         return true;
+ 
++    if (!prefaceSent && !sendClientPreface())
++        return false;
++
+     m_channel->state = QHttpNetworkConnectionChannel::WritingState;
+     // Check what was promised/pushed, maybe we do not have to send a request
+     // and have a response already?
+diff --git a/src/network/access/qhttpnetworkconnectionchannel.cpp b/src/network/access/qhttpnetworkconnectionchannel.cpp
+index 6766989690..1e4161d1fd 100644
+--- a/src/network/access/qhttpnetworkconnectionchannel.cpp
++++ b/src/network/access/qhttpnetworkconnectionchannel.cpp
+@@ -209,6 +209,10 @@ void QHttpNetworkConnectionChannel::abort()
+ bool QHttpNetworkConnectionChannel::sendRequest()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeSendRequest = true;
++        return false; // this return value is unused
++    }
+     return protocolHandler->sendRequest();
+ }
+ 
+@@ -221,21 +225,28 @@ bool QHttpNetworkConnectionChannel::sendRequest()
+ void QHttpNetworkConnectionChannel::sendRequestDelayed()
+ {
+     QMetaObject::invokeMethod(this, [this] {
+-        Q_ASSERT(protocolHandler);
+         if (reply)
+-            protocolHandler->sendRequest();
++            sendRequest();
+     }, Qt::ConnectionType::QueuedConnection);
+ }
+ 
+ void QHttpNetworkConnectionChannel::_q_receiveReply()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeReceiveReply = true;
++        return;
++    }
+     protocolHandler->_q_receiveReply();
+ }
+ 
+ void QHttpNetworkConnectionChannel::_q_readyRead()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeReadyRead = true;
++        return;
++    }
+     protocolHandler->_q_readyRead();
+ }
+ 
+@@ -1239,7 +1250,18 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
+         if (!h2RequestsToSend.isEmpty()) {
+             // Similar to HTTP/1.1 counterpart below:
+             const auto &pair = std::as_const(h2RequestsToSend).first();
++            waitingForPotentialAbort = true;
+             emit pair.second->encrypted();
++
++            // We don't send or handle any received data until any effects from
++            // emitting encrypted() have been processed. This is necessary
++            // because the user may have called abort(). We may also abort the
++            // whole connection if the request has been aborted and there is
++            // no more requests to send.
++            QMetaObject::invokeMethod(this,
++                                      &QHttpNetworkConnectionChannel::checkAndResumeCommunication,
++                                      Qt::QueuedConnection);
++
+             // In case our peer has sent us its settings (window size, max concurrent streams etc.)
+             // let's give _q_receiveReply a chance to read them first ('invokeMethod', QueuedConnection).
+         }
+@@ -1257,6 +1279,28 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
+     QMetaObject::invokeMethod(connection, "_q_startNextRequest", Qt::QueuedConnection);
+ }
+ 
++
++void QHttpNetworkConnectionChannel::checkAndResumeCommunication()
++{
++    Q_ASSERT(connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2
++             || connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2Direct);
++
++    // Because HTTP/2 requires that we send a SETTINGS frame as the first thing we do, and respond
++    // to a SETTINGS frame with an ACK, we need to delay any handling until we can ensure that any
++    // effects from emitting encrypted() have been processed.
++    // This function is called after encrypted() was emitted, so check for changes.
++
++    if (!reply && h2RequestsToSend.isEmpty())
++        abort();
++    waitingForPotentialAbort = false;
++    if (needInvokeReadyRead)
++        _q_readyRead();
++    if (needInvokeReceiveReply)
++        _q_receiveReply();
++    if (needInvokeSendRequest)
++        sendRequest();
++}
++
+ void QHttpNetworkConnectionChannel::requeueHttp2Requests()
+ {
+     const auto h2RequestsToSendCopy = std::exchange(h2RequestsToSend, {});
+diff --git a/src/network/access/qhttpnetworkconnectionchannel_p.h b/src/network/access/qhttpnetworkconnectionchannel_p.h
+index c42290feca..061f20fd42 100644
+--- a/src/network/access/qhttpnetworkconnectionchannel_p.h
++++ b/src/network/access/qhttpnetworkconnectionchannel_p.h
+@@ -74,6 +74,10 @@ public:
+     QAbstractSocket *socket;
+     bool ssl;
+     bool isInitialized;
++    bool waitingForPotentialAbort = false;
++    bool needInvokeReceiveReply = false;
++    bool needInvokeReadyRead = false;
++    bool needInvokeSendRequest = false;
+     ChannelState state;
+     QHttpNetworkRequest request; // current request, only used for HTTP
+     QHttpNetworkReply *reply; // current reply for this request, only used for HTTP
+@@ -146,6 +150,8 @@ public:
+     void closeAndResendCurrentRequest();
+     void resendCurrentRequest();
+ 
++    void checkAndResumeCommunication();
++
+     bool isSocketBusy() const;
+     bool isSocketWriting() const;
+     bool isSocketWaiting() const;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5ab61ba3e0..71dff3e672 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -10,6 +10,8 @@ QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
 
+QT6BASE_IGNORE_CVES += CVE-2024-39936
+
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
