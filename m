Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7223C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 07:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 484CD40B8B;
	Tue, 21 Jun 2022 07:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 484CD40B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxDfGSF6NPbU; Tue, 21 Jun 2022 07:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC0D4023F;
	Tue, 21 Jun 2022 07:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AC0D4023F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85A1D1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 07:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F20A4023F
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 07:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F20A4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyK5yfQUBaUq for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 07:30:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94A5540142
 for <buildroot@uclibc.org>; Tue, 21 Jun 2022 07:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A5540142
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8E8F687322; Tue, 21 Jun 2022 07:17:49 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 21 Jun 2022 07:30:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ian_ormshaw@waters.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14856-163-KCh0esGMHH@https.bugs.busybox.net/>
In-Reply-To: <bug-14856-163@https.bugs.busybox.net/>
References: <bug-14856-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14856] nvidia-driver package fails to build
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDg1NgoKLS0tIENvbW1l
bnQgIzUgZnJvbSBEciBJIEogT3Jtc2hhdyA8aWFuX29ybXNoYXdAd2F0ZXJzLmNvbT4gLS0tCkkg
YW0gc3RpbGwgbm90IGFibGUgdG8gY29tcGlsZSB0aGUgZHJpdmVycy4gIEl0IHdvdWxkIGFwcGVh
ciBmcm9tCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2pvYW5ibS8xNDRhOTY1YzM2ZmMxZGMwZDFm
MWI5YmUzNDM4YTM2OC4gIFRoYXQgdGhlCnBhdGNoIHlvdSBoYXZlIGFwcGxpZWQgb25seSB3b3Jr
cyBmb3IgNS4xMCAtPiA1LjEzIGFuZCB0aGUgYnVpbGQgYnJlYWtzIGFnYWluCmZyb20gNS4xNCBv
bi4KCkluIGZpbGUgaW5jbHVkZWQgZnJvbQouLi9udmlkaWEtZHJpdmVyLTM5MC4xNDQva2VybmVs
L2NvbW1vbi9pbmMvb3MtaW50ZXJmYWNlLmg6MjcsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9u
dmlkaWEtZHJpdmVyLTM5MC4xNDQva2VybmVsL252aWRpYS9udi1wcm9jZnMuYzoxNDoKLi4vLi4v
aG9zdC9saWIvZ2NjL3g4Nl82NC1XYXRlcnNBTVNULWxpbnV4LWdudS8xMS4zLjAvaW5jbHVkZS9z
dGRhcmcuaDo1MjoKbm90ZTogdGhpcyBpcyB0aGUgbG9jYXRpb24gb2YgdGhlIHByZXZpb3VzIGRl
ZmluaXRpb24KICAgNTIgfCAjZGVmaW5lIHZhX2NvcHkoZCxzKSAgICBfX2J1aWx0aW5fdmFfY29w
eShkLHMpCiAgICAgIHwgCi4uL252aWRpYS1kcml2ZXItMzkwLjE0NC9rZXJuZWwvbnZpZGlhLWRy
bS9udmlkaWEtZHJtLWRydi5jOiBJbiBmdW5jdGlvbgrigJhudl9kcm1fcmVnaXN0ZXJfZHJtX2Rl
dmljZeKAmToKLi4vbnZpZGlhLWRyaXZlci0zOTAuMTQ0L2tlcm5lbC9udmlkaWEtZHJtL252aWRp
YS1kcm0tZHJ2LmM6ODE0OjEwOiBlcnJvcjoK4oCYc3RydWN0IGRybV9kZXZpY2XigJkgaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhwZGV24oCZOyBkaWQgeW91IG1lYW4g4oCYZGV24oCZPwogIDgxNCB8
ICAgICBkZXYtPnBkZXYgPSBwZGV2OwogICAgICB8ICAgICAgICAgIF5+fn4KICAgICAgfCAgICAg
ICAgICBkZXYKbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4ODoKL2hvbWUv
aWFuL2J1aWxkL2Ftc3QtaGl3aXJlLWxpbnV4LTkyOTdmYTg0LXg4Nl82NC9idWlsZHJvb3QvYnVp
bGQvbnZpZGlhLWRyaXZlci0zOTAuMTQ0L2tlcm5lbC9udmlkaWEtZHJtL252aWRpYS1kcm0tZHJ2
Lm9dCkVycm9yIDEKLi4vbnZpZGlhLWRyaXZlci0zOTAuMTQ0L2tlcm5lbC9udmlkaWEvbnZsaW5r
X2xpbnV4LmM6IEluIGZ1bmN0aW9uCuKAmG52bGlua19zbGVlcOKAmToKLi4vbnZpZGlhLWRyaXZl
ci0zOTAuMTQ0L2tlcm5lbC9udmlkaWEvbnZsaW5rX2xpbnV4LmM6NjAwOjE4OiBlcnJvcjog4oCY
c3RydWN0CnRhc2tfc3RydWN04oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYc3RhdGXigJk7IGRp
ZCB5b3UgbWVhbiDigJhfX3N0YXRl4oCZPwogIDYwMCB8ICAgICAgICAgY3VycmVudC0+c3RhdGUg
PSBUQVNLX0lOVEVSUlVQVElCTEU7CiAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fgogICAg
ICB8ICAgICAgICAgICAgICAgICAgX19zdGF0ZQptYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6Mjg4OgovaG9tZS9pYW4vYnVpbGQvYW1zdC1oaXdpcmUtbGludXgtOTI5N2ZhODQt
eDg2XzY0L2J1aWxkcm9vdC9idWlsZC9udmlkaWEtZHJpdmVyLTM5MC4xNDQva2VybmVsL252aWRp
YS9udmxpbmtfbGludXgub10KRXJyb3IgMQptYWtlWzJdOiAqKiogW01ha2VmaWxlOjE4Njg6Ci9o
b21lL2lhbi9idWlsZC9hbXN0LWhpd2lyZS1saW51eC05Mjk3ZmE4NC14ODZfNjQvYnVpbGRyb290
L2J1aWxkL252aWRpYS1kcml2ZXItMzkwLjE0NC9rZXJuZWxdCkVycm9yIDIKbWFrZVsyXTogTGVh
dmluZyBkaXJlY3RvcnkKJy9ob21lL2lhbi9idWlsZC9hbXN0LWhpd2lyZS1saW51eC05Mjk3ZmE4
NC14ODZfNjQvYnVpbGRyb290L2J1aWxkL2xpbnV4LTUuMTUuNDQnCm1ha2VbMV06ICoqKiBbcGFj
a2FnZS9wa2ctZ2VuZXJpYy5tazoyOTQ6Ci9ob21lL2lhbi9idWlsZC9hbXN0LWhpd2lyZS1saW51
eC05Mjk3ZmE4NC14ODZfNjQvYnVpbGRyb290L2J1aWxkL252aWRpYS1kcml2ZXItMzkwLjE0NC8u
c3RhbXBfYnVpbHRdCkVycm9yIDIKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkKJy9ob21lL2lh
bi9wcm9qZWN0cy9hbXN0LWhpd2lyZS1saW51eC9zb3VyY2UvYnVpbGRyb290JwptYWtlOiAqKiog
W01ha2VmaWxlOjYxNjogYnVpbGRyb290XSBFcnJvciAyCgpUaGUgbm8gY2MgY2hlY2sgcGF0Y2gg
d29ya3MgYXMgZXhwZWN0ZWQgb24gRmVkb3JhIDM2CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgb24gdGhlIENDIGxpc3QgZm9yIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
