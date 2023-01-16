Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79188C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E99740B8D;
	Mon, 16 Jan 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E99740B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsiZtAPO6hZ7; Mon, 16 Jan 2023 20:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4170B402E0;
	Mon, 16 Jan 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4170B402E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D53691BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFCC640887
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFCC640887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQjFetOgpmno for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:52:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D1240861
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19D1240861
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:52:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B1A94FF802;
 Mon, 16 Jan 2023 20:52:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pHWSg-008F97-Kc; Mon, 16 Jan 2023 21:52:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230116105032.1890904-1-peter@korsgaard.com>
 <20230116105032.1890904-2-peter@korsgaard.com>
 <20230116203007.GF2770@scaer>
Date: Mon, 16 Jan 2023 21:52:10 +0100
In-Reply-To: <20230116203007.GF2770@scaer> (Yann E. MORIN's message of "Mon,
 16 Jan 2023 21:30:07 +0100")
Message-ID: <87mt6ifbid.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/go: explicitly set GOMODCACHE
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-01-16 11:50 +0100, Peter Korsgaard spake thusly:
 >> go mod vendor caches downloaded modules to the Go module cache, which
 >> defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
 >> environment variable:
 >> 
 >> https://go.dev/ref/mod#module-cache
 >> 
 >> So explicitly set GOMODCACHE= for reproducibility.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks, but see below...

 >> ---
 >> package/go/go.mk | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/package/go/go.mk b/package/go/go.mk
 >> index c4f72d403c..c38ae0b99c 100644
 >> --- a/package/go/go.mk
 >> +++ b/package/go/go.mk
 >> @@ -26,6 +26,7 @@ HOST_GO_COMMON_ENV = \
 >> GOROOT="$(HOST_GO_ROOT)" \
 >> GOPATH="$(HOST_GO_GOPATH)" \
 >> GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 >> +	GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \

 > HOST_GO_GOPATH is $(HOST_DIR)/share/go-path, however, with PPD, HOST_DIR
 > is per-package, so there will not besharing of the cache between two
 > packages, unless there is a build dependency between them (unlikely in
 > the go ecosystem).

 > If we wanted to really share the go cache(s), we need to hit somewhere
 > in $(BR2_DL_DIR), like we do for cargo, see 8450b7691870 (package/pkg-cargo:
 > move CARGO_HOME into DL_DIR).

 > Still, this patch guarantees that the current situation is reproducible,
 > and does not depend on the user's environment.

Yes, I know. As far as I can see this was already the case (on systems
where GOMODCACHE isn't set), and I wanted a "safe" fix we could backport
- But indeed, longer term we should probably put the go module cache in
DL_DIR like we recently did for the cargo cache.

 > Applied to master, thanks.

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
