Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A362C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4112408EB;
	Sun, 19 Mar 2023 10:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4112408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45PFMjlxILk0; Sun, 19 Mar 2023 10:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF61408D7;
	Sun, 19 Mar 2023 10:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF61408D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF6E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D588151E
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D588151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRl8omMRoghk for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:45:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CFE0814B3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CFE0814B3
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:45:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CA9A1C0005
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:45:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pdqXI-006XbM-Bl
 for buildroot@buildroot.org; Sun, 19 Mar 2023 11:45:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 11:45:12 +0100
Message-ID: <874jqhxbnr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.11 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjIuMDIuMTEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4wMi4xMS50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjIuMDIuMTEudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxk
cm9vdCAyMDIyLjAyLjExIGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0
ZXJtCnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxh
dGVkIGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIyLjAyLjEwIHJlbGVhc2UuCgotIFNl
Y3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGFwciwgYXByLXV0aWwsIGJpbmQsIGNsYW1hdiwgZXhm
YXQsCiAgZXhmYXQtdXRpbHMsIGdpdCwgaGFwcm94eSwgbGVzcywgbGliY3VybCwgbGlibW9kc2Vj
dXJpdHksIGxpYnBqc2lwLAogIHBhaG8tbXF0dC1jLCBwaHAsIHB5dGhvbi1kamFuZ28sIHB5dGhv
bi1tMmNyeXB0bywgcHl0aG9uLXdlcmt6ZXVnLAogIHRpZmYsIHVhY21lLCB3ZWJraXRndGssIHdw
ZXdlYmtpdAoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNl
IGlzc3VlcyBpbiBhc3RlcmlzaywKICBhdDkxZGF0YWZsYXNoYm9vdCwgYXVkaXQsIGRtYWxsb2Ms
IGYyZnMtdG9vbHMsIGdjYywKICBnbHNsc2FuZGJveC1wbGF5ZXIsIGdvLCBpbnRlbC1nbW1saWIs
IGlwbWl1dGlsLCBsaWJibG9ja2RldiwgbGliZXYsCiAgbGliZ2NyeXB0LCBsaWJtYWQsIGxpYm1k
YngsIGxpYm9sbSwgbHR0bmctYmFiZWx0cmFjZSwgbWVuZGVyLCBtcHYsCiAgbXV0dCwgbXhzLWJv
b3RsZXRzLCBvcGVuc2JpLCBvcHVzLCBwY20tdG9vbHMsIHByb3h5Y2hhaW5zLW5nLCBxdWF6aXAs
CiAgcXVpY2tqcywgcm9ja2NoaXAtbWFsaSwgcnN5bmMsIHN1ZG8sIHVxbWksIHdwZWJhY2tlbmQt
ZmRvLCB6bmMKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIyLjAyLjEx
CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQg
dG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0
byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjIuMDIuMTAuLgoKICAgIDQzICBG
YWJyaWNlIEZvbnRhaW5lCiAgICAgOCAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNiAgQmVybmQgS3Vo
bHMKICAgICAzICBQZXRlciBTZWlkZXJlcgogICAgIDMgIFlhbm4gRS4gTU9SSU4KICAgICAyICBB
ZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMiAgSmFtZXMgSGlsbGlhcmQKICAgICAyICBMYW5n
IERhbmllbAogICAgIDEgIEFybm91dCBWYW5kZWNhcHBlbGxlCiAgICAgMSAgSGVpa28gVGhpZXJ5
CiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAxICBNYXR0aGV3IFdlYmVyCiAgICAgMSAgTmlj
b2xhIERpIExpZXRvCiAgICAgMSAgUm9tYWluIE5hb3VyCiAgICAgMSAgU2ViYXN0aWFuIFdleWVy
CiAgICAgMSAgU3RlZmFuIEFnbmVyCiAgICAgMSAgVGhvbWFzIERldm9vZ2R0CiAgICAgMSAgVGhv
bWFzIFBldGF6em9uaQogICAgIDEgINCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVy
aWV2KQoKTm90aWNlIHRoYXQgdGhlIGxvbmcgdGVybSByZWxlYXNlIGZvciAyMDIzIGhhcyBiZWVu
IHJlbGVhc2VkOgoyMDIzLjAyLiBUaGVyZSB3aWxsIGJlIG9uZSBtb3JlIGZpbmFsIHVwZGF0ZSBv
ZiAyMDIyLjAyLnggYmVmb3JlIGl0IGdvZXMKRU9MLCBidXQgcGxlYXNlIGNvbnNpZGVyIG1pZ3Jh
dGluZyB0byAyMDIzLjAyLnggaW4gdGhlIG5lYXIgZnV0dXJlLgoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
