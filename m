Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 07:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDEB403F8;
	Fri, 26 Nov 2021 07:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMzto6v0sDqa; Fri, 26 Nov 2021 07:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19585403EC;
	Fri, 26 Nov 2021 07:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1D21BF395
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C69780C84
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amidHobe427B for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 07:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9780180C7D
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 07:33:36 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id gt5so6658824pjb.1
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 23:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:message-id:subject:mime-version
 :content-transfer-encoding;
 bh=3NA7sBFspO9zj3uInyJXZ/LiWHESRj2Es+NDM9XgHHM=;
 b=jQ4F/l/pWjwpAlY5CPgVpkvXjeqSeaYp7h2n6Q0wkzeRiex0EudMbg7b+oR0PSPIAs
 F+B8WBBiI1iDI4P04JIEYAyT4M0QtM14Yw4HfbcGO43MtHPSDh23TorlL2fPWW03QkgN
 DQh1OT+Vi1A+Sb71CrVwlMGmCH/bTwjA9PC509HamwtWRCQMgF2qBuLh0ILqtkmlAHEH
 lGVRSLP4crYfnJ/JhnTd0yf6mSu6ijvMS0z6Sti25KbL9jMz2Dw8xVmqMITKqXxEdnmq
 mnosi9ibMgBtNExfWarBf5ycEKGFn3DwrZTnL8jWsxygB4emz9ji+Dh5TKlo3UuFYQXm
 /ubw==
X-Gm-Message-State: AOAM532MO0+hZb97oQdG4BOXydVwRxT/Cd4fiVmMaAYOPNfox2DMTEYU
 52c0PKD+csRKuEl28+L0taND2AqgtaIbEQ==
X-Google-Smtp-Source: ABdhPJz//0J18JiWVl8SCc+mdE4lXNyBlqqW9dw5okLYbtrmO9EP2pj0JvM/n6Djudx9v3mxdTDwSA==
X-Received: by 2002:a17:903:230d:b0:141:e3ce:2738 with SMTP id
 d13-20020a170903230d00b00141e3ce2738mr35445913plh.57.1637912015917; 
 Thu, 25 Nov 2021 23:33:35 -0800 (PST)
Received: from GI-0403 ([103.129.252.60])
 by smtp.gmail.com with ESMTPSA id o23sm5457957pfp.209.2021.11.25.23.33.35
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:33:35 -0800 (PST)
Date: Fri, 26 Nov 2021 15:33:34 +0800
From: kelly.devilliv <kelly.devilliv@gmail.com>
To: =?utf-8?Q?buildroot=40buildroot.org?= <buildroot@buildroot.org>
Message-ID: <DA4933D9-0555-4EE2-9423-A697BFDEA99B@gmail.com>
X-Mailer: MailMasterPC/4.15.8.1002 (Windows 10 20H2)
X-CUSTOM-MAIL-MASTER-SENT-ID: C5C07DC1-9F6C-43B8-92CD-B88CE579B416
MIME-Version: 1.0
Subject: [Buildroot] =?utf-8?q?How_to_uninstall_packages_that_already_ins?=
 =?utf-8?q?talled_in_output/target?=
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
Content-Type: multipart/mixed; boundary="===============2198147920487637686=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2198147920487637686==
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCiAgICA8bWV0YSBodHRwLWVxdWl2PSdDb250ZW50LVR5cGUnIGNvbnRl
bnQ9J3RleHQvaHRtbDsgY2hhcnNldD1VVEYtOCc+DQo8L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZT4N
CiAgICBmb250ew0KICAgICAgICBsaW5lLWhlaWdodDogMS42Ow0KICAgIH0NCiAgICB1bCxvbHsN
CiAgICAgICAgcGFkZGluZy1sZWZ0OiAyMHB4Ow0KICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9u
OiBpbnNpZGU7DQogICAgfQ0KPC9zdHlsZT4NCjxkaXYgc3R5bGUgPSAnZm9udC1mYW1pbHk65b6u
6L2v6ZuF6buRLFZlcmRhbmEsJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyBsaW5lLWhlaWdodDoxLjY7Jz4NCiAgICA8c3BhbiBzdHls
ZT0iY29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kSwgVmVy
ZGFuYSwgJ01pY3Jvc29mdCBZYWhlaScsIFNpbVN1biwgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6
IDIyLjRweDsiPkRlYXIgZnJpZW5kcyw8L3NwYW4+PGJyIHN0eWxlPSJjb2xvcjogcmdiKDQ5LCA1
MywgNTkpOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buRLCBWZXJkYW5hLCAnTWljcm9zb2Z0IFlh
aGVpJywgU2ltU3VuLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjIuNHB4OyI+PGJyIHN0eWxl
PSJjb2xvcjogcmdiKDQ5LCA1MywgNTkpOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buRLCBWZXJk
YW5hLCAnTWljcm9zb2Z0IFlhaGVpJywgU2ltU3VuLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDog
MjIuNHB4OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNDksIDUzLCA1OSk7IGZvbnQtZmFtaWx5
OiDlvq7ova/pm4Xpu5EsIFZlcmRhbmEsICdNaWNyb3NvZnQgWWFoZWknLCBTaW1TdW4sIHNhbnMt
c2VyaWY7IGxpbmUtaGVpZ2h0OiAyMi40cHg7Ij5UaGVyZSBpcyBhIHByb2JsZW0gd2hpY2ggY29u
ZnVzZWQgbWUgZm9yIGEgbG9uZyB0aW1lLiBXaGVuIEkgZmlyc3RseSBjb21waWxlIGJ1aWxkcm9v
dCB3aXRoIHBhY2thZ2UgJ0EnIGVuYWJsZWQsIHRoZW4gaXQgd2lsbCBpbnN0YWxsIGFsbCAnQScg
cmVsYXRlZCBmaWxlcyAobGlicywgYmluLCBlLmcuKSBpbnRvIG91dHB1dC90YXJnZXQgZGlyZWN0
b3J5LiBUaGVuIEkgZGlzYWJsZSAnQScgaW4gbWVudWNvbmZpZyBhbmQgcmVidWlsZCwgYnV0IHRo
ZSBwcmUtaW5zdGFsbCBmaWxlcyBzdGlsbCByZW1haW4gaW4gb3V0cHV0L3RhcmdldCBkaXJlY3Rv
cnkgYW5kIGFyZSBiZWluZyBwYWNrZWQgaW50byB0aGUgcm9vdGZzLiBIb3cgY2FuIEkgdW5pbnN0
YWxsIGFsbCAnQScgcmVsYXRlZCBmaWxlcyBhZnRlciBJIGRpc2FibGUgdGhhdCBwYWNrYWdlPyBG
b3Igbm93IEkgY2FuIG9ubHkgZGVsZXRlIHRoZW0gbWFudWFsbHkgb3IgY2xlYW4gdGhlIHdob2xl
IHByb2plY3QgYW5kIHJlYnVpbGQgaXQgYWdhaW4uPC9zcGFuPjxiciBzdHlsZT0iY29sb3I6IHJn
Yig0OSwgNTMsIDU5KTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kSwgVmVyZGFuYSwgJ01pY3Jv
c29mdCBZYWhlaScsIFNpbVN1biwgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDIyLjRweDsiPjxi
ciBzdHlsZT0iY29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7
kSwgVmVyZGFuYSwgJ01pY3Jvc29mdCBZYWhlaScsIFNpbVN1biwgc2Fucy1zZXJpZjsgbGluZS1o
ZWlnaHQ6IDIyLjRweDsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDQ5LCA1MywgNTkpOyBmb250
LWZhbWlseTog5b6u6L2v6ZuF6buRLCBWZXJkYW5hLCAnTWljcm9zb2Z0IFlhaGVpJywgU2ltU3Vu
LCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjIuNHB4OyI+VGhhbmsgeW91IGZvciB5b3VyIHRp
bWUuPC9zcGFuPjwhLS3wn5iALS0+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4=

--===============2198147920487637686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2198147920487637686==--
