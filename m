Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B050C0032E
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 08:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A324F149;
	Sat, 21 Oct 2023 08:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90A324F149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7sCI42w82ZT; Sat, 21 Oct 2023 08:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 069F14F14B;
	Sat, 21 Oct 2023 08:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069F14F14B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F82E1BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 08:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6569584E61
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 08:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6569584E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rA9GoL8l0PNw for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 08:58:21 +0000 (UTC)
Received: from m13102.mail.163.com (m13102.mail.163.com [220.181.13.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id B791484E4B
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 08:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B791484E4B
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr102
 (Coremail) ; Sat, 21 Oct 2023 16:58:08 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 21 Oct 2023 16:58:08 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <fa6fbdf3-6a59-4893-9128-7087db14b91f@kuhls.net>
References: <20231020120158.2684019-1-andyshrk@163.com>
 <fa6fbdf3-6a59-4893-9128-7087db14b91f@kuhls.net>
X-NTES-SC: AL_QuySBfSct04j7iSRYOlSyjxX7opnBbrRyIZ+tfYve8UPuCDC5SAPd1FuFmbtyOOu6v7rjgkG5NPXd7Vsl8wQ
MIME-Version: 1.0
Message-ID: <16d2b4bf.15c3.18b5174c2f1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZsGowAA3Pv2gkjNlfT4YAA--.48148W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOwQQXmC5oABBlAABsc
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=wBVB5GAXp/Nt/YZ4R5nw/81AXqcLSQXRWggRafBL6fo=; b=R
 Ew6SR1hmdWjkmtLk5YIIbFy6K5et/rV7g6m0tohZOrVq5rehTkqSRaOOytlf+oR0
 kGxYyhJmoYtSoAfox6/nwBATqmA6yRVnx+Osho3iYpC2iAuegKZdjKrOYip2miPH
 SZ0hir4SnCq3qmFF28YAjbd2lENjqdkYO7Vaf9LdX0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=REw6SR1h
Subject: Re: [Buildroot] [PATCH v3 1/1] igt-gpu-tools: add igt-gpu-tools
 package
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
Content-Type: multipart/mixed; boundary="===============6240495152533364579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6240495152533364579==
Content-Type: multipart/alternative; 
	boundary="----=_Part_20785_825278877.1697878688497"

------=_Part_20785_825278877.1697878688497
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgQmVybmTvvJoKCgoKCgoKCgoKCgoKCgoKCgpBdCAyMDIzLTEwLTIwIDIzOjU5OjI3LCAiQmVy
bmQgS3VobHMiIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOgo+W1RoaXMgbWFpbCB3YXMgYWxzbyBw
b3N0ZWQgdG8gZ21hbmUuY29tcC5saWIudWNsaWJjLmJ1aWxkcm9vdC5dCj4KPkhpIEFuZHksCj4K
PnRoYW5rcyBmb3IgdjMhIFNvbWUgbW9yZSBuaXRzL2hpbnRzIDspCj4KPlBsZWFzZSBhZGQgYW4g
ZW50cnkgaW4gdGhlIERFVkVMT1BFUlMgZmlsZSBmb3IgeW91ciBwYWNrYWdlOgoKPmh0dHA6Ly9i
dWlsZHJvb3QudWNsaWJjLm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI0RFVkVMT1BF
UlMKT2thee+8jEkgd2lsbCBhZGQgaXQgaW4gVjQgCj4KPkFtIEZyaSwgMjAgT2N0IDIwMjMgMjA6
MDI6NDAgKzA4MDAgc2NocmllYiBBbmR5IFlhbjoKPgo+RHVlIHRvIHRoZSBhZGRpdGlvbiBvZiBl
bGZ1dGlscyBhcyBkZXBlbmRlbmN5IHRoaXMgbGluZSBpcyBzdGlsbCBuZWVkZWQgCj5pbiBDb25m
aWcuaW4KPgo+CWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGVsZnV0aWxzCj4KCj5hbG9uZyB3
aXRoIGFuIHVwZGF0ZWQgY29tbWVudC4KR2V0IGl077yMIHRrYW5rcyBmb3IgcG9pbnRpbmcgb3V0
IHRoaXPjgIIKPgo+ZWxmdXRpbHMgaGFzIGFub3RoZXIgZGVwZW5kZW5jeSB3aGljaCB3b3VsZCBu
ZWVkIGJhY2twb3J0aW5nOgo+Cj4JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJD
IHx8IEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwo+Cj5CdXQgd2hlbiBteSBwYXRjaCBzZXJpZXMK
Pmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
MzEwMTkyMTQ5NTMuNDAwMjYwOS0xLWJlcm5kQGt1aGxzLm5ldC8KCj5sYW5kcyB0aGVyZSBpcyBu
byBuZWVkIHRvIGFkZCB0aGlzIGRlcGVuZGVuY3kgdG8gaWd0LWdwdS10b29scyA7KQoKClNvIG1h
eWJlIEkgY2FuIHdhaXQgZm9yIHRoaXMgcGFjaCBsYW5kcyBiZWZvcmUgc2VuZGluZyB2NC4KPgo+
PiAraWYgQlIyX1BBQ0tBR0VfSUdUX0dQVV9UT09MUwo+PiArCj4+ICtjb25maWcgQlIyX1BBQ0tB
R0VfSUdUX0dQVV9UT09MU19MSUJVTldJTkQKPj4gKwlib29sICJsaWJ1bndpbmQiCj4+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJVTldJTkRfQVJDSF9TVVBQT1JUUyAjIGxpYnVud2luZAo+
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJVTldJTkQKPj4gKwloZWxwCj4+ICsJICBVc2UgbGli
dW53aW5kCj4+ICtlbmRpZgo+Cj5UaGlzIHdob2xlIGJsb2NrIGlzIG5vdCBuZWVkZWQsIHNlZSBi
ZWxvdy4KPgo+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9JR1RfR1BVX1RPT0xTX0xJQlVOV0lORCks
eSkKPgo+UmVwbGFjZSB0aGlzIGxpbmUgd2l0aAo+CWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVU5X
SU5EKSx5KQoKPgpva++8jCB0aGFua3PjgIIKPlJlZ2FyZHMsIEJlcm5kCg==
------=_Part_20785_825278877.1697878688497
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij5IaSBCZXJuZO+8mjwvcD48
cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwv
cD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJy
PjwvcD48ZGl2IHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2ZTt6b29tOjEiPjwvZGl2PjxkaXYgaWQ9
ImRpdk5ldGVhc2VNYWlsQ2FyZCI+PC9kaXY+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+
PHByZT48YnI+QXQgMjAyMy0xMC0yMCAyMzo1OToyNywgIkJlcm5kIEt1aGxzIiAmbHQ7YmVybmRA
a3VobHMubmV0Jmd0OyB3cm90ZToKJmd0O1tUaGlzIG1haWwgd2FzIGFsc28gcG9zdGVkIHRvIGdt
YW5lLmNvbXAubGliLnVjbGliYy5idWlsZHJvb3QuXQomZ3Q7CiZndDtIaSBBbmR5LAomZ3Q7CiZn
dDt0aGFua3MgZm9yIHYzISBTb21lIG1vcmUgbml0cy9oaW50cyA7KQomZ3Q7CiZndDtQbGVhc2Ug
YWRkIGFuIGVudHJ5IGluIHRoZSBERVZFTE9QRVJTIGZpbGUgZm9yIHlvdXIgcGFja2FnZToKPGRp
dj4mZ3Q7PGEgaHJlZj0iaHR0cDovL2J1aWxkcm9vdC51Y2xpYmMub3JnL2Rvd25sb2Fkcy9tYW51
YWwvbWFudWFsLmh0bWwjREVWRUxPUEVSUyIgX3NyYz0iaHR0cDovL2J1aWxkcm9vdC51Y2xpYmMu
b3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjREVWRUxPUEVSUyI+aHR0cDovL2J1aWxk
cm9vdC51Y2xpYmMub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjREVWRUxPUEVSUzwv
YT48L2Rpdj48ZGl2Pk9rYXnvvIxJIHdpbGwgYWRkIGl0IGluIFY0IDwvZGl2PiZndDsKJmd0O0Ft
IEZyaSwgMjAgT2N0IDIwMjMgMjA6MDI6NDAgKzA4MDAgc2NocmllYiBBbmR5IFlhbjoKJmd0Owom
Z3Q7RHVlIHRvIHRoZSBhZGRpdGlvbiBvZiBlbGZ1dGlscyBhcyBkZXBlbmRlbmN5IHRoaXMgbGlu
ZSBpcyBzdGlsbCBuZWVkZWQgCiZndDtpbiBDb25maWcuaW4KJmd0OwomZ3Q7CWRlcGVuZHMgb24g
QlIyX1VTRV9XQ0hBUiAjIGVsZnV0aWxzCiZndDsKPGRpdj4mZ3Q7YWxvbmcgd2l0aCBhbiB1cGRh
dGVkIGNvbW1lbnQuPC9kaXY+PGRpdj5HZXQgaXTvvIwgdGthbmtzIGZvciBwb2ludGluZyBvdXQg
dGhpc+OAgjwvZGl2PiZndDsKJmd0O2VsZnV0aWxzIGhhcyBhbm90aGVyIGRlcGVuZGVuY3kgd2hp
Y2ggd291bGQgbmVlZCBiYWNrcG9ydGluZzoKJmd0OwomZ3Q7CWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9VU0VTX1VDTElCQyB8fCBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKJmd0OwomZ3Q7QnV0
IHdoZW4gbXkgcGF0Y2ggc2VyaWVzCiZndDtodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMxMDE5MjE0OTUzLjQwMDI2MDktMS1iZXJuZEBrdWhs
cy5uZXQvCjxkaXY+Jmd0O2xhbmRzIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIHRoaXMgZGVwZW5k
ZW5jeSB0byBpZ3QtZ3B1LXRvb2xzIDspPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TbyBtYXli
ZSBJIGNhbiB3YWl0IGZvciB0aGlzIHBhY2ggbGFuZHMgYmVmb3JlIHNlbmRpbmcgdjQuPC9kaXY+
Jmd0OwomZ3Q7Jmd0OyAraWYgQlIyX1BBQ0tBR0VfSUdUX0dQVV9UT09MUwomZ3Q7Jmd0OyArCiZn
dDsmZ3Q7ICtjb25maWcgQlIyX1BBQ0tBR0VfSUdUX0dQVV9UT09MU19MSUJVTldJTkQKJmd0OyZn
dDsgKwlib29sICJsaWJ1bndpbmQiCiZndDsmZ3Q7ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9M
SUJVTldJTkRfQVJDSF9TVVBQT1JUUyAjIGxpYnVud2luZAomZ3Q7Jmd0OyArCXNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJVTldJTkQKJmd0OyZndDsgKwloZWxwCiZndDsmZ3Q7ICsJICBVc2UgbGlidW53
aW5kCiZndDsmZ3Q7ICtlbmRpZgomZ3Q7CiZndDtUaGlzIHdob2xlIGJsb2NrIGlzIG5vdCBuZWVk
ZWQsIHNlZSBiZWxvdy4KJmd0OwomZ3Q7Jmd0OyAraWZlcSAoJChCUjJfUEFDS0FHRV9JR1RfR1BV
X1RPT0xTX0xJQlVOV0lORCkseSkKJmd0OwomZ3Q7UmVwbGFjZSB0aGlzIGxpbmUgd2l0aAomZ3Q7
CWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVU5XSU5EKSx5KQo8ZGl2PiZndDs8L2Rpdj48ZGl2Pm9r
77yMIHRoYW5rc+OAgjwvZGl2PiZndDtSZWdhcmRzLCBCZXJuZAo8L3ByZT48L2Rpdj4=
------=_Part_20785_825278877.1697878688497--


--===============6240495152533364579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6240495152533364579==--

