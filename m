Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B44C0015E
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 08:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE4981CA3;
	Wed,  5 Jul 2023 08:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE4981CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBIujUjBM5sI; Wed,  5 Jul 2023 08:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D657181A58;
	Wed,  5 Jul 2023 08:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D657181A58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55A4E1BF330
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F25881A58
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F25881A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akndv4o3Jb-d for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 08:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2388B80F62
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2388B80F62
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 08:03:12 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 87167780310
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 10:03:13 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGxTg-0003s8-UE
 for buildroot@buildroot.org; Wed, 05 Jul 2023 10:03:08 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.96)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGxTg-007JUD-16 for buildroot@buildroot.org;
 Wed, 05 Jul 2023 10:03:08 +0200
Date: Wed, 5 Jul 2023 10:03:08 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20230705080308.uzco7bptqryqxi2l@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [RFC 0/1] Re-enable bpftool for arm/armeb?
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems the restriction regarding arm/armeb should not hold anymore.
The local copy bpftool keeps of libbpf has been bumped since the times
when it would reportedly not compile on these archs.

I've tested with the defconfig of arm/arm920t from autobuild, the same
platform for which the build failed before commit
c750dd4e5d03430148841d2d897e90dbe19ce172, and it builds just fine.

Ignacy Gaw=EAdzki (1):
  package/bpftool: enable support for arm/armeb

 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

-- =

2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
