Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B52C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 01:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9776440AB4;
	Wed, 21 Dec 2022 01:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9776440AB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYqNPceci9tN; Wed, 21 Dec 2022 01:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE8640A6D;
	Wed, 21 Dec 2022 01:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE8640A6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1E41BF304
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 01:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6375C40A6D
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 01:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6375C40A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wh2I1ikKIvm0 for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 01:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96FD64013F
Received: from m1391.mail.163.com (m1391.mail.163.com [220.181.13.91])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96FD64013F
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 01:23:21 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [39.152.157.120] ) by
 ajax-webmail-wmsvr91 (Coremail) ; Wed, 21 Dec 2022 09:23:08 +0800 (CST)
X-Originating-IP: [39.152.157.120]
Date: Wed, 21 Dec 2022 09:23:08 +0800 (CST)
From: tianyuanhao3  <tianyuanhao3@163.com>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220708(c4627114)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <20221006140754.46144-1-tianyuanhao3@163.com>
References: <20221006140754.46144-1-tianyuanhao3@163.com>
X-NTES-SC: AL_QuycA/mTuk8j7ieQY+kXmU0Ugec2WcO4vP8u1IRSOZE0pirU+QYRZlBFG2Pv/eSvGzmUnzelVhdxzeNcfa5BR4cklpwtcuAtcBUkuiQwxwJt
MIME-Version: 1.0
Message-ID: <2e134c1e.118c.1853246f376.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: W8GowAAHdxT8X6JjlAScAQ--.21920W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGhDejVaEDzwnzAABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=fetB/l6PwOFuHn6WqieigOY8nyRz1KzTguc111lyb0U=; b=a
 3/kD79JGg/2sO+/Ty/1CrTQhDASLPoMK/eKSY31p3zBjKbpU5vQsm3PZkhHEQn+h
 +zEglLmCDN/t+wYRDukpiegsy3j8au9OjG5qUHLHqdNlB4lqIprCoSRRDd52yrtI
 y7NmLuwDO8h7nmg5vRjHqn69r4R5W+Lhz77mX5uOTk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=a3/kD79J
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as runtime
 in containerd
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
Content-Type: multipart/mixed; boundary="===============3829486624221717056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3829486624221717056==
Content-Type: multipart/alternative; 
	boundary="----=_Part_16545_1930238197.1671585788790"

------=_Part_16545_1930238197.1671585788790
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgYWxsLAoKCgoKSSBob3BlIHRoaXMgcGF0Y2ggd2lsbCBiZSBtZXJnZWQgYmVmb3JlIDIwMjMu
MDIuCgoKClRoYW5rcyEKQXQgMjAyMi0xMC0wNiAyMjowNzo1NCwgIlRJQU4gWXVhbmhhbyIgPHRp
YW55dWFuaGFvM0AxNjMuY29tPiB3cm90ZToKPkNyZWF0ZSBydW5jIHN5bWxpbmsgdG8gY3J1biB3
aGVuIHJ1bmMgaXMgbWlzc2luZy4KPgo+U2VlOiBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVy
ZC9jb250YWluZXJkL2Rpc2N1c3Npb25zLzYxNjIKPgo+U2lnbmVkLW9mZi1ieTogVElBTiBZdWFu
aGFvIDx0aWFueXVhbmhhbzNAMTYzLmNvbT4KPi0tLQo+IHBhY2thZ2UvY29udGFpbmVyZC9Db25m
aWcuaW4gfCAyICstCj4gcGFja2FnZS9jcnVuL2NydW4ubWsgICAgICAgICB8IDcgKysrKysrKwo+
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYg
LS1naXQgYS9wYWNrYWdlL2NvbnRhaW5lcmQvQ29uZmlnLmluIGIvcGFja2FnZS9jb250YWluZXJk
L0NvbmZpZy5pbgo+aW5kZXggMGUzYTU1ZWYzOS4uZTY5ZGQ2NzY4YSAxMDA2NDQKPi0tLSBhL3Bh
Y2thZ2UvY29udGFpbmVyZC9Db25maWcuaW4KPisrKyBiL3BhY2thZ2UvY29udGFpbmVyZC9Db25m
aWcuaW4KPkBAIC01LDcgKzUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQ09OVEFJTkVSRAo+IAlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiAJZGVwZW5kcyBvbiAhQlIyX1RP
T0xDSEFJTl9VU0VTX1VDTElCQyAjIHJ1bmMKPiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIHV0
aWwtbGludXgKPi0Jc2VsZWN0IEJSMl9QQUNLQUdFX1JVTkMgIyBydW50aW1lIGRlcGVuZGVuY3kK
PisJc2VsZWN0IEJSMl9QQUNLQUdFX1JVTkMgaWYgIUJSMl9QQUNLQUdFX0NSVU4gIyBydW50aW1l
IGRlcGVuZGVuY3kKPiAJc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVggIyBydW50aW1lIGRl
cGVuZGVuY3kKPiAJc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfQklOQVJJRVMKPiAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfUElWT1RfUk9PVAo+ZGlmZiAtLWdpdCBhL3BhY2th
Z2UvY3J1bi9jcnVuLm1rIGIvcGFja2FnZS9jcnVuL2NydW4ubWsKPmluZGV4IDRhMGMxNTA1OTQu
LjE5ZGRhNzFhOWYgMTAwNjQ0Cj4tLS0gYS9wYWNrYWdlL2NydW4vY3J1bi5tawo+KysrIGIvcGFj
a2FnZS9jcnVuL2NydW4ubWsKPkBAIC0zNiw0ICszNiwxMSBAQCBlbHNlCj4gQ1JVTl9DT05GX09Q
VFMgKz0gLS1kaXNhYmxlLXN5c3RlbWQKPiBlbmRpZgo+IAo+K2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
UlVOQyksKQo+K2RlZmluZSBDUlVOX0NSRUFURV9TWU1MSU5LCj4rCWxuIC1zZiBjcnVuICQoVEFS
R0VUX0RJUikvdXNyL2Jpbi9ydW5jCj4rZW5kZWYKPitDUlVOX1BPU1RfSU5TVEFMTF9UQVJHRVRf
SE9PS1MgKz0gQ1JVTl9DUkVBVEVfU1lNTElOSwo+K2VuZGlmCj4rCj4gJChldmFsICQoYXV0b3Rv
b2xzLXBhY2thZ2UpKQo+LS0gCj4yLjI1LjEK
------=_Part_16545_1930238197.1671585788790
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEhlbHZldGljYSwgJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LCB2ZXJkYW5h
OyI+SGkgYWxsLDwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PHAgc3R5
bGU9Im1hcmdpbjogMDsiPkkgaG9wZSB0aGlzIHBhdGNoIHdpbGwgYmUgbWVyZ2VkIGJlZm9yZSAy
MDIzLjAyLjwvcD48ZGl2IHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
bWFyZ2luOiAwOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBIZWx2ZXRpY2EsICZxdW90O01p
Y3Jvc29mdCBZYWhlaSZxdW90OywgdmVyZGFuYTsiPlRoYW5rcyE8L3NwYW4+PC9kaXY+PHByZT5B
dCAyMDIyLTEwLTA2IDIyOjA3OjU0LCAiVElBTiBZdWFuaGFvIiAmbHQ7dGlhbnl1YW5oYW8zQDE2
My5jb20mZ3Q7IHdyb3RlOgomZ3Q7Q3JlYXRlIHJ1bmMgc3ltbGluayB0byBjcnVuIHdoZW4gcnVu
YyBpcyBtaXNzaW5nLgomZ3Q7CiZndDtTZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJk
L2NvbnRhaW5lcmQvZGlzY3Vzc2lvbnMvNjE2MgomZ3Q7CiZndDtTaWduZWQtb2ZmLWJ5OiBUSUFO
IFl1YW5oYW8gJmx0O3RpYW55dWFuaGFvM0AxNjMuY29tJmd0OwomZ3Q7LS0tCiZndDsgcGFja2Fn
ZS9jb250YWluZXJkL0NvbmZpZy5pbiB8IDIgKy0KJmd0OyBwYWNrYWdlL2NydW4vY3J1bi5tayAg
ICAgICAgIHwgNyArKysrKysrCiZndDsgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKJmd0OwomZ3Q7ZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29udGFpbmVyZC9D
b25maWcuaW4gYi9wYWNrYWdlL2NvbnRhaW5lcmQvQ29uZmlnLmluCiZndDtpbmRleCAwZTNhNTVl
ZjM5Li5lNjlkZDY3NjhhIDEwMDY0NAomZ3Q7LS0tIGEvcGFja2FnZS9jb250YWluZXJkL0NvbmZp
Zy5pbgomZ3Q7KysrIGIvcGFja2FnZS9jb250YWluZXJkL0NvbmZpZy5pbgomZ3Q7QEAgLTUsNyAr
NSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9DT05UQUlORVJECiZndDsgCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUwomZ3Q7IAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VT
RVNfVUNMSUJDICMgcnVuYwomZ3Q7IAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgdXRpbC1saW51
eAomZ3Q7LQlzZWxlY3QgQlIyX1BBQ0tBR0VfUlVOQyAjIHJ1bnRpbWUgZGVwZW5kZW5jeQomZ3Q7
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfUlVOQyBpZiAhQlIyX1BBQ0tBR0VfQ1JVTiAjIHJ1bnRpbWUg
ZGVwZW5kZW5jeQomZ3Q7IAlzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWCAjIHJ1bnRpbWUg
ZGVwZW5kZW5jeQomZ3Q7IAlzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9CSU5BUklFUwom
Z3Q7IAlzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9QSVZPVF9ST09UCiZndDtkaWZmIC0t
Z2l0IGEvcGFja2FnZS9jcnVuL2NydW4ubWsgYi9wYWNrYWdlL2NydW4vY3J1bi5tawomZ3Q7aW5k
ZXggNGEwYzE1MDU5NC4uMTlkZGE3MWE5ZiAxMDA2NDQKJmd0Oy0tLSBhL3BhY2thZ2UvY3J1bi9j
cnVuLm1rCiZndDsrKysgYi9wYWNrYWdlL2NydW4vY3J1bi5tawomZ3Q7QEAgLTM2LDQgKzM2LDEx
IEBAIGVsc2UKJmd0OyBDUlVOX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtc3lzdGVtZAomZ3Q7IGVu
ZGlmCiZndDsgCiZndDsraWZlcSAoJChCUjJfUEFDS0FHRV9SVU5DKSwpCiZndDsrZGVmaW5lIENS
VU5fQ1JFQVRFX1NZTUxJTksKJmd0OysJbG4gLXNmIGNydW4gJChUQVJHRVRfRElSKS91c3IvYmlu
L3J1bmMKJmd0OytlbmRlZgomZ3Q7K0NSVU5fUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBD
UlVOX0NSRUFURV9TWU1MSU5LCiZndDsrZW5kaWYKJmd0OysKJmd0OyAkKGV2YWwgJChhdXRvdG9v
bHMtcGFja2FnZSkpCiZndDstLSAKJmd0OzIuMjUuMQo8L3ByZT48L2Rpdj4=
------=_Part_16545_1930238197.1671585788790--


--===============3829486624221717056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3829486624221717056==--

