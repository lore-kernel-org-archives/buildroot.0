Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D9AC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09AEE406B9;
	Thu, 15 Aug 2024 12:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x88iqpacufwC; Thu, 15 Aug 2024 12:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB94404E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB94404E9;
	Thu, 15 Aug 2024 12:51:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2231BF97F
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A1B4044B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R19m3TVBfJkI for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E8EC4026E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8EC4026E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:51:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CC6A856F1; Thu, 15 Aug 2024 12:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f31fea6d038c3390ab480e4c27837b8c720597b
X-Git-Newrev: b866afa68405564497dd60c1f8f33cdf71d22728
X-Patchwork-Hint: ignore
Message-Id: <20240815125108.5CC6A856F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: fix CVE-2024-39936
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b866afa68405564497dd60c1f8f33cdf71d22728
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://security-tracker.debian.org/tracker/CVE-2024-39936

Got patch from:
https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/0001-fix-CVE-2024-39936.patch | 247 ++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                    |   3 +
 2 files changed, 250 insertions(+)

diff --git a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
new file mode 100644
index 0000000000..a6778ce107
--- /dev/null
+++ b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
@@ -0,0 +1,247 @@
+From fc1b8814f38c7d925d4590e9bdb16a02ca824025 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Tue, 25 Jun 2024 17:09:35 +0200
+Subject: [PATCH] HTTP2: Delay any communication until encrypted() can be
+ responded to
+
+We have the encrypted() signal that lets users do extra checks on the
+established connection. It is emitted as BlockingQueued, so the HTTP
+thread stalls until it is done emitting. Users can potentially call
+abort() on the QNetworkReply at that point, which is passed as a Queued
+call back to the HTTP thread. That means that any currently queued
+signal emission will be processed before the abort() call is processed.
+
+In the case of HTTP2 it is a little special since it is multiplexed and
+the code is built to start requests as they are available. This means
+that, while the code worked fine for HTTP1, since one connection only
+has one request, it is not working for HTTP2, since we try to send more
+requests in-between the encrypted() signal and the abort() call.
+
+This patch changes the code to delay any communication until the
+encrypted() signal has been emitted and processed, for HTTP2 only.
+It's done by adding a few booleans, both to know that we have to return
+early and so we can keep track of what events arose and what we need to
+resume once enough time has passed that any abort() call must have been
+processed.
+
+Fixes: QTBUG-126610
+Pick-to: 6.5 6.2 5.15 5.12
+Change-Id: Ic25a600c278203256e35f541026f34a8783235ae
+Reviewed-by: Marc Mutz <marc.mutz@qt.io>
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+(cherry picked from commit b1e75376cc3adfc7da5502a277dfe9711f3e0536)
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+(cherry picked from commit 0fb43e4395da34d561814242a0186999e4956e28)
+
+Upstream: https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58
+Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+---
+ src/network/access/qhttp2protocolhandler.cpp  |  6 +--
+ .../access/qhttpnetworkconnectionchannel.cpp  | 48 ++++++++++++++++++-
+ .../access/qhttpnetworkconnectionchannel_p.h  |  6 +++
+ tests/auto/network/access/http2/tst_http2.cpp | 44 +++++++++++++++++
+ 4 files changed, 99 insertions(+), 5 deletions(-)
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
+diff --git a/tests/auto/network/access/http2/tst_http2.cpp b/tests/auto/network/access/http2/tst_http2.cpp
+index 00efbc9832..c02e7b7b5b 100644
+--- a/tests/auto/network/access/http2/tst_http2.cpp
++++ b/tests/auto/network/access/http2/tst_http2.cpp
+@@ -106,6 +106,8 @@ private slots:
+ 
+     void duplicateRequestsWithAborts();
+ 
++    void abortOnEncrypted();
++
+ protected slots:
+     // Slots to listen to our in-process server:
+     void serverStarted(quint16 port);
+@@ -1479,6 +1481,48 @@ void tst_Http2::duplicateRequestsWithAborts()
+     QCOMPARE(finishedCount, ExpectedSuccessfulRequests);
+ }
+ 
++void tst_Http2::abortOnEncrypted()
++{
++#if !QT_CONFIG(ssl)
++    QSKIP("TLS support is needed for this test");
++#else
++    clearHTTP2State();
++    serverPort = 0;
++
++    ServerPtr targetServer(newServer(defaultServerSettings, H2Type::h2Direct));
++
++    QMetaObject::invokeMethod(targetServer.data(), "startServer", Qt::QueuedConnection);
++    runEventLoop();
++
++    nRequests = 1;
++    nSentRequests = 0;
++
++    const auto url = requestUrl(H2Type::h2Direct);
++    QNetworkRequest request(url);
++    request.setAttribute(QNetworkRequest::Http2DirectAttribute, true);
++
++    std::unique_ptr<QNetworkReply> reply{manager->get(request)};
++    reply->ignoreSslErrors();
++    connect(reply.get(), &QNetworkReply::encrypted, reply.get(), [reply = reply.get()](){
++        reply->abort();
++    });
++    connect(reply.get(), &QNetworkReply::errorOccurred, this, &tst_Http2::replyFinishedWithError);
++
++    runEventLoop();
++    STOP_ON_FAILURE
++
++    QCOMPARE(nRequests, 0);
++    QCOMPARE(reply->error(), QNetworkReply::OperationCanceledError);
++
++    const bool res = QTest::qWaitFor(
++            [this, server = targetServer.get()]() {
++                return serverGotSettingsACK || prefaceOK || nSentRequests > 0;
++            },
++            500);
++    QVERIFY(!res);
++#endif // QT_CONFIG(ssl)
++}
++
+ void tst_Http2::serverStarted(quint16 port)
+ {
+     serverPort = port;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5ab61ba3e0..4c0392f92d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -10,6 +10,9 @@ QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
 
+# 0001-fix-CVE-2024-39936.patch
+QT6BASE_IGNORE_CVES += CVE-2024-39936
+
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
