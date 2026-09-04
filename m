Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409DFC624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 19:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E2181158;
	Fri,  4 Sep 2026 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYEDfNkBEzYb; Fri,  4 Sep 2026 19:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92B428114F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788551709;
	b=HgRAUDysArLOaFwBhh8vYj+qH2M423xUX4FdeoVPCrW0dd2OzvbeoGO9lT7MhtPgbfus
	 vowFeSL6ZYrZVaENlQWIdu7rF0ovmF6MefLGntdTo//gH7i+1M3VdM26ctXWuZjiyuCL7
	 XAakwNcXBNOfZjxKL25cEdqQe3bFh3fV8e2ughkfYvPUIfGJXJvStIJjQ4EdqlVz4l1b2
	 mR8QXTaRh2wA3xgGW7T8QU0w6Lu+FYfETfY5TzeBwd7HqRpOYUy5KVNx++UJGFNLu7yAW
	 s1L0ONrGyYCKHjKv0qhwGUvm3bQm5+nIY3wg5oXOjjut6Agv9PsykwtkBQm4+keMhEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788551709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MtuUuC+Ni//1DuOy+kl1Lq+iv6CPWLQNkc2ogAPq6TI=;
	b=hpOop848Rd+JdJoWvQX6o0gqjf+JNYWFhNHFnWdTPIohBTcYuM7Oam7NFevPz7j95tRC
	 8CxrE9utO4kEiyPSofFBVgz3OK2TV7VOzkEiwBAGLvUGw5EqRwv6ykmxefrRsD8KwHQOr
	 ZfeMywI/02zARFKx/QLILelRoG1NMG+JrZVLLSSMjdSsHAzrAjjsplbeCX7vuGXkZQ6gS
	 FFsKzidh7j1jHdxX1/5jGktphWiu1lmQ0ja4Kt+2DxjMcKYy6OSFrkgboc/+JR3gdfwRo
	 EVoH8QCfeFLglOKLDQbjsxLauEl3i9whrCPuo1xlS8SzlFBFmD+dTFnhwwBwB1FMIBQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788551709;
	bh=MtuUuC+Ni//1DuOy+kl1Lq+iv6CPWLQNkc2ogAPq6TI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jj4nqxUgu83GdJKl99JB4/ea6oB8hlN100F+fMwn5sO86Yjl9SB4CYLmPbD5ecOiF
	 YXBnzydEdBI7kn0xAXlFt9wI2/1IOZRCPZZP5Pkd8m0Xq7Quxa55cH2ryaGrWVcg/F
	 KrpCNCzf18JaVENW1I4rxOI2aqTTCh0fhbQffF+ykZb+4Rv/Co+nNnZtrsUThcpXfd
	 g+c4wcyP7k6WiEQVgpXF7JXBXZZcKS3vekR8ek31ND2lvKxfB9LQaF1T8htkY4O0EQ
	 jje/HX86/o+yFDsmYlM4MjqTREwoFcVkPLn6p22qIao+k0NFxJRkZIszsD1Ix92/om
	 Mf/4yeBoXk/iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B428114F;
	Fri,  4 Sep 2026 19:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A00810E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 19:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37E2A404F7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 19:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bU-k-NWi7kou for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 19:55:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7310B40058
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788551707;
 b=qBM4wcMlGIC0Ugp6HlVyvHO37J1s6jIkf+WhrYhYHmUPg58y/hAcBQEiXk9hRepH3Vtk
 EA2hCeZKgqcKtQt4DoqmOKeHhlIq14aofaDamK9y77AU0+jer+pG+FdYu1YRq0OujAg4B
 EFMwp/Y4IGlC+Tj6WnpkCNX4SO3rk72Ws2XCkWKDGcQxO0QvrQhLXZw3T7TwFaJCdZMYJ
 Q7V1eOlN8OPTiqWWi43v2eu9qO8IDdtWvi1Y0U+f2zAGvfStr+bi5KDpLLuR6EFbT+zoL
 recfoGmYz3bgY+WSMrOih8JgR/vrPdo88A3xLDKXxZA9M43oMRF2V86ehr+7FbUGLAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788551707;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DKxvX69zaiVd+FcKcow4+8fzbYUhT4E7C8Vb/1bIDkc=;
 b=lPlHFYKhRz4ydFmOgKur2l1At11D/BGyXhhaEDowPtW1Sx8ixx42wJ9tPt6eB2NwQcvP
 sb/GXR1L1pcSDnS5vMXiKO9GZN57rEHj3gqTNjZWjsRrh85DH9y0M2sEzwrNepr/xtREh
 f1kvig+gwLyRFUIM+9AZ+ddRRvXfBQ8DcA216hGQq5Na6NffylAE45Ow3jduPmidmHx7e
 DhnrIUNqd/wrDPGexVRZE+JyDgTidWFkNbxYcmZLS7RQeh47J8bJk25tEz7PeZ8tlFeC7
 5BPDp+8oyKAE5vVxwNEQ3E0hB2gSEdPrM/2gloC+WCX8fEJvrXO5pE/Y0DNvZGQmlzQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=e0sa7g+f; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=e0sa7g+f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7310B40058
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788551703;
 bh=DKxvX69zaiVd+FcKcow4+8fzbYUhT4E7C8Vb/1bIDkc=;
 h=From:To:Subject:Date:From;
 b=e0sa7g+fnp9PK6BQxl1CJL49VJvQYfuZ02gXMmwYqESHOSqlxaEuhdlumNzLhd5Iu
 0G7MdV0ZgTEaSWzMA7Oc+BxlTCCK3/pWNGDgJv+aaPjq6uS1ykDR3G5+Tmk7ZLJDZh
 diEchnClN3Vgd3x4G8hag0jFJCUync4/HKCXM/Tc8aa43O+ZCHiKiDMwxlTn9zaLGQ
 V19MAAnBLh1I6nRzdC/1EtFmyjs/LGwtz8FhA+WYXnn0ELHLSAk90pqA0JWZfVQ/x1
 O/2g86lpmcrNofKY809iEenNAGmafdZwO53xg/GYa016bRpY+9SJiOytP47vQNWmV1
 o6qDApeKErgTg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 625B9A4C0F97
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 21:55:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58212)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2a07-000000000zL-0H1L
 for buildroot@buildroot.org; Fri, 04 Sep 2026 19:55:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 21:55:03 +0200
Message-ID: <20260904195503.1375486-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/thrift: bump version to 0.24.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9naXRodWIuY29tL2FwYWNoZS90aHJpZnQvYmxvYi92MC4yNC4wL0NIQU5HRVMubWQK
ClBsZWFzZSBub3RlIHRoYXQgdGhpcyBidW1wIGluY2x1ZGVzIENWRS0yMDI2LTQxNjA4OgpodHRw
czovL2xpc3RzLmFwYWNoZS5vcmcvdGhyZWFkL3Z3c2Jjd3FkcHdkdHA4cWtqbzExb2w2cm9kYmZt
MjFmCndoaWNoIGZpeGVzIGEgc2VjdXJpdHkgYnVnIGluIHRoZSBweXRob24gYmluZGluZ3MgdGhh
dCBhcmUgbm90IHVzZWQgYnkKYnVpbGRyb290LgoKQnVpbGRpbmcgdGhpcyBkZWZjb25maWcKCkJS
Ml9hYXJjaDY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQ1VTVE9NPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9BRD15CkJSMl9UT09MQ0hB
SU5fRVhURVJOQUxfVVJMPSJodHRwOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9hZHMv
cmVsZWFzZXMvdG9vbGNoYWlucy9hYXJjaDY0LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDE3LjA1
LXRvb2xjaGFpbnMtMS0yLnRhci5iejIiCkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzY9eQpC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0hFQURFUlNfNF85PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9DVVNUT01fR0xJQkM9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NYWD15CkJSMl9QQUNLQUdF
X1RIUklGVD15Cgp3aXRob3V0IHRoaXMgYnVtcCBkb2VzIG5vdCBjYXVzZSBidWlsZCBlcnJvcnMu
CgpUaGUgR2l0bGFiIHBpcGVsaW5lcyBkZXRlY3RlZCBhIGJ1aWxkIGVycm9yIGZvciB0aGlzIGJ1
bXAgd2l0aCB0aGUKZGVmY29uZmlnIGJvb3RsaW4tYWFyY2g2NC1nbGliYy1vbGQ6CgovYnVpbGRz
L2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cvYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZC9i
dWlsZC90aHJpZnQtMC4yNC4wL2xpYi9jcHAvc3JjL3RocmlmdC90cmFuc3BvcnQvVEJ1ZmZlclRy
YW5zcG9ydHMuaDoxMTA6MzI6CiBlcnJvcjog4oCYcHRyZGlmZl904oCZIGRvZXMgbm90IG5hbWUg
YSB0eXBlCgpUbyBmaXggdGhlIHByb2JsZW0gd2UgYWRkIGEgcGF0Y2ggdG8gaW5jbHVkZSBjc3Rk
ZGVmLgoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCkkg
ZGlkIG5vdCBtYW5hZ2UgdG8gZmluZCB0aGUgdXBzdHJlYW0gY29tbWl0IHdoaWNoIGNhdXNlcyB0
aGUgYnVpbGQKZXJyb3IuCgpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9naXRsYWIu
Y29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzL2VjNmVkYzljNDliYmZmNDljN2Q1ZWI2ZGNm
Y2MxOTdiNzY5NTQxNmIKCiAuLi5uY2x1ZGUtdG8tZml4LWJ1aWxkLWVycm9yLXdpdGgtNi4zLjAu
cGF0Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3RocmlmdC90aHJpZnQuaGFz
aCAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KIHBhY2thZ2UvdGhyaWZ0L3RocmlmdC5tayAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90aHJpZnQv
MDAwMS1BZGQtY3N0ZGRlZi1pbmNsdWRlLXRvLWZpeC1idWlsZC1lcnJvci13aXRoLTYuMy4wLnBh
dGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS90aHJpZnQvMDAwMS1BZGQtY3N0ZGRlZi1pbmNsdWRl
LXRvLWZpeC1idWlsZC1lcnJvci13aXRoLTYuMy4wLnBhdGNoIGIvcGFja2FnZS90aHJpZnQvMDAw
MS1BZGQtY3N0ZGRlZi1pbmNsdWRlLXRvLWZpeC1idWlsZC1lcnJvci13aXRoLTYuMy4wLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY1OTQ1NGMzZDEKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3RocmlmdC8wMDAxLUFkZC1jc3RkZGVmLWluY2x1ZGUtdG8t
Zml4LWJ1aWxkLWVycm9yLXdpdGgtNi4zLjAucGF0Y2gKQEAgLTAsMCArMSwzMyBAQAorRnJvbSBj
YTJjMjQ2N2M3OGQ5MTQwYTdlMjYwNzI3Y2QzMzA1YmYzZGVjZDA5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KK0RhdGU6IEZyaSwg
NCBTZXAgMjAyNiAxOTo0OTo1OSArMDIwMAorU3ViamVjdDogW1BBVENIXSBBZGQgY3N0ZGRlZiBp
bmNsdWRlIHRvIGZpeCBidWlsZCBlcnJvciB3aXRoIDYuMy4wCitNSU1FLVZlcnNpb246IDEuMAor
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVy
LUVuY29kaW5nOiA4Yml0CisKK3RocmlmdC0wLjI0LjAvbGliL2NwcC9zcmMvdGhyaWZ0L3RyYW5z
cG9ydC9UQnVmZmVyVHJhbnNwb3J0cy5oOjExMDozMjoKKyBlcnJvcjog4oCYcHRyZGlmZl904oCZ
IGRvZXMgbm90IG5hbWUgYSB0eXBlCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vYXBh
Y2hlL3RocmlmdC9wdWxsLzM4MDEKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KKy0tLQorIGxpYi9jcHAvc3JjL3RocmlmdC90cmFuc3BvcnQvVEJ1ZmZlclRy
YW5zcG9ydHMuaCB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZm
IC0tZ2l0IGEvbGliL2NwcC9zcmMvdGhyaWZ0L3RyYW5zcG9ydC9UQnVmZmVyVHJhbnNwb3J0cy5o
IGIvbGliL2NwcC9zcmMvdGhyaWZ0L3RyYW5zcG9ydC9UQnVmZmVyVHJhbnNwb3J0cy5oCitpbmRl
eCBiNzhlNDU3YjMuLmIwNDQ3YjBiYyAxMDA2NDQKKy0tLSBhL2xpYi9jcHAvc3JjL3RocmlmdC90
cmFuc3BvcnQvVEJ1ZmZlclRyYW5zcG9ydHMuaAorKysrIGIvbGliL2NwcC9zcmMvdGhyaWZ0L3Ry
YW5zcG9ydC9UQnVmZmVyVHJhbnNwb3J0cy5oCitAQCAtMjAsNiArMjAsNyBAQAorICNpZm5kZWYg
X1RIUklGVF9UUkFOU1BPUlRfVEJVRkZFUlRSQU5TUE9SVFNfSF8KKyAjZGVmaW5lIF9USFJJRlRf
VFJBTlNQT1JUX1RCVUZGRVJUUkFOU1BPUlRTX0hfIDEKKyAKKysjaW5jbHVkZSA8Y3N0ZGRlZj4K
KyAjaW5jbHVkZSA8Y3N0ZGxpYj4KKyAjaW5jbHVkZSA8Y3N0cmluZz4KKyAjaW5jbHVkZSA8bGlt
aXRzPgorLS0gCisyLjQ3LjMKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS90aHJpZnQvdGhyaWZ0Lmhh
c2ggYi9wYWNrYWdlL3RocmlmdC90aHJpZnQuaGFzaAppbmRleCA0MDZjNjVmZDI1Li4xODdmZDE1
YzUwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3RocmlmdC90aHJpZnQuaGFzaAorKysgYi9wYWNrYWdl
L3RocmlmdC90aHJpZnQuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2Rvd25s
b2Fkcy5hcGFjaGUub3JnL3RocmlmdC8wLjIzLjAvdGhyaWZ0LTAuMjMuMC50YXIuZ3ouc2hhMjU2
Ci1zaGEyNTYgIDE4NTlkOTMyZDJhZTFmMTNkMTZjNWExOTY5MzEyMDhjMTE2MzEwYTVmZjUwZjJi
ZmQxMWQzZGIwM2JlOGY0NmYgIHRocmlmdC0wLjIzLjAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9k
b3dubG9hZHMuYXBhY2hlLm9yZy90aHJpZnQvMC4yNC4wL3RocmlmdC0wLjI0LjAudGFyLmd6LnNo
YTI1Ngorc2hhMjU2ICBlMGZhNTgzOWE0YzVjMWQ2MzFiMDkzMWNmMmM1NTRlYmJmYTRlMmZlZTNh
OWZiM2ZmZDRmODJjZTQzOTZjNmU0ICB0aHJpZnQtMC4yNC4wLnRhci5negogIyBMaWNlbnNlIGZp
bGVzLCBsb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgODlhYTdiMjc4Njg2NjkyOTliZDhhNmM1
M2I3MmVjNGJlYWRjZTQyZGFkNmM4MzM2Nzk3Y2MyNmUxZThkZjk4ZCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS90aHJpZnQvdGhyaWZ0Lm1rIGIvcGFja2FnZS90aHJpZnQvdGhyaWZ0Lm1r
CmluZGV4IDM0ZjQ2NzEyMzkuLmE1MTdkZDUwMzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdGhyaWZ0
L3RocmlmdC5taworKysgYi9wYWNrYWdlL3RocmlmdC90aHJpZnQubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1USFJJRlRfVkVSU0lPTiA9IDAuMjMuMAor
VEhSSUZUX1ZFUlNJT04gPSAwLjI0LjAKIFRIUklGVF9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMu
YXBhY2hlLm9yZy90aHJpZnQvJChUSFJJRlRfVkVSU0lPTikKIFRIUklGVF9MSUNFTlNFID0gQXBh
Y2hlLTIuMCwgUHVibGljIERvbWFpbiAoc2hhMjU2LmgpCiBUSFJJRlRfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
