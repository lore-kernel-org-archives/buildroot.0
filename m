Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69751C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 17:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8596C61502
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8596C61502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABE860C1D;
	Tue,  5 Oct 2021 17:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUEgs9G2itxQ; Tue,  5 Oct 2021 17:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B785D60C13;
	Tue,  5 Oct 2021 17:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85D491BF3AA
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 17:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E5CD40863
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 17:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GltkBw4Lz0c for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 17:18:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBAEA40871
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 17:18:02 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:cd86:4984:f7b5:5901] (unknown
 [IPv6:2a01:e0a:947:6e20:cd86:4984:f7b5:5901])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 9936BBFA60
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1633454279;
 bh=aySwzYZ0aSz1JSa+Cj3UPLlGxJqswBU4hixzJGsRxo4=;
 h=To:From:Subject:Date:From;
 b=FKkEyXb+zETy2E+oJWiOtzAFHeP4Lspy90rjVnRmFF/DUk5N+vAa2Lqdr1wTHHtAR
 fBgM/0/Da51oFmD5VXD0A1RVMenaHALdVgF7L1ky9zJ1mqoDaIyp/TIngpeRH5xzXN
 x2rVfPI7hYIKFyIU5yB/6+tbdLlTHdnQvW765L9lrh2vsDxk0yWpMOqw1KHrtvhjD8
 X2nWxmO49bg+OivqR7x1VGA0hsX7vVmRvFsTioKs7aQKcrbRT+hoAGvldgwyRorto1
 eKFM6xdoc6+cVShGx6UfT/e+k0cdNvQiVle7wZZCAjgcR+GAKcbiY8vh2PDdpMj/zP
 PG3sA5xLvMwPg==
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <914a4374-e517-b730-c45f-f37ec8147649@grenoble.cnrs.fr>
Date: Tue, 5 Oct 2021 19:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: prevent
 the commands from wrapping
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

Traditional VT-10x terminals (and their emulators) have a "magic
margins" feature that enables the last character position to be updated
without scrolling the screen: whenever a character is printed on the
last column, the cursor stays over the character, instead of moving to
the next line.

The Busybox shell, ash, attempts to defeat this feature by printing
CF,LF right after echoing a character to the last column.[1] This
doesn't play well with emulator.py. The run() method of the Emulator
class captures the output of the emulated system and assumes the first
line it reads is the echo of the command, and all subsequent lines are
the command's output. If the line made by the command + shell prompt is
longer than 80 characters, then it is echoed as two or more lines, and
all but the first one are mistaken for the command's output.

We fix this by telling the emulated system that we are using an
ultra-wide terminal with 29999 columns. Larger values would be ignored
and replaced by the default, namely 80 columns.[2]

[1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_34_0#n412
[2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_34_0#n258

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Co-authored-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/emulator.py | 2 ++
 1 file changed, 2 insertions(+)

Note that I tested that the command

    stty columns 29999

does fix the wrapping behavior on an actual board, while using a serial
connection. I did not test the script emulator.py, as I am unfamiliar
with the testing infrastructure. Would someone volunteer to do that
test?

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 0a77eb80fc..f1f5eac3a8 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -100,6 +100,8 @@ class Emulator(object):
         if index != 0:
             raise SystemError("Cannot login")
         self.run("dmesg -n 1")
+        # Prevent the shell from wrapping the commands at 80 columns.
+        self.run("stty columns 29999")
 
     # Run the given 'cmd' with a 'timeout' on the target
     # return a tuple (output, exit_code)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
