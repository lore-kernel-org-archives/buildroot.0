Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B80417A5;
	Fri, 18 Mar 2022 08:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfM9PmS2eqaN; Fri, 18 Mar 2022 08:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6D9415ED;
	Fri, 18 Mar 2022 08:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5A7C1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DF48174D
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xLlE2DRrKSy for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:24:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CD5781570
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647591887;
 bh=aI7DyWpHPSOP9fohMNn9e1eV82zbUyf8Z74f9v1FglQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=MGrZio68SvG/FRp9oWfNbn4cT7MdbafHMtJXjQ+44n0NPFsjEzDD2n1TxQk40nth9
 dHmc5zHFNRoSedyDVHYjMJHYBlN2DDmpbe6Vb6Zbia/yURsh/L+0I19h9MZAexO92E
 ADK3pbNxhF0KJvWydRAXkdwUYBQgcpO6jehryu10=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHoNC-1nHR4j1AP8-00EuYC for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 09:24:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 09:24:45 +0100
Message-Id: <20220318082446.18552-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:c4iOB2oymvFELeI2fB6E29m5IeyZ7JzIppZTc37j/OeNBUMQAvq
 JgAQLKefROqFx3J7Q7QKrq53E2isNnok6lI4StYu3psUlOwiNotpLLN/Mklif0SUvdLjC0s
 +1QM4tidRrPun4Pm7IEXQpg8DbwLlcaRsqsbugaa6TRmigBsECZxfdFwzSIUUAzmGCu7w2B
 Y8OV0ldxUKabYXMmiJ1rQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqn5zsJnUbM=:c1xWzHI/BqoMbgtTrx5V3S
 VwYGkkMV5lSlKbahC8tCZeODfGS8dU8hF02HkEj3T/aNwutOhUb5i3UcgvuCqq0RD3yB/E/fK
 k4CKF0rzBvInU6wu2FlrkLtC14w1Qv5BJ3adBHK8aJVTthG2hJ+iMQM8dvChF9rBlOLtQhoBr
 rm6t+2ik2zjoYc1I/Kqb7uJOx1WVfHsCTJg2OqVvpsf9UkUmqiVIA3wFvpAh+a863kA63hBl3
 PI7llqIwk61tOqwijPkesZzCJdRWIhVkzasR4uggSHl/Nq0rI4C9mUi8uFdedOjXS76BhWrAk
 8dsNfOLHx1GYGaoP6k/VoqjvCKK7xyCSb5gq+UTRQK25IZHxqm2zs4WvXRyYK255ouIv8lTMu
 rVBMXOedLsKN6hW5ffSt5taSc8FYU4FqfpLhVO5x+UlfBeuFDXR/gbg45bdbTbkV+Ho1F6FTF
 J13VhGZ0v/e1WBNBSsbaRIrdzd1ioiAueZPIMKwmYGfJvqknHEdnbY7nbZsMfoflyHixqUit/
 KfmrDcHA4xgRRtsHte9ISsQ9ICcoMl92E87V8Q8Y0u+sprEwVZ84TjMb1bMDwexCVXQY5eIUi
 XEH4IJQJ7F8uk437sPyzObFgo16cTXW7xm8dh0LB5Og9qHb8UQL+sfBmi1EQLhvTSXhmOQJ1u
 3L2vy2gIXPRWU6qnA8hoKXMA+Wrkk1YpMd0G4Aw7H7fucMPeP6W5iO/MG+6bNRvc5U9etjeI6
 ABgOv5DpJKGuJcWwIcs4ucSx1MmyWc6/qqk3i0T4ffR8zCHrzA+MQ1QFGh3dLx4gB2hyBM3Rv
 oMLnkBjJgYBqDy5+YJ96MHPq73IkeJqmFxqWVTs/qJ0PZjWv3a2eZrpGsDpoHex7tNmB+xpmO
 OGOUkH1PBiyaaq2REW+BgZ+CcLcytkkeCMrstoIeTYbXU5fyopBCsdfoFgky0gtNINtjusiJQ
 kJs0Git96ntrwWDaKc0AfEedCKXTnkywUoy+ySTwl/f03eHMdJvq8+O0MZKOkw73wqdaB0K1R
 jSGe7REJPDM5JNzII34fjo+4O/69XWmrjwvHWZnCxmhE/L8Lu/vsUWVTnPhArsIeOIB12eNlL
 BIQpYNuJM/HRGA=
Subject: [Buildroot] [PATCH v1 1/2] package/spidev_test: fix spidev_test.c
 version in Config.in help text
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

- fix spidev_test.c version in Config.in help text, version update to 4.10
  (missing from commit 'spidev_test: bump to version in Linux 4.10' [1])

[1] https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/spidev_test/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 44990c66b6..2f3fcf4090 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, otherwise 3.15
+	  if it's older than 3.15 then 3.0 is used, otherwise 4.10 
 	  is used.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
