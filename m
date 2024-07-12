Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D48BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2619611D8;
	Fri, 12 Jul 2024 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 714KVNQsnW74; Fri, 12 Jul 2024 12:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B75D060BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75D060BBE;
	Fri, 12 Jul 2024 12:50:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 859D41BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F5DD40438
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak9XD_seOIxX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9873402C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9873402C7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9873402C7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1sfoP43f3D-00VWCv; Fri, 12
 Jul 2024 14:50:09 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:50 +0200
Message-ID: <20240712124956.3925574-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:5+LJ0U020J3AK0IVLSO9LS1h07N9fRrwraVN7/b/WGB7dPVhkRD
 qd1zOrTXkVfb6JfiSKovEXXrGeHftYMq6oFXlDAmFWGykR6WMv1afJLXRFpv0YWymU7TVBR
 64nafgYV0QzppAtd5p1yRr9lr05Xka/bpPe85dbQXbGLrwiEDHXchv9MdTzwI7vdJULYQ0B
 BpafB32wlUsjJMnpImJIQ==
UI-OutboundReport: notjunk:1;M01:P0:NDj5gfdJ6uI=;TzPbgmSshKfmURZGPLaCO9j+pKJ
 yciHAo7NqpdIRMSunk4EzCYvZLbVEpodw+TfDchLaHmmoGP/unH+WT4Ms84pLo9D9uTUgB+bF
 YskYF844OzHqF2e28AHh/EUehGQzOcI8EkxdvE3RG0DpMWqMymvhwia91paxv7UcQDxovdriW
 X3xvLkF4PuX/TwI9OF/88P+iybL0q2rTKDSbaip0WlpR7bfMC5H82dS6qURxxvutnhZLTo17O
 1kYLDlq0RvHLMBbu405Iv504aCjqMcZ6ktkmTWEfR4KjbZab7Ef2/w20sXB8z/zLc6sG03Plz
 buHefu7zTEruZU1PYD3NW3kIxvs/9+tzR4j2eo9TjXpOOGlzQRxLTxpv+JTgJk3hjEHG9ZGES
 khLVp7aLygGz4/E3g1y7OiOHnOIGG0k99GUSblDJL8uLaQ0aMVkw1I/ZD+5cQM27YWYA6/sGG
 TNgZx1w2qT+z58wM6z5+brgHDUtOLXKcQkGM0vUALOE5H4cmyiEf5qVVg+VNyfshQZIdstHbr
 vqElcKRi7IzCLT3qs+tkvHMjZbdnj6XWSUio8FZ2pwCRGukc6C3EYDnFEwdjUA0P38Ppr6ehk
 cynt3ICMKuaI/GbF9V6ZXpEuhO6a7MqX34BhJnRpkzRN6p2GrsbnbRUAXPl/17wXKkTx1Cbtl
 3mfPa3kWDnlxyTznmgxhXWAcEGmmOZLdESNBx53q57D71eVQA8wrrBGq0D4OwnPsagCavH68x
 jnJvVdnAgVZ2AuBvotdS6G99uExk0mOgdVW9Zhzk2CvZNU9Z3Kc/0CYakzIs3z3dEfFCehpPc
 0wWm2VTDPd8EWNpYKfTia38A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788610; x=1721393410; i=fiona.klute@gmx.de;
 bh=DjqWU98fk/tpzwyokxnTEr2cswOc7rDIKsOfW9KUZ1s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Npseolpvb22EwGLPUQ4pVmAq8ahzykBr7/T8Ws/agW4ytrtZJcYJ5tvCShZ3ausX
 6oZLHmAFwvvhC+RmEiqOxqpgXd5VwDaBwSpLYrZJBw3XBym2Nrm0mrX4ippndU4+3
 m8ofm1cQrmhReBcqRT6bEsrJGaRlhnDSpbFRuZVtDJPrQzRke/6zcGjdf/0KUO56k
 Z9jN3wl5RmlcT75d56ImusY5x6nqE0pW6esMXJma/vb/8tQnbmk47Lu4EWkR3Qvuv
 KzSgTYj/oyBAWz3D59baKW6Rd68edejn5ZABP9c8GNYo9ZukrEYT9koxw+X6a6gRS
 sr8CUANPp5nil9ESHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Npseolpv
Subject: [Buildroot] [PATCH v2 0/6] Update init script style
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

As discussed on the mailing list [1] init scripts may rely on the
default Buildroot options for Busybox and other base components being
enabled. This allows using long form options to start-stop-daemon in
init scripts for readability, among other things.

This series:

* Documents reliance on Buildroot defaults in the manual (patch 1)

* Updates the reference S01syslogd script to follow this and other
  good practices (patch 2 & 3)

* Updates a few other scripts I've had to do with recently to follow
  the same style.

[1] https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/

Changes v1 -> v2:
* Update the manual paragraph below the reference script to match its
  style (patch 3)
* Use start-stop-daemon --stop --test to check if the service is still
  running during stop (where the service does not delete its PID file
  on exit, patches 2 and 5), instead of poking at procfs

Fiona Klute (WIWA) (6):
  docs/manual: describe relying on default options
  package/busybox: tidy up S01syslogd init script
  docs/manual: include S01syslogd from source
  package/openssh: tidy up init script
  package/dnsmasq: tidy up init script
  package/network-manager: rewrite init script

 .checkpackageignore                        |  1 -
 docs/manual/adding-packages-directory.adoc | 65 ++-------------------
 docs/manual/integration-principles.adoc    | 20 +++++++
 docs/manual/integration.adoc               |  2 +
 docs/manual/manual.mk                      |  5 ++
 package/busybox/S01syslogd                 | 18 ++++--
 package/dnsmasq/S80dnsmasq                 | 64 +++++++++++++-------
 package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++
 package/network-manager/S45network-manager | 41 -------------
 package/network-manager/network-manager.mk |  2 +-
 package/openssh/S50sshd                    | 12 ++--
 11 files changed, 163 insertions(+), 135 deletions(-)
 create mode 100644 docs/manual/integration-principles.adoc
 create mode 100644 package/network-manager/S45NetworkManager
 delete mode 100644 package/network-manager/S45network-manager

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
