Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A091C43334
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 14:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF8C840A06;
	Fri, 17 Jun 2022 14:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF8C840A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sz_U2jVTSbAC; Fri, 17 Jun 2022 14:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0864E405F4;
	Fri, 17 Jun 2022 14:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0864E405F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8941BF373
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 14:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061C44242E
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 14:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061C44242E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znqek4YTNFkr for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 14:13:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444D942429
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 444D942429
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 14:13:50 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1N63NW-1ndysd3cMa-016Nbx; Fri, 17 Jun 2022 16:13:47 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Jun 2022 16:12:02 +0200
Message-Id: <20220617141202.2260-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:f+7xAmgo16mL7UMlLLzgh+8GAEw5fmEOWCVBG9B3tXdDUj2E1dY
 TM+RlBT+54W+jRU/QbSN9Tb7CjfJisERvNWOPirBQtCYpTuiXCioyRsj3my6VQO0oXpQntk
 FcikPU1pq6BE/iwkDSBI1Vu+jqpJwQeGMg119NOUpbwJPrs+70uWOyP5KjKY5cMVbhwxCdk
 aIntMb/7gJk+O0C7QEvqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z5OoZtZnDAI=:CyPzlmQCF/A9zxAWj98pV+
 D2tjM5LjBAXa10LOGY8SEKMxPP3nhv6V2wm/23z7xaqK/cugZ7IALbIGyoPrQ1hhCL3UlOjG0
 pXR5IQmD9wlLaD98aznaCetJSrLjlQ2BuWcYByGs4UFixzmsahCv3MP8yQOSB7L9DS73SUmSS
 /TRHZswWpYA6Ve/PIHvb1v93M7Qg317xf9Ok1wu018tFATzhkdHkMWsuPh4O2/JRk/iAdpq9+
 TTvsl3SPzpoFvFWdg9X673GhH6EDWaSArYoCbzy5lG59n9euv0Mi2uTOF3Ka7fd5pUdLtneng
 ouAqs6CZR9TKhaSYrtjuD5GOyJHQwGJxlIIeV3SdLApcWRw+fAizzYMiBKl9QJvjSe64TZR5y
 uNnb1y0JjBApFuPsom9n5C1r1Tqi9vzoaeqZJN8Qzkz10vOkfmzBcKWxYOAqR3dpr+pjMZkK0
 jGVVJNkAkjNXyUIcqOvpC+dMp1KX4bJXvSHUA9xyTmWOBy0lKel+JGxOJ/6c4WI45ue3uYDNg
 LdLK9hj60nss1No/TK8j88tUuW9OLm4/Q0BZvJjptnBQIbNTFxX1yMrPML0w8HxY92baOeuN/
 mL9kyntODnVWdorvV8kfjNp/TSWnGJ39x+8wcv+AD9CspUEO0ID3niJ0WMZaoc0bzP7D81XuG
 kQnTGGzhA3Wle/0zgV7OkAUnSs66qW4L6p7l3VNQGxT8e4c5EPhPpUsY+dwtRseyInyAlVcZs
 rkJOWOFi+pcN6VBQNRhEgLGAe8hFiZ3l9474sgQ7RFn5YNasp6ap1pALY6iLCjApu+BAZQ5kb
 Dv1Wf6P
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix GNUism in
 S05avahi-setup.sh
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzY3JpcHQgdXNlcyAiY2hvd24gdXNlci5ncm91cCIgaW5zdGVhZCBvZiB0aGUgUE9TSVgg
ImNob3duCnVzZXI6Z3JvdXAiLiAgVGhlIGZpcnN0IHN5bnRheCBpcyBhIGRlcHJlY2F0ZWQgR05V
IGV4dGVuc2lvbi4KU2luY2UgY29yZXV0aWxzIDkuMSwgY2hvd24gc3RhcnRlZCBpc3N1aW5nIGEg
d2FybmluZyB3aGVuIHRoaXMgc3ludGF4IGlzCnVzZWTCuS4KClRoZSByZXN1bHQgaXMgdGhhdCBp
ZiBib3RoIGF2YWhpIGFuZCBjb3JldXRpbHMgYXJlIGVuYWJsZWQsIHRoaXMgbWVzc2FnZQphcHBl
YXJzIGR1cmluZyBib290OgoKY2hvd246IHdhcm5pbmc6ICcuJyBzaG91bGQgYmUgJzonOiAnYXZh
aGkuYXZhaGknCgpbMV0gaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2dudWxpYi5n
aXQvY29tbWl0L2xpYi91c2Vyc3BlYy5jP2lkPTIzY2NhODI2OGQyMWY1ZDU4ZWQwMjA5MDAyZDU2
NzNkMDUxOGM0MjYKClNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2F2YWxsYXJpIDxuaWNvbGFzLmNh
dmFsbGFyaUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4KLS0tCiBwYWNrYWdlL2F2YWhpL1MwNWF2
YWhpLXNldHVwLnNoIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdmFoaS9TMDVhdmFoaS1zZXR1cC5zaCBi
L3BhY2thZ2UvYXZhaGkvUzA1YXZhaGktc2V0dXAuc2gKaW5kZXggOTBjY2JjZWFjYy4uMmY1M2Ex
OTJlNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9hdmFoaS9TMDVhdmFoaS1zZXR1cC5zaAorKysgYi9w
YWNrYWdlL2F2YWhpL1MwNWF2YWhpLXNldHVwLnNoCkBAIC01LDcgKzUsNyBAQCBjYXNlICIkMSIg
aW4KIAlpZiBbICEgLWQgL3RtcC9hdmFoaS1hdXRvaXBkIF07IHRoZW4KIAkgICAgcm0gLXJmIC90
bXAvYXZhaGktYXV0b2lwZAogCSAgICBta2RpciAvdG1wL2F2YWhpLWF1dG9pcGQKLQkgICAgY2hv
d24gYXZhaGkuYXZhaGkgL3RtcC9hdmFoaS1hdXRvaXBkCisJICAgIGNob3duIGF2YWhpOmF2YWhp
IC90bXAvYXZhaGktYXV0b2lwZAogCWZpCiAJOzsKICAgICBzdG9wKSA7OwotLSAKMi4zNi4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
