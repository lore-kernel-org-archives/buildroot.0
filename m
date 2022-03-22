Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A0B611F4;
	Tue, 22 Mar 2022 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EB9MiMdHaxQs; Tue, 22 Mar 2022 12:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC7C611ED;
	Tue, 22 Mar 2022 12:40:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5FFB1BF2A4
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C30611ED
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 12:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-lC7GRHGb7G for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 12:40:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF1860A9F
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 12:40:29 +0000 (UTC)
Received: from smtpclient.apple ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPA
 id WdoHnpe4UJ0EVWdoHnT7BL; Tue, 22 Mar 2022 13:40:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1647952826; bh=UnGp9cc3vIwVeSywmRbRtn50W2Dlb/3XfUVnicd2ExU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=UHEepx3bkTE5XO9Hnsm/ecnn5Ax1zD535pnkUDL0YZfSpsYT73m+39WrYK6Dt8PY+
 gvhSPBgDQBZ27YQKL0IMWBPFUDOZrlTV2NTfO7i7aJBwgsJEFMFjYTNHRvbR8QI/4V
 Gzg1RCSnMo+N9n2LN44Ir+P1mlixUL9IytP01oxvWbKF3xWWsoBgHeUOkGWsOP2SEF
 nHWoTfmShB7gVC9sprnHFujnJrkrZk3pltWsMFlSFup5GN+DR6pBgEgRJ83xMyhvQF
 R6OEdi89ObnlUZAOLNcmVtwhHBXHv84f4FD576C8o72IXANtbY6aZuzhzhbCk7CHuM
 CW+KdaN1x+1sQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 22 Mar 2022 13:40:25 +0100
Message-Id: <70D87B9E-978A-49CE-BECE-500C876CE13D@benettiengineering.com>
References: <20220322110313.4061782-1-neal.frager@amd.com>
In-Reply-To: <20220322110313.4061782-1-neal.frager@amd.com>
To: Neal Frager <neal.frager@amd.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfEHYdJEP6giCuuavOoJo8RvtvcBIluhWXVx01LEs/JYQJFpC+pSDgWfvG0oPDaHMhOgOAgeCg8BwHzqVC2B2OA9yynkKjOp8rTCSfLOo4WrbT0LHzFib
 V4C4SRjUm2ELUIQuPA6I0Tj/vV0vY0Ifb8Z6iwKDupMInDXUg5ZDVeHLTmrXcR7QGfu2huMmqeYzaXJk5TGQ4+REi49ndRefcv0C7yvb1+9u7cubQJXjQ4XI
 39F2I3H1+Z7p4+A0xa2FZ+/uKIO8FYogsB61CY4Zg7xL6412awsO17aUhIh6f+1rKObnhWzN5Mb9/t3tmg4NAHSKcSJb2W7SlDzRvsH1D32XOiNFK7d78Ipn
 8HIGjuNW
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: change git to
 https
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
Cc: luca@lucaceresoli.net, fabio.caccamo@amd.com, michal.simek@amd.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCj4gSWwgZ2lvcm5vIDIyIG1hciAyMDIyLCBhbGxlIG9yZSAxMjowMywgTmVhbCBG
cmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/VGhpcyBwYXRj
aCBtaWdyYXRlcyBYaWxpbnggTGludXgga2VybmVsIGFuZCBVLUJvb3QgZnJvbSBnaXQ6Ly8gdG8K
PiBodHRwczovLyBiZWNhdXNlIGdpdDovLyBpcyBubyBsb25nZXIgc3VwcG9ydGVkLgo+IAo+IEZv
ciBtb3JlIGRldGFpbHM6Cj4gaHR0cHM6Ly9naXRodWIuYmxvZy8yMDIxLTA5LTAxLWltcHJvdmlu
Zy1naXQtcHJvdG9jb2wtc2VjdXJpdHktZ2l0aHViLwo+IAo+IFNpZ25lZC1vZmYtYnk6IE5lYWwg
RnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgo+IC0tLQo+IERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gY29uZmlncy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZyB8IDQg
KystLQo+IGNvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZjb25maWcgfCA0ICsrLS0KPiAzIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA5NDJiYjhmZTljLi41OGVkNGY4MWNk
IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTIwODks
NyArMjA4OSw3IEBAIEY6ICAgIHBhY2thZ2UvbGliZXZkZXYvCj4gRjogICAgcGFja2FnZS9wa2ct
cW1ha2UubWsKPiBGOiAgICBwYWNrYWdlL3F0NS9xdDVvcGN1YS8KPiAKPiAtTjogICAgTmVhbCBG
cmFnZXIgPG5lYWwuZnJhZ2VyQHhpbGlueC5jb20+Cj4gK046ICAgIE5lYWwgRnJhZ2VyIDxuZWFs
LmZyYWdlckBhbWQuY29tPgo+IEY6ICAgIGJvYXJkL3p5bnFtcC8KPiBGOiAgICBjb25maWdzL3p5
bnFtcF96Y3UxMDJfZGVmY29uZmlnCgpUaGlzIF5eXiBzaG91bGQgYmUgc3BsaXR0ZWQgaW50byBh
bm90aGVyIHBhdGNoLgoKQmVzdCByZWdhcmRzCuKAlC0KR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBF
bmdpbmVlcmluZyBzYXMKCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvenlucW1wX3pjdTEwMl9k
ZWZjb25maWcgYi9jb25maWdzL3p5bnFtcF96Y3UxMDJfZGVmY29uZmlnCj4gaW5kZXggNGU5NjQ4
OTE3OS4uMmRkMDgxN2JkOCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3p5bnFtcF96Y3UxMDJfZGVm
Y29uZmlnCj4gKysrIGIvY29uZmlncy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZwo+IEBAIC00LDcg
KzQsNyBAQCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC96eW5xbXAvcG9zdC1i
dWlsZC5zaCIKPiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC96eW5xbXAvcG9z
dC1pbWFnZS5zaCIKPiBCUjJfTElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9HSVQ9eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9SRVBPX1VSTD0iZ2l0Oi8vZ2l0aHVi
LmNvbS9YaWxpbngvbGludXgteGxueC5naXQiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JF
UE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0Igo+IEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVkVSU0lPTj0idjUuMTUtOTMwLWc5NjYxMjQ1MzI2NTZi
Yzk1ZDc4MWFiZjU3NTMxZTRjZDRmOTYyMjM3Igo+IEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklH
PSJ4aWxpbnhfenlucW1wIgo+IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+IEBAIC0y
Miw3ICsyMiw3IEBAIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwzMV9VQk9PVD15
Cj4gQlIyX1RBUkdFVF9VQk9PVD15Cj4gQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NP
TkZJRz15Cj4gQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fR0lUPXkKPiAtQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fUkVQT19VUkw9ImdpdDovL2dpdGh1Yi5jb20vWGlsaW54L3UtYm9vdC14bG54Lmdp
dCIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHViLmNv
bS9YaWxpbngvdS1ib290LXhsbnguZ2l0Igo+IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9f
VkVSU0lPTj0idjIwMjIuMDEtMTY1LWc2NjcwMDEzMTljYmU1MTFjZTYzNTMxOTVmYjQ5MTBhZTVj
YjA0MWNlIgo+IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJ4aWxpbnhfenlucW1w
X3ZpcnQiCj4gQlIyX1RBUkdFVF9VQk9PVF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL3p5
bnFtcC96Y3UxMDIvdWJvb3QuZnJhZ21lbnQiCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvenlucW1w
X3pjdTEwNl9kZWZjb25maWcgYi9jb25maWdzL3p5bnFtcF96Y3UxMDZfZGVmY29uZmlnCj4gaW5k
ZXggMGE5Nzk3NWFhMC4uZDgzNmVkZmFmMCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3p5bnFtcF96
Y3UxMDZfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy96eW5xbXBfemN1MTA2X2RlZmNvbmZpZwo+
IEBAIC00LDcgKzQsNyBAQCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC96eW5x
bXAvcG9zdC1idWlsZC5zaCIKPiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC96
eW5xbXAvcG9zdC1pbWFnZS5zaCIKPiBCUjJfTElOVVhfS0VSTkVMPXkKPiBCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9HSVQ9eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9SRVBPX1VSTD0iZ2l0
Oi8vZ2l0aHViLmNvbS9YaWxpbngvbGludXgteGxueC5naXQiCj4gK0JSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbnguZ2l0
Igo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1JFUE9fVkVSU0lPTj0idjUuMTUtOTMwLWc5NjYx
MjQ1MzI2NTZiYzk1ZDc4MWFiZjU3NTMxZTRjZDRmOTYyMjM3Igo+IEJSMl9MSU5VWF9LRVJORUxf
REVGQ09ORklHPSJ4aWxpbnhfenlucW1wIgo+IEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9
eQo+IEBAIC0yMiw3ICsyMiw3IEBAIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwz
MV9VQk9PVD15Cj4gQlIyX1RBUkdFVF9VQk9PVD15Cj4gQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9T
WVNURU1fS0NPTkZJRz15Cj4gQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fR0lUPXkKPiAtQlIyX1RB
UkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9ImdpdDovL2dpdGh1Yi5jb20vWGlsaW54L3UtYm9v
dC14bG54LmdpdCIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8v
Z2l0aHViLmNvbS9YaWxpbngvdS1ib290LXhsbnguZ2l0Igo+IEJSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1JFUE9fVkVSU0lPTj0idjIwMjIuMDEtMTY1LWc2NjcwMDEzMTljYmU1MTFjZTYzNTMxOTVm
YjQ5MTBhZTVjYjA0MWNlIgo+IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJ4aWxp
bnhfenlucW1wX3ZpcnQiCj4gQlIyX1RBUkdFVF9VQk9PVF9DT05GSUdfRlJBR01FTlRfRklMRVM9
ImJvYXJkL3p5bnFtcC96Y3UxMDYvdWJvb3QuZnJhZ21lbnQiCj4gLS0gCj4gMi4xNy4xCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
