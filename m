Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A47EC6FA89
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C949C607D0;
	Wed, 14 Sep 2022 09:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C949C607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2hK95UAZeVr; Wed, 14 Sep 2022 09:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED54760701;
	Wed, 14 Sep 2022 09:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED54760701
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07B2A1BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9BE41739
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9BE41739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzQvXCIsKW69 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:11:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA84641724
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA84641724
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:11:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3BE312000D;
 Wed, 14 Sep 2022 09:11:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYOQs-0041RE-8v; Wed, 14 Sep 2022 11:11:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220802013359.96843-1-christian@paral.in>
 <20220803093504.3ac15546@windsurf>
Date: Wed, 14 Sep 2022 11:11:46 +0200
In-Reply-To: <20220803093504.3ac15546@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 3 Aug 2022 09:35:04 +0200")
Message-ID: <871qses4kt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to 1.18.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon,  1 Aug 2022 18:33:59 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> go1.18.4 includes security fixes to the compress/gzip, encoding/gob,
 >> encoding/xml, go/parser, io/fs, net/http, and path/filepath packages, as well as
 >> bug fixes to the compiler, the go command, the linker, the runtime, and the
 >> runtime/metrics package.
 >> 
 >> go1.18.5 includes security fixes to the encoding/gob and math/big packages, as
 >> well as bug fixes to the compiler, the go command, the runtime, and the testing
 >> package.
 >> 
 >> https://go.dev/doc/devel/release#go1.18.minor
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> package/go/go.hash | 4 ++--
 >> package/go/go.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks.

Committed to 2022.05.x, thanks.

For 2022.02.x I will instead bump to 1.17.13.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
