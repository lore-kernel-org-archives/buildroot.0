Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A65FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA12424C3;
	Fri,  7 Jan 2022 22:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erfhqWAMR36h; Fri,  7 Jan 2022 22:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4C31424BD;
	Fri,  7 Jan 2022 22:40:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96B3D1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D885424C3
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soMSCo3t8k6Z for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:39:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C1B9400AB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:39:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e9so12181515wra.2
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWhTfT3tFjyxv0DHzZ883bTpMEz7qvu9IoFaM1tUkPg=;
 b=OABL/+gBxBLDFMpikk7FcdkpQPkv0Mz2luh0GYp70gyK0IC7CwroQFUySxFc2KethD
 SSsjmU9H6M3PouTs22RXbVns1c9ZaRCmEO1K+GAWMuMX0uKmlkGNo5SkkPL1dzN4nyn9
 7ZyAeSBoo+yj1iAA2H14iszDwOhVLC2XW6WfpHopZks66SaAlhbMdnK06h6wXGAOfMl2
 aJYhZLdp6pmd220mxcWz10s9GOFrwR6NRU9jl72CCvl2VjBGMDLvucmj3/b+tT7HmiiK
 lyP4MKoAwjCpgG2pXwuu2THg1dqAnykArzICPN4FQl8TU01LkPB1aQfJVPOHyGVT+hOO
 XIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWhTfT3tFjyxv0DHzZ883bTpMEz7qvu9IoFaM1tUkPg=;
 b=f9XmI2JPmNVIAuaPOSls/KigroLY9+O9eVJGTvr0s+TJofTI59oOKHaI2NFiuHJcjA
 G5ZuzvwpoGl6BVtGWCWlvvb3HaUcH1EDaNY6wRy4lb3DuzlI95leVOElJYFSecpWp0Nf
 CaBzp83S7y3AR0ZD6LTesziyCConbUYQkIKHwl/iMt6OgP3r3UX+JzhaUrFXI6UOEf0c
 6Tallvv/Vxk1tPbVQWxZok97gg2kdYirDupNyLTMpylIHHqpRiIqS5PMQq7rB6/k0vry
 xMhv2MKw9vM3yoS2cn8RQ+wKY0KtPebdTQnjL03Oi437HopWl1HJb+97VAUyiYbN3ZMI
 gYLg==
X-Gm-Message-State: AOAM530DCg+wBoekZLyeydkOAtsXCg5w8CvmeDnrhclt4sYC+g93JBPD
 4wz8QoMWTQwDa3BjVme0nnlfMOqbwsILHw==
X-Google-Smtp-Source: ABdhPJx5YWid2+Nuns/mrlRdu5u/rskeLA1RPs1X0GURTzJ8ex4tOq5cQgO457ZB9fSTfsvuGCGSJA==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr804810wru.125.1641595197535;
 Fri, 07 Jan 2022 14:39:57 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id l10sm44560wmq.7.2022.01.07.14.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:39:57 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 23:39:55 +0100
Message-Id: <20220107223955.148266-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml: ignore
 branch name prefix <foo> containing a single hyphen
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit [1] added a sed command used to retreive a pattern
to keep only defconfigs whose name start with the pattern.

"<foo>-defconfigs-<pattern>"

The sed command doesn't work as expected if <foo> contains a
single hyphen [2]:

"qemu-6.2.0-defconfigs-qemu"

Update the sed command to ignore completely the part before
"-defconfigs-".

[1] 65d2f04c012af492a9b9da04dfa3b3cbd20347f1
[2] http://lists.busybox.net/pipermail/buildroot/2022-January/632507.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/generate-gitlab-ci-yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3e0c68091b..bd79807914 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -66,8 +66,8 @@ gen_tests() {
           (*-defconfigs)
             do_defconfigs=base
             ;;
-	  (*-defconfigs-*)
-            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%[^\-]*-defconfigs-\(.*\)%\1%')
+          (*-defconfigs-*)
+            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%^.*-defconfigs-\(.*\)%\1%')
             defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
             do_defconfigs=base
             ;;
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
