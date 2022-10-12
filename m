Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9016FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 17:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A3F61081;
	Wed, 12 Oct 2022 17:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A3F61081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEyEdY4oHcQ7; Wed, 12 Oct 2022 17:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD876107F;
	Wed, 12 Oct 2022 17:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD876107F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C641BF2AF
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 17:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 525AA4056C
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 17:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 525AA4056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xn2uqp0zwKdV for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 17:30:52 +0000 (UTC)
X-Greylist: delayed 02:27:59 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 373AE40142
Received: from 5.mo550.mail-out.ovh.net (5.mo550.mail-out.ovh.net
 [178.33.45.107])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 373AE40142
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 17:30:52 +0000 (UTC)
Received: from player690.ha.ovh.net (unknown [10.109.138.120])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 820E521E09
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 16:51:24 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 94CB02F8226B5;
 Wed, 12 Oct 2022 16:51:22 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 18:48:31 +0200
Message-Id: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17332947592034577387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpledvrddugedtrddvuddurddukeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0068bfb2f00-ed29-49d4-a6c0-34af38af5dba,
 FE9F4EF6251822EA91E95D070B5353786FA8A9F2)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: proper output on host
 without jq installed
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

T24gaG9zdCB3aXRob3V0IGpxIGluc3RhbGxlZCwgdGVzdC1wa2cncyBvdXRwdXQgaXMgYXMgZm9s
bG93aW5nOgoKJCAuL3V0aWxzL3Rlc3QtcGtnIC1wIG1tYy11dGlscwogICAgICAgICAgICAgICAg
ICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiB3aGljaDogbm8ganEgaW4gKC91c3IvbG9j
YWwvc2JpbjovdXNyL2xvY2FsL2JpbjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2Jpbjovb3B0
L2JpbjovdXNyL2xpYi9sbHZtLzE0L2JpbjovdXNyL2xpYi9sbHZtLzEzL2JpbjovdXNyL2xpYjY0
L29wZW5jYXNjYWRlL2JpbikKSlEgSVMKT0sKICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1h
cm12Ny1nbGliYyBbMi82XTogd2hpY2g6IG5vIGpxIGluICgvdXNyL2xvY2FsL3NiaW46L3Vzci9s
b2NhbC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L29wdC9iaW46L3Vzci9saWIv
bGx2bS8xNC9iaW46L3Vzci9saWIvbGx2bS8xMy9iaW46L3Vzci9saWI2NC9vcGVuY2FzY2FkZS9i
aW4pCkpRIElTCk9LCiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMv
Nl06IHdoaWNoOiBubyBqcSBpbiAoL3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Iv
c2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi9vcHQvYmluOi91c3IvbGliL2xsdm0vMTQvYmluOi91
c3IvbGliL2xsdm0vMTMvYmluOi91c3IvbGliNjQvb3BlbmNhc2NhZGUvYmluKQouLi4KClNpbmNl
IHRlc3QtcGtnIGhhbmRsZXMgdGhpcyBjYXNlIHdlIGNhbiBoaWRlIHRoaXMgZXJyb3IgbWVzc2Fn
ZSBhbmQgaGF2ZQpwcm9wZXIgb3V0cHV0OgoKJCAuL3V0aWxzL3Rlc3QtcGtnIC1wIG1tYy11dGls
cwogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiBPSwogICAg
ICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwogICAgICAgICAg
ICAgICAgICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBPSwoKU2lnbmVkLW9mZi1ieTog
U8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgot
LS0KIHV0aWxzL3Rlc3QtcGtnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbHMvdGVzdC1wa2cgYi91dGlscy90ZXN0
LXBrZwppbmRleCA0ZWJmZDlhZjY2Li5lN2Y1NDY0ODE3IDEwMDc1NQotLS0gYS91dGlscy90ZXN0
LXBrZworKysgYi91dGlscy90ZXN0LXBrZwpAQCAtMjAxLDcgKzIwMSw3IEBAIGJ1aWxkX29uZSgp
IHsKIAogICAgICMgVmFsaWRhdGUgdGhhdCB3ZSBnZW5lcmF0ZSBwcm9wZXIganNvbiBhcyBzaG93
LWluZm8KICAgICB7IHRwdXQgc21zbzsgcHJpbnRmICc+Pj4gUnVubmluZyBzaG93LWluZm9cbic7
IHRwdXQgcm1zbzsgfSA+PiAiJHtkaXJ9L2xvZ2ZpbGUiIDI+IC9kZXYvbnVsbDsKLSAgICBKUT0i
JCh3aGljaCBqcSkiCisgICAgSlE9IiQod2hpY2gganEgMj4gL2Rldi9udWxsKSIKICAgICBpZiBb
IC16ICIke0pRfSIgXTsgdGhlbgogICAgICAgICBtYWtlIE89IiR7ZGlyfSIgaG9zdC1qcSA+PiAi
JHtkaXJ9L2xvZ2ZpbGUiIDI+JjEKICAgICAgICAgSlE9IiR7ZGlyfS9ob3N0L2Jpbi9qcSIKLS0g
CjIuMzcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
