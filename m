Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671CAC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 06:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3164B80C06;
	Fri, 23 Aug 2024 06:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnHysKyWSMge; Fri, 23 Aug 2024 06:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ADF881307
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADF881307;
	Fri, 23 Aug 2024 06:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A02B31BF3D7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 06:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9985B410BC
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 06:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2lrvz7H88ha for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 06:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE289410A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE289410A8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE289410A8
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 06:36:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CC2360003
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 06:36:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1shNuI-005gmr-35
 for buildroot@buildroot.org; Fri, 23 Aug 2024 08:36:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 08:36:22 +0200
Message-ID: <87msl3d9uh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.08-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyNC4wOC1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNC4wOC1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0
LjA4LXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC5naXQKCkFub3RoZXIgMiB3ZWVrcywgYW5vdGhlciByZWxl
YXNlIGNhbmRpZGF0ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBwcm9i
bGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0byB0
aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNu
IDIwMjQuMDgtcmMxLi4KCiAgICAyMiAgV2FsZGVtYXIgQnJvZGtvcmIKICAgIDE5ICBUaG9tYXMg
UGV0YXp6b25pCiAgICAgNiAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNCAgQnJhbmRvbiBNYWllcgog
ICAgIDMgIEp1bGllbiBPbGl2YWluCiAgICAgMyAgWWFubiBFLiBNT1JJTgogICAgIDIgIEJlcm5k
IEt1aGxzCiAgICAgMiAgSmFtZXMgSGlsbGlhcmQKICAgICAyICBKYW1pZSBHaWJib25zCiAgICAg
MiAgTWF4IEZpbGlwcG92CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIEF0
aGFhcmlxIEFyZGhpYW5zeWFoCiAgICAgMSAgRGFyaW8gQmluYWNjaGkKICAgICAxICBEbWl0cnkg
Q2hlc3RueWtoCiAgICAgMSAgR2HDq2wgUE9SVEFZCiAgICAgMSAgSi4gTmV1c2Now6RmZXIKICAg
ICAxICBOZWFsIEZyYWdlcgogICAgIDEgIFJveSBLb2xsZW4gU3ZlbmRzZW4KICAgICAxICBTZXJn
ZXkgTWF0eXVrZXZpY2gKICAgICAxICBUYW4gRW4gRGUKCkV4cGVjdCB0aGUgZmluYWwgMjAyNC4w
OCByZWxlYXNlIGF0IHRoZSBlbmQgb2YgdGhlIG1vbnRoLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
