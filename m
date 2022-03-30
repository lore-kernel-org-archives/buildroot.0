Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692F0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 05:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116A840C73;
	Wed, 30 Mar 2022 05:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAvK1BjVVcRo; Wed, 30 Mar 2022 05:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29D0740A99;
	Wed, 30 Mar 2022 05:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23FE81BF951
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 05:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1146284521
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 05:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXPqZd31thtK for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 05:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 551498451F
 for <buildroot@uclibc.org>; Wed, 30 Mar 2022 05:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2E51B83840; Wed, 30 Mar 2022 05:28:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Mar 2022 05:37:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jose.pekkarinen@unikie.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14701-163-kWpcxTJikh@https.bugs.busybox.net/>
In-Reply-To: <bug-14701-163@https.bugs.busybox.net/>
References: <bug-14701-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14701] Multiple unresolved symbols while building
 kernel module package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDcwMQoKLS0tIENvbW1l
bnQgIzQgZnJvbSBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4g
LS0tCkkgd2FudCB0byBoaWdobGlnaHQgdGhhdCB0aGlzIG1heSBiZSBhIGJ1aWxkcm9vdCBpc3N1
ZSwgYW5kIG5vdAphIGRyaXZlciwgb3IgYSBsaW51eCBvbmUuIFRoaXMgaXMgYmVjYXVzZSBJIHRy
aWVkIHRoZSBzYW1lIGtlcm5lbAp2ZXJzaW9uIG9uIG15IGxhcHRvcDoKCiQgdW5hbWUgLXIKNS4x
NS4yMS1oYXJkZW5lZDEKCkFuZCB0aGlzIGlzIHRoZSBidWlsZGluZyBvdXRwdXQgb2YgdGhlIG1v
ZHVsZToKCiBtYWtlCm1ha2UgLUMgL2xpYi9tb2R1bGVzLzUuMTUuMjEtaGFyZGVuZWQxL2J1aWxk
Ck09L2hvbWUvcGVra2FyaS9saW51eC1zZ3gtZHJpdmVyLXNneF9kcml2ZXJfMi4xNCBtb2R1bGVz
Cm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbGludXgtaGVhZGVycy01LjE1
LjIxLWhhcmRlbmVkMScKICBDQyBbTV0gIC9ob21lL3Bla2thcmkvbGludXgtc2d4LWRyaXZlci1z
Z3hfZHJpdmVyXzIuMTQvc2d4X21haW4ubwogIENDIFtNXSAgL2hvbWUvcGVra2FyaS9saW51eC1z
Z3gtZHJpdmVyLXNneF9kcml2ZXJfMi4xNC9zZ3hfcGFnZV9jYWNoZS5vCiAgQ0MgW01dICAvaG9t
ZS9wZWtrYXJpL2xpbnV4LXNneC1kcml2ZXItc2d4X2RyaXZlcl8yLjE0L3NneF9pb2N0bC5vCiAg
Q0MgW01dICAvaG9tZS9wZWtrYXJpL2xpbnV4LXNneC1kcml2ZXItc2d4X2RyaXZlcl8yLjE0L3Nn
eF92bWEubwogIENDIFtNXSAgL2hvbWUvcGVra2FyaS9saW51eC1zZ3gtZHJpdmVyLXNneF9kcml2
ZXJfMi4xNC9zZ3hfdXRpbC5vCiAgQ0MgW01dICAvaG9tZS9wZWtrYXJpL2xpbnV4LXNneC1kcml2
ZXItc2d4X2RyaXZlcl8yLjE0L3NneF9lbmNsLm8KICBDQyBbTV0gIC9ob21lL3Bla2thcmkvbGlu
dXgtc2d4LWRyaXZlci1zZ3hfZHJpdmVyXzIuMTQvc2d4X2VuY2wyLm8KICBMRCBbTV0gIC9ob21l
L3Bla2thcmkvbGludXgtc2d4LWRyaXZlci1zZ3hfZHJpdmVyXzIuMTQvaXNneC5vCiAgTU9EUE9T
VCAvaG9tZS9wZWtrYXJpL2xpbnV4LXNneC1kcml2ZXItc2d4X2RyaXZlcl8yLjE0L01vZHVsZS5z
eW12ZXJzCldBUk5JTkc6IG1vZHBvc3Q6IG1vZHBvc3Q6IEZvdW5kIDIgd3JpdGFibGUgZnVuY3Rp
b24gcG9pbnRlcnMuClRvIHNlZSBmdWxsIGRldGFpbHMgYnVpbGQgeW91ciBrZXJuZWwgd2l0aDoK
J21ha2UgQ09ORklHX0RFQlVHX1dSSVRBQkxFX0ZVTkNUSU9OX1BPSU5URVJTX1ZFUkJPU0U9eScK
ICBDQyBbTV0gIC9ob21lL3Bla2thcmkvbGludXgtc2d4LWRyaXZlci1zZ3hfZHJpdmVyXzIuMTQv
aXNneC5tb2QubwogIExEIFtNXSAgL2hvbWUvcGVra2FyaS9saW51eC1zZ3gtZHJpdmVyLXNneF9k
cml2ZXJfMi4xNC9pc2d4LmtvCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9s
aW51eC1oZWFkZXJzLTUuMTUuMjEtaGFyZGVuZWQxJwoKYW5kIGluc3RhbGxpbmcgYW5kIGxvYWRp
bmcgdGhlIG1vZHVsZSBJIGNhbiBzZWUgaW4gZG1lc2c6CgpbICAyMzMuMTQ1OTY1XSBpc2d4OiBs
b2FkaW5nIG91dC1vZi10cmVlIG1vZHVsZSB0YWludHMga2VybmVsLgpbICAyMzMuMTQ2MDA2XSBp
c2d4OiBtb2R1bGUgdmVyaWZpY2F0aW9uIGZhaWxlZDogc2lnbmF0dXJlIGFuZC9vciByZXF1aXJl
ZCBrZXkKbWlzc2luZyAtIHRhaW50aW5nIGtlcm5lbApbICAyMzMuMTQ2NTU5XSBpbnRlbF9zZ3g6
IHRoZSBDUFUgaXMgbWlzc2luZyBTR1gKClNvIHN5bWJvbHMgYXJlIGluIHBsYWNlLCBrZXJuZWwg
aXMgbm90IHdyb25nLCBtb2R1bGUgZWl0aGVyLCBidXQKYnVpbGRyb290IGNvbmZpZ3VyZXMgdGhl
IGxpbmtlciBpbiBhIHdheSB0aGUgc3ltYm9scyBhcmUgbm90IGZvdW5kLgoKVGhhbmtzIQoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBs
aXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
