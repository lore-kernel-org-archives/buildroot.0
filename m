Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8EFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 23:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF89983DEF;
	Thu, 13 Jan 2022 23:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJACKQbE25Hs; Thu, 13 Jan 2022 23:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3248583410;
	Thu, 13 Jan 2022 23:27:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A225D1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975DA4165B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8I5hn24ikEkL for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 23:27:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B61941653
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 23:27:39 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a18so28796511edj.7
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 15:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YLr6FAwEXNVmgTRGG198prMlm43JVlBlkdIPyTbkE2o=;
 b=pPeLzdpkq9RefZJEOLMBPW76hKM+Dup/2b4i/Y5iOv8FwA+Oe1N4gRwIBtKUvZ7AwL
 DIZbOFGjc677jfk9HeEGfXcareAGLFhlaxlMguRc4zaqNsjYj8OsZeDYUpjM14AfScvi
 TZBGAwA57X9+wcPhKDWltvnguMC2xaW6v967USd8F9NIZ29RHKK8yYUGlPqdkML5yE32
 VWw5yYCX0AWv9JzoSm6XCD/hcK18st4xbssZeUJJh2d2lMMyABQ16evGb2vlA/5oXy4P
 +JD1qaTsRD7MXvuQgIJ1YYYp3xG2yiZEUuM28h/N34MjhYPZZTnOdfH3XEfAdGTyeQ+t
 4skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YLr6FAwEXNVmgTRGG198prMlm43JVlBlkdIPyTbkE2o=;
 b=kPlXaETSjZ1WwDOF8BXM7JjnCPmdiNTmgIn1W+gBGzMk8I7Zs1PQTT8RC/2q8zjjaz
 /alx27TWQ+i3qhWoIwSfv6LGRwBlx+SO//de/Rm7zGOg9rUSxZHobj6cPkud/FxbDnET
 Xb9GSsrNLExiIpGHS36MPN2/LeV2KCXrRTu6TL7oH2kswueFaYNgIEJv9s2ixF0Rg0dD
 xRtxHgxLwE4tUdxK5Jf18bbarEqS82Q6USepAuY70hB6bd9DYhkw0uUR77lrWSHP0CI7
 tn/x3XJjmfehj4wrnfkMaqPiCRCihXYvUebSd3HPn2+50zVHaBEXpm3CND21n4xB3C1/
 jxwg==
X-Gm-Message-State: AOAM530C3GQSzBn1p1jucxnUFttwtAtHB7zmihLsey1cQICPeY21qwNa
 ZTnP4g7aMDD0qogImSngnRnJCD+iWttOFWt3aT5KjHtW3co=
X-Google-Smtp-Source: ABdhPJz2IONVENgFLRC+nNjiD6KOGkFW9NEcW9mcITQQbyjZwW/KweDLLn2OkkPYfCeLZubqERhsWTzjZMtDD+I4Svg=
X-Received: by 2002:a17:906:4c87:: with SMTP id
 q7mr5666684eju.460.1642116457416; 
 Thu, 13 Jan 2022 15:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20211220093311.1927043-1-fontaine.fabrice@gmail.com>
 <20220113220429.3ae14160@windsurf>
In-Reply-To: <20220113220429.3ae14160@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Jan 2022 00:26:07 +0100
Message-ID: <CAPi7W82+CWMafFZRBYe2miD+S3__YoVNnrCF7CNROR6rCAxiGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-rtsp-server:
 fix introspection
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAxMyBqYW52LiAyMDIyIMOgIDIyOjA0LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4g
T24gTW9uLCAyMCBEZWMgMjAyMSAxMDozMzoxMSArMDEwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gRml4IHRoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZSB3aXRoIGludHJvc3BlY3Rpb246Cj4gPgo+ID4gL2hvbWUvZ2l1bGlvYmVu
ZXR0aS9hdXRvYnVpbGQvcnVuL2luc3RhbmNlLTMvb3V0cHV0LTEvaG9zdC9yaXNjdjMyLWJ1aWxk
cm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvYmluL2ctaXItY29tcGlsZXIgZ3N0L3J0c3Atc2Vy
dmVyL0dzdFJ0c3BTZXJ2ZXItMS4wLmdpciAtLW91dHB1dCBnc3QvcnRzcC1zZXJ2ZXIvR3N0UnRz
cFNlcnZlci0xLjAudHlwZWxpYiAtLWluY2x1ZGVkaXI9L3Vzci9zaGFyZS9naXItMS4wCj4gPiBD
b3VsZCBub3QgZmluZCBHSVIgZmlsZSAnR3N0LTEuMC5naXInOyBjaGVjayBYREdfREFUQV9ESVJT
IG9yIHVzZSAtLWluY2x1ZGVkaXIKPiA+IGVycm9yIHBhcnNpbmcgZmlsZSBnc3QvcnRzcC1zZXJ2
ZXIvR3N0UnRzcFNlcnZlci0xLjAuZ2lyOiBGYWlsZWQgdG8gcGFyc2UgaW5jbHVkZWQgZ2lyIEdz
dC0xLjAKPiA+IElmIHRoZSBhYm92ZSBlcnJvciBtZXNzYWdlIGlzIGFib3V0IG1pc3NpbmcgLnNv
IGxpYnJhcmllcywgdGhlbiBzZXR0aW5nIHVwIEdJUl9FWFRSQV9MSUJTX1BBVEggaW4gdGhlIC5t
ayBmaWxlIHNob3VsZCBoZWxwLgo+ID4gVHlwaWNhbGx5IGxpa2UgdGhpczogUEtHX01BS0VfRU5W
ICs9IEdJUl9FWFRSQV9MSUJTX1BBVEg9IiQoQEQpLy5saWJzIgo+ID4KPiA+IEZpeGVzOgo+ID4g
IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMDRhZjZiMjJjZmEwY2Zm
YjZhMzEwOWEzYjMyYjI3MTM3YWQyZTBiMAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gVGhhbmtzIGFwcGxpZWQs
IGJ1dCBzZWUgYmVsb3cuCj4KPiA+ICtTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+ICtbVXBzdHJlYW0gc3RhdHVzOgo+ID4gK2h0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXJ0c3Atc2VydmVyLy0v
bWVyZ2VfcmVxdWVzdHMvMjE3XQo+Cj4gWW91J3ZlIGhhZCBzb21lIGZlZWRiYWNrIGFib3V0IHJl
c3VibWl0dGluZyB0byB0aGUgbW9ub3JlcG8gKHdoaWNoIEkKPiBzdXBwb3NlIGlzIHRoZSBuZXcg
c2luZ2xlIHJlcG8gdGhhdCBnc3RyZWFtZXIgZGV2ZWxvcGVycyBhcmUgdXNpbmcKPiBub3cpLiBJ
ZiBub3QgYWxyZWFkeSBkb25lLCBjb3VsZCB5b3UgZm9sbG93LXVwIG9uIHRoaXM/Ckl0IGlzIGFs
cmVhZHkgbWVyZ2VkOgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dz
dHJlYW1lci8tL2NvbW1pdC9lNjM3YWFlNjI5ZjViOTViNzQ4YTZmMjNhYmVjYzJiNTAyMjcyODIy
Cj4KPiBUaGFua3MgYSBsb3QhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KQmVzdCBSZWdhcmRzLAoK
RmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
