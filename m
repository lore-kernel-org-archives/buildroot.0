Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543CBC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4118606CE;
	Sun, 25 Aug 2024 13:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oulh9-ZsdP7Y; Sun, 25 Aug 2024 13:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2139D605C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2139D605C9;
	Sun, 25 Aug 2024 13:56:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 136501BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01EB24013C
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MtV5axV2fzA5 for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4647D4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4647D4004A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4647D4004A
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:56:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSc1L-1sWzHo3FkX-00TmKS; Sun, 25
 Aug 2024 15:55:57 +0200
Date: Sun, 25 Aug 2024 15:55:48 +0200
Message-Id: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOQ3y2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNz3aL0pNzEkqLMCl2z1CRzQ8u0FHMLYwMloPqCotS0zAqwWdGxtbU
 ADpm2yFsAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724594157; l=1347;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=OaPl6SJv9tslvLyVHPcs7OVqBzi5NqDz5IYdCKGc/y4=;
 b=dqC6mU0DAa0U0YeeXQOj0OnIXPLi8dR0vHly7p+FLf+07azZmmn3yKCGIbrae12Y3C3FI55kI
 iXQa8VJkeF1AKhW8DRaUhpHTLY1uSsF7RVUvzwz8VzDh6xXKYl0wdd/
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:/HHLgEsvNq8qmTrIZS9C16AxH1cXdX68ehyK1f6HuhTOlwdBfrV
 ByClEYZ3g5kCCIPk7CiH1rqPADyIrBfgJAqg2jp+GOLXCQanQyHm6W18fhlmwlZaICBvDgC
 CENsKW+t7bnLUrcNJdo21uCMCo4AmwCKt33X4Btk4UrcT05oxdCi8t5pUTtEnn6xTFyPW1w
 vhsoYnfxVEsNZLPgqCClQ==
UI-OutboundReport: notjunk:1;M01:P0:/yReQMteREQ=;sW+p0iuJImBxrCTsy9Q6WSofYJH
 /otWk4VZtSuS07UqlfCpfbqcs7B5Pp/VQCstKdHQvNc4+FEuMyosUwwxwhQMx6L0N1D40TiiF
 UkNcflM08+8cbefXOwei7KluC2bba4NU6csAVPpAH5DDkQPup0I0OY5KKdu7AnuzA8OrfhLrY
 9Ot6hEXz6+QwGdq6NL1HI7+EjxJsIkz9upoq6t2HV1HRYN4YI9LIr0XbXmoL3r7Bckwyb/+KV
 xxQvbiDLv0SfE+j6mXaFPq75PUGzogumQ5jBu3z+89BXCI4DjXJ47NZ+s9MAhRJh7dmDTScPb
 hlrWC8mO6u/5fSy57DaAGNCPtxn5nj4PjGAjDO2G/KwktX2lxMIx2XI2xDKE31QZVm+Vaq8b6
 rNHpg+is5cvQkX/DOEwjwmJ4/+0R02A6o9YTE+4cRny11SK/1u2JaxopiTYrUI8Jvz5uqaoQI
 Z5QSzuljfum5jRaPcHjLi4TQsSNvUxF9RH2sUlewROk0MuxPFkhye3qNnlodAyxxaT+8BrzNj
 DKWWv7W1wNfmYmpqi44PyVylWzaD7jNzwHlhONK6ic95eM64RMODdQ2EX1HfWi/xK9Wvd4THq
 rCUEKSKvJ4+YMonzBb8KaFl8myDJhz4HNUSMDZsgCLLI+MLqn0SCjhQ0vWjkt4Ew4hSnHSh+Q
 IlUSG/pNtZsbdHryI8Y4QsHEDLxySXtwFofbhMaL45xJsuHBK3qsQZapKFEhrj6L9nVVE88kN
 HcPVa9w506AAL8JjWGrnJvbfwAmCgfrkAPytyxT3Oq39lsSpGb6lBGSQzZ4xKyUYQL8g7P9tA
 59H2TKt9w19qbeP4OPov3voQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724594157; x=1725198957; i=j.neuschaefer@gmx.net;
 bh=EYFF2/vV5KYeOuHWpOCpXW7PhvgP+zyPUEF7OiQw5gY=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=L7HHkGLYHFrB7xrcFryBOTwc5J5Gu/TXWzd2difKWn2yxOxRz98hN4eIM3xGkOrl
 qWK36adyM4PKKFWHeQS1iRGNSt/v4IOD2TcFrln8eM2vc58wArC7ZGi1QYPLhckda
 PDFcAGdTx2wClj70/zrdG+C9fTW8ovCYLm6tF7ftk9+o8xdWPikXm7pZbvqe26U69
 pzJR0V1RURhm3/K/mK8SzwTE+HGs1Cd3zsfYDmS5rlIVJIitsxmLrrqfhHBSNvLIq
 iuAC0oNlerW62yJshebVtBwLgI8R6gCV4Tf4kq5jhUU8El5LjpI4t6ngV80VMBzEo
 g68CSWw1QdEyOwPc7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=L7HHkGLY
Subject: [Buildroot] [PATCH 0/3] Version bump and python bindings for
 rpi-rgb-led-matrix
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBycGktcmdiLWxlZC1tYXRyaXggcGFja2FnZSBhbmQg
YWRkcyB0aGUgcHl0aG9uCmJpbmRpbmdzLCB3aGljaCBhcmUgYnVpbHQgZnJvbSB0aGUgc2FtZSBz
b3VyY2UgY29kZS4KCkknbSBub3QgZW50aXJlbHkgaGFwcHkgd2l0aCB0aGUgZHVwbGljYXRpb24g
YmV0d2VlbiB0aGUgdHdvIHBhY2thZ2VzLiBJZgp0aGVyZSdzIGEgd2F5IHRvIG1lcmdlIHRoZW0g
YW5kIHNwZWNpZnkgdGhlIHZlcnNpb24sIGhhc2hlcywgYW5kCmRlcGVuZGVuY2llcyBvbmx5IG9u
Y2UsIEknbGwgZ2xhZGx5IGRvIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KU29ycnkgZm9yIHRoZSBkdXBsaWNhdGUgZW1haWws
IEkgaGFkIHNvbWUgaXNzdWVzIHdpdGggbXkgZW1haWwKY29uZmlndXJhdGlvbi4KCi0tLQpKLiBO
ZXVzY2jDpGZlciAoMyk6CiAgICAgIHBhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4OiB1cGRhdGUg
dG8gbGF0ZXN0IGNvbW1pdAogICAgICBbUkZDXSBwYWNrYWdlL3B5dGhvbi1yZ2JtYXRyaXg6IG5l
dyBwYWNrYWdlCiAgICAgIERFVkVMT1BFUlM6IGFkZCBKLiBOZXVzY2jDpGZlciBmb3IgcnBpLXJn
Yi1sZWQtbWF0cml4L3B5dGhvbi1yZ2JtYXRyaXgKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvcHl0aG9uLXJnYm1h
dHJpeC9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgIDggKysrKysrKysKIHBhY2thZ2UvcHl0
aG9uLXJnYm1hdHJpeC9weXRob24tcmdibWF0cml4Lmhhc2ggICAgIHwgIDMgKysrCiBwYWNrYWdl
L3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5tayAgICAgICB8IDIzICsrKysrKysr
KysrKysrKysrKysrKysKIHBhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1h
dHJpeC5oYXNoIHwgIDIgKy0KIHBhY2thZ2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVk
LW1hdHJpeC5tayAgIHwgIDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA4YmQwMGMxNmQ4YWYyYjRiNjIwYTBiMmMx
MzZlNjgzMGI5ZDZiM2EwCmNoYW5nZS1pZDogMjAyNDA3MjctcmdibWF0cml4LTZlYjcxOWZkNzgz
MAoKQmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
