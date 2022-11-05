Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217D2607C0;
	Sat,  5 Nov 2022 18:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217D2607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLfMByzyM1Zl; Sat,  5 Nov 2022 18:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C536059A;
	Sat,  5 Nov 2022 18:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C536059A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBE421BF375
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43E16059A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D43E16059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZgWDmZHPb9G for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8AF960093
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8AF960093
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:45:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8FA455FFA3;
 Sat,  5 Nov 2022 19:44:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:44:55 +0100
Date: Sat, 5 Nov 2022 19:44:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221105184455.GL3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-4-troglobit@gmail.com>
 <20221031214956.37e0ef12@windsurf> <871qqnf7wt.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qqnf7wt.fsf@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667673898;
 bh=O5RfwI+dy1BmLOGtX+tFYKJ/eAaoeh6UlViGWF6N4dQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HV0Zsn8Beh6LOMgTFSI7gOfaMTSmjqcKvQ/g+NHtLLCqLCk9MLcdCCDo+EKjRAWmk
 8noXs4UJvFgKjkUnO4zVg0p4+O9mCGfnKBem9+yYYc4Muu/MSTu+maonBMBnGEaYBH
 EC1zkQoBeZ9zV4rt7GFoZrBQHGEPZXRXfopx6YJVAN2iwFldKjGldOjWfC0c83dizc
 TFHQiCfEVwXmmtq498QqJSV7nTWlNDSbaipDJi5LQuus5OcOcnKfcecn4h10hQibFk
 oCIUz2b4DU5wr4pibLtA8J/9QQ+1UAHp2OBRN3SIjYd8zsZhOKdqUZEfkNYTHkZtJR
 yOgpNwghgKbJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HV0Zsn8B
Subject: Re: [Buildroot] [PATCH 3/3] package/ssdp-responder: fix warnings
 from check-package and shellcheck
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2022-11-01 08:30 +0100, Joachim Wiberg spake thusly:
> On Mon, Oct 31, 2022 at 21:49, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > On Mon, 31 Oct 2022 18:46:32 +0100
> > Joachim Wiberg <troglobit@gmail.com> wrote:
> >> +cmd()
> >> +{
> >> +	start-stop-daemon -q -p "$PIDFILE" -x "$DAEMON" "$@"
> >> +	status=$?
> >> +	[ $status -eq 0 ] && echo "OK" || echo "FAIL"
> >> +
> >> +	return $status
> >> +}
> > I don't think we're using this cmd construct anywhere else in the tree,
> > or did I miss some change in our coding style/policy?
> 
> I mentioned it in the cover letter, but that information should have
> been here in this patch.  Sorry about that.
> 
> It all started out with utils/check-package telling me I used $DAEMON
> wrong.  While changing that I ended up with a final comment from it
> that said I should also "run shellcheck and fix the warnings".
> 
> It in turn had several grievances which I took one by one.  In this one
> I used the same construct as in package/smcroute/S41smcroute to work
> around a warning about using `$?` instead of using an `if cmd; then ...`

We hanve cmd() in only two pacjages so far, smcroute and watchdogd, both
proided by you, so I can see you are aiming for some consistency! :-)

However, the majority of our SNNfoo startup scripts do not use this
cmd() wrapper construct, so I am not a fan of it.

(I like that it is generic and that we could have in a library of helpers
shared across our startup script, but IIRC we had a similar discussion a
long time ago, and decide against it, because it is trivial enough to
call start-stop-daemon).

The rest of the changes are however interesting, so could you respin
with just fixing those, pelase?

Note: it is acceptable that some shellcheck triggers get forcefully
disabled. For example, SC2086 (Double quote to prevent globbing and word
splitting) must be disabled when expanding $DAEMON_ARGS; this can be
achieved with:

    # shellcheck source=/dev/null
    [ -f $CFGFILE ] && . $CFGFILE

    # shellcheck disable=SC2086
    start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS

Basically, the canonical reference for a startup script is
package/busybox/S01syslogd.

Oh, btw, as much as I hate TABs, we do use TABs for indentation...

https://nightly.buildroot.org/#adding-packages-start-script

Regards,
Yann E. MORIN.

> >>  start() {
> >> -	printf 'Starting %s: ' "$NAME"
> >> -	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
> >> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> >
> > This all looked matching our coding style. Why are you changing this?
> >>  case "$1" in
> >> -    start|stop|restart)
> >> -	"$1"
> >> -	;;
> >> -    reload)
> >> -	restart
> >> -	;;
> >> -    *)
> >> -	echo "Usage: $0 {start|stop|restart|reload}"
> >> -	exit 1
> >> +	start|stop|restart)
> >> +		"$1"
> >> +		;;
> >> +	reload)
> >> +		restart
> >> +		;;
> >> +	*)
> >> +		echo "Usage: $0 {start|stop|restart|reload}"
> >> +		exit 1
> >
> > I'm not sure what is the recommended indentation style in our init
> > scripts. Tabs? Spaces?
> 
> Shellcheck pointed out this section had four spaces indent instead of
> the eight (tab) used for the rest of the script.  Iirc from the "own
> code coding style" discussions C and shell script should follow the
> same style, but I may very well be wrong here.
> 
> 
> Best regards
>  /Joachim
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
