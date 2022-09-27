Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65067C6FA83
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 07:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9EF418B7;
	Tue, 27 Sep 2022 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA9EF418B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZOF4Se78EPd; Tue, 27 Sep 2022 07:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DBAF4186C;
	Tue, 27 Sep 2022 07:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DBAF4186C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BADF01BF2F9
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 07:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A299440164
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 07:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A299440164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUKfBA69VDdK for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 07:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8E8400AF
 for <buildroot@uclibc.org>; Tue, 27 Sep 2022 07:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8E8400AF
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5760586082; Tue, 27 Sep 2022 07:26:03 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 27 Sep 2022 07:26:02 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sergio@digien.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15021-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15021] New: Buildroot not compiling with systemd
 and glibc.
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTAyMQoKICAgICAgICAg
ICAgQnVnIElEOiAxNTAyMQogICAgICAgICAgIFN1bW1hcnk6IEJ1aWxkcm9vdCBub3QgY29tcGls
aW5nIHdpdGggc3lzdGVtZCBhbmQgZ2xpYmMuCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRyb290
CiAgICAgICAgICAgVmVyc2lvbjogdW5zcGVjaWZpZWQKICAgICAgICAgIEhhcmR3YXJlOiBBbGwK
ICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAg
ICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFA1CiAgICAgICAgIENvbXBv
bmVudDogT3RoZXIKICAgICAgICAgIEFzc2lnbmVlOiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51Y2xp
YmMub3JnCiAgICAgICAgICBSZXBvcnRlcjogc2VyZ2lvQGRpZ2llbi5pbwogICAgICAgICAgICAg
ICAgQ0M6IGJ1aWxkcm9vdEB1Y2xpYmMub3JnCiAgVGFyZ2V0IE1pbGVzdG9uZTogLS0tCgpCdWls
ZHJvb3QgZG9lcyBub3QgY29tcGlsZSB3aGVuIEkgYWN0aXZhdGUgc3lzdGVtZCB3aXRoIGdsaWJj
ICh0aGUgb25seQphdmFpbGFibGUgbGlicmFyeSkuCgpJIHdvdWxkIHN3ZWFyIHRoYXQgdGhpcyBz
dGF0eCByZWRlZmluaXRpb24gYnVnIHdhcyByZXNvbHZlZCBpbiAyMDE4IGJ1dCBJIGtlZXAKZW5j
b3VudGVyaW5nIGl0LgoKClRvIHJlcHJvZHVjZToKCi0gRGVmY29uZmlnIG9mIGFueSBhcm0gYXJj
aGl0ZWN0dXJlIChyYXNwYmVycnlwaTQpCi0gbWFrZSBtZW51Y29uZmlnOgogICAgLSBnbGliYyBh
cyBjIGxpYnJhcnkKICAgIC0gc3lzdGVtZCBhcyBpbml0CgotIGNvbXBpbGUgdGhlIGltYWdlICht
YWtlKS4KCgpbNy82MjZdIENvbXBpbGluZyBDIG9iamVjdApzcmMvbGlic3lzdGVtZC9saWJzeXN0
ZW1kX3N0YXRpYy5hLnAvc2QtcmVzb2x2ZV9zZC1yZXNvbHZlLmMubwpGQUlMRUQ6IHNyYy9saWJz
eXN0ZW1kL2xpYnN5c3RlbWRfc3RhdGljLmEucC9zZC1yZXNvbHZlX3NkLXJlc29sdmUuYy5vCi91
c3IvYmluL2djYyAtSXNyYy9saWJzeXN0ZW1kL2xpYnN5c3RlbWRfc3RhdGljLmEucCAtSXNyYy9s
aWJzeXN0ZW1kCi1JLi4vc3JjL2xpYnN5c3RlbWQgLUlzcmMvYmFzaWMgLUkuLi9zcmMvYmFzaWMg
LUlzcmMvZnVuZGFtZW50YWwKLUkuLi9zcmMvZnVuZGFtZW50YWwgLUlzcmMvc3lzdGVtZCAtSS4u
L3NyYy9zeXN0ZW1kIC1JLiAtSS4uCi1JLi4vc3JjL2xpYnN5c3RlbWQvc2QtYnVzIC1JLi4vc3Jj
L2xpYnN5c3RlbWQvc2QtZGV2aWNlCi1JLi4vc3JjL2xpYnN5c3RlbWQvc2QtZXZlbnQgLUkuLi9z
cmMvbGlic3lzdGVtZC9zZC1od2RiCi1JLi4vc3JjL2xpYnN5c3RlbWQvc2QtaWQxMjggLUkuLi9z
cmMvbGlic3lzdGVtZC9zZC1qb3VybmFsCi1JLi4vc3JjL2xpYnN5c3RlbWQvc2QtbmV0bGluayAt
SS4uL3NyYy9saWJzeXN0ZW1kL3NkLW5ldHdvcmsKLUkuLi9zcmMvbGlic3lzdGVtZC9zZC1yZXNv
bHZlCi1JL2hvbWUvc2VtZWRpL1dvcmtzcGFjZS9kaWdpZW4vaWlvdC1pbWFnZS9idWlsZHJvb3Qv
b3V0cHV0L2hvc3QvaW5jbHVkZQotZmRpYWdub3N0aWNzLWNvbG9yPWFsd2F5cyAtRF9GSUxFX09G
RlNFVF9CSVRTPTY0IC1XYWxsIC1XaW52YWxpZC1wY2ggLVdleHRyYQotc3RkPWdudTk5IC1PMyAt
V25vLWZvcm1hdC1zaWduZWRuZXNzIC1Xbm8tbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnMKLVdu
by11bnVzZWQtcGFyYW1ldGVyIC1XZGF0ZS10aW1lIC1XZW5kaWYtbGFiZWxzIC1XZXJyb3I9Zm9y
bWF0PTIKLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWluY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzCi1XZXJyb3I9aW50LWNvbnZlcnNpb24gLVdlcnJvcj1vdmVy
ZmxvdyAtV2Vycm9yPW92ZXJyaWRlLWluaXQKLVdlcnJvcj1yZXR1cm4tdHlwZSAtV2Vycm9yPXNo
aWZ0LWNvdW50LW92ZXJmbG93IC1XZXJyb3I9c2hpZnQtb3ZlcmZsb3c9MgotV2Vycm9yPXVuZGVm
IC1XZmxvYXQtZXF1YWwgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD01IC1XaW5pdC1zZWxmIC1XbG9n
aWNhbC1vcAotV21pc3NpbmctaW5jbHVkZS1kaXJzIC1XbWlzc2luZy1ub3JldHVybiAtV25lc3Rl
ZC1leHRlcm5zCi1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVdwb2ludGVyLWFyaXRoIC1XcmVkdW5k
YW50LWRlY2xzIC1Xc2hhZG93Ci1Xc3RyaWN0LWFsaWFzaW5nPTIgLVdzdHJpY3QtcHJvdG90eXBl
cyAtV3N1Z2dlc3QtYXR0cmlidXRlPW5vcmV0dXJuCi1XdW51c2VkLWZ1bmN0aW9uIC1Xd3JpdGUt
c3RyaW5ncyAtV25vLW1heWJlLXVuaW5pdGlhbGl6ZWQgLVduby11bnVzZWQtcmVzdWx0Ci1XZXJy
b3I9bWlzc2luZy1kZWNsYXJhdGlvbnMgLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXMKLWZkaWFn
bm9zdGljcy1zaG93LW9wdGlvbiAtZm5vLWNvbW1vbiAtZm5vLXN0cmljdC1hbGlhc2luZyAtZnN0
YWNrLXByb3RlY3RvcgotZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZ2aXNpYmlsaXR5PWhpZGRl
biAtLXBhcmFtPXNzcC1idWZmZXItc2l6ZT00Ci1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNl
Y3Rpb25zIC1XZXJyb3I9c2hhZG93IC1pbmNsdWRlIGNvbmZpZy5oIC1PMiAtZlBJQwotcHRocmVh
ZCAtZnZpc2liaWxpdHk9ZGVmYXVsdCAtTUQgLU1RCnNyYy9saWJzeXN0ZW1kL2xpYnN5c3RlbWRf
c3RhdGljLmEucC9zZC1yZXNvbHZlX3NkLXJlc29sdmUuYy5vIC1NRgpzcmMvbGlic3lzdGVtZC9s
aWJzeXN0ZW1kX3N0YXRpYy5hLnAvc2QtcmVzb2x2ZV9zZC1yZXNvbHZlLmMuby5kIC1vCnNyYy9s
aWJzeXN0ZW1kL2xpYnN5c3RlbWRfc3RhdGljLmEucC9zZC1yZXNvbHZlX3NkLXJlc29sdmUuYy5v
IC1jCi4uL3NyYy9saWJzeXN0ZW1kL3NkLXJlc29sdmUvc2QtcmVzb2x2ZS5jCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSAuLi9zcmMvYmFzaWMvbWlzc2luZ19zeXNjYWxsLmg6MjUsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9zcmMvbGlic3lzdGVtZC9zZC1yZXNvbHZlL3NkLXJlc29sdmUuYzoyNDoK
Li4vc3JjL2Jhc2ljL21pc3Npbmdfc3RhdC5oOjM5Ojg6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg
4oCYc3RydWN0CnN0YXR4X3RpbWVzdGFtcOKAmQogICAzOSB8IHN0cnVjdCBzdGF0eF90aW1lc3Rh
bXAgewogICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC91c3IvaW5jbHVkZS9iaXRzL3N0YXR4Lmg6MzEsCiAgICAgICAgICAgICAgICAgZnJvbSAvdXNy
L2luY2x1ZGUvc3lzL3N0YXQuaDo0NjUsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvYmFz
aWMvbWlzc2luZ19zdGF0Lmg6NToKL3Vzci9pbmNsdWRlL2xpbnV4L3N0YXQuaDo1Njo4OiBub3Rl
OiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQogICA1NiB8IHN0cnVjdCBzdGF0eF90aW1lc3RhbXAg
ewogICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn4KLi4vc3JjL2Jhc2ljL21pc3Npbmdfc3Rh
dC5oOjQ1Ojg6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0YXR44oCZCiAgIDQ1
IHwgc3RydWN0IHN0YXR4IFNUQVRYX0RFRklOSVRJT047CiAgICAgIHwgICAgICAgIF5+fn5+Ci91
c3IvaW5jbHVkZS9saW51eC9zdGF0Lmg6OTk6ODogbm90ZTogb3JpZ2luYWxseSBkZWZpbmVkIGhl
cmUKICAgOTkgfCBzdHJ1Y3Qgc3RhdHggewogICAgICB8ICAgICAgICBefn5+fgoKClRoYW5rcy4K
Ci0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0aGUg
Q0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
