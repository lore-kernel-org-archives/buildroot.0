Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E8C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 786B66079D;
	Sat, 15 Jun 2024 18:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AvKXZcg0D0R; Sat, 15 Jun 2024 18:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F53B607BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F53B607BB;
	Sat, 15 Jun 2024 18:32:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E18631BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D998F83145
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7hdzpXCamim for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A67AA83134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67AA83134
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A67AA83134
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:32:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA3111C0004;
 Sat, 15 Jun 2024 18:32:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIYCi-000iaB-0J;
 Sat, 15 Jun 2024 20:32:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <24eee82d7cade44c8ed6fc1675ea739a1ec70a18.1717609998.git.yann.morin.1998@free.fr>
Date: Sat, 15 Jun 2024 20:32:44 +0200
In-Reply-To: <24eee82d7cade44c8ed6fc1675ea739a1ec70a18.1717609998.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Jun 2024 19:53:19 +0200")
Message-ID: <87y176qcoj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 07/10 v2] support/download/cvs: fix
 shellcheck
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

> ---
 >  .checkpackageignore  | 1 -
 >  support/download/cvs | 3 ++-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/.checkpackageignore b/.checkpackageignore
 > index 8825d644ab..f8c5837e0a 100644
 > --- a/.checkpackageignore
 > +++ b/.checkpackageignore
 > @@ -1653,7 +1653,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 >  support/dependencies/dependencies.sh Shellcheck
 >  support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
 >  support/download/cargo-post-process Shellcheck
 > -support/download/cvs Shellcheck
 >  support/download/dl-wrapper Shellcheck
 >  support/download/file Shellcheck
 >  support/download/go-post-process Shellcheck
 > diff --git a/support/download/cvs b/support/download/cvs
 > index 0c079e2403..b771caf280 100755
 > --- a/support/download/cvs
 > +++ b/support/download/cvs
 > @@ -40,12 +40,13 @@ shift $((OPTIND-1)) # Get rid of our options
 >  # 10 minutes should do the trick.
 >  _cvs() {
 >      if [ -z "${quiet}" ]; then
 > -        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
 > +        printf '%s ' timeout 10m "${CVS}" "${@}"; printf '\n'
 >      fi
 >      _plain_cvs "$@"
 >  }
 >  # Note: please keep command below aligned with what is printed above
 >  _plain_cvs() {
 > +    # shellcheck disable=SC2086  # We really want word splitting in CVS
 >      eval timeout 10m ${CVS} "${@}"
 >  }
 
 > -- 

 > 2.45.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
