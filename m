Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B50C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4FD4295C;
	Thu,  6 Jan 2022 15:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJQpgRUg2hoR; Thu,  6 Jan 2022 15:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841D442966;
	Thu,  6 Jan 2022 15:35:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 140631BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68C4C40A2E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZ1zZxlmqBEG for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:35:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8BC940133
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:35:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso724729wmd.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YzyAUf+Epr9onHRgkm14wg+C1QkDgBfJFOvr5/1MVTw=;
 b=tZD7CHJ8Mo+CpzMC7+x+ccSch4A6nb6pGVxoZ3i7WtKMULB+5D4wFbe1jXBLOfmYLU
 1cNwyZfUr1pUyGSxGleD+QakSWvH/j4bNsOKISz/sBBe9myWgZrUzbpFz/rAkJXL7Saa
 ifIy5et1+40mgo/4hR0YfTV6+1/844xFE4YQ28hFa43i/w+tdXexewD+PloNtwcsxhaC
 SDy0YSayERbWKe1UP3KP4QbuOcDHvfhuTrKvW7qiGa7qH8BYtNRPmhEXEDCirsW3pBUb
 cLu2ZOpZ6yAkIgJSuS+yROqgFtdnbqX66aaArKyV5i4Ras5D4f3lciH78UfL50xRRCCI
 OLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YzyAUf+Epr9onHRgkm14wg+C1QkDgBfJFOvr5/1MVTw=;
 b=rEACddILXBvKGkNGx6P1xh0vmrNyLlfqxN687aRkcyTz119LQRy32iYt3Ugkg2c0p4
 Q4z2PmOJhz5djxzWuqP6Sy5fCG6yHGjFEuTgcazJOJdEeRpev3jhUIb/2gl3Mbe9WblM
 etSfc2vq+R6EZimjfpYH0bFDxd5bYgq3CPbXJgONwnVJ87oK4OGNYJ6DuECmXdssgQ7I
 7ukl5XXIlwb/ivm3LGP3UM/8G768BOm+iYS9QyQcl9KmOVkcF4ojC1zpXMYAmS9nb3ar
 5AZwvMGOUEsljgU5Lj0AxOFxJwQ9tePLB/2jDtYqMqehW7kjnGOCXgFXqf/ycQi8o8XM
 tC7Q==
X-Gm-Message-State: AOAM532AvUP9rm5eaE/LVyiWdaIAezrLNwYp4TcujPXNqRVPfUX+rLV/
 qlJYNgscewYPquThdgn6P5ZJGpIE7kbfTg==
X-Google-Smtp-Source: ABdhPJyAdNh+gYJr2k+tgia7bYnEbDRlkRML9xWex0xMmfNxF3KXhqKwJ/xJEQMxH6Ou0SRJf7UVFg==
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr7473619wmm.142.1641483348014; 
 Thu, 06 Jan 2022 07:35:48 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id az15sm1967847wmb.47.2022.01.06.07.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 07:35:47 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 16:35:41 +0100
Message-Id: <20220106153542.1668688-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv3 1/2] package/mender: remove single hyphen
 command
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
Cc: Romain Naour <romain.naour@smile.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Single hyphen commands has been removed since Mender 3.0.0 [1]

[1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/mender/S42mender             | 2 +-
 package/mender/mender-client.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/S42mender b/package/mender/S42mender
index 108fecfea9..dc60f94f8b 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -25,7 +25,7 @@ start() {
 	umask 077
 
 	start-stop-daemon -S -q -b -m -p /var/run/mender.pid \
-		--exec /usr/bin/mender -- -daemon
+		--exec /usr/bin/mender -- daemon
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
diff --git a/package/mender/mender-client.service b/package/mender/mender-client.service
index 2a5f476ee5..5539a56fd6 100644
--- a/package/mender/mender-client.service
+++ b/package/mender/mender-client.service
@@ -17,7 +17,7 @@ if [ -L /var/lib/mender \
         mkdir -p "$(readlink /var/lib/mender)"; \
     fi; \
 fi'
-ExecStart=/usr/bin/mender -daemon
+ExecStart=/usr/bin/mender daemon
 Restart=on-abort
 
 [Install]
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
