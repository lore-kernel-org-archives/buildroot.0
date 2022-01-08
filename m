Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA19C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0914E400AF;
	Sat,  8 Jan 2022 22:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4z1bdcEjmng; Sat,  8 Jan 2022 22:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE9140185;
	Sat,  8 Jan 2022 22:47:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2CB1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6301E40185
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wdhjo2HiLqwc for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A97400AF
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84A4D807EA; Sat,  8 Jan 2022 22:41:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:42:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fd3770cc64679d5ff541fdaa5d0fdb2f9d16111
X-Git-Newrev: 65b351fc9b7d70c96a0efc96182685899c5b9111
X-Patchwork-Hint: ignore
Message-Id: <20220108224114.84A4D807EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: bump to version
 0.11.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65b351fc9b7d70c96a0efc96182685899c5b9111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add upstream status (rejected) to first and second patches
- Drop third patch (already in version)

https://github.com/meetecho/janus-gateway/blob/v0.11.6/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/0001-disable-ssp.patch       |   2 +
 ...002-Add-test-for-Wunused-but-set-variable.patch |   2 +
 ...ross-site-Scripting-XSS-exploits-in-demos.patch | 357 ---------------------
 ...tch => 0003-Fixed-missing-XSS-mitigation.patch} |   0
 package/janus-gateway/janus-gateway.hash           |   2 +-
 package/janus-gateway/janus-gateway.mk             |   7 +-
 6 files changed, 7 insertions(+), 363 deletions(-)

diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index 22f7f1a417..0c9b006ed9 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -12,6 +12,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Upstream status: rejected
+(https://github.com/meetecho/janus-gateway/pull/1801)]
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index b54c8cbec6..2dfcc76d68 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -18,6 +18,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Upstream status: rejected
+(https://github.com/meetecho/janus-gateway/pull/1789)]
 ---
  Makefile.am                 |  1 +
  configure.ac                |  6 ++-
diff --git a/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch b/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
deleted file mode 100644
index 9f3adfcc8e..0000000000
--- a/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
+++ /dev/null
@@ -1,357 +0,0 @@
-From ba166e9adebfe5343f826c6a9e02299d35414ffd Mon Sep 17 00:00:00 2001
-From: Lorenzo Miniero <lminiero@gmail.com>
-Date: Thu, 25 Nov 2021 17:20:53 +0100
-Subject: [PATCH] Fix potential Cross-site Scripting (XSS) exploits in demos
- (#2817)
-
-[Retrieved (and backported) from:
-https://github.com/meetecho/janus-gateway/commit/ba166e9adebfe5343f826c6a9e02299d35414ffd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- html/audiobridgetest.js   | 17 +++++++++++++----
- html/recordplaytest.js    | 13 +++++++++++--
- html/screensharingtest.js | 11 ++++++++++-
- html/streamingtest.js     | 13 +++++++++++--
- html/textroomtest.js      | 23 ++++++++++++++---------
- html/videocalltest.js     | 15 ++++++++++++---
- html/videoroomtest.js     | 13 +++++++++++--
- html/vp9svctest.js        | 13 +++++++++++--
- 8 files changed, 93 insertions(+), 25 deletions(-)
-
-diff --git a/html/audiobridgetest.js b/html/audiobridgetest.js
-index 18e1cc1839..f757789708 100644
---- a/html/audiobridgetest.js
-+++ b/html/audiobridgetest.js
-@@ -178,7 +178,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -222,7 +222,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -267,7 +267,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -429,7 +429,7 @@ function registerUsername() {
- 			return;
- 		}
- 		var register = { request: "join", room: myroom, display: username };
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		mixertest.send({ message: register});
- 	}
- }
-@@ -448,3 +448,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/recordplaytest.js b/html/recordplaytest.js
-index 74ee7bed95..52b5ccbc4c 100644
---- a/html/recordplaytest.js
-+++ b/html/recordplaytest.js
-@@ -423,11 +423,11 @@ function updateRecsList() {
- 			Janus.debug("Got a list of available recordings:", list);
- 			for(var mp in list) {
- 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["name"] + " (" + list[mp]["date"] + ")");
--				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["name"] + " [" + list[mp]["date"] + "]" + "</a></li>");
-+				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["name"]) + " [" + list[mp]["date"] + "]" + "</a></li>");
- 			}
- 			$('#recslist a').unbind('click').click(function() {
- 				selectedRecording = $(this).attr("id");
--				selectedRecordingInfo = $(this).text();
-+				selectedRecordingInfo = escapeXmlTags($(this).text());
- 				$('#recset').html($(this).html()).parent().removeClass('open');
- 				$('#play').removeAttr('disabled').click(startPlayout);
- 				return false;
-@@ -545,3 +545,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/screensharingtest.js b/html/screensharingtest.js
-index 61eac70f43..c64d8dbd67 100644
---- a/html/screensharingtest.js
-+++ b/html/screensharingtest.js
-@@ -161,7 +161,7 @@ $(document).ready(function() {
- 										if(event === "joined") {
- 											myid = msg["id"];
- 											$('#session').html(room);
--											$('#title').html(msg["description"]);
-+											$('#title').html(escapeXmlTags(msg["description"]));
- 											Janus.log("Successfully joined room " + msg["room"] + " with ID " + myid);
- 											if(role === "publisher") {
- 												// This is our session, publish our stream
-@@ -514,3 +514,12 @@ function newRemoteFeed(id, display) {
- 			}
- 		});
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/streamingtest.js b/html/streamingtest.js
-index 7dd2e1f681..3f9937f11c 100644
---- a/html/streamingtest.js
-+++ b/html/streamingtest.js
-@@ -323,7 +323,7 @@ function updateStreamsList() {
- 			Janus.debug(list);
- 			for(var mp in list) {
- 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["description"] + " (" + list[mp]["type"] + ")");
--				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["description"] + " (" + list[mp]["type"] + ")" + "</a></li>");
-+				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["description"]) + " (" + list[mp]["type"] + ")" + "</a></li>");
- 			}
- 			$('#streamslist a').unbind('click').click(function() {
- 				selectedStream = $(this).attr("id");
-@@ -345,7 +345,7 @@ function getStreamInfo() {
- 	var body = { request: "info", id: parseInt(selectedStream) || selectedStream };
- 	streaming.send({ message: body, success: function(result) {
- 		if(result && result.info && result.info.metadata) {
--			$('#metadata').html(result.info.metadata);
-+			$('#metadata').html(escapeXmlTags(result.info.metadata));
- 			$('#info').removeClass('hide').show();
- 		}
- 	}});
-@@ -394,6 +394,15 @@ function stopStream() {
- 	simulcastStarted = false;
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons() {
- 	$('#curres').parent().append(
-diff --git a/html/textroomtest.js b/html/textroomtest.js
-index 082ae44905..3d0697e35a 100644
---- a/html/textroomtest.js
-+++ b/html/textroomtest.js
-@@ -153,9 +153,7 @@ $(document).ready(function() {
- 									var what = json["textroom"];
- 									if(what === "message") {
- 										// Incoming message: public or private?
--										var msg = json["text"];
--										msg = msg.replace(new RegExp('<', 'g'), '&lt');
--										msg = msg.replace(new RegExp('>', 'g'), '&gt');
-+										var msg = escapeXmlTags(json["text"]);
- 										var from = json["from"];
- 										var dateString = getDateString(json["date"]);
- 										var whisper = json["whisper"];
-@@ -170,9 +168,7 @@ $(document).ready(function() {
- 										}
- 									} else if(what === "announcement") {
- 										// Room announcement
--										var msg = json["text"];
--										msg = msg.replace(new RegExp('<', 'g'), '&lt');
--										msg = msg.replace(new RegExp('>', 'g'), '&gt');
-+										var msg = escapeXmlTags(json["text"]);
- 										var dateString = getDateString(json["date"]);
- 										$('#chatroom').append('<p style="color: purple;">[' + dateString + '] <i>' + msg + '</i>');
- 										$('#chatroom').get(0).scrollTop = $('#chatroom').get(0).scrollHeight;
-@@ -180,7 +176,7 @@ $(document).ready(function() {
- 										// Somebody joined
- 										var username = json["username"];
- 										var display = json["display"];
--										participants[username] = display ? display : username;
-+										participants[username] = escapeXmlTags(display ? display : username);
- 										if(username !== myid && $('#rp' + username).length === 0) {
- 											// Add to the participants list
- 											$('#list').append('<li id="rp' + username + '" class="list-group-item">' + participants[username] + '</li>');
-@@ -282,7 +278,7 @@ function registerUsername() {
- 			username: myid,
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		transactions[transaction] = function(response) {
- 			if(response["textroom"] === "error") {
- 				// Something went wrong
-@@ -312,7 +308,7 @@ function registerUsername() {
- 			if(response.participants && response.participants.length > 0) {
- 				for(var i in response.participants) {
- 					var p = response.participants[i];
--					participants[p.username] = p.display ? p.display : p.username;
-+					participants[p.username] = escapeXmlTags(p.display ? p.display : p.username);
- 					if(p.username !== myid && $('#rp' + p.username).length === 0) {
- 						// Add to the participants list
- 						$('#list').append('<li id="rp' + p.username + '" class="list-group-item">' + participants[p.username] + '</li>');
-@@ -418,3 +414,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/videocalltest.js b/html/videocalltest.js
-index d1c1ab8d07..18ccbc2c47 100644
---- a/html/videocalltest.js
-+++ b/html/videocalltest.js
-@@ -148,7 +148,7 @@ $(document).ready(function() {
- 										} else if(result["event"]) {
- 											var event = result["event"];
- 											if(event === 'registered') {
--												myusername = result["username"];
-+												myusername = escapeXmlTags(result["username"]);
- 												Janus.log("Successfully registered as " + myusername + "!");
- 												$('#youok').removeClass('hide').show().html("Registered as '" + myusername + "'");
- 												// Get a list of available peers, just for fun
-@@ -163,7 +163,7 @@ $(document).ready(function() {
- 												bootbox.alert("Waiting for the peer to answer...");
- 											} else if(event === 'incomingcall') {
- 												Janus.log("Incoming call from " + result["username"] + "!");
--												yourusername = result["username"];
-+												yourusername = escapeXmlTags(result["username"]);
- 												// Notify user
- 												bootbox.hideAll();
- 												incoming = bootbox.dialog({
-@@ -213,7 +213,7 @@ $(document).ready(function() {
- 												});
- 											} else if(event === 'accepted') {
- 												bootbox.hideAll();
--												var peer = result["username"];
-+												var peer = escapeXmlTags(result["username"]);
- 												if(!peer) {
- 													Janus.log("Call started!");
- 												} else {
-@@ -598,6 +598,15 @@ function getQueryStringValue(name) {
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons(temporal) {
- 	$('#curres').parent().append(
-diff --git a/html/videoroomtest.js b/html/videoroomtest.js
-index 6a566891d8..5a3ade9be9 100644
---- a/html/videoroomtest.js
-+++ b/html/videoroomtest.js
-@@ -400,7 +400,7 @@ function registerUsername() {
- 			ptype: "publisher",
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		sfutest.send({ message: register });
- 	}
- }
-@@ -530,7 +530,7 @@ function newRemoteFeed(id, display, audio, video) {
- 							}
- 						}
- 						remoteFeed.rfid = msg["id"];
--						remoteFeed.rfdisplay = msg["display"];
-+						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
- 						if(!remoteFeed.spinner) {
- 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
- 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
-@@ -685,6 +685,15 @@ function getQueryStringValue(name) {
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons(feed, temporal) {
- 	var index = feed;
-diff --git a/html/vp9svctest.js b/html/vp9svctest.js
-index eca0239c32..b22ccf3340 100644
---- a/html/vp9svctest.js
-+++ b/html/vp9svctest.js
-@@ -387,7 +387,7 @@ function registerUsername() {
- 			ptype: "publisher",
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		sfutest.send({ message: register });
- 	}
- }
-@@ -486,7 +486,7 @@ function newRemoteFeed(id, display, audio, video) {
- 							}
- 						}
- 						remoteFeed.rfid = msg["id"];
--						remoteFeed.rfdisplay = msg["display"];
-+						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
- 						if(!remoteFeed.spinner) {
- 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
- 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
-@@ -630,6 +630,15 @@ function newRemoteFeed(id, display, audio, video) {
- 		});
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create SVC-related UI for a new viewer
- function addSvcButtons(feed) {
- 	var index = feed;
diff --git a/package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch b/package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
similarity index 100%
rename from package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch
rename to package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 83afc72c98..7aec3d2aa3 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  21e2fc7dee4b20ed8d749a69577eccd961b0bfe5b863d42f39ddfcd2af903718  janus-gateway-0.10.10.tar.gz
+sha256  b5fe70d95b9288200df15d5f75cb8eb6db66484c6ded159422a81e880ecb7104  janus-gateway-0.11.6.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 83d28ff6c7..84ca0bc116 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.10.10
+JANUS_GATEWAY_VERSION = 0.11.6
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 
-# 0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
-JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4020
-
-# 0004-Fixed-missing-XSS-mitigation.patch
+# 0003-Fixed-missing-XSS-mitigation.patch
 JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4124
 
 # ding-libs provides the ini_config library
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
