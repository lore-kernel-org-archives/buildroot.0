Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6280FC53210
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6774038B;
	Thu,  5 Jan 2023 13:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A6774038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADMKCY0vYPvz; Thu,  5 Jan 2023 13:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6220F40125;
	Thu,  5 Jan 2023 13:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6220F40125
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E183F1BF318
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7E1F4014B
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E1F4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDp9xGFvOiXa for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A37E840117
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A37E840117
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhI-HT; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-CG; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 13:59:56 +0100
Message-Id: <20230105130000.682525-2-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105130000.682525-1-martin@geanix.com>
References: <20230105130000.682525-1-martin@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=dcVisZgJXC7tuJ0FX2xVzYiNJOq/lt6jS8wQ0dLnwMY=; b=AP7oZ5A76s7HGY4O2qLlxEUK6D
 SuKedRGGuXaeZfbnhgILQ8JDX0Pygdo1/OAPoRusSwhTd5jM3wnRgFfOl8ArOWyy4YyAxK2uXH/qc
 YOBVLeMMOMxHvJgaJIAfEAItBA1gCFhBcTUc+bn67aJkm4WQonAeMNlF7xIDkONGvRndk0G2w/+T3
 ATmFO8wSxBxyaHl1d7EaHl0G+u0DP2EJ0fB4uBitUWR6Ek7oyh7t5YVnbq6Vg6ytY9/5nFku+d6lS
 sbZg3BaLsICEUGWswfBXu/LYgZQf+akcAaCLu+er3YZtIeA5AlT7olY3rXaeZEZaS03H4fwIsrdFv
 gC+JAT9A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=AP7oZ5A7
Subject: [Buildroot] [PATCH 1/5] package/python-apispec: new package
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

YXBpc3BlYyBpcyBhIGRlcGVuZGVuY3kgb2YgdG8tYmUtYWRkZWQgcHl0aG9uLWZsYXNrLXNtb3Jl
c3QuCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+
Ci0tLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9weXRob24tYXBpc3BlYy9Db25maWcuaW4gICAgICAgICAgIHwgIDkgKysrKysrKysr
CiBwYWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVjLmhhc2ggfCAgNSArKysrKwog
cGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tayAgIHwgMTQgKysrKysrKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLWFwaXNwZWMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tawoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggOTk1ZGFlMmM1
Ny4uY2I1YWY5YTdlMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KQEAgLTk1NSw2ICs5NTUsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9k
dWxlcyIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvQ29uZmlnLmluIgogCXNvdXJj
ZSAicGFja2FnZS9weXRob24tYWxzYWF1ZGlvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
cHl0aG9uLWFuc2ljb2xvcnMvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tYXBp
c3BlYy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1hcHBkaXJzL0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFyZ2gvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9weXRob24tYXJnb24yLWNmZmkvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tYXBpc3BlYy9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1hcGlzcGVjL0NvbmZpZy5p
bgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43YTMyMmM5OTY5Ci0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tYXBpc3BlYy9Db25maWcuaW4KQEAgLTAsMCAr
MSw5IEBACitjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0FQSVNQRUMKKwlib29sICJweXRob24t
YXBpc3BlYyIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BBQ0tBR0lORyAjIHJ1bnRpbWUK
KwloZWxwCisJICBBIHBsdWdnYWJsZSBBUEkgc3BlY2lmaWNhdGlvbiBnZW5lcmF0b3IuIEN1cnJl
bnRseSBzdXBwb3J0cworCSAgdGhlIE9wZW5BUEkgU3BlY2lmaWNhdGlvbiAoZi5rLmEuIHRoZSBT
d2FnZ2VyCisJICBzcGVjaWZpY2F0aW9uKS4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL21hcnNo
bWFsbG93LWNvZGUvYXBpc3BlYwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYXBpc3BlYy9w
eXRob24tYXBpc3BlYy5oYXNoIGIvcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3Bl
Yy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjlkNjUzY2M4ZTgK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVj
Lmhhc2gKQEAgLTAsMCArMSw1IEBACisjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9y
Zy9weXBpL2FwaXNwZWMvanNvbgorbWQ1ICAgYjRlOTAwMDZhMjYyMTVlMmUwYTZmZTI2MjlkMTJj
MTAgYXBpc3BlYy02LjAuMi50YXIuZ3oKK3NoYTI1NiAgZTc2ZDgwYjczOWVkZWY0YmUyMTMwOTJh
NjM4NGFkN2ZkOTMzYmE3ZDY0ZjZkNWEwYWZmOGQ0ZGExYmVmNzg4NyAgYXBpc3BlYy02LjAuMi50
YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIGE0NTJh
ZmNlZjc1MDk1NmE4Mzk2ZjdlN2E2ZjkxM2ExMTdkMjhlZjk5YTEzMTcwYzI5ZGM3NGMzYjdhOTVm
MjkgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFw
aXNwZWMubWsgYi9wYWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVjLm1rCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ2NzRjZTBjM2QKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVjLm1rCkBAIC0wLDAg
KzEsMTQgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1hcGlzcGVjCisj
CisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05fQVBJU1BFQ19WRVJTSU9OID0gNi4w
LjIKK1BZVEhPTl9BUElTUEVDX1NPVVJDRSA9IGFwaXNwZWMtJChQWVRIT05fQVBJU1BFQ19WRVJT
SU9OKS50YXIuZ3oKK1BZVEhPTl9BUElTUEVDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvYTcvMmEvYjQyYzE3ZTBkNjUzMzQxYjhmNTkxNjk5OTg5MmNkMmQ4
NDg5ZGUxMjdkYWM2MTE4YWU0NDUzMTY3NGY1CitQWVRIT05fQVBJU1BFQ19TRVRVUF9UWVBFID0g
c2V0dXB0b29scworUFlUSE9OX0FQSVNQRUNfTElDRU5TRSA9IE1JVAorUFlUSE9OX0FQSVNQRUNf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQotLSAK
Mi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
