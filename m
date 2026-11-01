Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11469606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cjK/XcAl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E05CA40629;
	Sun,  1 Nov 2026 13:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnrkOkJ6AMlp; Sun,  1 Nov 2026 13:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AE3740620
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541173;
	b=MrX4Wxo11KZtwoepij2c9WRWXNiPZlA1JRhmAEt8QEkzhPawYmWVAEi/KHGAPje0q7LJ
	 pYV2SR2HPzOLkPoHKiUJAQ4VyxgzHSIkiT3FnTXX5w05ecK3wWtvDwfgRAiurhg6cbWjG
	 9EiasF6OfDm36fb81Lclh9HQ3aqoif1yx54H2DMUAQUnV8KjEo8A2XhcLAfLm3H/qH0/Q
	 R+5RQoQsL1eRxzzPbJ03uj1Zb6q1yZ7YEoyguSADb4mLs4H1Jtg+CxnMZ50esaBewuA38
	 TYqNMdUeXRRbFA3VJYSYu/RAa4DxQkuA4AeRSW9OctbqJkHrb6ZmzydaDSHgGqZvSGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9OwOKCsXr5BrXMZpL+YX+YYhzHDs5yCsTT2xc+CrNs8=;
	b=qQR7ALfGZEfLvPZoX3H1efcJMCreDaIYlXa0elQr34vW3IqUCzB5zXy6kEfWP6oZTtF1
	 zKm+OoV8/oIJ42+Thy35+40JbSwVRC34UKwUM+PrCEZY5mBpMotExur1r5PyP/niAZUjM
	 XsZWBgkjciH4D9hmLJPjXXvvJ5WY1jBw6pRRmsCDIAGLq6CfbaTLdtzjMYXbKs1WW1k1t
	 /3xZbJiSlSuDYBjxy1P//xJpavenVvU78RYeX3CwMPEgKxn1UjG3J0hz/+5OT30AOf5vz
	 exwVqITuf9iy7Ym4ouxh36XFq88fzdlWkwG+lLHTbuhxK2GMutuqMbmm1NQ/XEIBLgA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541173;
	bh=9OwOKCsXr5BrXMZpL+YX+YYhzHDs5yCsTT2xc+CrNs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cjK/XcAljFJ1guLFquelxGpGnusUVlw89ho1zFvFIajF5WvLYK5A524rRhpXhqeM4
	 uArN5I5nWGwSae69nZS4brt9tWqf6+bkGMQ/X4AK68qkm4tE6+0PtWaZRwyabYHofd
	 1xkBRiPBsw+jptg6qJdf2Fk/WqJDao3SK1yt20f1cqcw27wu+JUeDLHe1g2jDxAAk0
	 rUtpONgimSZ7Z2kRfkgYczGL9wApk/ApgzWw3Fl4K5mdomK/L6lOoiawCZnl2tdbm2
	 Oyc2HBE7Upmi8N3reXQvZxxDHwenACY0IqNDMPiLUTtHS6Zo0lAWDmmvOxrsuE2T6s
	 8hnDywC91aOYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE3740620;
	Sun,  1 Nov 2026 13:52:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F72E4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24EDA60619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DnaDqNzT7hW for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 289A460612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541168;
 b=NtpYGOAEG4aZN88Fxz79ll7qzmWpQGsI7HbLfR7RSD0NY9Y8oj+U6vZOpKK4wvMIEXRp
 amC4dbY0Ip4yxzEBgujkv5Qc0efJK13OrmdCHBMxf6kG0T9pdffgfmyTeeu1d2jW/TWwB
 n7PuV6FHtqgNfF6vt6rHSQEahcpkMtJ2cgR17ccS1Nkc1V6oijv+1nzOuciEZh0iwKAWq
 m/zeLXnYigkK1pFw5sdXBvDkpHakbbDV+DxjALxB758URnwS2cxsqOuun1XAVUlM2W2lu
 /tz6xxVJEH+yOQXA8ol3xg1QeNunoB/Py14IK6DfeGCAlqR4dk3xR2kl8PGDPXHlcOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BOSg5If8WgbfrtHIKwgJPKZaZgw1BYsByfN+ve61u8A=;
 b=bVjq2xht0gl7GmUgpx4S8TqKPqEyiF/5VidMxkexRh7DdIdDa69B2DIKvxe4tH//VtAy
 f1QrZmTCJq3rYjMxKv5HQUOPcgRYbF5yZ5nIYwGX19c7e2HGE17s62OExgtAQoUHm3QJC
 hLQy3NnLtFuF/OHtw/eAS5q2noTZZWH+hyiOGK/mqdXaipOlHiDHNZiXtQY40iee1PrZ4
 KZI2RJ+VnQWpQZ2dlJNzdQrdPgU46ven1/bNyLziJUenAgtwnATVHGNFIE4Jfgs+ZYITO
 kGANoz7Ia+YstnxS0CHV9+P+LEe8EDDn6oXQTOmFo+scKjud9LrIuAaszEw2iQMJ2xw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 289A460612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECF839D460; Sun,  1 Nov 2026 13:51:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86a3f994974296c9b358f7287dc5fc0a8968947d
X-Git-Newrev: 1e925aba84470d25f03d923df49fbbaeb72d1ed2
X-Patchwork-Hint: ignore
Message-Id: <20261101135118.ECF839D460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: bump version to v29.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0657852892302842238=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0657852892302842238==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e925aba84470d25f03d923df49fbbaeb72d1ed2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://docs.docker.com/engine/release-notes/29/#2912
https://docs.docker.com/engine/release-notes/29/#2913
https://docs.docker.com/engine/release-notes/29/#2921
https://docs.docker.com/engine/release-notes/29/#2931
https://docs.docker.com/engine/release-notes/29/#2952
https://docs.docker.com/engine/release-notes/29/#2953
https://docs.docker.com/engine/release-notes/29/#2962
https://docs.docker.com/engine/release-notes/29/#2972
https://docs.docker.com/engine/release-notes/29/#2980
https://docs.docker.com/engine/release-notes/29/#2981
https://docs.docker.com/engine/release-notes/29/#2982
https://docs.docker.com/engine/release-notes/29/#2990
https://docs.docker.com/engine/release-notes/29/#2991
https://docs.docker.com/engine/release-notes/29/#2992

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Stefan Agner <stefan.agner@openhomefoundation.org>
[Bernd: squashed and rebased commits from
 https://github.com/home-assistant/buildroot/commits/docker-29.8.1/
 bump version to 29.9.2]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 06758086bd..67f4c1195c 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5864ccdfceef3a9e8ddb29b4a555d5b82a551b5258067aac164b6156c6cfdc08  docker-cli-28.5.2-go2.tar.gz
+sha256  e3b1fab5e2ee2d6b63b8ce0e8bbd08d6f54c0537c470332f2c345ab997233409  docker-cli-29.9.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 216cf70b95..563f4c851b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 28.5.2
+DOCKER_CLI_VERSION = 29.9.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0

--===============0657852892302842238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0657852892302842238==--
