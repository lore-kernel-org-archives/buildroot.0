Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3244C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 22:57:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A743360E8B
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 22:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A743360E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B53F60784;
	Sat, 30 Oct 2021 22:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4kRdt6ZEWqT; Sat, 30 Oct 2021 22:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAABC60763;
	Sat, 30 Oct 2021 22:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCC81BF5DF
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 22:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719B5401E8
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 22:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fa-RsfrQDQSj for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 22:57:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F45F401E7
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 22:57:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6625331E0839; Sun, 31 Oct 2021 00:56:56 +0200 (CEST)
Date: Sun, 31 Oct 2021 00:56:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <YX3NuMeoXJyNSD8S@waldemar-brodkorb.de>
References: <20211025212541.12280-1-ps.report@gmx.net>
 <20211028230131.5f50d6e7@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028230131.5f50d6e7@gmx.net>
X-Operating-System: Linux 5.10.0-9-amd64 x86_64
Subject: Re: [Buildroot] [uclibc-ng-devel] Re: [PATCH v1] package/ntpsec:
 new package
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
Cc: devel@uclibc-ng.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,
Peter Seiderer wrote,

> Hello Waldemar, *,
> 
> On Mon, 25 Oct 2021 23:25:41 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> The resulting ntpd runs fine with the raspberrypi3_defconfig, but segfaults
> when compiled/used with raspberrypi3_64_defconfig (uclibc, -Os):
> 
> 	$ /usr/sbin/ntpd -n -d -g
> 1970-01-01T00:04:18 ntpd[263]: INIT: ntpd ntpsec-1.2.0 2021-10-24T13:39:21Z: Starting
> 1970-01-01T00:04:18 ntpd[263]: INIT: Command line: /usr/sbin/ntpd -n -d
> 1970-01-01T00:04:18 ntpd[263]: INIT: precision = 7.291 usec (-17)
> 1970-01-01T00:04:18 ntpd[263]: INIT: successfully locked into RAM
> 1970-01-01T00:04:18 ntpd[263]: CONFIG: readconfig: parsing file: /etc/ntp.conf
> 1970-01-01T00:04:18 ntpd[263]: CONFIG: restrict nopeer ignored
> 1970-01-01T00:04:18 ntpd[263]: INIT: Using SO_TIMESTAMPNS
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 0 v6wildcard [::]:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 1 v4wildcard 0.0.0.0:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 2 lo 127.0.0.1:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 3 eth0 172.16.0.30:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 4 lo [::1]:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 5 eth0 [fe80::ba27:ebff:fea6:340%2]:123
> 1970-01-01T00:04:18 ntpd[263]: IO: Listening on routing socket on fd #22 for interface updates
> 1970-01-01T00:04:19 ntpd[263]: SYNC: Found 10 servers, suggest minsane at least 3
> 1970-01-01T00:04:19 ntpd[263]: INIT: MRU 10922 entries, 13 hash bits, 65536 bytes
> 1970-01-01T00:04:20 ntpd[263]: DNS: dns_probe: 0.pool.ntp.org, cast_flags:8, flags:101
> Segmentation fault (core dumped)

Could you add a small C test program to uClibc-ng-test to trigger
the bug? That would help to find any regression to targets without
TLS support.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
