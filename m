Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE66C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9929460F41
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9929460F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9E740330;
	Sun, 14 Nov 2021 13:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLlSaWCKBGfT; Sun, 14 Nov 2021 13:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E5240329;
	Sun, 14 Nov 2021 13:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96D0A1BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F92A80E48
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiMRygF8TWDj for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1DE180E46
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636898243;
 bh=wNKi7yXwY5nnDMJ/xxFheHn2AcF+eSXp1zFva5Lanww=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LxjB0RmM27egAKfviJa3T6JiRQmX8BNGRDLmRMURpEbANKXjwFu5SwJY7GebE7++H
 MOYaET8Ro+VH5oPT4V8Z1RSSlbbuZUWEAJ2NdvGhnljsL/Nf3vTnEVvCY9GeUC1Epl
 O2V6K//kJP7Fs3aHftTSidNdNbHpGnIcmDUFCMwE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1mZphp2Fz0-014h5H; Sun, 14
 Nov 2021 14:57:23 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:57:22 +0100
Message-Id: <20211114135722.12386-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:QxUhhVITlhh0uI9dRnVrVN2SYBaibDZo/zr1WlKJ4dw2COninaC
 N/WAcpfN2v/jtVisTj2N6wRwEJixVfjxRwmmmGK3cg33ekI39Chr/8gPCRxYVKBws0LAuyp
 b/Oyo4pf6SGItygg2w/jpvh7sdr0mZ0Oo4G4qMp/pSNjWSTqcwvRmtIFSB2De4b8ReAhWW5
 wdoc7uBy2Mkrkj0Ll1wTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XyyGTe7NhQg=:vwGCsRzfDIK2MRHucmb6/8
 SKrbuiBjlN0P6lOatxEyTUHTctL9oZTZ5q4IoG2699ebcMyNJr6Hx6zueNkcxoRkX0CqY5tfQ
 BwKn5AsqzoOEblgAHiNrTvwYOdkKcAUYjSo57OXBXNONlRjjrEM7zJDqqXwA485RAJCTjl09N
 7mQc0Dsl/q6qJ4m4Zt3PzWnuNlpxCVUdMAfQh4bPpic8Q/wslXnsSUsysMEY+j/OpM6NNlN6e
 YdCOlGrN0xyfIlhSCjZ0zSr035nBPNccoBGkK5rE11SXcyxoHZ7rUgtWTBIND9rra0h2+zRbZ
 g9cfkkVdET3kOlfyjKk+DjgyDh5dNdze28ruScRgFiOTBMgcZvy09X3vPqLgYXPKha5Xy2PlP
 9j+7OC5ipW/dJ6GTZdUIHXDbnFlYUsGa33+GTLHIH3HvP2MiovEBkLgT7x5IYBUSGTf6UHLrm
 /YvS97Ka53Y7T8LDzHto1PagaJ9s7VEuNwj6Mo+H7b+/knT98r55TJAdk2weQ4jRahzcGYQts
 T5zbVTDWii+pIOlE90BiQ7bk9AdpOnqCc3DbLJCt6CZzmkHs7nl8SEIX4JIoeakM8uRvW5wK5
 iWBNFcONfLdGBjIGEOpHXZ2eyFKquYa+xDoF9E2Yu7xnODGM+n+j/pd3zFGZW2znaCekb71fL
 StytpIikJ8pY4fUJxwimjl3T5zD03J0+b/zJBcuNQkJArHAnH+hfVy4+65v1TFuqxxXk8O874
 MIlgG1Wt+Jxfxqu3lHqhPkNc3G0OCOKWOPp/+ztfc2lWkSUfoUClWwLk4URhsB437FpIl02tF
 CIDircIS/nvVzUD6HeWpFvRzIxllnOM6CdxP1X7re6NKoFxyvxYbluMwauniJwq2kDFth2uLz
 3/QKd8uu9vdN7d3bYwXewFMCm8kyqlahimpHz0Juy2qHBBO50Gtpmaqkwc3m5M9WPJdYFMso8
 8lNxoeolOPhGqH1TewKfmYp+TCIEfWBpUreW24aH5JMDFstTkX2JF4lQKBaDlNjUXQzQnDJZm
 ckh2Gkkzkz84FmDntZYvCSeV728cSXa0K7fD1XZtGJ42bQelArXs9GJhRDShdAo+54IQVJWzw
 or/Kf3SuLrvVeY=
Subject: [Buildroot] [PATCH/next v1] package/qt5declarative: move the qt5gui
 select from qt5declarative to qt5quick
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
Cc: =?UTF-8?q?=D0=9A=D1=83=D0=B7=D1=8C=D0=BC=D0=B8=D0=BD=D0=BE=D0=B2=20=D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9?=
 <kuzminov.sergey81@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgcmVxdWVzdGVkL3N1Z2dlc3RlZCBieSBTZXJnZXkgS3V6bWlub3YoWzFdKSBtb3ZlIHRoZSBx
dDVndWkgc2VsZWN0IGZyb20KcXQ1ZGVjbGFyYXRpdmUgdG8gcXQ1cXVpY2suCgpUaGUgcXQ1ZGVj
bGFyYXRpdmUgKHdpdGhvdXQgcXQ1cXVpY2spIGNvbXBpbGVzIGFuZCBpbnN0YWxscyBmaW5lIHdp
dGhvdXQKcXQ1Z3VpIGVuYWJsZWQgYW5kIGNvZGUgaW5zcGVjdGlvbiBvZiB0aGUgcXQ1ZGVjbGFy
YXRpdmUgc291Y2UgcGFja2FnZSAqLnBybwpmaWxlcyBzaG93cyB0aGUgdW5jb25kaXRpb25hbGx5
IGd1aSBkZXBlbmRlbmNpZXMgb25seSBpbiBmb3IgZG9jLXNuaXBwZXRzCmFuZC9vciB0ZXN0IHBy
b2plY3RlcyBvciByZWFsIHRoZSBxdDVxdWljayBtb2R1bHMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnVpbGRyb290LzZmZDA1Zjk3LTdmYjktOTZkOC1jY2EwLTUwNjNiZThhZDYyMEBn
bWFpbC5jb20KClJlcG9ydGVkLWJ5OiAi0JrRg9C30YzQvNC40L3QvtCyINCh0LXRgNCz0LXQuSIg
PGt1em1pbm92LnNlcmdleTgxQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KTm90ZXM6CiAgLSBAU2VyZ2V5OiBJIHVzZWQgdGhl
IEFTQ0lJIHZlcnNpb24gb2YgeW91ciBuYW1lLCBob3BlIGl0IGlzIG8uay4gZm9yIHlvdT8KLS0t
CiBwYWNrYWdlL3F0NS9xdDVkZWNsYXJhdGl2ZS9Db25maWcuaW4gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3F0NS9xdDVkZWNsYXJhdGl2ZS9Db25maWcuaW4gYi9wYWNrYWdlL3F0NS9xdDVkZWNsYXJhdGl2
ZS9Db25maWcuaW4KaW5kZXggM2JhOTIyNGMyMi4uNWVjODNkYWEyNyAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcXQ1L3F0NWRl
Y2xhcmF0aXZlL0NvbmZpZy5pbgpAQCAtMSw3ICsxLDYgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9R
VDVERUNMQVJBVElWRQogCWJvb2wgInF0NWRlY2xhcmF0aXZlIgogCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfUVQ1X0pTQ09SRV9BVkFJTEFCTEUKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9H
VUkKIAloZWxwCiAJICBRdCBpcyBhIGNyb3NzLXBsYXRmb3JtIGFwcGxpY2F0aW9uIGFuZCBVSSBm
cmFtZXdvcmsgZm9yCiAJICBkZXZlbG9wZXJzIHVzaW5nIEMrKy4KQEAgLTE2LDYgKzE1LDcgQEAg
aWYgQlIyX1BBQ0tBR0VfUVQ1REVDTEFSQVRJVkUKIAogY29uZmlnIEJSMl9QQUNLQUdFX1FUNURF
Q0xBUkFUSVZFX1FVSUNLCiAJYm9vbCAicXVpY2sgbW9kdWxlIgorCXNlbGVjdCBCUjJfUEFDS0FH
RV9RVDVCQVNFX0dVSQogCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX09QRU5HTCBpZiBCUjJf
UEFDS0FHRV9RVDVfR0xfQVZBSUxBQkxFCiAKIGVuZGlmCi0tIAoyLjMzLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
