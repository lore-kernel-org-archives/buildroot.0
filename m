Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE5E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A724059A;
	Fri, 26 Dec 2025 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go-CXd3Esc26; Fri, 26 Dec 2025 16:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 810DF404B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766765241;
	bh=5h16OLWLLWbrtNHtB6rPXrniCXmx4C1wuUs3F9AFl0E=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EC6+Pib8Nxwkof57jg3Vf6/88KPUJ0rd6aZkiyhqcR2hjtELCHxcbxLvQXMfouTiT
	 V7Ox77NQgsJm4jCaB/uYwahoVxzU/FZsZLi9itB5re+AM9OEoYLcTP9s9W9OSwrmyh
	 QTdqWC9rWEocz9yFDrNXQKKz9hbq45BqTGw+vI2+Dyz4ts058HSa5GoJ0b+myvndVC
	 do8bAcZZkYxjWzeCIQ3K8+OE6IxpY3ypg/wR5y+jVSBarEWf127X0gte7ywIfFXEUK
	 As462nevvZjJsV8n1DGyIpnRoCNtCmb+063hgn4HPG8JBa/QegrBL9E3H9MyNwrIMl
	 MGcQF3FTAegZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810DF404B7;
	Fri, 26 Dec 2025 16:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1293119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A37404B7
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xloqytRRTMLq for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 16:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F5BB4035E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5BB4035E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F5BB4035E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:07:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.100.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1vqQ523dHX-00wQD9; Fri, 26
 Dec 2025 17:07:15 +0100
Date: Fri, 26 Dec 2025 17:07:09 +0100
Message-Id: <20251226-rgbmatrix-bump-v1-0-69c2aa62beaa@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK2yTmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3aL0pNzEkqLMCt2k0twC3TTDVNPUZBMjk7QUIyWgpoKi1LTMCrC
 B0UpBbs5KsbW1AJ6nTSplAAAA
X-Change-ID: 20251226-rgbmatrix-bump-f1e5ec424fd2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766765235; l=1329;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=0TGvs5JfmDu209OqWAOI55XMYMCufpBr637SrdybqNk=;
 b=zDRh7VNrL+9E3JWTH6dgNFpMULwXI0Q8wCM1vLG/OEDnJKHMCg8khW3OwUlFn6TQS+nigD1zl
 80pX3KqSLjSAE+tyFmisFxUw0zk2ilbgAcxKJx2eJn/unVUZ2ih4r3D
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:+yIj+U9jTBSRH7w4K+vxtVHDnWGiNP0puHS/OzHMFxTCFUpN2t3
 PlcZpOLtlYo4Bx1eigYFJTKPuF+j42BTuAu3YB4iqBXGF3ggJhUY7DjQ3KeAg0HQNl5O9+V
 JHCbAqmDELNbgfBA7w2g8Ui/wdqNmChc7MCd32+VD7Nc6M0OIPttu9TQumaCmZ6k4IWyYyt
 KR4PNzsJnFrABNrLDDkXQ==
UI-OutboundReport: notjunk:1;M01:P0:O8b18HjxHhU=;dsCkeepakvt+xdJk6sLpHYGlOqK
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766765236; x=1767370036; i=j.neuschaefer@gmx.net;
 bh=t1LDX70866Qy0mhRXKuXcIVdWhxrdx+SX0P48HGCSEg=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=olRg2GWakhiPWQ8kFU1k9kHlmHNPPbsKgetCPPk8IaihUUwhWIaYoLSBN2EEFAZ8
 JVfy03k/1xABlm7Vg8T/1mVZudD9xZtyZ8p2DE3SOJqxu54UjUwwTwA9r1zBTTVeo
 5H0G4k5Ji4H3WOfVamUgmJ8xsNdQEMwVqpD4yAHWxSCK4fdbq0id6Hh3JRRZga9a8
 SCKIDMWdwpYcGLiqizmZqsBxxKGZkuWxryI17xrFV6MNZNMTHuNw4xmz6lj6yM/FG
 Szz/NOQH/ZCBz46+Uh3gAqs5mPfb6JX5H+FhC2xnCXzxvTbpMyUZ0EvFoiGFxImyp
 We4hLep4jROS07ao6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=olRg2GWa
Subject: [Buildroot] [PATCH RFC 0/2] Update package/rpi-rgb-led-matrix
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBicmluZ3MgdGhlIHJwaS1yZ2ItbGVkLW1hdHJpeCBhbmQgcHl0aG9uLXJnYm1hdHJpeCBw
YWNrYWdlcwp1cCB0byBkYXRlLiBPbmUgdGhpbmcgdGhhdCBzdGFuZHMgb3V0IGlzIHRoZSBhZGRp
dGlvbmFsIGRlcGVuZGVuY3kKb24gcHl0aG9uLXBpbGxvdydzIGxpYkltYWdpbmcgaGVhZGVycywg
d2hpY2ggcmVxdWlyZXM6CgoxLiB0aGUgcHl0aG9uLXBpbGxvdyBwYWNrYWdlIHRvIGluc3RhbGwg
dGhlIGhlYWRlcnMgc29tZXdoZXJlCjIuIHRoZSBweXRob24tcmdibWF0cml4IHBhY2thZ2UgdG8g
cGljayB0aGVtIHVwLgoKSSd2ZSBtYWRlIGFuIGF0dGVtcHQgYXQgdGhpcywgd2hpY2ggd29ya3Mg
YnV0IGRvZXNuJ3Qgc2VlbSBvcHRpbWFsLAplc3BlY2lhbGx5IHRoZSBmYWN0IHRoYXQgSSdtIGlu
c3RhbGxpbmcgdG8gJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUKcmF0aGVyIHRoYW4gLi4uL3B5
dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS4gQ29tbWVudHMgYXJlIGFwcHJlY2lhdGVkLgoK
U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkouIE5ldXNjaMOkZmVyICgyKToKICAgICAgcGFja2FnZS9weXRob24tcGlsbG93OiBpbnN0YWxs
IGxpYkltYWdpbmcgaGVhZGVycwogICAgICBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeDogdXBk
YXRlIHRvIGxhdGVzdCBnaXQgdmVyc2lvbiAoMjAyNS0xMi0yMikKCiBwYWNrYWdlL3B5dGhvbi1w
aWxsb3cvcHl0aG9uLXBpbGxvdy5tayAgICAgICAgICAgICB8IDYgKysrKysrCiBwYWNrYWdlL3B5
dGhvbi1yZ2JtYXRyaXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICB8IDEgKwogcGFja2FnZS9w
eXRob24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRyaXguaGFzaCAgICAgfCAyICstCiBwYWNrYWdl
L3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5tayAgICAgICB8IDQgKystLQogcGFj
a2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lmhhc2ggfCAyICstCiBw
YWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsgICB8IDIgKy0K
IDYgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKLS0tCmJh
c2UtY29tbWl0OiA2MWNhNjdhNWIyMDJjM2I4MTA4OWFiYzMwZjY3YWE4OGVkZjczZGQyCmNoYW5n
ZS1pZDogMjAyNTEyMjYtcmdibWF0cml4LWJ1bXAtZjFlNWVjNDI0ZmQyCgpCZXN0IHJlZ2FyZHMs
Ci0tIApKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
