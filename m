Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841C3EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 15:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5896419FB;
	Fri, 16 Jun 2023 15:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5896419FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAleUEKb5-3v; Fri, 16 Jun 2023 15:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15AA9419F0;
	Fri, 16 Jun 2023 15:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AA9419F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770661BF2C7
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 15:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DDEB419F0
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 15:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DDEB419F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewMaebC3vIll for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 15:42:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B391400C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B391400C1
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 15:42:43 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EF1020003
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 15:42:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qABay-00FV3y-7X
 for buildroot@buildroot.org; Fri, 16 Jun 2023 17:42:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 17:42:38 +0200
Message-ID: <87wn03ifbl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2023.02.2 released
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
MjMuMDIuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjIgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuMSByZWxlYXNlLgoKLSBJbmZyYXN0
dWN0dXJlOiBBZGQgQlIyX0hPU1RfQ01BS0VfQVRfTEVBU1RfKiBmb3IgcGFja2FnZXMgbmVlZGlu
ZyBhCiAgbmV3ZXIgaG9zdC1jbWFrZSB0aGFuIHdoYXQgaXMgY3VycmVudGx5IGVuZm9yY2VkICgz
LjE4KSAtIFVwIHRvIHRoZQogIHZlcnNpb24gcHJvdmlkZWQgYnkgdGhlIGNtYWtlIHBhY2thZ2Ug
KDMuMjIpLgoKICB1dGlscy9kb2NrZXItcnVuOiBOb3cgY29ycmVjdGx5IGhhbmRsZXMgZ2l0CiAg
d29ya2RpcnMvd29ya3RyZWVzLgoKLSBEZWZjb25maWdzOiBRRU1VIHMzOTB4OiBCdW1wIHJvb3Rm
cyBzaXplIHRvIG1ha2Ugcm9vbSBmb3Iga2VybmVsCiAgbW9kdWxlcywgU3RtMzJmNHh4OiBUd2Vh
ayBjb25maWcgdG8gc2F2ZSBSQU0sIFhpbGlueCBWZXJzYWwgdmNrMTkwOgogIFVzZSBjb3JyZWN0
IChBNzIpIENQVSB2YXJpYW50CgotIFNlY3VyaXR5IGZpeGVzIGZvciBjdXBzLCBnbywgZ3JhcGhp
Y3NtYWdpY2ssIGludGVsLW1pY3JvY29kZSwgbGliY3VybCwKICBsaWJvcGVuc3NsLCBsaWJzc2gs
IG1vYnktYnVpbGRraXQsIG5jdXJzZXMsIG9wZW5qZGssIG9wZW5qZGstYmluLAogIHBvc3RncmVz
cWwsIHJlZGlzLCB4bGliX2xpYlgxMQoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24v
cnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhdGttbSwgYmlyZCwKICBidXN5Ym94LCBjYWlyb21t
LCBjYWlyb21tMV8xNCwgY21ha2UsIGNvbnRhaW5lcmQsIGNydWRpbmksIGRlbHZlLAogIGRvY2tl
ci1jbGksIGRvY2tlci1lbmdpbmUsIGVhcmx5b29tLCBmbHVlbnQtYml0LCBmcmVlc3dpdGNoLCBn
Y2MsIGdkYiwKICBnbGlibW0yXzY2LCBnbnVwZzIsIGdwdGZkaXNrLCBsaWJhc3MsIGxpYmRlZmxh
dGUsIGxpYmdlb3MsIGxpYmd0azMsCiAgbGlianhsLCBsaWJuZnRsLCBsaWJyZXNzbCwgbGx2bSwg
bHVhLCBtZXNhM2QsIG1pY3JvcHl0aG9uLCBtaW5pZGxuYSwKICBtcGQsIG11cGRmLCBuZnRhYmxl
cywgcGVybC1odHRwLW1lc3NhZ2UsIHBocCwgcHl0aG9uLWNhbiwKICBweXRob24tZGphbmdvLCBw
eXRob24tZG9ja2VyLCBweXRob24taXB5dGhvbiwgcHl0aG9uLW1hdHBsb3RsaWIsCiAgcHl0aG9u
LW11cGRmLCBweXRob24tcmVxdWVzdHMsIHB5dGhvbjMsIHFlbXUsIHJwbSwgcnVuYywgc2RsMl9t
aXhlciwKICB0emRhdGEsIHVjbGliYywgdmRyLCB3ZWJraXRndGssIHdpbGMtZmlybXdhcmUsIHhh
cHBfeGNhbGMsCiAgeGFwcF94ZHB5aW5mbywgeGFwcF94aW5wdXQsIHhhcHBfeHdpbmluZm8sIHhk
YXRhX3hiaXRtYXBzLAogIHhkYXRhX3hjdXJzb3ItdGhlbWVzLCB4ZHJpdmVyX3hmODYtaW5wdXQt
bW91c2UsCiAgeGRyaXZlcl94Zjg2LXZpZGVvLWFyaywgeGRyaXZlcl94Zjg2LXZpZGVvLWdlb2Rl
LAogIHhkcml2ZXJfeGY4Ni12aWRlby1uZW9tYWdpYywgeGZvbnRfZW5jb2RpbmdzLCB4bGliX2xp
YlhhdywgeGxpYl9saWJYaSwKICB4bGliX2xpYlhmaXhlcywgeGxpYl9saWJYZnQsIHhsaWJfbGli
WHBtLCB6ZnMsIHpuYwoKLSBOZXcgcGFja2FnZXM6IHBlcmwtY2xvbmUsIHB5dGhvbi1hc3R0b2tl
bnMsIHB5dGhvbi1leGVjdXRpbmcsCiAgcHl0aG9uLXB1cmUtZXZhbCwgcHl0aG9uLXN0YWNrLWRh
dGEKCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0
LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMy4wMi4yCgpVc2Vy
cyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBn
cmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlz
IHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMDIuMS4uCgogICAgMzggIEJlcm5kIEt1
aGxzCiAgICAyNSAgUm9tYWluIE5hb3VyCiAgICAgOSAgUGV0ZXIgU2VpZGVyZXIKICAgICA3ICBE
YW5pZWwgTGFuZwogICAgIDcgIFBldGVyIEtvcnNnYWFyZAogICAgIDYgIENocmlzdGlhbiBTdGV3
YXJ0CiAgICAgNSAgWWFubiBFLiBNT1JJTgogICAgIDQgIEFkYW0gRHVza2V0dAogICAgIDQgIEph
bWVzIEtuaWdodAogICAgIDQgIE5lYWwgRnJhZ2VyCiAgICAgNCAgUmFwaGHDq2wgTcOpbG90dGUK
ICAgICAzICBTZXJnZXkgQm9icmVub2sKICAgICAzICBUaG9tYXMgRGV2b29nZHQKICAgICAyICBG
cmFuY29pcyBQZXJyYWQKICAgICAxICBBYXJvbiBTaWVycmEKICAgICAxICBBbmRyZWFzIFppZWds
ZXIKICAgICAxICBCYWdhcyBTYW5qYXlhCiAgICAgMSAgQ2FybG9zIFNhbnRvcwogICAgIDEgIERh
bWllbiBMZSBNb2FsCiAgICAgMSAgRGFyaW8gQmluYWNjaGkKICAgICAxICBFdGllbm5lIENhcnJp
ZXJlCiAgICAgMSAgR2l1bGlvIEJlbmV0dGkKICAgICAxICBHcnplZ29yeiBCbGFjaAogICAgIDEg
IEpvbmF0aGFuIE5ldXNjaMOkZmVyCiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAxICBLcmlz
IEJhaG5zZW4KICAgICAxICBMdWNhIENlcmVzb2xpCiAgICAgMSAgTHVrZSBELiBKb25lcwogICAg
IDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIFNlcmdleSBNYXR5dWtldmljaAogICAgIDEgIFN0
ZWZhbiBBZ25lcgogICAgIDEgIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDEgIFdhbGRlbWFyIEJy
b2Rrb3JiCiAgICAgMSAgV2l0b2xkIExpcGlldGEKICAgICAxICBZZWdvciBZZWZyZW1vdgogICAg
IDEgIGl0endhbQoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
