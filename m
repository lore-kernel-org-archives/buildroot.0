Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871F6C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF9F832C6;
	Wed, 20 Jul 2022 16:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF9F832C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SteXJVUA-Cma; Wed, 20 Jul 2022 16:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD3682983;
	Wed, 20 Jul 2022 16:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD3682983
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 934FE1BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2CE60D76
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2CE60D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYTZnDZDKUMH for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6409B60AE3
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6409B60AE3
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:23:43 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oECU6-00006U-Kv;
 Wed, 20 Jul 2022 17:23:39 +0100
Date: Wed, 20 Jul 2022 17:23:38 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YtgsCjq5XQU1x1kX@donbot>
MIME-Version: 1.0
Content-Disposition: inline
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Type:Message-ID:Subject:To:From:Date:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=Rg+BCXAvzct9UpHMc8DQjajgrj7K3Gj2VF0wUhGA2Ng=; b=cq
 kOrT6cnoABl7Vo6R3vTRfndgrf9o2Di+5jQs0JS8Yt14KpXVPMz5nzeTcVm3P+O3g6/GphEYmxGc3
 oGpJURKQsfrrvcwy2Nmoq//WS06HbbMeUv6KT694jC9VyOIj71ByDU6KqQiDgkPlrp0NDVAHYKahR
 Kwz2nVI345jEHP9JioR32qvCF3omVktfCnajahnecikWInLqeicnUQaQM0x4nLW6ubwbaBgG1fKwM
 U7Lh0hzVVrLkIj0gGysrmxod1baW0wN3JEe/nHHB3gX6Wg4tjvx0c9RRq/NwlFpmiCo4S4SDIHKCv
 I8mGzew26grp8qxdfpu7VeAyK6DMbn+Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=cqkOrT6c
Subject: [Buildroot] package/fscryptctl: how to update with breaking changes?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

fscryptctl is currently pointing to a commit SHA from 2017 and there is
now a v1.0.0 tag from 2021 (with the only subsequent changes being
documentation & test related).

However, updating isn't straightforward as Buildroot's current version
only supports v1 encryption policies but upstream has introduced v2
policies and then deprecated and removed support for v1 policies before
the v1.0.0 release [1].

What is the best way to handle this in Buildroot?

Do we need to provide a choice to keep support for v1 policies if anyone
needs them?  Or do we just update and pull in the breaking change?

(There are no package changes needs to update to v1.0.0, it's just a
case of changing the version and hash.)

[1] https://github.com/google/fscryptctl/commit/d2066cded914860164ffacebc24ea0afc0b57963


Thanks,
John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
