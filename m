Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF33C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 21:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E7560A88;
	Sat, 19 Mar 2022 21:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9tHTRWs703K; Sat, 19 Mar 2022 21:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79423607B5;
	Sat, 19 Mar 2022 21:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC991BF32A
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B84C81D3D
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojNUdWY3tFn6 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 21:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F267081D3A
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 21:45:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r13so1016414wrr.9
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwJonj0/JxjI+KcDrBaQZmjtX2p+ItzY8F5F+78ulm4=;
 b=N1cDs3jhQ9akwOy+2YgvAbJL0op/IBMjj5jRB+tVyD8EvyMAPQ7O8+oGrDovTNC2yf
 6FhhIB0o9orgUkEspaoUDc7FppYFiwBnARelf/b5CBi1WyW3wVLi6JOgUuE5+u6AkPwx
 NTSnjdrySG+nLDsdf/RzafJsSTRQsQK/QqQihYwIz+RO2+o/CGshin3fBYAn/ziE1an7
 KV91gswc/4Oy6Y1rZmPHLZP67YyySUidnlMtIh0ceAQXfobiIBsjNN5NTMhpCFxA3ze9
 kaNoX9L33zNzhd6R3SfXWf8WLPpWwvpVNpkUWL8wBAgO3YCOfNKaQjlEV5k60tfCz6vd
 wVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwJonj0/JxjI+KcDrBaQZmjtX2p+ItzY8F5F+78ulm4=;
 b=FjiBIRSxpX9x7L6qu2H4KCRbB58WuSnMbf9f6xVyopPk3NMkyGLPXwXGHdAkoSbsxv
 x82zJDdGSPX0p5lWDRFkWbduzJ3zDbt032l0dPofu3c+dQc+8CMEpvUBmUt+wzysDexW
 n5tF5h0BLWvMGFCeh5o/5O4xTDVMkN8XuDPl2UI3Bnxa72PyGK7PP0cFs2klIYx6Rkfy
 C/cKFJqSDDJAivgSN4w6OigUPTireGS9zWJKbAYRqcTE1Eumit/McRrXJddguy6FbFuf
 IIXXrvU2qcHBfG17WMpDMz8rCf74fa8mtQ4IK/kfyCe+ZamyMyN5906K7LLIxBrANdHW
 zo1g==
X-Gm-Message-State: AOAM533Wrurc4UyU+j1XydKrbxnSCadG3Q0qb19ZdDD/nZ/iAoJf4kOF
 Xu5LQbYjJJlGBEcjQsuEBUASHHxbrHY=
X-Google-Smtp-Source: ABdhPJxD6jZyxAAZhrOL48lObp2o8gk84Xr4Cb0opNNExU/kjjVMdBSiAyTTczyQYTWtkp7nikpqWg==
X-Received: by 2002:adf:d1c2:0:b0:1f1:f89a:24ba with SMTP id
 b2-20020adfd1c2000000b001f1f89a24bamr12804431wrd.515.1647726353644; 
 Sat, 19 Mar 2022 14:45:53 -0700 (PDT)
Received: from EL-LT0027.marvell.com
 (226.red-83-34-138.dynamicip.rima-tde.net. [83.34.138.226])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm4188632wrc.6.2022.03.19.14.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 14:45:53 -0700 (PDT)
From: Juan Garcia Blanco <juanrgar@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 22:45:35 +0100
Message-Id: <20220319214536.2417-1-juanrgar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/dependencies/dependencies.sh: fix check
 for CWD in env vars
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
Cc: Juan Garcia Blanco <juanrgar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous pattern incorrectly matches against path lists that don't
contain CWD, but end with ':', e.g., exported like VAR=<...>:$VAR where
$VAR is empty.

Now the pattern explicitly checks for $PWD in the path list.

Signed-off-by: Juan Garcia Blanco <juanrgar@gmail.com>
---
 support/dependencies/dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..d1fe94c9b9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -16,7 +16,7 @@ fi
 
 # Sanity check for CWD in LD_LIBRARY_PATH
 case ":${LD_LIBRARY_PATH:-unset}:" in
-(*::*|*:.:*)
+(*:$PWD:*|*:.:*)
 	echo
 	echo "You seem to have the current working directory in your"
 	echo "LD_LIBRARY_PATH environment variable. This doesn't work."
@@ -32,7 +32,7 @@ esac
 # An empty PATH is technically possible, but in practice we would not
 # even arrive here if that was the case.
 case ":${PATH:-unset}:" in
-(*::*|*:.:*)
+(*:$PWD:*|*:.:*)
 	echo
 	echo "You seem to have the current working directory in your"
 	echo "PATH environment variable. This doesn't work."
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
