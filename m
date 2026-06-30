Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A87C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 14:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9191560609;
	Tue, 30 Jun 2026 14:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhl4-Qp1IRmx; Tue, 30 Jun 2026 14:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74AC460634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782829705;
	bh=gW6DM8BNnR9JsZYJCnP1j8oZ9Db2kgmfUJRS7arvOlo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZHs3w8f4XxzWZzoJP5lCIXs/u0YQqGaaHeoTS5MU1TPKCy+Yoc2dOcDcqUA7voB2/
	 qMGrd8oGpvm3OJH+gHvr+w63IWfxTwGRIQ6yKhuJsbYMa3Zl4PdqawXYma4YLOldnU
	 gwl8Ghh5f6isJ9nuR9M7CQBQ8/pLGqtDyLDioWQQJ6im4sco4i3vBWi3d6ROsusV8H
	 pXPRaHEZWtPD0LBxmkTx+u2rN228leqp/F0PsEJVx9c1dSemBqUjIVTcjYoi0nky5+
	 jj5UUs+8t105nriJZcKTDJaa3bvNOxKh2h9joGE3S3yvRx3cZEOADXgynyy6mO/V1u
	 OaRLWaFujiVHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AC460634;
	Tue, 30 Jun 2026 14:28:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFAE149
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4AD382969
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGOYKflQlYnL for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 14:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70D0E8248F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D0E8248F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70D0E8248F
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:28:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1xNIKf1yFR-00bv6U; Tue, 30
 Jun 2026 16:28:20 +0200
Message-ID: <089eb61b-f255-418e-a6da-e3923aef8e34@gmx.de>
Date: Tue, 30 Jun 2026 16:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260626204520.328944-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20260626204520.328944-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:NC9vxw/gbJX6EFDANStQYfs75vUXZ8JTWauMvaiJGrzYHffM8V5
 5/mI/1V6xoQ9QJkgDh1MNanuPxRw93FbkZYzGQzy22kB29qEU/pbpu9gmyjCsy5fCXR7quJ
 VDcwZh57FWwO/kTh6vnpRc83jm6W6nYwpAK+qmHVBWW0Bg9zz1h4hSUUMSnhvg++l2I9LYC
 v3iU7EkfDcZg/F2OIS7Gg==
UI-OutboundReport: notjunk:1;M01:P0:2YsvNjTEVMI=;vUxyOSg2+FTw4dDBlsHPAORu3fN
 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
 r89sd05VTV7CojwoYBgFD6QR7S/NLz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782829700; x=1783434500; i=fiona.klute@gmx.de;
 bh=9Pfr+L8qNA+2Jb4IEW9ma/V4cnWSqcn1vD6/HSYNivE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=B8epMdU44TVsTjLIH4Yd2G95eexFY66rHOH2LjaCknWbTBktobV3b0SpI1BuHhRJ
 6Lhzilrn/81Jiulmed0gZb5zPykKVQPR5W2kH74RAnTUGeiLu6Nq68lGCljah9qUM
 x4148y9NwDVtfTGwVHjD6XINDyzVSKwCK1ZXNYCtvtOksoHv0hAF8/giTBQcHUsxX
 AwMW+SGm/qfzymXo6FTvFDSE29SUw4vnnglffDz/Ja6OJPQG3lpBtkNsg0CviivXu
 TwPHon5K9ldNTVIJuOt+bOqnvyb5WOX1l1wlSnlARyciKHgaIgDJGvnth7VLjxHQe
 dtrEdv9x9nZ2mvatnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=B8epMdU4
Subject: Re: [Buildroot] [PATCH] package/sudo: backport patch CVE-2026-35535
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.06.26 um 22:45 schrieb Thomas Perale via buildroot:
> This backport is provided thanks to the Debian community [1].
> 
> - CVE-2026-35535:
>      In Sudo through 1.9.17p2 before 3e474c2, a failure of a setuid,
>      setgid, or setgroups call, during a privilege drop before running the
>      mailer, is not a fatal error and can lead to privilege escalation.
> 
> For more information, see:
>      https://www.cve.org/CVERecord?id=CVE-2026-35535
> 
> [1] https://salsa.debian.org/sudo-team/sudo/-/blob/debian/trixie/debian/patches/0006-exec_mailer-Set-group-as-well-as-uid-when-running-th.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thank you!

> ---
>   ...-well-as-uid-when-running-the-mailer.patch | 147 ++++++++++++++++++
>   package/sudo/sudo.mk                          |   4 +
>   2 files changed, 151 insertions(+)
>   create mode 100644 package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> 
> diff --git a/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> new file mode 100644
> index 0000000000..0bfcdd6f93
> --- /dev/null
> +++ b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> @@ -0,0 +1,147 @@
> +From 3e474c2f201484be83d994ae10a4e20e8c81bb69 Mon Sep 17 00:00:00 2001
> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> +Date: Sat, 8 Nov 2025 15:34:02 -0700
> +Subject: [PATCH] exec_mailer: Set group as well as uid when running the mailer
> +
> +Also make a setuid(), setgid() or setgroups() failure fatal.
> +
> +Found by the ZeroPath AI Security Engineer <https://zeropath.com>
> +
> +CVE: CVE-2026-35535
> +Upstream: https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + include/sudo_eventlog.h      |  3 ++-
> + lib/eventlog/eventlog.c      | 21 +++++++++++++++++----
> + lib/eventlog/eventlog_conf.c |  4 +++-
> + plugins/sudoers/logging.c    |  2 +-
> + plugins/sudoers/policy.c     |  2 +-
> + 5 files changed, 24 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/sudo_eventlog.h b/include/sudo_eventlog.h
> +index eb9f4f4..485d259 100644
> +--- a/include/sudo_eventlog.h
> ++++ b/include/sudo_eventlog.h
> +@@ -80,6 +80,7 @@ struct eventlog_config {
> +     int syslog_rejectpri;
> +     int syslog_alertpri;
> +     uid_t mailuid;
> ++    gid_t mailgid;
> +     bool omit_hostname;
> +     const char *logpath;
> +     const char *time_fmt;
> +@@ -151,7 +152,7 @@ void eventlog_set_syslog_rejectpri(int pri);
> + void eventlog_set_syslog_alertpri(int pri);
> + void eventlog_set_syslog_maxlen(size_t len);
> + void eventlog_set_file_maxlen(size_t len);
> +-void eventlog_set_mailuid(uid_t uid);
> ++void eventlog_set_mailuser(uid_t uid, gid_t gid);
> + void eventlog_set_omit_hostname(bool omit_hostname);
> + void eventlog_set_logpath(const char *path);
> + void eventlog_set_time_fmt(const char *fmt);
> +diff --git a/lib/eventlog/eventlog.c b/lib/eventlog/eventlog.c
> +index 5a32824..d56c4e4 100644
> +--- a/lib/eventlog/eventlog.c
> ++++ b/lib/eventlog/eventlog.c
> +@@ -304,15 +304,13 @@ exec_mailer(int pipein)
> + 	syslog(LOG_ERR, _("unable to dup stdin: %m")); // -V618
> + 	sudo_debug_printf(SUDO_DEBUG_ERROR,
> + 	    "unable to dup stdin: %s", strerror(errno));
> +-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +-	_exit(127);
> ++	goto bad;
> +     }
> +
> +     /* Build up an argv based on the mailer path and flags */
> +     if ((mflags = strdup(evl_conf->mailerflags)) == NULL) {
> + 	syslog(LOG_ERR, _("unable to allocate memory")); // -V618
> +-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +-	_exit(127);
> ++	goto bad;
> +     }
> +     argv[0] = sudo_basename(mpath);
> +
> +@@ -331,11 +329,23 @@ exec_mailer(int pipein)
> +     if (setuid(ROOT_UID) != 0) {
> + 	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
> + 	    ROOT_UID);
> ++	goto bad;
> ++    }
> ++    if (setgid(evl_conf->mailgid) != 0) {
> ++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change gid to %u",
> ++	    (unsigned int)evl_conf->mailgid);
> ++	goto bad;
> ++    }
> ++    if (setgroups(1, &evl_conf->mailgid) != 0) {
> ++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to set groups to %u",
> ++	    (unsigned int)evl_conf->mailgid);
> ++	goto bad;
> +     }
> +     if (evl_conf->mailuid != ROOT_UID) {
> + 	if (setuid(evl_conf->mailuid) != 0) {
> + 	    sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
> + 		(unsigned int)evl_conf->mailuid);
> ++	    goto bad;
> + 	}
> +     }
> +     sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +@@ -347,6 +357,9 @@ exec_mailer(int pipein)
> +     sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to execute %s: %s",
> + 	mpath, strerror(errno));
> +     _exit(127);
> ++bad:
> ++    sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> ++    _exit(127);
> + }
> +
> + /* Send a message to the mailto user */
> +diff --git a/lib/eventlog/eventlog_conf.c b/lib/eventlog/eventlog_conf.c
> +index 0663a38..ec3b569 100644
> +--- a/lib/eventlog/eventlog_conf.c
> ++++ b/lib/eventlog/eventlog_conf.c
> +@@ -70,6 +70,7 @@ static struct eventlog_config evl_conf = {
> +     MAXSYSLOGLEN,		/* syslog_maxlen */
> +     0,				/* file_maxlen */
> +     ROOT_UID,			/* mailuid */
> ++    ROOT_GID,			/* mailgid */
> +     false,			/* omit_hostname */
> +     _PATH_SUDO_LOGFILE,		/* logpath */
> +     "%h %e %T",			/* time_fmt */
> +@@ -151,9 +152,10 @@ eventlog_set_file_maxlen(size_t len)
> + }
> +
> + void
> +-eventlog_set_mailuid(uid_t uid)
> ++eventlog_set_mailuser(uid_t uid, gid_t gid)
> + {
> +     evl_conf.mailuid = uid;
> ++    evl_conf.mailgid = gid;
> + }
> +
> + void
> +diff --git a/plugins/sudoers/logging.c b/plugins/sudoers/logging.c
> +index bd4de92..9535289 100644
> +--- a/plugins/sudoers/logging.c
> ++++ b/plugins/sudoers/logging.c
> +@@ -1157,7 +1157,7 @@ init_eventlog_config(void)
> +     eventlog_set_syslog_alertpri(def_syslog_badpri);
> +     eventlog_set_syslog_maxlen(def_syslog_maxlen);
> +     eventlog_set_file_maxlen(def_loglinelen);
> +-    eventlog_set_mailuid(ROOT_UID);
> ++    eventlog_set_mailuser(ROOT_UID, ROOT_GID);
> +     eventlog_set_omit_hostname(!def_log_host);
> +     eventlog_set_logpath(def_logfile);
> +     eventlog_set_time_fmt(def_log_year ? "%h %e %T %Y" : "%h %e %T");
> +diff --git a/plugins/sudoers/policy.c b/plugins/sudoers/policy.c
> +index f3adfb0..27f6e58 100644
> +--- a/plugins/sudoers/policy.c
> ++++ b/plugins/sudoers/policy.c
> +@@ -639,7 +639,7 @@ sudoers_policy_deserialize_info(struct sudoers_context *ctx, void *v,
> +     }
> +
> + #ifdef NO_ROOT_MAILER
> +-    eventlog_set_mailuid(ctx->user.uid);
> ++    eventlog_set_mailuser(ctx->user.uid, ctx->user.gid);
> + #endif
> +
> +     /* Dump settings and user info (XXX - plugin args) */
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 8602e62b0b..e28f7815f9 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -12,6 +12,10 @@ SUDO_LICENSE = ISC, BSD-3-Clause
>   SUDO_LICENSE_FILES = LICENSE.md
>   SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
>   SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
> +
> +# 0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> +SUDO_IGNORE_CVES += CVE-2026-35535
> +
>   SUDO_SELINUX_MODULES = sudo
>   # This is to avoid sudo's make install from chown()ing files which fails
>   SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
