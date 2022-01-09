Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A19AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10B0408A3;
	Sun,  9 Jan 2022 22:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bam3CzldtRUU; Sun,  9 Jan 2022 22:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D17402D8;
	Sun,  9 Jan 2022 22:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1DC1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88A5960ACB
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KS6jrHIPHUs for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC37260669
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:19:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o3so23306098wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqE88fT1aE9VwwiWr6gQ1NpYo8zcWEoWf0KzYNxsqZ0=;
 b=H1bihEx+NyNpE1mrshGoAQgitm6hgf4IKQAZ8RHobLx53WDQG6B8kjtbOBNv05t/R8
 tJ4bLOjsnmAhCIZzcP6FyLJQV5nXTF6dJGapJN9PtwOPpkN2YRkSR1eMZxhb0nx4QHwy
 jvgKElxB6J49XvJnbUTHfKuUp+UKxRfN8pv+DZ4Uq4qfOjz+dk86qOYaM+/JbfjjklIN
 5wpwPVXQvwsJ0AaD5gnNWG17uY7ojK1UinzBvqVezARfzkMy9U9AJrZTrbpiVUZNHHhy
 fEf4TtA5LNnU7OLxZO0prqw2N9HDnYSXkZZbNb4hlwDfe+4rwxF7btqDrU+VPs/MuTNC
 wCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqE88fT1aE9VwwiWr6gQ1NpYo8zcWEoWf0KzYNxsqZ0=;
 b=2mbrXWpib7lQTJDWIO9cIr1pVkaFHAhupgQ7T43afW/r8QPJJjViYfZUgsR2Bgre+0
 1fFe1jVP5JQJ+HnKgxHdSip26Vx4D3Wkq6Io1E3jV/OpNjh+hUW0qOsJERV21J2IHerM
 Vnb0lShi5tGd1ijUPgLtJ1IEDWVG8NLmE0rfYOtg23gp5B8daN4KWHa07eQ9JU67W2ex
 sc0Zu6NNHaTbvJj4+8xU9kwxiSCiyYjwDDP9iSzuibWewN6uXeW6SDD5v8QipOE3lS8H
 D5PO0o2meq4LONs2sidN2pqqNejVaEnOxtTmvnpIm2RNqoaoe2jnB5gE0lYGBD6jj+1Y
 HhfA==
X-Gm-Message-State: AOAM532PPIkITEd15X5H0Wg935y2420KXI8IZR99YFdsLSxJUBcfzobA
 xV0o6EtSV+MK5MTstZKqn6nZk5f4uAY=
X-Google-Smtp-Source: ABdhPJziIsn+y10wGnnrEVAMvmyztwExnPsHEkPG2KSGuG+u6xzEt1wLP0eYuc0VcjpOzBrDMGtRVg==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr18207537wry.32.1641766779578; 
 Sun, 09 Jan 2022 14:19:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id j16sm4336233wrp.76.2022.01.09.14.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:19:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:18:30 +0100
Message-Id: <20220109221830.1343278-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: drop C++ comment
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit f81242ae4fb64ab85af5d38e70246222276552ae forgot to drop C++
comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index aeb560a498..5a6b067a0d 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -50,9 +50,6 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
-comment "libvirtd needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_NETCAT_OPENBSD
-
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
