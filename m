Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4D4C3271F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A403812A5;
	Thu,  4 Jul 2024 19:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUY4QiVmlGNQ; Thu,  4 Jul 2024 19:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B97B812C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B97B812C5;
	Thu,  4 Jul 2024 19:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3001BF983
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD26409A1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nG1pJ-1Tkzs for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D260D40942
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D260D40942
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D260D40942
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:53:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1roTGw3mFy-00cq1o; Thu, 04
 Jul 2024 21:53:12 +0200
Date: Thu, 04 Jul 2024 21:53:09 +0200
Message-Id: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKX9hmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwND3WIz3dzSnJLM5MScHF0j80SDJFPzVBPLpFQloJaCotS0zAqwcdG
 xtbUAD2EAIl4AAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122792; l=1019;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=ICD37VhfWfASov3p+sooC82IVfC9ArRqeWOY6vaTCvQ=;
 b=5r9ra9vjZNcxcG54zE1+0aWiW81l1bfPnoxpfZ7BY/epXBdP9iP10zdQtInybPjcZyHr6oK5n
 AyajUVVrtljDpEYMlcLCxV8W0PjnLzjbcMB7AxfJTPfWvyH+6IY8v8h
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:24q7VainFGCdftzjIv3/gSrJ1ASMjJCHFW8YNyO8bNHeG6Eq5Pi
 251Lbk+PCkYhor812smw7sXLdgYO0u8EwP6taVeu1YRohg3ewPR2hD59+3ax1TzeswiKcs6
 IPh+URjFW1cn+0y8B1ZtjDe21t9Le7YMvD65a/XkautzKskXJLstGQ+sNSM6yPDWXmzVY8G
 eeGhfvEO9foz7/bZZ7FdQ==
UI-OutboundReport: notjunk:1;M01:P0:l0ed/WiBMUY=;7c6LclJPeWW3axG9Wa6rTj95X+7
 HitfXbrmgWHA2MTYW2vR6kRFj4ac4aFlaF7xEK0agreCfj3UzIXqKIcVIO37IhQxMiiBWYU7O
 A8lPjiC+yXcQvqkN/yQpR6bJE39sZRf4+DfyLGqqsxoLaottUke5FCoJDsFs7PORGYb8GhLbf
 RvyWeg27zZfDDIAGGD1pdHRVnTyDvRR0/8r0BVoTafm2fuV5rVCcXalSphdk3RexW/Se6572S
 /BO6od0Ih9sYd+HZ4czvSLfteUssgjjul8x+bMxd2OUA/yiNNhktbU+aSkZ1A8Cr3Evhokb/9
 WM/6TwUBkbppzwzg0zmTVQq0/MhABvUoIeXjSD2CJ8yuMd9rwdzubFzYVMeWr14Gi3ekfdH7C
 KCU5L8b/4HD5ybc0m/uSMWCTeg0Eef83vNpkkP90iztGtqOTzIPcPtJlSosa2dBuB+wsq6QwJ
 +gCmRTLZcbdjOzGTeYiGgaPaXDNbUw3KeWAGJMj3DOhL3H+rRJzebIC2baR5ieMviVwkuAkAY
 FBivmISy+nAppxJQKmcX0s4DvKkioObuN5aZ4poPOiPN07uNZVi6q/50ELBilPkO3/guwF8si
 yvTz9qen7CTfXecgz5BGTKU27Pr5w8qg9J/m+N5gUWnC8ql0a6SkNMdCfweAeTKe+I1D4sGo7
 k5pc0xJHgiDmfk0HDY/5eiXfgelaEpf/UuRihIfLJblXCX5DlcX03lZzTgvBoOHohnFUVl9YT
 zHVIkqlyjbts2UGvEXAI/rh6OjSEyQxWktlSIXGH9JBc7GXqXO6ocOfM/Jgkrk+OC6nyvrWju
 s7rCnGJw1L+ESASt30sMI2/yvv7i7f1XVfhR7oyMBoe28=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122793; x=1720727593; i=j.neuschaefer@gmx.net;
 bh=PXqdIyMXa4Dh4S8ERIEGmNN0OyHrSdhSZt6t76DxuCg=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dh55mZTX3J5C1BYURcx6+Ma57YarTKdBiubse+/f+6ZlY8ExgPOl2X9bMtuCh9lg
 UKlGFe5ZJMSlkN1+UQZjFx/VN+b0vzfeufcn06jdlrty66dQqVeVaCKhlvyf0lYbf
 TpNkroDYKvscmSgx0aakRpsuhLrzQKIj+GI/ONas8mQ7sYowA50EbNczNM11YjCEq
 KaWDyQfQMDtkeo1AWsk7fcmKk2+Xv07/aA6/8mfAmamRqcIItGj8mfGdxBFruvP9E
 NalNS6DEol2FldxeC/WLnKJXG/nS3JIeugu2YGrVBm0rFH5AAb6SSfwLoNDkkT14l
 vG/gqqlseb2T/rbLHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dh55mZTX
Subject: [Buildroot] [PATCH 0/3] Optionally build some skarnet.org packages
 as multicall binaries
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVjZW50IHllYXJzLCBleGVjbGluZSwgczYtcG9ydGFibGUtdXRpbHMsIGFuZCBzNi1saW51
eC11dGlscyBnYWluZWQKdGhlIGFiaWxpdHkgdG8gYmUgYnVpbHQgYXMgYSBtdWx0aWNhbGwgYmlu
YXJ5LCBqdXN0IGxpa2UgYnVzeWJveC4KVGhpcyBwYXRjaHNldCBleHBvc2VzIHRoZSBtdWx0aWNh
bGwgb3B0aW9uIGluIEJ1aWxkcm9vdC4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQpKLiBOZXVzY2jDpGZlciAoMyk6CiAgICAgIGV4ZWNs
aW5lOiBBZGQgb3B0aW9uIHRvIGJ1aWxkIG11bHRpY2FsbCBiaW5hcnkKICAgICAgczYtcG9ydGFi
bGUtdXRpbHM6IEFkZCBvcHRpb24gdG8gYnVpbGQgbXVsdGljYWxsIGJpbmFyeQogICAgICBzNi1s
aW51eC11dGlsczogQWRkIG9wdGlvbiB0byBidWlsZCBtdWx0aWNhbGwgYmluYXJ5CgogcGFja2Fn
ZS9leGVjbGluZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCiBw
YWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLm1rICAgICAgICAgICAgICAgICAgIHwgMSArCiBwYWNr
YWdlL3M2LWxpbnV4LXV0aWxzL0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgOSArKysrKysrKysK
IHBhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsgICAgICAgfCAxICsKIHBh
Y2thZ2UvczYtcG9ydGFibGUtdXRpbHMvQ29uZmlnLmluICAgICAgICAgICAgfCA5ICsrKysrKysr
KwogcGFja2FnZS9zNi1wb3J0YWJsZS11dGlscy9zNi1wb3J0YWJsZS11dGlscy5tayB8IDEgKwog
NiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogM2ViYzdj
NjlkNTY0MzBjMzRlYmE0Yzg2OWQxZDRmZTRkMWU4ZGU1NQpjaGFuZ2UtaWQ6IDIwMjQwNjAxLXM2
LW11bHRpY2FsbC0yN2EwYjU3ZTQ5YmUKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIg
PGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
