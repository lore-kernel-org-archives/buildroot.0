Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73573C7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 10:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0425660C0A;
	Tue, 13 Jun 2023 10:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0425660C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xi10Vr15KGg0; Tue, 13 Jun 2023 10:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CFBA60F97;
	Tue, 13 Jun 2023 10:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CFBA60F97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA59A1BF2BE
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90AFF60FCD
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90AFF60FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ry1l28uKAUpf for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC8260F00
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EC8260F00
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 10:50:25 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MOzGc-1qTrqC3jmW-00PLIO; Tue, 13
 Jun 2023 12:50:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 12:50:15 +0200
Message-Id: <20230613105015.739870-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613105015.739870-1-laurent@vivier.eu>
References: <20230613105015.739870-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pyGIZPzaEdQbvrPVReUxmbYMW3Wn/52TjGPzdiD3XWuwSUWZlpE
 VlFJWcivSplfrfWzagPb7g2KTjEaN4bPodGKSEbQr+W0dGsX34CYeL//M6sLM0Pq7NgxQef
 YVIXHdH9qi8HA7TOWa3rCiPTk8GsaALci8V489Cj8Nq3EM/0N/FOyyDthwzu38ZWFlFNcc0
 u8q0zzISoGhJmGra64lZQ==
UI-OutboundReport: notjunk:1;M01:P0:tXDo1wHk5Pk=;EYk+et6Eqybk6Lynrzsg1aZ00kf
 PmcL77HmgCBXuT1pluXmtrvSdNSg8oLEs96w+LpkvITw4xum5XHSErSdzP0AwD/gOsuH8Xf13
 5szxMW+SRwzQ8ANm5U4w6uf9nG4V0OhyE0MQQ+xU5Jw0EXsg/dC0eBO9kSWPO8E9o4bD0Eci7
 HUsJn33/QWfwX2pchk7Az++8GuVwjiHAWgXVZtSfT3U1wlog2N9Pc8RjDdOTQh7n5OO+GtiOu
 Zik9nK9EW/EOzV+JwFNcp+r98K/AUbuSYqt+9PSQ2Os+p/erqQ74cTH0JQS5ieDVWkST+48qM
 pT+g3YDkPSW1h8+wI+b+XoWo2j5twYS6YWFgtFjEieUkjuCu5mxOlgDZ5LMOqzi4zMn2z6wJe
 3LrFufWUBo9evh3m99fu4BBI+zH4XZMqPzXMjWd5hr268V5cCHHuAHg2kuuu7v4AnhSdu/wRy
 GwZAJ5VTOlh3Eh2ZBFmWWAxWUZyhoqH/SpkW03riLWwyz/R+q5KwkgiwcoNKKg7/EexPsPzim
 mlRKxejqoYeAOlrK4n8iFBA5ZLoYFvL4iaNVuA9tp33TvtJFuoEuqMm8HvE4eSqi0L7y0CoOo
 z4TgUJeZHllkpS6nWuEh9mBmsyBVx6bQfgDduOmgMQ459WpzWM7vN1EQs1tN71EUnJFLE7xYu
 /cPB9Adw6q1Rr9d4+LXJpHJb/a9lPINyo/XX7k7OvQ==
Subject: [Buildroot] [PATCH v14 4/4] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petitboot doesn't start a shell but a GUI.
Manage the menu to switch to the shell.

Enable the test for qemu_m68K_virt.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 support/scripts/boot-qemu-image.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index ba50ea69ee9a..c94b7a5c969d 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -36,7 +36,7 @@ def main():
     time.sleep(1)
 
     try:
-        child.expect(["buildroot login:"], timeout=600)
+        idx = child.expect(["buildroot login:", "Exit to shell"], timeout=600)
     except pexpect.EOF as e:
         # Some emulations require a fork of qemu-system, which may be
         # missing on the system, and is not provided by Buildroot.
@@ -55,7 +55,11 @@ def main():
         print("System did not boot in time, exiting.")
         sys.exit(1)
 
-    child.sendline("root\r")
+    if idx == 0:
+        child.sendline("root\r")
+    elif idx == 1:
+        time.sleep(1)
+        child.sendline("\r")
 
     try:
         child.expect(["# "], timeout=600)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
