Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E8DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 17:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F07B040004;
	Fri, 26 Nov 2021 17:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e14aMPKoe7vt; Fri, 26 Nov 2021 17:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF347401A3;
	Fri, 26 Nov 2021 17:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A50E1BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495D8401A3
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1I3UrGXM2dF for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 17:29:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2752340004
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 17:29:31 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e11so19993781ljo.13
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UYOn0q+77MFPREdyailbn28+JRdvTcv/9LH5BtpojhU=;
 b=bTe+kIjheP6f5k5KemSDi9j/y/quU9XvLZ0gJISi3gB4iBxwVa0/dyKJIXJqLK8hCJ
 vYEBhR0vQ23Ap0dwghQpSo+ksMtcIIW8jG18ajBCe/BFnxAsprwjVf8MH8YbufTB1S4k
 ss8BL7FNyB8Uv/RhFF4X/ikvecaWI+mrYnrrCY92lQiIkvIkn7vVK2mMKIddnTv4iwrl
 HR44Q+RWVBnnxpKGvf2m7aH9HHxUapFgUSMXKbx3hWcMginRI5nMPUvx8Gee7E85Cklz
 0THv74ZGyDkM2KZWoAi9a6H8skpqtIdtb9lC9ayPL9VPt86+kD4LjwrH33TDpD35caBu
 1dtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UYOn0q+77MFPREdyailbn28+JRdvTcv/9LH5BtpojhU=;
 b=OR402UWX5eOGTj9tZDu8OmFq7Cczp9NPmcjDA0M5hBRJKb335gYXrJMsc+7dQyDYot
 DbK01yKWQUgq/LYlBiFN45a6bjTzw6AY3vlxVX2lb///RnrDTgKG/CrpTpZeqT74B/JM
 3y/FwJoz2inJbMpwfZr5z3JgPWEOtOuiLx3nIFudHEqzvElmU/M234jq/CIm2imhZMX+
 Kq4klqhDU17eByhtjbYvAZdwERWUE9o+np1/INbDc3Hzmqma6ipdISfNsbJJfflPkhu9
 aVyEfDaDhHOHl4frU+qptKCVhnHHy5HR7T8tlOgY0HdQxmvxNrdas7TGVzq14c2qQa3U
 yoOQ==
X-Gm-Message-State: AOAM531/GG/PO2jO4SPVSw9WcPM+vDa8u9GKQaOR7zo4AESXvECMDDwX
 ict9TIm1QoCx3I1YvSo0B+rzaq33zUS0RFqvjg0=
X-Google-Smtp-Source: ABdhPJxwLEVeSPiW9362q0kuWJ0dP5o6Gui0SratS4JX6PUiKKvvJ8LGxmnUeLpJDZj4o7Gg4Ep3y2hhuiNDY2bZlFw=
X-Received: by 2002:a2e:b947:: with SMTP id 7mr33104502ljs.89.1637947769129;
 Fri, 26 Nov 2021 09:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20211125215654.4189447-1-fontaine.fabrice@gmail.com>
 <fc493f23-3579-93d7-92d9-9caa80c0041f@mind.be>
In-Reply-To: <fc493f23-3579-93d7-92d9-9caa80c0041f@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 26 Nov 2021 18:26:52 +0100
Message-ID: <CAPi7W83ni9L-Qa0ACpKYNUACV_eHSdr=97yibictPmo646RH_Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH/next 1/1] utils/checkpackagelib/lib_mk.py:
 check typo in define
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBBcm5vdXQsCgpMZSB2ZW4uIDI2IG5vdi4gMjAyMSDDoCAwODo0MiwgQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBhIMOpY3JpdCA6Cj4KPgo+Cj4gT24gMjUvMTEvMjAy
MSAyMjo1NiwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+IENoZWNrIHR5cG8gaW4gZGVmaW5l
IHRvIGRldGVjdCBTTUFLRV9MSU5VWF9DT05GSUdfRklYVVBTIGluIHNtYWNrCj4gPiAoZml4ZWQg
YnkgNDFlMjEzMmZiZThhOGZjMjM3Y2E0YTJjZDJlZmY5YmQ5Y2VkMDlhNikKPiA+Cj4gPiBBZGQg
R0NDX1RBUkdFVCBpbiBBTExPV0VEIHZhcmlhYmxlIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgd2Fy
bmluZ3M6Cj4gPgo+ID4gYXJjaC9hcmNoLm1rOjEyOiBwb3NzaWJsZSB0eXBvOiBHQ0NfVEFSR0VU
X0FSQ0ggLT4gKkFSQ0gqCj4gPiBhcmNoL2FyY2gubWs6MTM6IHBvc3NpYmxlIHR5cG86IEdDQ19U
QVJHRVRfQUJJIC0+ICpBUkNIKgo+ID4gYXJjaC9hcmNoLm1rOjE0OiBwb3NzaWJsZSB0eXBvOiBH
Q0NfVEFSR0VUX05BTiAtPiAqQVJDSCoKPiA+IGFyY2gvYXJjaC5tazoxNTogcG9zc2libGUgdHlw
bzogR0NDX1RBUkdFVF9GUDMyX01PREUgLT4gKkFSQ0gqCj4gPiBhcmNoL2FyY2gubWs6MTY6IHBv
c3NpYmxlIHR5cG86IEdDQ19UQVJHRVRfQ1BVIC0+ICpBUkNIKgo+ID4gYXJjaC9hcmNoLm1rOjE3
OiBwb3NzaWJsZSB0eXBvOiBHQ0NfVEFSR0VUX0ZQVSAtPiAqQVJDSCoKPiA+IGFyY2gvYXJjaC5t
azoxODogcG9zc2libGUgdHlwbzogR0NDX1RBUkdFVF9GTE9BVF9BQkkgLT4gKkFSQ0gqCj4gPiBh
cmNoL2FyY2gubWs6MTk6IHBvc3NpYmxlIHR5cG86IEdDQ19UQVJHRVRfTU9ERSAtPiAqQVJDSCoK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICB1dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX21rLnB5
IHwgNyArKysrLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3V0aWxzL2NoZWNrcGFja2FnZWxpYi9saWJf
bWsucHkgYi91dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX21rLnB5Cj4gPiBpbmRleCBkMDk5MjJm
NzI0Li45MTc4OTMxMjc2IDEwMDY0NAo+ID4gLS0tIGEvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xp
Yl9tay5weQo+ID4gKysrIGIvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5weQo+ID4gQEAg
LTIzNiw2ICsyMzYsNyBAQCBjbGFzcyBUeXBvSW5QYWNrYWdlVmFyaWFibGUoX0NoZWNrRnVuY3Rp
b24pOgo+ID4gICAgICAgICAgICJCUl9DQ0FDSEVfSU5JVElBTF9TRVRVUCIsCj4gPiAgICAgICAg
ICAgIkJSX0xJQkMiLAo+ID4gICAgICAgICAgICJCUl9OT19DSEVDS19IQVNIX0ZPUiIsCj4gPiAr
ICAgICAgICAiR0NDX1RBUkdFVCIsCj4gPiAgICAgICAgICAgIkxJTlVYX0VYVEVOU0lPTlMiLAo+
ID4gICAgICAgICAgICJMSU5VWF9QT1NUX1BBVENIX0hPT0tTIiwKPiA+ICAgICAgICAgICAiTElO
VVhfVE9PTFMiLAo+ID4gQEAgLTI0OCw3ICsyNDksNyBAQCBjbGFzcyBUeXBvSW5QYWNrYWdlVmFy
aWFibGUoX0NoZWNrRnVuY3Rpb24pOgo+ID4gICAgICAgICAgICJUQVJHRVRfRklOQUxJWkVfSE9P
S1MiLAo+ID4gICAgICAgICAgICJUQVJHRVRTX1JPT1RGUyIsCj4gPiAgICAgICAgICAgIlhURU5T
QV9DT1JFX05BTUUiXSkpCj4gPiAtICAgIFZBUklBQkxFID0gcmUuY29tcGlsZShyIl4oW0EtWjAt
OV9dK19bQS1aMC05X10rKVxzKihcK3wpPSIpCj4gPiArICAgIFZBUklBQkxFID0gcmUuY29tcGls
ZShyIl4oZGVmaW5lICk/KFtBLVowLTlfXStfW0EtWjAtOV9dKykiKQo+Cj4gICBUaGlzIG5vIGxv
bmdlciBtYXRjaGVzIGlubGluZSBhc3NpZ25tZW50cy4uLiBTbyBJIHRoaW5rIHRoaXMgc2hvdWxk
IGJlCj4gc29tZXRoaW5nIGxpa2UKPiBeKGRlZmluZSApPyhbQS1aMC05X10rX1tBLVowLTlfXSsp
fF4oW0EtWjAtOV9dK19bQS1aMC05X10rKVxzKihcK3wpPQpDYW4geW91IGdpdmUgbWUgYW4gZXhh
bXBsZSBvZiBhbiBpbmxpbmUgYXNzaWdubWVudCB0aGF0IGlzIG5vdCBjYXRjaGVkIGFueW1vcmU/
CgpUaGlzIG5ldyBleHByZXNzaW9uIHdpbGwgY2F0Y2g6ClNNQUtFX0NPTkZfT1BUUwphcyB3ZWxs
IGFzCmRlZmluZSBTTUFLRV9MSU5VWF9DT05GSUdfRklYVVBTCgpJIG1hZGUgb25seSB0d28gbW9k
aWZpY2F0aW9uczoKIC0gYWRkIChkZWZpbmUgKT8gd2hpY2ggd2lsbCBtYXRjaCAiZGVmaW5lICIg
YnV0IGFsc28gYW4gZW1wdHkgdmFsdWUuClRoYW5rcyB0byB0aGlzLCB0aGUgc2Vjb25kIGdyb3Vw
IHdpbGwgYWx3YXlzIGNvbnRhaW4gdGhlIHZhcmlhYmxlCm5hbWUuCiAtIHJlbW92ZSBccyooXCt8
KT0gd2hpY2ggc2VlbXMgc3VwZXJmbHVvdXMKPgo+ICAgSWRlYWxseSwgd2Ugc2hvdWxkIGhhdmUg
YSBydW50aW1lIHRlc3QgdGhhdCB2YWxpZGF0ZXMgdGhhdCBjaGVjay1wYWNrYWdlCj4gY2F0Y2hl
cyB0aGUgZXJyb3JzIHdlIHdhbnQgaXQgdG8gY2F0Y2guLi4KPgo+ID4KPiA+ICAgICAgIGRlZiBi
ZWZvcmUoc2VsZik6Cj4gPiAgICAgICAgICAgcGFja2FnZSwgXyA9IG9zLnBhdGguc3BsaXRleHQo
b3MucGF0aC5iYXNlbmFtZShzZWxmLmZpbGVuYW1lKSkKPiA+IEBAIC0yNTgsNyArMjU5LDcgQEAg
Y2xhc3MgVHlwb0luUGFja2FnZVZhcmlhYmxlKF9DaGVja0Z1bmN0aW9uKToKPiA+ICAgICAgICAg
ICAjIGxpbnV4IGV4dGVuc2lvbnMgZG8gbm90IHVzZSBMSU5VWF9FWFRfIHByZWZpeCBmb3IgdmFy
aWFibGVzCj4gPiAgICAgICAgICAgcGFja2FnZSA9IHBhY2thZ2UucmVwbGFjZSgiTElOVVhfRVhU
XyIsICIiKQo+ID4gICAgICAgICAgIHNlbGYucGFja2FnZSA9IHBhY2thZ2UKPiA+IC0gICAgICAg
IHNlbGYuUkVHRVggPSByZS5jb21waWxlKHIiXihIT1NUX3xST09URlNfKT8oe31fW0EtWjAtOV9d
KykiLmZvcm1hdChwYWNrYWdlKSkKPiA+ICsgICAgICAgIHNlbGYuUkVHRVggPSByZS5jb21waWxl
KHIiKEhPU1RffFJPT1RGU18pPyh7fV9bQS1aMC05X10rKSIuZm9ybWF0KHBhY2thZ2UpKQo+ID4g
ICAgICAgICAgIHNlbGYuRklORF9WSVJUVUFMID0gcmUuY29tcGlsZSgKPiA+ICAgICAgICAgICAg
ICAgciJee31fUFJPVklERVNccyooXCt8KT1ccyooLiopIi5mb3JtYXQocGFja2FnZSkpCj4gPiAg
ICAgICAgICAgc2VsZi52aXJ0dWFsID0gW10KPiA+IEBAIC0yNjgsNyArMjY5LDcgQEAgY2xhc3Mg
VHlwb0luUGFja2FnZVZhcmlhYmxlKF9DaGVja0Z1bmN0aW9uKToKPiA+ICAgICAgICAgICBpZiBt
IGlzIE5vbmU6Cj4gPiAgICAgICAgICAgICAgIHJldHVybgo+ID4KPiA+IC0gICAgICAgIHZhcmlh
YmxlID0gbS5ncm91cCgxKQo+ID4gKyAgICAgICAgdmFyaWFibGUgPSBtLmdyb3VwKDIpCj4KPiAg
IEFoLCB3aXRoIHRoZSByZWdleCB0aGF0IG1hdGNoZXMgYm90aCwgdGhpcyB3aWxsIGJlIHRyaWNr
eS4uLiBQZXJoYXBzIHdlIHNob3VsZAo+IHVzZSBuYW1lZCBncm91cHMgdGhlbi4KPgo+Cj4gICBS
ZWdhcmRzLAo+ICAgQXJub3V0Cj4KPgo+ID4KPiA+ICAgICAgICAgICAjIGFsbG93IHRvIHNldCB2
YXJpYWJsZXMgZm9yIHZpcnR1YWwgcGFja2FnZSB0aGlzIHBhY2thZ2UgcHJvdmlkZXMKPiA+ICAg
ICAgICAgICB2ID0gc2VsZi5GSU5EX1ZJUlRVQUwuc2VhcmNoKHRleHQpCj4gPgpCZXN0IFJlZ2Fy
ZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
