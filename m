Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5136C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 18:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36795612CD;
	Thu,  7 Apr 2022 18:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oqvk2O1KaP7; Thu,  7 Apr 2022 18:31:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD864612C9;
	Thu,  7 Apr 2022 18:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFE571BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC66341B6C
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2sqhfcoA1XK for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA96F419ED
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4E2AF20B9CEF;
 Thu,  7 Apr 2022 11:24:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E2AF20B9CEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649355888;
 bh=PDxXqV5F+khhthWmjD/CmW15sI3FSHzLuMJuZmennQo=;
 h=From:To:Cc:Subject:Date:From;
 b=mpbYH7R9mgvSD9a3hkT63CMfpANSKrUF02nAZe7QA8WDSlm/w0wkkCmvGFghtTOBT
 xvXeFNYvScSigE6phpKfPmkcu88ARwzPnY/cmFnZlu5nTZbzWTGgPWvWJzXuDmuUDA
 X+WJZ7wkWP3AY+S+dBFhgn7jsYolyd4UwTMxzDgs=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 19:24:23 +0100
Message-Id: <20220407182425.194001-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 0/2] Fix sysdig build errors
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 bradford barr <bradford@density.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkuCgoKRmlyc3Qgb2YgYWxsLCBJIGhvcGUgeW91IGFyZSBmaW5lIGFuZCB0aGUgc2FtZSBmb3Ig
eW91ciByZWxhdGl2ZXMuCgpXaGVuIGJ1aWxkaW5nIGEgc3lzdGVtIHdpdGggcmVjZW50IGtlcm5l
bCB3aXRoIEJSMl9QQUNLQUdFX1NZU0RJRywgSSBnb3Qgc29tZQpjb21waWxhdGlvbiBlcnJvcnMg
d2hlbiBidWlsZGluZyBzeXNkaWcgbGlic2luc3A6Ci4uLi9zeXNkaWctMC4yMy4xL3VzZXJzcGFj
ZS9saWJzaW5zcC9jaGlzZWwuY3BwOjk5OjMwOiBlcnJvcjogZWxlbWVudHMgb2YgYXJyYXkg4oCY
Y29uc3QgbHVhTF9yZWcgbGxfc3lzZGlnIFtd4oCZIGhhdmUgaW5jb21wbGV0ZSB0eXBlCiAgIDk5
IHwgY29uc3Qgc3RhdGljIHN0cnVjdCBsdWFMX3JlZyBsbF9zeXNkaWcgW10gPQpBZnRlciB0aGF0
LCBhbiBlcnJvciB3aGVuIGJ1aWxkaW5nIG1vZHVsZXMgb2NjdXJzOgouLi4vc3lzZGlnLTAuMjMu
MS9kcml2ZXIvcHBtLmg6NjI6MTg6IGVycm9yOiBmaWVsZCDigJhsYXN0X3ByaW50X3RpbWXigJkg
aGFzIGluY29tcGxldGUgdHlwZQogICA2MiB8ICBzdHJ1Y3QgdGltZXNwZWMgbGFzdF9wcmludF90
aW1lOwpBbmQgZmluYWxseSBhbiBlcnJvciBkdXJpbmcgbGluayB0aW1lIG9jY3VyczoKLi4uL3N5
c2RpZy0wLjIzLjEvdXNlcnNwYWNlL2xpYnNpbnNwLmEoY3JpLmdycGMucGIuY2Mubyk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gc3ltYm9sICdfWk40YWJzbDEybHRzXzIwMjEwMzI0NU11dGV4RDFF
dicKCkNvbmNlcm5pbmcgdGhlIGVycm9yIGluIGxpYnNpbnNwLCBhIHBhdGNoIHdhcyBhZGRlZCB0
byBzeXNkaWcgcmVjaXBlLgpUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIE1pbmlrdWJlIHBhdGNoLCB3
aGljaCBpcyBpbiB0dXJuIGJhc2VkIG9uIHN5c2RpZwpDTWFrZUxpc3RzLnR4dCBQQVRDSF9DT01N
QU5EIFsxLCAyXS4KVGhlIG1vZHVsZXMgZXJyb3JzIHdlcmUgZml4ZWQgdXBzdHJlYW0sIHNvIEkg
YnVtcGVkIHN5c2RpZyB2ZXJzaW9uIHRvIDAuMjcuMQpbMywgNF0uCkZvciB0aGUgbGlua2luZyBv
bmUsIGEgcGF0Y2ggYWxyZWFkeSBleGlzdCB0byBmaXggdGhpcyBidWdneSBiZWhhdmlvciBbNV0u
CgpTeXNkaWcgMC4yNy4xIHJlbGllcyBvbiB0YmIsIHNvIGEgcmVjaXBlIGZvciB0aGlzIGxpYnJh
cnkgd2FzIGFkZGVkLgpOb3RlIHRoYXQsIHRoaXMgcmVjaXBlIHdhcyBvcmlnaW5hbGx5IHdyaXR0
ZW4gYnkgQnJhZGZvcmQgQmFyciBhbmQgSSBqdXN0IGJ1bXBlZAppdHMgdmVyc2lvbiB0byBzdWl0
IHN5c2RpZyBjYXNlIFs2XS4KCldpdGggdGhlIHR3byBwYXRjaGVzIGFwcGxpZWQsIEkgd2FzIGFi
bGUgdG8gYnVpbGQgYW5kIGJvb3QgYW4gaW1hZ2Ugd2l0aGluIHFlbXU6CiQgbWFrZSBxZW11X3g4
Nl82NF9kZWZjb25maWcKJCBtYWtlIG1lbnVjb25maWcKIyBTZXQgZ2xpYmMgYXMgbGlicmFyeSwg
ZW5hYmxlIGMrKywgZW5hYmxlIGx1YWppdCBhbmQgZW5hYmxlIHN5c2RpZy4KJCBtYWtlIGxpbnV4
LW1lbnVjb25maWcKIyBFbmFibGUgRlRSQUNFCiQgbWFrZSAtaiQobnByb2MpCi4uLgokIGJhc2gg
c3RhcnQtcWVtdS5zaAouLi4KV2VsY29tZSB0byBCdWlsZHJvb3QKYnVpbGRyb290IGxvZ2luOiBy
b290CiMgaW5zbW9kIC9saWIvbW9kdWxlcy81LjE1LjE4L2V4dHJhL3N5c2RpZy1wcm9iZS5rbwpz
eXNkaWdfcHJvYmU6IGxvYWRpbmcgb3V0LW9mLXRyZWUgbW9kdWxlIHRhaW50cyBrZXJuZWwuCnN5
c2RpZ19wcm9iZTogZHJpdmVyIGxvYWRpbmcsIHN5c2RpZy1wcm9iZSAwLjEuMWRldgojIHN5c2Rp
ZyAtLXZlcnNpb24Kc3lzZGlnIHZlcnNpb24gMC4xLjFkZXYKCklmIHlvdSBzZWUgYW55IHdheSB0
byBpbXByb3ZlIHRoaXMgY29udHJpYnV0aW9uLCBmZWVsIGZyZWUgdG8gc2hhcmUgaXQhCgpGcmFu
Y2lzIExhbmllbCAoMSk6CiAgcGFja2FnZS9zeXNkaWc6IGJ1bXAgdmVyc2lvbiB0byAwLjI3LjEu
CgpicmFkZm9yZCBiYXJyICgxKToKICB0YmI6IG5ldyBwYWNrYWdlCgogREVWRUxPUEVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogLi4uQVRDSF9DT01NQU5ELXRvLWZp
eC1sdWEtdHlwZXMtYW5kLWZ1LnBhdGNoIHwgODIgKysrKysrKysrKysrKysrKysrKwogLi4uZ2Fp
bnN0LWxpYmFic2VpbC1jcHAtd2hpY2gtZ3JwYy11c2VzLnBhdGNoIHwgNDUgKysrKysrKysrKwog
cGFja2FnZS9zeXNkaWcvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKIHBh
Y2thZ2Uvc3lzZGlnL3N5c2RpZy5oYXNoICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2th
Z2Uvc3lzZGlnL3N5c2RpZy5tayAgICAgICAgICAgICAgICAgICAgICB8ICA3ICstCiAuLi4vMDAw
MS10YmItRW5hYmxlLWNyb3NzLWNvbXBpbGF0aW9uLnBhdGNoICAgfCA1NSArKysrKysrKysrKysr
CiBwYWNrYWdlL3RiYi9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgfCAxNiArKysr
CiBwYWNrYWdlL3RiYi90YmIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBw
YWNrYWdlL3RiYi90YmIubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzOSArKysrKysr
KysKIDExIGZpbGVzIGNoYW5nZWQsIDI1MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXNkaWcvMDAwMS1saWJzaW5zcC1BcHBseS1QQVRD
SF9DT01NQU5ELXRvLWZpeC1sdWEtdHlwZXMtYW5kLWZ1LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9zeXNkaWcvMDAwMi1MaW5rLWFnYWluc3QtbGliYWJzZWlsLWNwcC13aGljaC1n
cnBjLXVzZXMucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RiYi8wMDAxLXRiYi1F
bmFibGUtY3Jvc3MtY29tcGlsYXRpb24ucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3RiYi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RiYi90YmIuaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGJiL3RiYi5tawoKCkJlc3QgcmVnYXJkcyBhbmQg
dGhhbmsgeW91IGluIGFkdmFuY2UgZm9yIHlvdXIgcmV2aWV3cy4KClAuUy46IElmIHlvdSBhcmUg
aW50ZXJlc3RlZCwgdGhpcyBidWcgd2FzIHNwb3R0ZWQgd2hpbGUgdHJ5aW5nIHRvIGJ1bXAgTWlu
aWt1YmUKa2VybmVsIHRvIDUuMTAuNTcgWzddLgoKLS0tClsxXSBodHRwczovL2dpdGh1Yi5jb20v
a3ViZXJuZXRlcy9taW5pa3ViZS9jb21taXQvZjAzNmMyNzliYzU5OGNmNTlhZmZiMGZjNTM4YzAx
N2Q4M2FmYjdhYgpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2RyYWlvcy9zeXNkaWcvY29tbWl0L2Ew
NjQ0NDAzOTRjOTNhNzU3OWRjNmUxZGIxM2M4Mzc4ZDVlZWNkNmYKWzNdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9kcmFpb3Mvc3lzZGlnL2NvbW1pdC85Mzg5ODY4OTAyOTFjMTI2ZjliOGYzYTA1MGJjM2Vk
Yzk1ZmI2ZjVhCls0XSBodHRwczovL2dpdGh1Yi5jb20vZHJhaW9zL3N5c2RpZy9jb21taXQvMjY5
MWNiYzY2YzdmYWE5NzMzMzNkNjVhNjk5MDliZTA2YmUyMWMxOApbNV0gaHR0cHM6Ly9naXRodWIu
Y29tL2hob2Zmc3RhZXR0ZS9wb3J0YWdlL2Jsb2IvOGQwNDcyNDc3MTlhMTVjNWE2MzAwMWY2NWJh
MzQ4NTE0NzA2Mjc3ZC9kZXYtdXRpbC9zeXNkaWcvZmlsZXMvMC4yNy4xLWdycGMtYWJzbC1zeW5j
LnBhdGNoCls2XSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMTcwOTI4MjM1MDQzLjMxODkxLTItYnJhZGZvcmRAZGVuc2l0eS5pby8KWzddIGh0
dHBzOi8vZ2l0aHViLmNvbS9rdWJlcm5ldGVzL21pbmlrdWJlL3B1bGwvMTI3MDcKLS0gCjIuMjUu
MQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
