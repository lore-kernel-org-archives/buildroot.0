Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B121CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 115B44118F;
	Fri, 30 Aug 2024 12:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bahumVZu4beg; Fri, 30 Aug 2024 12:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B377541185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B377541185;
	Fri, 30 Aug 2024 12:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72A011BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EC1740346
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThfJOT-p_y-8 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F9E1403C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9E1403C0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9E1403C0
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:26:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.139]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbIx-1st38e2Ff9-00BIzD; Fri, 30
 Aug 2024 14:26:55 +0200
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:26:34 +0200
Message-ID: <20240830122637.3722450-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830122637.3722450-1-fiona.klute@gmx.de>
References: <20240830122637.3722450-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fVaD55mVWz24Z8BT8UfJojSC5WiSn+r36qych6cBbxKiBanpK9y
 dwd6RtB7L+tchzVX0kbL5qwcm1XuMeiTMAcxCSfvJ4C2BZOseCVhDxBON6rdZbNvvxZAEMO
 XvcwMhrrALneT4Jhhgskaztrp5g010HXwhZaYNtxy4nsBgUTPqlyYzQSYB7xaEW2rDKgxU1
 50dDiodzRBrfcA7Wtx06g==
UI-OutboundReport: notjunk:1;M01:P0:VR0Z/m1yfm0=;mDnBg8rrHDE6Wtz5b+CplCoPxeo
 afAKZHjMvZqh9CP0cf+yn5cthxdmSFb7PzLEpkjmh5YwDNswYZ0Y4yab2T9KImq9kXHEswDca
 cCYVWeUlSpL9V7C7umfrM798q5Mekv/WfURpkoJxb7COD7UiswZmuwKJfvrYXatwKAqQIuNfc
 DWLmP/GKWvk2CIuBvJGR9ltUsD6uyiaNO8cD0uswhJz5DLjcApOMVfldQzJ2kyN3CepLigpmr
 f5gyW/hF/bqg40aESelNh/5Fto6Xo8S4wrp3xHWld5lNq0NiTgJosB0c/9a/Bhc7GIRsiPpXm
 IsWXODpE9InSkFn60ZQybb3Y0N/gSxTtxrp7fpnYdw4RXTUzkR/AdKkTLuf2Lm01wXn9tcakl
 8r+W/oiWZGa31/AZ+GABmPC28LBx4Jh9H0MoHQJEiVFsMKq8/g0hneJKiyia5L/XJ65p4Mqtu
 8Xbto74d4bC56fPEx/plPXlcbERjdaJ0iC+04a+gj50saTrO47WzaMXyx6gD2it0M/zHvWbz6
 dGtmUOi7q6cxvzSgpq8/Fl9wucFbIxktETe+NHqxtZfS16cW8tNifazk1tE8ws38ZgD0bYEHl
 cqoNDVwIgPZ5+aumcGptlK9D1qTTrSsgwE5WG0gPQ+rn2yD+Xv9AEkjhR7Givr2PiqoE7xW25
 MG0/7xpsnUzACRAw3v8TIaktgYAuztePPVa70UL3kJBA1oqYdeuqNHxO7+9TR+6iC02+dsgww
 c4WDLUJkWtEHAuPIReqqTwULNRZNWqjoHGtV9p9pMbRYEXz/bJaSl76jEqtEvUwwvY2ldVrWZ
 Zr7HWq4tOif/NEhrTc2iy+7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725020815; x=1725625615; i=fiona.klute@gmx.de;
 bh=LJzflpzY0O9h5SzQ+dHizz32S4HrQ0FYF6/46Mxpl5A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UjgQ2RVIoXFY+ADitGxFnlfzwCekHV0PabUMBHFnjee3W8+i/Ukbry2XbMoku4V8
 z24aRlHHoSxbSsOaUey7CKK276pVd6LSq2z1uOhAXgo8qOB7liyFdprjWFlZvNf8d
 33StFFBwKUKyb80jXwoSXMqh+EkzdFBD+WWol2m3yCkXbnzl5/L4uOVkPU69jJlFv
 /4ewjOkN+JemXRnoz/nClgZszR0Np43tGKlnviSXOT89ynapPGi5aKo0mCpXp+nKF
 twDMbbkp8pARK0hS4sZ7KUf1fXcVKxkUxMFpiiTHj4mk4l9AX7Gb5yjlqy6GL9r0D
 ah6+luZXgxtudN/ABw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=UjgQ2RVI
Subject: [Buildroot] [PATCH next v2 3/3] package/network-manager: optional
 gobject-introspection
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8349b6c79b..785976a0aa 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	util-linux

 NETWORK_MANAGER_CONF_OPTS = \
-	-Dintrospection=false \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
@@ -50,6 +49,12 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif

+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += -Diwd=true
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
