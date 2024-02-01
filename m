Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B44C4828F
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 15:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C86B83D11;
	Thu,  1 Feb 2024 15:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C86B83D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qK22OlYdkcN; Thu,  1 Feb 2024 15:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDEE983D0D;
	Thu,  1 Feb 2024 15:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDEE983D0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D3E1BF279
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 15:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD83360B79
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 15:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD83360B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1ZuxVWGxDhV for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 15:11:44 +0000 (UTC)
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F00B60AC0
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 15:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F00B60AC0
Received: from qiusihao23$mails.ucas.ac.cn ( [117.30.136.180] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 1 Feb 2024 23:11:37 +0800 (GMT+08:00)
X-Originating-IP: [117.30.136.180]
Date: Thu, 1 Feb 2024 23:11:37 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6YKx5oCd6LGq?= <qiusihao23@mails.ucas.ac.cn>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230921(8ad33efc)
 Copyright (c) 2002-2024 www.mailtech.cn cnic.cn
MIME-Version: 1.0
Message-ID: <524bf2c.ae1d.18d6539b773.Coremail.qiusihao23@mails.ucas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowADHz++qtLtl6MMAAA--.4857W
X-CM-SenderInfo: 5tlx2xxkdrjjo6pdxz3voxutnvoduhdfq/1tbiDAcOB2W7suwEwwA
	BsE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Subject: [Buildroot] Use Clang as toolchain for buildroot
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
Content-Type: multipart/mixed; boundary="===============4932414427217265398=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4932414427217265398==
Content-Type: multipart/alternative; 
	boundary="----=_Part_152447_1786599337.1706800297842"

------=_Part_152447_1786599337.1706800297842
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

IEhpLCBJIGFtIG5ldyB0byB0aGUgZW1iZWRkaW5nIHRoaW5ncywgYW5kIEknbSBsb29raW5nIHRv
IHVzZSBidWlsZHJvb3QgdG8gZ2V0IGMvYysrIHBhY2thZ2VzIGNvbXBpbGVkIHdpdGggbXVsdGlw
bGUgcGFyYW1ldGVycyBsaWtlIGNvbXBpbGVyLCBhcmNoaXRlY3R1cmUgYW5kIG9wdGltaXphdGlv
biBsZXZlbCwgZm9yIGFjYWRlbWljIHB1cnBvc2UuIEUuZywgaW4gbXkgZGF0YXNldCwgQmludXRp
bHMgMi4zMiB3aWxsIGJlIGNvbXBpbGVkIGluIFtnY2MxMSwgYXJtNjQsIE8wXSwgW2djYzExLCBh
cm02NCwgTzFdLCAuLi4gYWxvbmcgd2l0aCBvdGhlciB2YXJpYWJsZSBzZXR0aW5ncy4KCiBJIG5v
dGljZWQgdGhhdCBidWlsZHJvb3QgY2FuIHNldCBtb3N0IG9mIHZhcmlhYmxlcyBpbiAuY29uZmln
IGZpbGUsIGJ1dCByZWdhcmRpbmcgYWRkaW5nIGV4dGVybmFsIHRvb2xjaGFpbnMsIGluZm9ybWF0
aW9uIGFyZSByZWxhdGl2ZWx5IGluc3VmZmljaWVudC4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYg
dGhlcmUgYXJlIHNvbWUgd2F5cyB0byBhZGQgY29tcGlsZXJzIGxpa2UgY2xhbmcgaW50byB0aGUg
cGhhc2Ugb2YgYnVpbGRpbmcgdGFyZ2V0IHBhY2thZ2VzLg==
------=_Part_152447_1786599337.1706800297842
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHA+CgkmbmJzcDtIaSwgSSBhbSBuZXcgdG8gdGhlIGVtYmVkZGluZyZuYnNwO3RoaW5ncywgYW5k
IEknbSBsb29raW5nJm5ic3A7dG8gdXNlIGJ1aWxkcm9vdCB0byBnZXQgYy9jKysgcGFja2FnZXMg
Y29tcGlsZWQmbmJzcDt3aXRoIG11bHRpcGxlJm5ic3A7cGFyYW1ldGVycyZuYnNwO2xpa2UgY29t
cGlsZXIsJm5ic3A7YXJjaGl0ZWN0dXJlIGFuZCBvcHRpbWl6YXRpb24gbGV2ZWwsIGZvciBhY2Fk
ZW1pYyBwdXJwb3NlLiBFLmcsIGluIG15IGRhdGFzZXQsIEJpbnV0aWxzIDIuMzIgd2lsbCBiZSBj
b21waWxlZCBpbiBbZ2NjMTEsIGFybTY0LCBPMF0sIFtnY2MxMSwgYXJtNjQsIE8xXSwgLi4uIGFs
b25nIHdpdGggb3RoZXIgdmFyaWFibGUgc2V0dGluZ3MuCjwvcD4KPHA+CgkmbmJzcDtJIG5vdGlj
ZWQgdGhhdCBidWlsZHJvb3QgY2FuIHNldCBtb3N0IG9mIHZhcmlhYmxlcyBpbiAuY29uZmlnIGZp
bGUsIGJ1dCByZWdhcmRpbmcgYWRkaW5nIGV4dGVybmFsIHRvb2xjaGFpbnMsIGluZm9ybWF0aW9u
IGFyZSByZWxhdGl2ZWx5IGluc3VmZmljaWVudC4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgdGhl
cmUgYXJlIHNvbWUgd2F5cyB0byBhZGQgY29tcGlsZXJzIGxpa2UgY2xhbmcgaW50byB0aGUgcGhh
c2Ugb2YgYnVpbGRpbmcgdGFyZ2V0IHBhY2thZ2VzLgo8L3A+
------=_Part_152447_1786599337.1706800297842--


--===============4932414427217265398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4932414427217265398==--

