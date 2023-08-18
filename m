Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D3CC001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B902E83F23;
	Fri, 18 Aug 2023 10:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B902E83F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmIASfFzDlzi; Fri, 18 Aug 2023 10:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFEC83C94;
	Fri, 18 Aug 2023 10:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFEC83C94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20FF61BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE04C401AE
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE04C401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnWNmmkmfSzR for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 172C840004
 for <buildroot@uclibc.org>; Fri, 18 Aug 2023 10:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172C840004
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 039C685D66; Fri, 18 Aug 2023 10:50:35 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 18 Aug 2023 10:50:34 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trung.le@ruby-journal.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15730-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15730] New: 2023.08-rc1 gettext-gnu 0.20.1 failed
 to compile
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTczMAoKICAgICAgICAg
ICAgQnVnIElEOiAxNTczMAogICAgICAgICAgIFN1bW1hcnk6IDIwMjMuMDgtcmMxIGdldHRleHQt
Z251IDAuMjAuMSBmYWlsZWQgdG8gY29tcGlsZQogICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9v
dAogICAgICAgICAgIFZlcnNpb246IHVuc3BlY2lmaWVkCiAgICAgICAgICBIYXJkd2FyZTogQWxs
CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAg
ICAgIFNldmVyaXR5OiBub3JtYWwKICAgICAgICAgIFByaW9yaXR5OiBQNQogICAgICAgICBDb21w
b25lbnQ6IE90aGVyCiAgICAgICAgICBBc3NpZ25lZTogdW5hc3NpZ25lZEBidWlsZHJvb3QudWNs
aWJjLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IHRydW5nLmxlQHJ1Ynktam91cm5hbC5jb20KICAg
ICAgICAgICAgICAgIENDOiBidWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6
IC0tLQoKIyMjIEluZm8KCioqYnVpbGRyb290IGJyYW5jaCoqOiAyMDIzLjAyLW9wLWJ1aWxkCioq
T1MqKjogRmVkb3JhIDM5IChyYXdoaWRlKSBMaW51eCBzaHJpbXAtcGFzdGUKNi41LjAtMC5yYzYu
MjAyMzA4MTZnaXQ0ODUzYzc0YmQ3YWIuNDUuZmMzOS5wcGM2NGxlCioqZ2NjKio6IDEzLjIuMSAy
MDIzMDcyOCAoUmVkIEhhdCAxMy4yLjEtMSkgZ2xpYmMgMi4zOAoqKmcrKyoqOiAxMy4yLjEgMjAy
MzA3MjggKFJlZCBIYXQgMTMuMi4xLTEpIGdsaWJjIDIuMzgKCgojIyMgQnVpbGQgb3V0cHV0OgoK
YGBgCi4uL2dudWxpYi1saWIvc3RkaW8uaDo3NTg6MTogZXJyb3I6IGRlY2xhcmF0aW9uIGZvciBw
YXJhbWV0ZXIK4oCYX2dsX2N4eGFsaWFzX2R1bW154oCZIGJ1dCBubyBzdWNoIHBhcmFtZXRlcgog
IDc1OCB8IF9HTF9DWFhBTElBU1dBUk4gKGZnZXRzKTsKICAgICAgfCBefn5+fn5+fn5+fn5+fn5+
Ci4uL2dudWxpYi1saWIvc3RkaW8uaDo3NTY6MTogZXJyb3I6IGRlY2xhcmF0aW9uIGZvciBwYXJh
bWV0ZXIK4oCYX2dsX2N4eGFsaWFzX2R1bW154oCZIGJ1dCBubyBzdWNoIHBhcmFtZXRlcgogIDc1
NiB8IF9HTF9DWFhBTElBU19TWVMgKGZnZXRzLCBjaGFyICosIChjaGFyICpzLCBpbnQgbiwgRklM
RSAqc3RyZWFtKSk7CiAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fgouLi9nbnVsaWItbGliL3N0ZGlv
Lmg6NzQzOjE6IGVycm9yOiBkZWNsYXJhdGlvbiBmb3IgcGFyYW1ldGVyCuKAmF9nbF9jeHhhbGlh
c19kdW1teeKAmSBidXQgbm8gc3VjaCBwYXJhbWV0ZXIKICA3NDMgfCBfR0xfQ1hYQUxJQVNXQVJO
IChmZ2V0Yyk7CiAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fgouLi9nbnVsaWItbGliL3N0ZGlvLmg6
NzQxOjE6IGVycm9yOiBkZWNsYXJhdGlvbiBmb3IgcGFyYW1ldGVyCuKAmF9nbF9jeHhhbGlhc19k
dW1teeKAmSBidXQgbm8gc3VjaCBwYXJhbWV0ZXIKICA3NDEgfCBfR0xfQ1hYQUxJQVNfU1lTIChm
Z2V0YywgaW50LCAoRklMRSAqc3RyZWFtKSk7CiAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fgovdXNy
L2xpYi9nY2MvcHBjNjRsZS1yZWRoYXQtbGludXgvMTMvaW5jbHVkZS9zdGRkZWYuaDo0MzY6Mzog
ZXJyb3I6IGRlY2xhcmF0aW9uCmZvciBwYXJhbWV0ZXIg4oCYbWF4X2FsaWduX3TigJkgYnV0IG5v
IHN1Y2ggcGFyYW1ldGVyCiAgNDM2IHwgfSBtYXhfYWxpZ25fdDsKICAgICAgfCAgIF5+fn5+fn5+
fn5+Ci91c3IvbGliL2djYy9wcGM2NGxlLXJlZGhhdC1saW51eC8xMy9pbmNsdWRlL3N0ZGRlZi5o
OjMyOToyNDogZXJyb3I6CmRlY2xhcmF0aW9uIGZvciBwYXJhbWV0ZXIg4oCYd2NoYXJfdOKAmSBi
dXQgbm8gc3VjaCBwYXJhbWV0ZXIKICAzMjkgfCB0eXBlZGVmIF9fV0NIQVJfVFlQRV9fIHdjaGFy
X3Q7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+Ci91c3IvbGliL2djYy9w
cGM2NGxlLXJlZGhhdC1saW51eC8xMy9pbmNsdWRlL3N0ZGRlZi5oOjE0NToyNjogZXJyb3I6CmRl
Y2xhcmF0aW9uIGZvciBwYXJhbWV0ZXIg4oCYcHRyZGlmZl904oCZIGJ1dCBubyBzdWNoIHBhcmFt
ZXRlcgogIDE0NSB8IHR5cGVkZWYgX19QVFJESUZGX1RZUEVfXyBwdHJkaWZmX3Q7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgpyZWdleC5jOjgyOiBlcnJvcjogZXhw
ZWN0ZWQg4oCYe+KAmSBhdCBlbmQgb2YgaW5wdXQKbWFrZVs0XTogKioqIFtNYWtlZmlsZToyMDk5
OiByZWdleC5vXSBFcnJvciAxCm1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5CicvaG9tZS90bGUv
V29yay9vcC1idWlsZC9vdXRwdXQvYnVpbGQvaG9zdC1nZXR0ZXh0LWdudS0wLjIwLjEvZ2V0dGV4
dC10b29scy9saWJncmVwJwptYWtlWzNdOiAqKiogW01ha2VmaWxlOjIwNDM6IGFsbF0gRXJyb3Ig
MgptYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeQonL2hvbWUvdGxlL1dvcmsvb3AtYnVpbGQvb3V0
cHV0L2J1aWxkL2hvc3QtZ2V0dGV4dC1nbnUtMC4yMC4xL2dldHRleHQtdG9vbHMvbGliZ3JlcCcK
bWFrZVsyXTogKioqIFtNYWtlZmlsZToyMTc3OiBhbGwtcmVjdXJzaXZlXSBFcnJvciAxCm1ha2Vb
Ml06IExlYXZpbmcgZGlyZWN0b3J5CicvaG9tZS90bGUvV29yay9vcC1idWlsZC9vdXRwdXQvYnVp
bGQvaG9zdC1nZXR0ZXh0LWdudS0wLjIwLjEvZ2V0dGV4dC10b29scycKbWFrZVsxXTogKioqIFtN
YWtlZmlsZToyMDQ1OiBhbGxdIEVycm9yIDIKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkKJy9o
b21lL3RsZS9Xb3JrL29wLWJ1aWxkL291dHB1dC9idWlsZC9ob3N0LWdldHRleHQtZ251LTAuMjAu
MS9nZXR0ZXh0LXRvb2xzJwptYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjkzOgov
aG9tZS90bGUvV29yay9vcC1idWlsZC9vdXRwdXQvYnVpbGQvaG9zdC1nZXR0ZXh0LWdudS0wLjIw
LjEvLnN0YW1wX2J1aWx0XQpFcnJvciAyCmBgYAoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
