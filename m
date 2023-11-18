Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C401C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 16:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ABC282189;
	Sat, 18 Nov 2023 16:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABC282189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcwHqnRmeKJX; Sat, 18 Nov 2023 16:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FE082183;
	Sat, 18 Nov 2023 16:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FE082183
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFBF01BF2F4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 16:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 800B841855
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 16:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 800B841855
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0h4a4UrCgDzp for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 16:27:30 +0000 (UTC)
X-Greylist: delayed 3090 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 18 Nov 2023 16:27:30 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD8141841
Received: from out203-205-251-53.mail.qq.com (out203-205-251-53.mail.qq.com
 [203.205.251.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CD8141841
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 16:27:29 +0000 (UTC)
X-QQ-FEAT: oHWrrGTW1dC2rQ4SYB6o3zego2AKJXPB
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-XMAILINFO: Mi/i+wq2NsJqzhHsIVvRy8M3mxo/XYdsu+X3jTF0zVPbKcJQYqP+hrzl6letiG
 DR8q+8MPjnIzEFFcBYFawhBvPmgM68YK921QSPYr8h3R0fquPTt7qHm3pnz1BlyEtXFy4aUomADLd
 mxLdbyBHqn1y8BGiC/2fPOXBB3MKQJBwf28MU+lLqAC7vhtZNnQw4RyEPMjr+QJV91/gObh+8nGql
 zktzWSc29hOO32II+0q9fLPLIsycu/L54wa1zAyRY51+umR4A4QxIn2QYBqAklJm2RP3rN/wYv+Qx
 DZEuXcHsrj38ybeYWtsrs8w3MNnS58+9JBpgVSG4RUdVUaJC2tucbtB8gVuFUT0GKyoy5dE8uM7/2
 oyttTUzY9IceFD/y0AqqMcxJSPDc9PLJbs0yVjTWoQS1gOfyVua+87X6TtmKegsSmAeayl7orDe6b
 518jFf/mYbLO1mQAHBQibMXNYtyCzqCw8oCMM74s1BrLpKi6t1wmD6K2roSZMxtu6uLNlxiv/7qnh
 2fpNHGUMFYfzLz79f3MibnTwWjHio2ZMXOhu7oX318OpzuMjqLDjyUahgnzbAAPQwPeL/yn9ktdaf
 2osMHrSE3aNGxnHfLN79ICo5Kkw5UXtzHZnkKHHjwfRNxN8KSKAAMdHHLkMyrRZbxG/q6DyE1MvNl
 MddvfvEuGF3Om2ohomZABT2+SkAMJ+pF9+0wX7ZdHH6MBjLgTjVi/NMjI7i9OyT9fQEA7fV2sjJhj
 pCllsLjZwU1cFxJBrGfI6DMxZEV4CwR3LuvSI+ZitWAfeGr1Mw6DmdG8r5VkI2ZEvIhMsam3fHeT3
 9Lj5h0url38lVQ7UfiCmbcj9SXlBDbIZAGGjhv0BgFBW5vg7Teu9i9MYoO+pJ6Oz4fOKwyYapjAJ4
 61hQLkdM0IeAMF/VMjW5Tu3GOGIMkBxGvtiiGpfTuN3vS/GtcFXIS0NEnWIkig0TFufaBCQCDZec1
 uaxwPT1oflgPWPn7ApSdQcEIGaiTY=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 120.245.14.161
In-Reply-To: <20231118162041.GH996011@scaer>
References: <tencent_D6A6E9BF418910070340A731CA97A2A5C606@qq.com>
 <20231118162041.GH996011@scaer>
X-QQ-STYLE: 
X-QQ-mid: webmail281t1700324832t6382734
To: "=?ISO-8859-1?B?WWFubiBFLiBNT1JJTg==?=" <yann.morin.1998@free.fr>
Mime-Version: 1.0
Date: Sun, 19 Nov 2023 00:27:12 +0800
X-Priority: 3
Message-ID: <tencent_DC70840134189F7E29598A6CB2FFE797280A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700324833; bh=S23QZJRXTv1ObFfaupPulwIdVaMv6uJMoj25sfNIpJk=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=X6DDZHuqDuYeRzLTT+ftuUwzEBvxRArcSJRLvU9lCkOSvd85FvlYbkK7THzLtoyeL
 rPd8jJrlpKBjRdCww05WrlDXenyoxYIb6BP4PCoKh+NBJetxl/KdX2GNL/JD1PxqXS
 kac4kZfZFtg2A702H3w1wgoOqVG0sA/3u9W+Dy/A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=X6DDZHuq
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO
 library wiringX
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
From: hanyuan-z via buildroot <buildroot@buildroot.org>
Reply-To: =?ISO-8859-1?B?aGFueXVhbi16?= <hanyuan-z@qq.com>
Cc: =?ISO-8859-1?B?cy5tYXJ0aW40OQ==?= <s.martin49@gmail.com>,
 =?ISO-8859-1?B?YnVpbGRyb290?= <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4312870962969938132=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============4312870962969938132==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_6558E5E0_153B4120_4651AEA9"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_6558E5E0_153B4120_4651AEA9
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGVsbG8gWWFubiwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIGFuZCBoZWxwISBOb3cg
SSBhbSBtb3JlIGNsZWFyIGFib3V0IHRoZSB3aG9sZSBzaXR1YXRpb24uIFRoaXMgbWF0dGVy
IGNvdWxkIGJlIHRlbXBvcmFyaWx5IG1hcmtlZCBhcyBzb2x2ZWQuIFRoYW5rcyBhZ2FpbiBm
b3IgeW91ciB1bmRlcnN0YW5kaW5nIQ0KDQoNCllvdXJzLA0KSGFueXVhbg==

------=_NextPart_6558E5E0_153B4120_4651AEA9
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGVsbG8gWWFubiw8ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBmb3IgeW91ciBwYXRpZW5j
ZSBhbmQgaGVscCEgTm93IEkgYW0gbW9yZSBjbGVhciBhYm91dCB0aGUgd2hvbGUgc2l0dWF0
aW9uLiBUaGlzIG1hdHRlciBjb3VsZCBiZSB0ZW1wb3JhcmlseSBtYXJrZWQgYXMgc29sdmVk
LiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgdW5kZXJzdGFuZGluZyE8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PllvdXJzLDwvZGl2PjxkaXY+SGFueXVhbjwvZGl2Pg==

------=_NextPart_6558E5E0_153B4120_4651AEA9--


--===============4312870962969938132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4312870962969938132==--

