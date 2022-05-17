Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6982FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02E4083381;
	Tue, 17 May 2022 06:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_iXhninWu00; Tue, 17 May 2022 06:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCC28145C;
	Tue, 17 May 2022 06:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E76C41BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E1E60B6F
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXssjscL5G3h for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC1056058C
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:26:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 740091BF205;
 Tue, 17 May 2022 06:26:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nqqfV-002V3A-KF; Tue, 17 May 2022 08:26:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220511114003.162006-1-joel@jms.id.au>
 <87lev79lxe.fsf@dell.be.48ers.dk>
 <CACPK8XeuZw-Ov4JUNSne6J2gNVrYCJRYU4B0akWsjg71jqHfCw@mail.gmail.com>
Date: Tue, 17 May 2022 08:26:53 +0200
In-Reply-To: <CACPK8XeuZw-Ov4JUNSne6J2gNVrYCJRYU4B0akWsjg71jqHfCw@mail.gmail.com>
 (Joel Stanley's message of "Tue, 17 May 2022 05:50:24 +0000")
Message-ID: <87zgjg4qtu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/go: Bump to v1.18.2
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

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > On Thu, 12 May 2022 at 08:48, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:
 >> 
 >> > Minor version bump to the latest release.
 >> > Signed-off-by: Joel Stanley <joel@jms.id.au>
 >> 
 >> According to to the upstream changelog this fixes security issues:
 >> 
 >> go1.18.2 (released 2022-05-10) includes security fixes to the syscall
 >> package, as well as bug fixes to the compiler, runtime, the go command,
 >> and the crypto/x509, go/types, net/http/httptest, reflect, and
 >> sync/atomic packages
 >> 
 >> https://go.dev/doc/devel/release#go1.18
 >> 
 >> So I have reworded the commit message to make this clear and committed,
 >> thanks.

 > Thanks for doing that.

 > I noticed you didn't merge the second patch in this series. Is that
 > one okay to go in too?

Sorry, I got sidetracked getting 2022.05-rc1 ready. I'll get back to it
later this week.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
