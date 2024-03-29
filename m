Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C5CD11DD
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 14:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6DC60706;
	Fri, 29 Mar 2024 14:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcwhaY7yO0BO; Fri, 29 Mar 2024 14:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA185607AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA185607AF;
	Fri, 29 Mar 2024 14:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055401BF39E
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A6240B60
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_GVypVhNo9V for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 14:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 040ED400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040ED400E4
 for <buildroot@uclibc.org>; Fri, 29 Mar 2024 14:08:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D236581514; Fri, 29 Mar 2024 14:08:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 29 Mar 2024 14:08:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: yocto.develop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16012-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16012] New: Cannot compile image for
 imx8mqevk_defconfig
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNjAxMgoKICAgICAgICAg
ICAgQnVnIElEOiAxNjAxMgogICAgICAgICAgIFN1bW1hcnk6IENhbm5vdCBjb21waWxlIGltYWdl
IGZvciBpbXg4bXFldmtfZGVmY29uZmlnCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRyb290CiAg
ICAgICAgICAgVmVyc2lvbjogMjAyNC4wMgogICAgICAgICAgSGFyZHdhcmU6IFBDCiAgICAgICAg
ICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVy
aXR5OiBjcml0aWNhbAogICAgICAgICAgUHJpb3JpdHk6IFA1CiAgICAgICAgIENvbXBvbmVudDog
T3RoZXIKICAgICAgICAgIEFzc2lnbmVlOiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51Y2xpYmMub3Jn
CiAgICAgICAgICBSZXBvcnRlcjogeW9jdG8uZGV2ZWxvcEBnbWFpbC5jb20KICAgICAgICAgICAg
ICAgIENDOiBidWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6IC0tLQoKVGhl
cmUgYXJlIDIgcHJvYmxlbXM6CjEuIENhbm5vdCBjb21waWxlIGhhYi5jLiBXZSBnb3QgdGhpcyBl
cnJvcjogCmVycm9yOiBhcnJheSBzdWJzY3JpcHQgMCBpcyBvdXRzaWRlIGFycmF5IGJvdW5kcyBv
ZiDigJh1aW50MzJfdFswXeKAmSB7YWthCuKAmHVuc2lnbmVkIGludFtd4oCZfSBbLVdlcnJvcj1h
cnJheS1ib3VuZHNdCiAgIDcxIHwgI2RlZmluZSBIQUJfUlZUX1JFUE9SVF9TVEFUVVNfQVJNNjQg
ICAgICAgICAgICAgKCh1bnNpZ25lZApsb25nKSoodWludDMyX3QgKikoSEFCX1JWVF9CQVNFICsg
MHg0OCkpCgoyLiBXZSBjaGFuZ2VkIHRoZSBoYWIuYyBjb2RlIHRvIGF2b2lkIHRoZSBlcnJvciBi
dXQgd2UgZ290IHRoaXMgbGlua2VyIGVycm9yOgplcnJvcjogYXJyYXkgc3Vic2NyaXB0IDAgaXMg
b3V0c2lkZSBhcnJheSBib3VuZHMgb2Yg4oCYdWludDMyX3RbMF3igJkge2FrYQrigJh1bnNpZ25l
ZCBpbnRbXeKAmX0gWy1XZXJyb3I9YXJyYXktYm91bmRzXQogICA3MSB8ICNkZWZpbmUgSEFCX1JW
VF9SRVBPUlRfU1RBVFVTX0FSTTY0ICAgICAgICAgICAgICgodW5zaWduZWQKbG9uZykqKHVpbnQz
Ml90ICopKEhBQl9SVlRfQkFTRSArIDB4NDgpKQoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
