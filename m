Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB7C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 17:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D6280FB7;
	Mon, 19 Aug 2024 17:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZs7BDYRY4fN; Mon, 19 Aug 2024 17:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C6480FB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C6480FB9;
	Mon, 19 Aug 2024 17:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23DC91BF3E0
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 17:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C2D880FB9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 17:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYey134pF0Ks for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 17:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A5AB80FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A5AB80FB7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A5AB80FB7
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 17:53:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.228]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1sI58V0ClT-00oS6w; Mon, 19
 Aug 2024 19:53:00 +0200
Message-ID: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
Date: Mon, 19 Aug 2024 19:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
X-Provags-ID: V03:K1:YU+zTKI3g3whfa83LuLJEz6V+00k/ArT1kyEVXlHuNdDryUYDNM
 +xdYf6l+Hf+UuRkmrWWColSWC1ZAsJcoCuAUW8crUSE5mSs8doP2I43rCRRcrr2cWCES/ws
 IOZ0p4pZkzSqYzmW5C6nTnWlG0jpG09l0d9d0nb2c00iiWQEbXdBZ62l/xGlm4zthAGdUgr
 mDLTNn8nQAAVble0LqxCg==
UI-OutboundReport: notjunk:1;M01:P0:vAY/1ZCtQPs=;M8oFUhHWg2X7dokwfVRDcCQs2bT
 U66VVBgWjk/XzoDEZjPHf+zWIxDvTv376fEztapBLBDUb/gogstj0l8nnY3RJTv/C41HwJ/Z4
 F+FOBylHdVk+mVmxEmlP6m4B7dszOlKoy4Tz+Y/6z90sX6hKvcezfMXRNaH4IMms9YeQDVCM3
 Zp4DcXTrOxiVJ8vX+K5Jlzt0EgEo4e/Cq+Vv1rAeokMhFQj34KCv+TujnqZtO2WAIQg0qBS8s
 pLz3E8WoxcbPIme0aFVKpwNmouX6SO/sgFxasoScIuZj17g35Ae5hhiaABND/BSfYq9Gwk20/
 z/tsI+cnV27BLzAHWOQQTIDegcFBUwL2A6t/Iq41W48OKUySjJs+jJDVd9ZFpEKNBGXhNUUmk
 +gzOWoB/RV0vaFi2pf68hpBOPqB30QJWlaiXbRmUb+1+THR1FYzRlHuFTDTShAICp8fEzhbar
 rhJIKhQ9mCTIyg3UfBm7bdf0clRZid/ux69pcfshCgDY3APvtoV9k+Ppgh+/rKyfj7FMVQuTe
 q0eoGdWGDEMZN1z5DnWI2imbMqxmxCnCsXMV++sKwbldWDHB9Bz6Vi9tBp9dwAa6QBzN+vvIR
 4MmVIubzw89KIJ0/yOhZ478tBO7FQub5InNniDjyBrOz+gnZ/8RtVMZjX/FYzTEWFqDQpmuG4
 AcPiXKj3j50jMLWzYmxpXGNh0VULVWDS7ProwTe43Xzw8qVRmO68O8TokPzaF6FmQDfo1p6ND
 XNUcN+F4iHhHYMTLFRgFI36WtVHQEpC1n8X5d2eA2rGc5HXOuEKttcXQZXxSs0/gZLos1O2yD
 DvFBziWK3yBQCgM0P8LHy1ug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724089980; x=1724694780; i=fiona.klute@gmx.de;
 bh=1thkSu0cF9j3AUlTjndLxdaoskz3hCDXHqQ7qzkLODI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
 Cc:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UBDQr1QKHluaFk+XcL+soCsSXKXr7cggl7431THVYiZvaSfi1uBpFV+YTrFtHIUy
 jIWonQbkFEWD34RVO08KlID7mSTk5RA9siqMfsFvp4JaP9RgzZAPlkluWN7q8VsSH
 dtfaYjjhZgfs6jkoSQS1NP58G3gTYEKXFDnthUR7C2gP3oFw09mBOl0p3Jtf8QIFR
 BnChkKSp5wQAGv3Xj8AGmGW6rECjfFpU2f2gpUKqK9tZFrMKJw3RnYG3o2Bx1iM1Q
 pWs/MAjZX9Bgtn2oBk+hB9FyGlSCShnX8FcxKtgg0sseDNCuoCuoN3az1Lbj3A4yD
 6kJI1HHk4ZpeTftdYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UBDQr1QK
Subject: [Buildroot] GLib/GObject-introspection bootstrap
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

I'm currently trying to upgrade GLib & GObject-introspection to their
current versions (1.80.4 and 1.80.1), not least because those work with
musl without patching. The difficulty is that GLib now needs a sort of
bootstrap process:

* Build GLib with -Dintrospection=disabled
* Build GObject-introspection
* Build GLib with -Dintrospection=enabled

Description in the GLib NEWS file:
https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438

What would be the preferred way to implement this in Buildroot? Is there
a built-in way to rebuild a package with different config after building
another package for such situations? Or should I include that bootstrap
build of GObject-introspection in libglib2.mk (like Alpine does)? In the
latter case the GLib package would share the source archive with
GObject-introspection and I remember reading on the ML that there's
support for that, would be great if someone could point me at it if
relevant.

Also, when I prepare patches, should I just drop the glibc requirement
for GObject-introspection, or add musl? I have no idea if it works with
uClibc. Likewise, are the checks for (ancient) GCC versions still relevant?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
