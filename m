Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B86C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E47406AF;
	Mon,  8 Jul 2024 22:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBlb6qWY55lM; Mon,  8 Jul 2024 22:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D3B406B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D3B406B0;
	Mon,  8 Jul 2024 22:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76F641BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60F90406AE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGiiP01CmNeW for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFFC5404A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFFC5404A9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFFC5404A9
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1snw3Z1QCa-00NjVS; Tue, 09
 Jul 2024 00:45:37 +0200
Date: Tue, 09 Jul 2024 00:45:32 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-1-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1162;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=BJSiYLeecrISifAXilZX07ptnm+/RZN3tYrqBE9lfAo=;
 b=AHqjHN8wzwNGM/LAPJS+xdyBxmHYLu5+TAWd++evc2V7aGgbXeOr5bm4Cuu7twJO6d8NaMV/j
 23kAph9LVPbASQ8dN/kVUQ/2yx6Xip8mONXIbi1CEwie/dNG6IG/NWg
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:saf8jr5zwn/0Qyf9MQPXXaItqVoBABnD2HO0RyMiFHRY3ju2DYw
 k5yMCwwURowYZkPbrbQ2VQFD+/99MfBVBCUhq5ErDeXLgv4UODaCFGVzwJ+4Tbw+LhU+MMb
 LXhYSTB1Fh8G4FYSeCnmh7IOotzJukd50fJHRuM7BSp/Q2JpDRqIHuQx1XXx6IKnbzRDP4D
 mM7mgv+aViS17lb2/6kxA==
UI-OutboundReport: notjunk:1;M01:P0:JzB08PS7o9M=;N47ryQ8AgjrllBucx93E1/IiUAa
 BOE4i9svOBptRuQwNIv1aznYzV8WNwNKPkBvBve3u/mk6d1dSkA9QNkChab8Uf6rkyBFeR42/
 yIhYCkp+O8Hh1nTCAZKBZE1XNaBmXXkMXSXCKJkAIrreMiH4+wRzvy5vrzM+nRN+GOQ7apzuO
 aQLod2B198qx2cJZH5B+aIz4bzecJvQit9gWw76DLxGclCUW/XkwKXTCiY47iiwyUYQN/JumF
 H+uKsRrnTihXeB+B6H3C/1aTGaPpi9phhytHYas7rJ61uK8HXAlFfRGWScUgmG16behle7jTE
 +0kx9lVc5OpH+pmhP7vm1aQtgwUEgGH/k/kKpA+SjVFdNBsgdF3ytteJfEq4dSEawn48oTB76
 2frEicDBUgAgYk0sXT9aW/9FH7Hwph6QACmjQZrTF7nFhFqf6hj+BcsLhPMmqmesRdXM8azhM
 L6CAwM3Koc4F8h2O4qRb0FRLPCuGNuDXh82Fx+/9W+QzY8/e515a0gju5J9TDc69qRRydTzP0
 Zk7Id9Mobq+vU/b4bL4O2P4CITGTtsia1vQprGmze5sysCHFxebC4XrlCxzthi9w709xwp0tf
 o2JOH4Yatvu8A6PbS8KBRjQr4t/HfFKv2mJ0W9kM1FVrBKbJenfhiMPkF/2xAQPDr8F81vaue
 5Kde9JKv5cRDhHiOd8BabpbJpmAwrPNAXozRt84keZpL9sx7A/7hs/mrvLwm/SHv0PISmcsNl
 2U0muSN7Fzdy1QtRvXNQHil2GHLja7UW4exwC1WMW5nxRFg5eSPDTiOs0TRGm03esQ5LpxPEA
 6OUqLL770E4L+ql8CthObjp3BRY1TzcIO6jRJHi+P8/kI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478737; x=1721083537; i=j.neuschaefer@gmx.net;
 bh=myinIF/2v7RkkFqfyQg0OhRVt5kpLFckuE8ewkTADI4=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VqjYimz7AxRs8cj76Utd1+dMatKmAzg36Tnce8Th4VfSxan1OFYOHbe6EovIi7T2
 dpKYS/DxKFTwtsXnfn2+qW8oaiiPHiV0EJzOPXnZdinu+ryxa3NJzEvGUVDFibobr
 DBHX8kkDSp0jSEyHfqY5hPqShJD1+ePYwmocrr/FzzEl1pI79wvlsAqPvXBmQee3Y
 WXaz1FyCykox4R+q1N6hixll9pWQsjDwkElFdWihAK01FirOUDjfOPPGT+RaV6qZJ
 n8Nl6iO764g67Bdg2qbHgZ3nyYbq/JmsZAEyh1pV05fDus/xgvthBjJZ48Z4E/ylk
 A//ZN3Y6zPRK5m14dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=VqjYimz7
Subject: [Buildroot] [PATCH v2 1/8] skalibs: bump to version 2.14.2.0
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

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CiBwYWNrYWdlL3NrYWxpYnMvc2thbGlicy5oYXNoIHwgMiArLQogcGFja2FnZS9za2FsaWJzL3Nr
YWxpYnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2ggYi9w
YWNrYWdlL3NrYWxpYnMvc2thbGlicy5oYXNoCmluZGV4IGQ4NzFlZTY1MDMuLjFlNmJkOTY2NzEg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2gKKysrIGIvcGFja2FnZS9z
a2FsaWJzL3NrYWxpYnMuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBnZW5lcmF0ZWQK
LXNoYTI1NiAgYjZiNzliODE2ZjRiYTBiNjgwMTY3NmIwZWQ0MTc5YjU5YzhjNzgwOWVlZmZlMjZk
YjY3MmU0MDQ2MzZiZWZjMyAgc2thbGlicy0yLjE0LjEuMS50YXIuZ3oKK3NoYTI1NiAgZGRmZWM1
NzMwZTViMmYxOWQwMzgxZWNmN2Y3OTZiMzlhNmU0NzMyMzZiZGEwYWQ4ZDM3NzZhM2ZlN2IwN2U0
MyAgc2thbGlicy0yLjE0LjIuMC50YXIuZ3oKIHNoYTI1NiAgZmRjOTMxMjk1NTI1ZGQwMDA5Y2Rm
MzM5MTg5Y2JlY2QyMjhkNjVjZWZlMzM0MDJmMDM3ZjliMDQ2ZjA3OTg5ZSAgQ09QWUlORwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9za2FsaWJzL3NrYWxpYnMubWsgYi9wYWNrYWdlL3NrYWxpYnMvc2th
bGlicy5tawppbmRleCA2N2UzYzY5NGZjLi40NWYzZTE1YTdiIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3NrYWxpYnMvc2thbGlicy5taworKysgYi9wYWNrYWdlL3NrYWxpYnMvc2thbGlicy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotU0tBTElCU19WRVJTSU9O
ID0gMi4xNC4xLjEKK1NLQUxJQlNfVkVSU0lPTiA9IDIuMTQuMi4wCiBTS0FMSUJTX1NJVEUgPSBo
dHRwczovL3NrYXJuZXQub3JnL3NvZnR3YXJlL3NrYWxpYnMKIFNLQUxJQlNfTElDRU5TRSA9IElT
QwogU0tBTElCU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKLS0KMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
