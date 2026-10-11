Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3BCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2945380EBA;
	Sun, 11 Oct 2026 10:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWXaMvapgEfn; Sun, 11 Oct 2026 10:15:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C4B980EDB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713702;
	b=kYQ/RcKSvGPxBphd833HhfPQfCmdmPm4LTGbJXFw6tC8PGMU6Aw9oqvIOthCu8XqhqPw
	 Qr+t/Rn4GaCUYGV0MFkcrSnkVSZ8L3dAAJshsOPhJeYXTbPdxfhOZZMENB0AxF4K91eGZ
	 vUJXYiqOYiypFp/YhbxAFeq8hnRYTOldiCnH98e3UtgCy7h3shoNBMKrdp/1NmAyc4egA
	 u0+cShhmXaN5C7CxlDT8hV3XYIxgsp3/Dl4+WIRVGRLiIdCU8/uWr8CMrNWyZGK7htcsm
	 Z25utBF9TAWMw+yM9xmJ3mbCnifUm48Iq3FwXmQGUpwssvsPNQMT5PGL5PFghfe9awQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bPQadNqvpU9MYmVa4869SBypg0fLAr0FDZY0ZrN2sek=;
	b=kBekrMj+96MecMFG2NK83UTdaJM8Qx2ih5vtZ+rgRUyOfanDHbooRRPw8WulpY065gSV
	 fwEO4hH0dbjq0eoMax1Aargswb146DObpLQVm4I7vWPyGnffYZFHPFI6kapPRL84805qH
	 VAybehLYvHhHGqzEzRI3fo3oHkcPu/iNCRo1f6O3jp1fmXnsDZNbl8Mq0nsxx3Dxzq67E
	 mgm1aibIQ0CZQSezia1VkVIpcmOGqGI8kZ67I/HEkJAhEzKFMN7LG531Gmwl/nDvHJeSv
	 KBaoEsmvtk51cmcu2XBkqvKcsuDVTY8wa4rXEUnQtkkZL318JOvCIv8J2VdEzuSRC0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713702;
	bh=bPQadNqvpU9MYmVa4869SBypg0fLAr0FDZY0ZrN2sek=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6+Fns7XmER/2z8tbxYj4ZA3JpvDPg1jy2u2iJbKTgqo9X80EoGCl5Tzibbtc2Htp
	 MloCWPit/lYjo7GGhvJXzMTm5+6jvVLMc67Sm9rPZm4YPndQNvO7eLKzixTt8n6Z0Y
	 3SPp/qZlzdfbmbOglGkY0BmSMbuIdDMcb9Oi5vZQbQeDetAnKwM9dFLSj2AfhRqNeT
	 K9bzTjcUcnCD7q9xqxmOBRIS8YrHE6YbUCAEcsQWaO3/tsqfJ3EPZCtdLXgxgkfkEF
	 NLOcD2zFPqaBBB3Shly05rBwC2LOaemYTqEVM6TMK1IMVNdi4AlJocY+TOt1hoti5J
	 Weq9ZQXag6dKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4B980EDB;
	Sun, 11 Oct 2026 10:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF48C317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C119A40677
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcUE4OMi1hEx for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:15:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CAB504065F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713700;
 b=FMXvjjJpA9S4ExhdV6spK54b0dWXX6Pc3ONYzZ0oVsmSXD3RUwzTWxppc7UXvN2NMTjW
 A7e+Wa3A9dvGlfk/VSCjRtztOZtWi6hfidlBRMlT98hlMlYLY+5F3YxvqIbhcB1qZA+6Z
 JQl8PJHwLn58e7VFb3krazE0bFeFffpkaIisIOaT5gCNg0TI5FmlWU2cxZLFLlcG6vt72
 R9Bh2pfaZH/EBM4HtStNQilUanMwHgyeV4DVCuv3gl9X+NqOlIX6QNOMJ0lqmjXOxXEVp
 XCllzWlpWt4dfRbIJL5r5o6xXiX8Fi1IvEkdKCjIkCqsDKxqPiWogwW+SiEUqLNoSFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713700;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Lrze6FFromsG56ui97qGQbesYU/Nm95Tes/8obIhVxw=;
 b=iMsj5HD1LeEHkTVt/p4MrAw+bQlx/o/wNupD+eFktMIqnFQKQsYYvhpV3f2bs15C5rT+
 PHTgQHu1+BFbJAdcNtR8r6ZnIJLD2JVv73ayyAMifPmhExN4AZeW9MhAshphL6p7GQNiB
 koFUcRfsTUL9ev4KVO/qhE/ZVqK8bHdw5x0lfvJIrwqEE6sr1wWmkJwV0wFseva/Y99Tf
 zrEBuRRTlJLp7nRoBzyiJjs24uvIMAnG2ZuschYnBzp9ZL6C55jebIgN25DlHZO5ft+dA
 2TJvDOjkdCyJnwcFd2ut2SmYs8kPgYCnofkL/DvlYLXER0mmWxgdCo2a9buTX5FR91g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=MI7ccYkm; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MI7ccYkm
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAB504065F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:14:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MI7ccYkmPTp2k1JUI3+kADb6lBUTjcH/tOCrGgTkkNmlJsLhdQuhm1IzXm17erNy2GEWyyoNeivN7fGGcSktKWnkxsawIGOzMd/saNKYVeoMEHieLlgYTXgsfbYPcjsrdzr/9Db0U30ltrJUAzOsw2YkdqLVsv9b5PAz/VdyJL2yfC6mHYIFQDNGZ/fV8ycu61J8aPmiMaTco9A6iDX4N9/IFGhM3yVRQYKdZKEtXV3DyLzikO9uK1lOfw78R0dNbsKz87v0uUfJWpk7K7lM/arN9t8XSIsX+xvIh76UuXzuLsuEZW0v2WbkDnCAOtNZSlAazKyOaGC7Oi9XcyTClg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=dp0PYwPgRTe5K2Oiadtqo0zg5TJBXntCxR6JS3mgacc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1376809896; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 10:14:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFqZx-00000008qRF-1RgR;
 Sun, 11 Oct 2026 12:14:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261002103144.13914-3-flaviu.nistor@gmail.com> (Flaviu Nistor's
 message of "Fri, 2 Oct 2026 13:31:37 +0300")
References: <20261002103144.13914-1-flaviu.nistor@gmail.com>
 <20261002103144.13914-3-flaviu.nistor@gmail.com>
Date: Sun, 11 Oct 2026 12:14:53 +0200
Message-ID: <874iesh7c2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 3/3] support/testing: add snappy
 test
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

Pj4+Pj4gIkZsYXZpdSIgPT0gRmxhdml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+
IHdyaXRlczoKCiA+IEFkZCBhIHNpbXBsZSB0ZXN0IGNhc2UgdGhhdCBpbXBvcnRzIHRoZSBtb2R1
bGUgYW5kIGRvZXMgYSBzaW1wbGUgY29tcHJlc3MKID4gZGVjb21wcmVzcyByb3V0aW5lLgoKID4g
U2lnbmVkLW9mZi1ieTogRmxhdml1IE5pc3RvciA8Zmxhdml1Lm5pc3RvckBnbWFpbC5jb20+CiA+
IC0tLQogPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKysKID4gIC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5ICAgICB8
ICA3ICsrKysKID4gIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5weSAgICAg
ICB8IDM0ICsrKysrKysrKysrKysrKysrKysKID4gIDMgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0
aW9ucygrKQogPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9weXRob25fc25hcHB5LnB5CiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25hcHB5LnB5CgogPiBkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKID4gaW5kZXggZGJlMDViNzgwNi4uMTUzYjJm
NGFmNSAxMDA2NDQKID4gLS0tIGEvREVWRUxPUEVSUwogPiArKysgYi9ERVZFTE9QRVJTCiA+IEBA
IC0xMTQwLDYgKzExNDAsOCBAQCBGOglwYWNrYWdlL3B5dGhvbi1jcmFtamFtLwogPiAgRjoJcGFj
a2FnZS9weXRob24tcmljaC8KID4gIEY6CXBhY2thZ2UvcHl0aG9uLXNtbWFwMi8KID4gIEY6CXBh
Y2thZ2UvcHl0aG9uLXNuYXBweS8KID4gK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3NhbXBsZV9weXRob25fc25hcHB5LnB5CiA+ICtGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl9zbmFwcHkucHkKIAogPiAgTjoJRmzDoXZpbyBUYXBhasOzcyA8Zmxh
dmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CiA+ICBGOgljb25maWdzL2FzdXNfdGlua2VyLXNf
cmszMjg4X2RlZmNvbmZpZwogPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX3NuYXBweS5weQogPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAogPiBp
bmRleCAwMDAwMDAwMDAwLi5mZjJjMDdjMDVhCiA+IC0tLSAvZGV2L251bGwKID4gKysrIGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkKID4gQEAg
LTAsMCArMSw3IEBACiA+ICtpbXBvcnQgc25hcHB5CiA+ICsKID4gK3BheWxvYWQgPSBiIkJ1aWxk
cm9vdCBweXRob24tc25hcHB5IHJ1bnRpbWUgdGVzdFxuIgogPiArY29tcHJlc3NlZCA9IHNuYXBw
eS5jb21wcmVzcyhwYXlsb2FkKQogPiArZGVjb21wcmVzc2VkID0gc25hcHB5LnVuY29tcHJlc3Mo
Y29tcHJlc3NlZCkKID4gKwogPiArYXNzZXJ0IGRlY29tcHJlc3NlZCA9PSBwYXlsb2FkCiA+IGRp
ZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFw
cHkucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFwcHku
cHkKID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKID4gaW5kZXggMDAwMDAwMDAwMC4uOGMwMDkyYmQy
MwogPiAtLS0gL2Rldi9udWxsCiA+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX3NuYXBweS5weQogPiBAQCAtMCwwICsxLDM0IEBACiA+ICtpbXBvcnQgb3MK
ID4gKwogPiArZnJvbSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9u
UGFja2FnZUJhc2UKID4gKwogPiArCiA+ICtjbGFzcyBUZXN0UHl0aG9uUHkzU25hcHB5KFRlc3RQ
eXRob25QYWNrYWdlQmFzZSk6CiA+ICsgICAgX190ZXN0X18gPSBUcnVlCiA+ICsgICAgY29uZmln
ID0gIiIiCiA+ICsgICAgICAgIEJSMl9hYXJjaDY0PXkKID4gKyAgICAgICAgQlIyX1RPT0xDSEFJ
Tl9FWFRFUk5BTD15CiA+ICsgICAgICAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0
dHlBTUEwIgogPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKID4gKyAgICAgICAgQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CiA+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNi4xMzUiCiA+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfVVNFX0NVU1RPTV9DT05GSUc9eQogPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9DT05GSUdfRklMRT0iYm9hcmQvcWVtdS9hYXJjaDY0LXZpcnQvbGludXguY29uZmlnIgogPiAr
ICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKID4gKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlU
SE9OX1NOQVBQWT15CiA+ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQogPiArICAg
ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CiA+ICsgICAgICAgICIiIgoK
SWRlYWxseSB3ZSBzaG91bGQgZml4IHRoZSBpc3N1ZSB0aGF0IHlvdSBydW4gaW50byB3aXRoIG91
ciBkZWZhdWx0IGFybXY1Cmtlcm5lbCBvciBhdCBsZWFzdCBkb2N1bWVudCB3aHkgd2UgbmVlZCB0
aGlzLiBBcyBhbiBhbHRlcm5hdGl2ZSB0aGUKc3RhbmRhcmQgYXJtdjcga2VybmVsIGNvdWxkIGFs
c28gYmUgdXNlZCwgc2ltaWxhciB0byBFLkcuIHRlc3RfYmF0LnB5CgoKID4gKyAgICBpbnRlcnBy
ZXRlciA9ICJweXRob24zIgoKVGhlIGRlZmF1bHQgaXMgZmluZSBoZXJlLCBzbyBubyBuZWVkIHRv
IG92ZXJyaWRlLgoKPiArICAgIHNhbXBsZV9zY3JpcHRzID0gWyJ0ZXN0cy9wYWNrYWdlL3NhbXBs
ZV9weXRob25fc25hcHB5LnB5Il0KID4gKyAgICB0aW1lb3V0ID0gMjAKCldoeT8KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
