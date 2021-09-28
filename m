Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CE1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F1F6103E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43F1F6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CCA41580;
	Tue, 28 Sep 2021 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIdHvIsPdIAj; Tue, 28 Sep 2021 19:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4768241586;
	Tue, 28 Sep 2021 19:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF7BD1BF404
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBE3660B34
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1HzO3ysO4fS for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 19:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7640760B48
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 19:55:51 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n2so14904579plk.12
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpCvXzRoNxIUzv6XQgvogK/e+WsvwR5JTGjnV2Mf8aw=;
 b=bxR1SsJ63aQFvaU7dVdHChIZoQYYkrTk9TNaFGpcvYzrhiutm60iBw48lUKvQ/CRb4
 kLmAuyyl7X6rRibBnSqOKeVmT+dzA+jBqpt5W0QjhPudNi1BdPZk4xIaCdi7PnzHq9gt
 vWIw/YqSn0jk5rmVHLz9qviVHVZSdq6Yl2abo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpCvXzRoNxIUzv6XQgvogK/e+WsvwR5JTGjnV2Mf8aw=;
 b=XLjL2U7F7xXSFRX6LzOTMjNTDlN1Z05czhtFCkaUMZA0pJNV0EXmCq6FWTa+Wf9VXu
 HgkWhQUYY5TEToQ0tkuh78ToDKR9c07HNn026sn9a1QgW80QMKrcuH1nIz3ns2RYvxS+
 IPanrMcuz/eFsYIVJLcsh50KO2ecBOevhwyfoKc32pBqy5I89YILNGS+WFM54bQUy9/e
 oSNfUpN+6c/rSqNM8MOh/Uj+UAF0Z3N5Jpdd1zjbaJ5WOZG75+vsymEamBtjPENaQ7oX
 NlzM5Mt0ySd1YizIa8vfCxQptGgRV80NNl8GS8Lof+hH6qat6jOU9h60zU8ats8RFW8B
 RwPA==
X-Gm-Message-State: AOAM531Nbek1MODRuYqE4EnIfbDyY+eJuwHGpwwPlHtTy2FjFIDif48V
 amjCkIJlKLEgU4aB7qSc2vgF4A==
X-Google-Smtp-Source: ABdhPJyRv7urQ9qsS3qXnuJ84fi0FOQR5zssuW0LUy9kjPtI2sAZS328VUZyvkWCpQU5QKI/rehP2Q==
X-Received: by 2002:a17:90b:4a82:: with SMTP id
 lp2mr1943295pjb.57.1632858950522; 
 Tue, 28 Sep 2021 12:55:50 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id z17sm21596098pfj.185.2021.09.28.12.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:55:50 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 6403B2A11349; Tue, 28 Sep 2021 12:55:48 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>,
	Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 28 Sep 2021 12:55:32 -0700
Message-Id: <20210928195533.1736944-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

After commit ca6a2907c27c[1], our automated nightly builds started
experiencing build failures. It took a little while to track down what
was happening. I think I understand now what is going on.

This is a bit of a lengthy email as it was a bit of a lengthy
investigation, and I want to relay my findings and some concerns.

The Build Error
===============

The error manifests itself like this:

>>>   Buildroot 2021.08-950-ga9072df Collecting legal info
COPYING: OK (sha256: 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4)
>>> toolchain-external  Executing pre-build script board/brcmstb/pre-build.sh

You must install 'gcc' on your build machine
support/dependencies/dependencies.mk:27: recipe for target 'dependencies' failed
make[3]: *** [dependencies] Error 1
Makefile:25: recipe for target '_all' failed

As you can see, this is happening for us at the "make legal-info" stage.
The error message is clearly bogus in this context. It just finished
successfully building everything without issue. Yet, when it comes to a
task that doesn't even require a compiler, it suddenly thinks host GCC
is missing and aborts.

One thing of note is that our post-build script calls "make legal-info",
and that is when the problem happens. The purpose of doing it like this
is to include the result of "make legal-info" in the image. As we will
see below, calling make from the post-build script is one crucial piece
to triggering this problem. The otheres are using ccache and the recent
switch to "command -v" from "which".

The Issue
=========

Patch ca6a2907c27c only sort-of introduced a new problem. Mostly, it
exposed a pre-existing issue. The problem existed all along, but was
hidden by "which" and the shell. With "which" being replaced by "command
-v", the issue became visible. But only under certain circumstances, and
that worries me a bit. More on that later.

The original problem is that the top-level Makefile unconditionally
defines HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE. This is fine 99.9% of the
time. However, if one is
   - using ccache
   - invoking make with HOSTCC/HOSTCXX already set
one ends up *with* ccache in the *_NOCCACHE variables (i.e. the exact
opposite of what should be happening)! Going forward, I'll just mention
HOSTCC_NOCCACHE, but the same applies to HOSTCXX_NOCCACHE.

How does it go astray? Because it unconditionally sets
   HOSTCC_NOCCACHE := $(HOSTCC)
HOSTCC_NOCCACHE can get overwritten in certain situations. In the
initial call to "make", all well. HOSTCC is /usr/bin/gcc, and later it
redefines
   HOSTCC = $(CCACHE) $(HOSTCC_NOCCACHE)
Now, HOSTCC references ccache and HOSTCC_NOCCACHE does not. Just as
intended.

However, when make is invoked a second time with HOSTCC already
defined to call ccache, it'll still assign
   HOSTCC_NOCCACHE := $(HOSTCC)
which now redefines HOSTCC_NOCCACHE to *INCLUDE* ccache (since HOSTCC
does, from earlier)!

How would one end up calling "make" again with HOSTCC already set to
ccache? Easy. One sets up a post-build script that calls "make
legal-info". Since the first instance of "make" is still running (it is
calling the post-build script after all), HOSTCC will already be
pointing to ccache, and it'll set HOSTCC_NOCCACHE to equal HOSTCC.
And now we have an issue. Albeit one we didn't see until patch
ca6a2907c27c. I'll explain why below.

To resolve the issue, my proposal is to set HOST*_NOCCACHE
conditionally:

ifndef HOSTCC_NOCCACHE
HOSTCC_NOCCACHE := $(HOSTCC)
endif
...
ifndef HOSTCXX_NOCCACHE
HOSTCXX_NOCCACHE := $(HOSTCXX)
endif

Doing this does indeed solve the problem, and it does seem like the
right thing to do.

Why did this work before?
=========================

There is a difference between "which" and "command -v" and how they
handle multiple arguments being passed to them. But it gets worse. There
is also a difference between "command -v" in different shells!

I am talking about dash here, Debian's and Ubuntu's /bin/sh
implementation, which is what support/dependencies/dependencies.sh will
be using on those systems.

As explained above, we end up with HOSTCC_NOCCACHE pointing to ccache,
like so:

$ echo $HOSTCC_NOCCACHE
/local/users/mmayer/buildroot/output/arm64/host/bin/ccache /usr/bin/gcc

Here is where it gets interesting. "which" will return two lines, one
for each of the commands:

$ which $HOSTCC_NOCCACHE
/local/users/mmayer/buildroot/output/arm64/host/bin/ccache
/usr/bin/gcc

This ultimately, ends up working -- by pure chance. It's a lucky
combination of "which" and the shell behaving in just the right way.

$ `which $HOSTCC_NOCCACHE` -v 2>&1 | grep 'gcc version'
gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04) 

And that's why this issue has never before shown up. The combination
between "which" returning two lines and the shell ignoring the first and
only dealing with the second, made things work.

However, dash's "command -v" will ignore the second argument:

$ command -v $HOSTCC_NOCCACHE 
/local/users/mmayer/buildroot/output/arm64/host/bin/ccache

And there's our problem. dependencies.sh now learns that $COMPILER is
apparently ccache. It runs "ccache -v", can't find "gcc" in ccache's
output and aborts the build concluding that gcc must not be installed.

$ `command -v $HOSTCC_NOCCACHE` -v
.../output/arm64/host/bin/ccache: invalid option -- 'v'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)
[...]

Please note that "command -v" in bash does *NOT* do this! Bash's
"command -v" seems to behave just like "which" used to. Yikes!

bash$ command -v $HOSTCC_NOCCACHE
/local/users/mmayer/buildroot/output/arm64/host/bin/ccache
/usr/bin/gcc

bash$ `command -v $HOSTCC_NOCCACHE` -v 2>&1 | grep 'gcc version'
gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04) 

I can't stress this enough. "command -v" behaves differently for bash
and dash! This does not give me the warm and fuzzies.

The Use of "command -v"
=======================

The command "command -v" may be mandated by POSIX, but it is clearly
implemented differently across different shells. Even shells that are
generally considered to be fairly compatible (bash and dash) do vastly
different things.

As such, relying on "command -v" seems a little risky in that it opens
up the possibility for strange build errors that others cannot reproduce
and that nobody would ever think to investigate as being related to the
"command -v" implementation of a specific shell.

There is also the issue of some developers working with different
distributions. Somebody developing a feature on distro 1 might create
build problems for others using distro 2 and vice versa. Neither would
have a way of knowing ahead of time that there will be an issue.

I am wondering if it might be prudent to provide a host-which package,
such that Buildroot can build its own "which" command if the system
doesn't have one and stick to using "which" despite it being deprecated.
At least for the time being and until "command -v" can be explored and
evaluated a bit more.

"which" has been around for a long time, and it is a known entity. To me
personally, and after what I learned here, relying on "command -v" seems
to be a bit like opening a can of worms. Who knows what else will happen
some time down the road when nobody is even thinking about the "which"
-> "command -v" change anymore?

With all of that explained, I'll defer to you on the final call on the
matter of using or not using "command -v".

However, please accept my Makefile change irrespective of the "command
-v" situation.

Regards,
-Markus

[1] https://git.buildroot.net/buildroot/commit/?id=ca6a2907c27c

Markus Mayer (1):
  Makefile: set HOST*_NOCCACHE variables only if unset

 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
