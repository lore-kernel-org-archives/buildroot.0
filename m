Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41F7CD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DBF407A1;
	Sat, 31 Aug 2024 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3iHiERh-5IB; Sat, 31 Aug 2024 19:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22AF4407AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AF4407AF;
	Sat, 31 Aug 2024 19:19:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B420F1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C4740247
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyxdqR5cZGWw for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E8834022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8834022F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E8834022F
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:19:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.123.38]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1sdDYo2CLq-00QRZA; Sat, 31
 Aug 2024 21:19:28 +0200
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:19:19 +0200
Message-ID: <20240831191919.370005-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Yg8Lwn6pRrCJznXV7lDYfqfEEqjJPHKGZu8gsk/KDZroMBITYE+
 U2Fvz/gbnOxf6kIvZZkB4rUVTaMK/CyJdZJCcBjSGGartEW/ue+WriR1otpkDrCgNBzRvRk
 i80r5WTYJGrORNelvJIbESQXAeXkaCrWQDcSu9ZhLuVToEeJ4R/vcJvXnVS0NAO18Y3NpCt
 rdMTeLXqm6GvloRBVt2TQ==
UI-OutboundReport: notjunk:1;M01:P0:UnapHZFvzQg=;QdbPDkPDeLsXioPfOiLmFSU/vPJ
 ibfKoL3URFGQrD67MTFcXt9ziKurv/fxiNIK+wpbPIl0xSnMnJk5Y1zyI/a5VnpDRUO/Np0uZ
 vzdYcA4XLBcqvj+fUKUv81stufj2zgqEw7lTlqKU6bn4oJQi3MyapNAA4Tl0lFcpaXHSpPwCF
 AnwFApW2Xkefnpp/tx5AVtZZNC7mg2WCYTwObrRbhB1sopWQMgKo1PlYe797RxnFSgQhTc/ZO
 e67pkAelDToGXgRWutNsG2Wh1QHNc51E2xyVE4nAt1GMy7Wp83h4Uum17pmuBkIQFWFQLg83C
 iAJr62MekscedOxtvg1ijVo/9GETlBNLgm2aeHF0VTMV/9cd0bHoVDqxjMEdpkgy1NA9zIKDz
 TaSm9K3FNHzVCpdhecSlBOnBQghD7LvRIL8PYdBx5+wil8f3C4kIq99NsNc2vYHXHBuJOw4vc
 Je4bBVXPK4E/mY7R7T3cwxaZQpp4p/F/CB1nQZVmH/CapP4xadOFdgOMA5WDMHIJqW9akUQ9Y
 GVYlRGAMImcW0+zICa9kQguk9MVnHlzfp7BBbPCm1iTjd03kBoXWbXWbvaREsjvHdLYk2am7A
 +frfvUu9wwgW0l8zA/qDwVfrKavCOAAbURcEN0fOnuKo1MpBjG8qn5UrRITxLPT5wJDr3cKEk
 V/Fe6wgQkmj/hqFRgwowBgS0UFiJUUTsZq/PkJxjf4ODbr+7KuH9JLaGbUROs50VJnHWq3EbN
 6JLiFpQ7SdY8I6ASNLCTqtePc/9GInaeFU7c2bZRx8D2y1ZyUQMI7yayNzx4MV6cQqiOsRx/v
 nvXOrlKTqdxiivQusOZD64NA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725131968; x=1725736768; i=fiona.klute@gmx.de;
 bh=vyz510CiflbbEEN2OunjajfMxr9abvHemqmMDWXTc2w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Xn9wdwqMsNS93/wAbT9rCg/x1XDpiA2Lr5knE7CidhqGBYQJk9RtZ7NfzDryMcWn
 m4+Ahy2VLbuGIRJDtE3B+1FEiFJmUbCw67P0LopyexlyWILUSVfw2+AmRWWn1STY8
 BijIpzlyogmOSdru7sIDIu8fIQO4SZOdYX7jwjjVNyX+IMl9bAdKRIfqiUWysNozY
 OZLwghemRCFsEpVnTWfRPNMXWlYVDTX6YHMiL3JaoK5neYdygQ2yDESLdso+HIKd/
 r7h5bVQsGDi1YRfARelx3eaEqSy9azSvDWv4SWMMhKRhS92m//BlngthyaFQv2KiM
 5X2CMOAg8GLGOK6eTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Xn9wdwqM
Subject: [Buildroot] [PATCH next v4 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The BR2_EXTERNAL environment variable is passed into the container,
and each path listed in it mounted. This allows using external trees
when running a build using utils/docker-run. Testing the existence of
the variable instead of a non-empty value allows passing an empty
BR2_EXTERNAL variable to disable currently set external trees.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Brandon, I've dropped your reviewed-by because the changes from v3 are
significant and counter to what you suggested in previous
reviews. Feel free to re-add it (or not).

Changes v3 -> v4:
* Split BR2_EXTERNAL on spaces OR colons
* Revert changes to mountpoints processing loop

Changes v2 -> v3:
* Use read to make the loop that creates mount options more robust,
  removing pre-exisiting shellcheck override. Suggested by Brandon
  Maier.

Changes v1 -> v2:
* Correctly handle spaces in external tree paths

 utils/docker-run | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..9579f83ce2 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi

+if [ -v BR2_EXTERNAL ]; then
+    docker_opts+=( --env BR2_EXTERNAL )
+    for br2_ext in ${BR2_EXTERNAL//:/ }; do
+        mountpoints+=( "${br2_ext}" )
+    done
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
