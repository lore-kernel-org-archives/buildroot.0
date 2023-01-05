Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99CBC3DA7A
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F7560E19;
	Thu,  5 Jan 2023 13:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F7560E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjwlL_yf-4Kq; Thu,  5 Jan 2023 13:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775C560B44;
	Thu,  5 Jan 2023 13:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775C560B44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B452E1BF318
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F59840C11
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F59840C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbWQYI01GdBx for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B119E4014B
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B119E4014B
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhG-DX; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-8p; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 13:59:55 +0100
Message-Id: <20230105130000.682525-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=KoAaQgzclifhkLOkSurNkGJ8QtQlNJEhTczgJUDczsg=; b=BxgRc5jJGvs1PIpvglc8N2U1Pj
 EKyFVIgq+NdKlstRMV2oEjvaTJgomy3ofI1Ov0f3CinKSbvaVVJzA43We7/GgGWWXwmxvWk9JUueY
 OUvmEvi88IE91I1TVw1nPh57DULlAgtcXdt5C4w7FzzTkKSbuAkTilHIWk9+hTbRI3++5xb3QLbXd
 HUCsDpU02QG02BXGybBgZ7DUYuY6S32IL4S/G97V2W0TZ7AiuTxS70xe6W4uJQzgr+elwgTshyHXU
 DtvsLt4LV5KgOVlepSKeDVFk9HHGxYGd2IjqQfURl+IXNe4iOQP8W/zLEc2uRRxpm9GRz7Wmt+ZIX
 W70EOxWw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=BxgRc5jJ
Subject: [Buildroot] [PATCH 0/5] python flask-smorest packages
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlc2UgcGF0Y2hlcyBhZGRzIGEgZmV3IHB5dGhvbiBwYWNrYWdlcyB0aGF0IHdlIHVzZSB0byBy
dW4gYSBSRVNUIEFQSQpiYWNrZW5kIG9uIG91ciB0YXJnZXQuCgpNYXJ0aW4gSHVuZGViw7hsbCAo
NSk6CiAgcGFja2FnZS9weXRob24tYXBpc3BlYzogbmV3IHBhY2thZ2UKICBwYWNrYWdlL3B5dGhv
bi13ZWJhcmdzOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93OiBuZXcg
cGFja2FnZQogIHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXk6IG5ldyBwYWNr
YWdlCiAgcGFja2FnZS9weXRob24tZmxhc2stc21vcmVzdDogbmV3IHBhY2thZ2UKCiBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKysrCiBw
YWNrYWdlL3B5dGhvbi1hcGlzcGVjL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8ICA5ICsr
KysrKysrKwogcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5oYXNoICAgICAg
ICAgfCAgNSArKysrKwogcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tayAg
ICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwogcGFja2FnZS9weXRob24tZmxhc2stc21vcmVz
dC9Db25maWcuaW4gICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogLi4uL3B5dGhvbi1mbGFz
ay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lmhhc2ggfCAgNSArKysrKwogLi4uL3B5dGhv
bi1mbGFzay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lm1rICAgfCAxNCArKysrKysrKysr
KysrKwogcGFja2FnZS9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVteS9Db25maWcuaW4gICAg
fCAxMCArKysrKysrKysrCiAuLi4vcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkuaGFzaCAg
ICAgICAgICAgICB8ICA1ICsrKysrCiAuLi4vcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXku
bWsgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1tYXJz
aG1hbGxvdy9Db25maWcuaW4gICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3B5
dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaCB8ICA2ICsrKysrKwogcGFj
a2FnZS9weXRob24tbWFyc2htYWxsb3cvcHl0aG9uLW1hcnNobWFsbG93Lm1rICAgfCAxNCArKysr
KysrKysrKysrKwogcGFja2FnZS9weXRob24td2ViYXJncy9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgfCAxMSArKysrKysrKysrKwogcGFja2FnZS9weXRob24td2ViYXJncy9weXRob24td2Vi
YXJncy5oYXNoICAgICAgICAgfCAgNSArKysrKwogcGFja2FnZS9weXRob24td2ViYXJncy9weXRo
b24td2ViYXJncy5tayAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwogMTYgZmlsZXMgY2hh
bmdlZCwgMTUwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhv
bi1hcGlzcGVjL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWFw
aXNwZWMvcHl0aG9uLWFwaXNwZWMuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0
aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1mbGFzay1zbW9yZXN0L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3QvcHl0aG9uLWZsYXNrLXNtb3Jlc3QuaGFzaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3QvcHl0aG9uLWZsYXNrLXNt
b3Jlc3QubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy1z
cWxhbGNoZW15L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW1h
cnNobWFsbG93LXNxbGFsY2hlbXkvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkuaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkv
cHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3B5dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93L3B5dGhvbi1tYXJzaG1hbGxvdy5t
awogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvQ29uZmlnLmluCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24td2ViYXJncy9weXRob24td2ViYXJncy5o
YXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24td2ViYXJncy9weXRob24td2Vi
YXJncy5tawoKLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
