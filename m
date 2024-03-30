Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ACECD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 14:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADEA605FB;
	Sat, 30 Mar 2024 14:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYVybknocqm0; Sat, 30 Mar 2024 14:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D89606F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D89606F3;
	Sat, 30 Mar 2024 14:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD2581BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6376401C3
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcCRes_M9Zfh for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 14:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8153F401BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8153F401BE
 for <buildroot@uclibc.org>; Sat, 30 Mar 2024 14:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id F2B578422F; Sat, 30 Mar 2024 14:18:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 30 Mar 2024 14:18:24 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.9
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daiwei@sunkaisens.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16015-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16015] New: nginx incorrectly created user group
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNjAxNQoKICAgICAgICAg
ICAgQnVnIElEOiAxNjAxNQogICAgICAgICAgIFN1bW1hcnk6IG5naW54IGluY29ycmVjdGx5IGNy
ZWF0ZWQgdXNlciBncm91cAogICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9vdAogICAgICAgICAg
IFZlcnNpb246IDIwMjMuMDIuOQogICAgICAgICAgSGFyZHdhcmU6IFBDCiAgICAgICAgICAgICAg
ICBPUzogTGludXgKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBu
b3JtYWwKICAgICAgICAgIFByaW9yaXR5OiBQNQogICAgICAgICBDb21wb25lbnQ6IE90aGVyCiAg
ICAgICAgICBBc3NpZ25lZTogdW5hc3NpZ25lZEBidWlsZHJvb3QudWNsaWJjLm9yZwogICAgICAg
ICAgUmVwb3J0ZXI6IGRhaXdlaUBzdW5rYWlzZW5zLmNvbQogICAgICAgICAgICAgICAgQ0M6IGJ1
aWxkcm9vdEB1Y2xpYmMub3JnCiAgVGFyZ2V0IE1pbGVzdG9uZTogLS0tCgpCZWNhdXNlIG9mIHNw
ZWNpYWwgbmVlZHMsIEkgc2V0IHRoZSBkaXJlY3RvcmllcyB1c2luZyBuZ2lueCB0byB0aGUgaG9t
ZSBwYXRoIG9mCnd3dy1kYXRhLgoKIG5naW54Lm1rOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiMgd3d3LWRhdGEgdXNlciBhbmQgZ3JvdXAgYXJlIHVzZWQgZm9yIG5naW54LiBCZWNhdXNl
IHRoZXNlIHVzZXIgYW5kIGdyb3VwCiMgYXJlIGFscmVhZHkgc2V0IGJ5IGJ1aWxkcm9vdCwgaXQg
aXMgbm90IG5lY2Vzc2FyeSB0byByZWRlZmluZSB0aGVtLgojIFNlZSBzeXN0ZW0vc2tlbGV0b24v
ZXRjL3Bhc3N3ZAojICAgdXNlcm5hbWU6IHd3dy1kYXRhICAgIHVpZDogMzMKIyAgIGdyb3VwbmFt
ZTogd3d3LWRhdGEgICBnaWQ6IDMzCiMKIyBTbywgd2UganVzdCBuZWVkIHRvIGNyZWF0ZSB0aGUg
ZGlyZWN0b3JpZXMgdXNlZCBieSBuZ2lueCB3aXRoIHRoZSByaWdodAojIG93bmVyc2hpcC4KZGVm
aW5lIE5HSU5YX1BFUk1JU1NJT05TCiAgICAgICAgL29wdC92YXIvbGliL25naW54IGQgNzU1IDMz
IDMzIC0gLSAtIC0gLQplbmRlZgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkF0IHRo
ZSBzYW1lIHRpbWUsIEkgbW9kaWZpZWQgdGhlIC9ldGMvcGFzc3dkIGZpbGUgaW4gdGhlIHNrZWxl
dG9uLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbcm9vdEBNaVdpRmktUjRBLXNy
diBza2VsZXRvbl0jIG1vcmUgZXRjL3Bhc3N3ZApyb290Ong6MDowOnJvb3Q6L3Jvb3Q6L2Jpbi9z
aApkYWVtb246eDoxOjE6ZGFlbW9uOi91c3Ivc2JpbjovYmluL2ZhbHNlCmJpbjp4OjI6MjpiaW46
L2JpbjovYmluL2ZhbHNlCnN5czp4OjM6MzpzeXM6L2RldjovYmluL2ZhbHNlCnN5bmM6eDo0OjEw
MDpzeW5jOi9iaW46L2Jpbi9zeW5jCm1haWw6eDo4Ojg6bWFpbDovdmFyL3Nwb29sL21haWw6L2Jp
bi9mYWxzZQp3d3ctZGF0YTp4OjMzOjMzOnd3dy1kYXRhOi9vcHQvdmFyL2xpYi9uZ2lueDovYmlu
L2ZhbHNlCm9wZXJhdG9yOng6Mzc6Mzc6T3BlcmF0b3I6L3ZhcjovYmluL2ZhbHNlCm5vYm9keTp4
OjY1NTM0OjY1NTM0Om5vYm9keTovaG9tZTovYmluL2ZhbHNlCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KQWZ0ZXIgc2VsZWN0aW5nIG5naW54IGFuZCBjb21waWxpbmcsIHRoZSBwZXJtaXNz
aW9ucyBvZiB0aGUgZ2VuZXJhdGVkIG5naW54CmZpbGUgYXJlIGNoYW5nZWQgdG8gdGFwZVtncm91
cCBuYW1lXS4KClRoZSBmb2xsb3dpbmcgaXMgdGhlIGZpbGUgb3V0cHV0IGJ5IHRoZSBvdXRwdXTv
vJoKCltyb290QE1pV2lGaS1SNEEtc3J2IGxpYl0jIHB3ZAovaG9tZS9idWlsZC9idWlsZHJvb3Qt
MjAyMy4wMi45L291dHB1dC9pbWFnZXMvb3B0L3Zhci9saWIKCltyb290QE1pV2lGaS1SNEEtc3J2
IGxpYl0jIGxsIC1ybHRoCuaAu+eUqOmHjyAwCmRyd3hyLXhyLXguIDIgMTAyICAgIDEwMyA2ICAz
5pyIIDMwIDIxOjE0IG15c3FsCmRyd3hyLXhyLXguIDIgMTA1ICAgIDEwNiA2ICAz5pyIIDMwIDIx
OjE2IHJlZGlzCmRyd3hyLXhyLXguIDIgIDMzICAgdGFwZSA2ICAz5pyIIDMwIDIxOjE2IG5naW54
CgpBZnRlciBteSBpbnNwZWN0aW9uLCBJIGZvdW5kIHRoYXQgdGhlIGdyb3VwIG5hbWUgb2YgR0lE
IDMzIG9mIHRoZSBjb21waWxhdGlvbgpob3N0IGlzIHRhcGUuCgovZXRjL2dyb3VwIG9uIE15SG9z
dDoKCnJvb3Q6eDowOgpiaW46eDoxOgpkYWVtb246eDoyOgpzeXM6eDozOgphZG06eDo0Ogp0dHk6
eDo1OgpkaXNrOng6NjoKbHA6eDo3OgptZW06eDo4OgprbWVtOng6OToKd2hlZWw6eDoxMDoKY2Ry
b206eDoxMToKbWFpbDp4OjEyOgptYW46eDoxNToKZGlhbG91dDp4OjE4OgpmbG9wcHk6eDoxOToK
Z2FtZXM6eDoyMDoKdGFwZTp4OjMzOgp2aWRlbzp4OjM5OgpmdHA6eDo1MDoKbG9jazp4OjU0Ogph
dWRpbzp4OjYzOgp1c2Vyczp4OjEwMDoKbm9ib2R5Ong6NjU1MzQ6CnV0bXA6eDoyMjoKdXRlbXB0
ZXI6eDozNToKaW5wdXQ6eDo5OTk6Cmt2bTp4OjM2OnFlbXUKcmVuZGVyOng6OTk4OgpzeXN0ZW1k
LWpvdXJuYWw6eDoxOTA6CnN5c3RlbWQtY29yZWR1bXA6eDo5OTc6CmRidXM6eDo4MToKcG9sa2l0
ZDp4Ojk5NjoKcHJpbnRhZG1pbjp4Ojk5NToKc3NoX2tleXM6eDo5OTQ6CmF2YWhpOng6NzA6CnJ0
a2l0Ong6MTcyOgpzc3NkOng6OTkzOgpwaXBld2lyZTp4Ojk5MjoKc2d4Ong6OTkxOgpsaWJzdG9y
YWdlbWdtdDp4Ojk5MDoKc3lzdGVtZC1vb206eDo5ODk6CmJybGFwaTp4Ojk4ODoKdHNzOng6NTk6
Y2xldmlzCmdlb2NsdWU6eDo5ODc6CmNvY2twaXQtd3M6eDo5ODY6CmNvY2twaXQtd3NpbnN0YW5j
ZTp4Ojk4NToKZmxhdHBhazp4Ojk4NDoKY29sb3JkOng6OTgzOgpjbGV2aXM6eDo5ODI6CnNldHJv
dWJsZXNob290Ong6OTgxOgpnZG06eDo0MjoKZ25vbWUtaW5pdGlhbC1zZXR1cDp4Ojk4MDoKc3No
ZDp4Ojc0OgpzbG9jYXRlOng6MjE6CmNocm9ueTp4Ojk3OToKZG5zbWFzcTp4Ojk3ODoKdGNwZHVt
cDp4OjcyOgpidWlsZDp4OjEwMDA6CndpcmVzaGFyazp4Ojk3NzoKdXNibW9uOng6OTc2OgpzdGFw
dXNyOng6MTU2OgpzdGFwc3lzOng6MTU3OgpzdGFwZGV2Ong6MTU4OgpwZXNpZ246eDo5NzU6CnFl
bXU6eDoxMDc6CgpBZnRlciB0ZXN0aW5nLCBpZiBJIGRlbGV0ZSB0aGUgdGFwZSBncm91cO+8iGdp
ZCAzM++8iSBpbiB0aGUgZ3JvdXAgb24gbXkKY29tcGlsYXRpb24gaG9zdO+8jHRoZSBwZXJtaXNz
aW9ucyBvZiB0aGUgY29tcGlsZWQgbmdpbnggZmlsZXMgYXJlIGNvcnJlY3TvvIhzaG93IAogZ2lk
IDMz77yJLk9yIGlmIEkgY2hhbmdlIHRoZSB1c2VyIGdyb3VwIHdpdGggZ2lkIDMzIHRvIGFub3Ro
ZXIgbmFtZSwgdGhlIG5naW54CmRpcmVjdG9yeSB3aWxsIGJlIHNldCB0byB0aGUgbmV3IGdyb3Vw
77yIZ2lkIDMz77yJLgpsaWtlIGJlbG9377yaCltyb290QE1pV2lGaS1SNEEtc3J2IG9wdF0jIGxs
IC1scnQgIHZhci9saWIvCuaAu+eUqOmHjyAwCmRyd3hyLXhyLXguIDIgMTAyICAgIDEwMyA2ICAz
5pyIIDMwIDIxOjE0IG15c3FsCmRyd3hyLXhyLXguIDIgMTA1ICAgIDEwNiA2ICAz5pyIIDMwIDIx
OjE2IHJlZGlzCmRyd3hyLXhyLXguIDIgIDMzIG5vbm9ubyA2ICAz5pyIIDMwIDIxOjE2IG5naW54
CgpJIHRoaW5rIHRoYXQgd2hlbiBidWlsZGluZyBuZ2lueCwgaXQgZGlkIG5vdCBjb3JyZWN0bHkg
aGFuZGxlIHRoZSBwZXJtaXNzaW9uCmlzc3VlIG9mIHRoZSBjcmVhdGVkIGZpbGUsIGFuZCBuZ2lu
eCBkaWQgbm90IGZpbmQgdGhlIGNvcnJlY3QgZ2lkIGluIHRoZQpza2VsZXRvbi4gSXQgc2VlbXMg
dG8gYmUgbG9va2luZyBmb3IgdGhlIGdpZCBpdCBiZWxvbmdzIHRvIGluIC9ldGMvZ3JvdXAgb24g
bXkKaG9zdC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSBvbiB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
