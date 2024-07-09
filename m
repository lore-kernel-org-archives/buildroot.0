Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BADC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0534F406D5;
	Tue,  9 Jul 2024 10:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bolW6ydphVuC; Tue,  9 Jul 2024 10:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D36B5410BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36B5410BC;
	Tue,  9 Jul 2024 10:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7B4B1BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C30674032E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2-dxX8I1hDy for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 098F74027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 098F74027C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 098F74027C
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:19:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1sHBps3bgz-00zXUc; Tue, 09
 Jul 2024 12:18:57 +0200
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 12:18:41 +0200
Message-ID: <20240709101841.1145134-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709101841.1145134-1-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zC6lEaPicJVP84XIOCTFVP3YhDwWqBSvbU4r0wUWtpn2/ekui4i
 NR+LvaAbaJCLmox3OPt8tHvQ0z3nCVRptWadaGQ7mwu2VJEBbrptfIriwjY5EVKucNZDzcD
 rXBNv+nlZq/vlFoAHqGBTqGHfzK0KPQNBNhIDa3H7FNbRO5kgu6OtVedGoFWwGQhBx/uHMz
 Xv5Vgx0fbZkMa0n3LiqFA==
UI-OutboundReport: notjunk:1;M01:P0:W99i92ng+GY=;y0daEePebOC4q5chQSSx9CD+91l
 q1Eqek4KrJiE+VOxqQ9MFd4qPLcEHgj4xUg6ydIgt0lhD0399cKioBzmPcFVEBzlYMkFER1u4
 WnTWENXmF875twHt+FT7wgGV8fN2lFndSwCrkmkTz2M34KXDR+IcFuJkwNU3Qayw1Iljny9qk
 oZFsqPSADdoXPoa76MRqR7582eOX+S2Gi/BDs1oQcB36T3VgZdFZ7LPuEttBZEOs3eTH+mmXN
 C+Wvy9AVOHfGvLp6k51tavijvbLQuRgTrGmaDlyUSimBFvHhHbKnMzpmEaK5WxHkAkL1wlRJB
 sNX4h0nnoELUZ0vytwXW79Nf/O61kVYgcbXx24Y88GuU/O/cn6sHYa+wynfB3Kne2VawHhZMI
 JC3Qk4w936Iy1dcX0Ppc/ijYC/xDJo2Pqnu5N0+3XqQ1dEv97mqm6Upg5tJAUENxZ/oBsHHB5
 Fx2//ZPRQtG6aHPUXfhZCS+fV4uicyjyxEIk80jxEZ/Lx9cJcW9XxKcqYxmWhjLlmNO08ijrJ
 euOIGWeLWRwVLHTbBqNGuQjtkIxFN2nD955/h7uzqPW+uJ6xXxdXndhasxPXcv9eUszOjwFzB
 gBD+t/4hPmY30zCVjU1KMqDpKPXHd2KWpMmumpunLx6tDKcS2RF/EYDIlJtUm/NzooVzVNkh3
 1CqkQWkxHQiNNt/u/CKt6Or9kGOp9KsJn6iKKZgOCOq0UM6Aj1RBax2HfoYbQ5K/u0IA9AoS5
 VZZrv+shFNNMLpInkeIyVzv7ibHqHN734tq+yt5HOAr9Y53tiMsxcploVkOKasLbW6mytQqu0
 s/cm/AQ/m5Cdro35TccPhTivmfOs7OEtIjW1+C/yKNa28=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520338; x=1721125138; i=fiona.klute@gmx.de;
 bh=SW5zk/sKVwtvqiJl40HWOAympo0Yc77suVm3v2VrIjA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dnwdWwpMG35Wu1yZRhhSqOQ+rbcC8xN1YnFNTwM0X4ywh4inuaSXr6Amy7SJA8v6
 frp3NdjcOaEiiA2wB6syn2ikEYcH075vcPJpOnimVkmHotjwz1Se1WxB+UUORg9i0
 tWzy+TYexHXrATG7Abh5rznqtshfTKEqPVom4392lSAna36Wsj9r5Q5EE9P7WwzY2
 LUP1CAGTVEZeee1KLc39ccYw7C9muLV7HKHrDLlJkxmYHShfZcB/pR26PhE+P4uJv
 l+byyYy19XIU0nYthu+oaDmQMLmaai9R0FHBHzQStZjC5p2mpiUzGUtQjYF6lKOHV
 V48JHQn1DiK7sKYBew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dnwdWwpM
Subject: [Buildroot] [PATCH v3 4/4] package/fail2ban: fix sshd filter with
 OpenSSH 9.8
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The filter needs to consider the new sshd-session binary, patches
already merged upstream.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Add this patch to fix the sshd filter with OpenSSH 9.8

 ...lter-for-openssh-9.8-new-daemon-name.patch | 24 +++++++++++++++++++
 ...shd.conf-ungroup-unneeded-for-daemon.patch | 24 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
 create mode 100644 package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch

diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
new file mode 100644
index 0000000000..026cef9693
--- /dev/null
+++ b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
@@ -0,0 +1,24 @@
+From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
+From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
+Date: Tue, 2 Jul 2024 07:54:15 +0200
+Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index 1c8a02deb5..a1fd749aed 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = sshd
++_daemon = (?:sshd(?:-session)?)
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
new file mode 100644
index 0000000000..597df667f0
--- /dev/null
+++ b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
@@ -0,0 +1,24 @@
+From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
+From: "Sergey G. Brester" <serg.brester@sebres.de>
+Date: Wed, 3 Jul 2024 19:35:28 +0200
+Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index a1fd749aed..3a84b1ba52 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = (?:sshd(?:-session)?)
++_daemon = sshd(?:-session)?
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
