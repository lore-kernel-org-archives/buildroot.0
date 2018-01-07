From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 7 Jan 2018 21:08:29 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180105052334.mc3fabifliw7gzqn@tarshish>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180104101927.oexxtwusya3wppyk@tarshish>
 <20180104113336.6b7ed00a@windsurf.lan>
 <20180104105154.l24rvscxbsliquv3@tarshish>
 <20180104112815.GD18339@airbook.vandijck-laurijssen.be>
 <20180104155213.GC3684@scaer>
 <20180104172352.k6u2i3bkfmovgwgm@tarshish>
 <20180104201958.GB5130@waldemar-brodkorb.de>
 <20180105052334.mc3fabifliw7gzqn@tarshish>
Message-ID: <20180107200829.GA30596@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Baruch Siach wrote,

> The UCLIBC_HAS_ADVANCED_REALTIME help text says that this options enables 
> clock_nanosleep(). But with current code you must have NPTL enabled for 
> clock_nanosleep(). So the help text is not correct.
> 
> This also means that architectures lack NPTL support can't have 
> clock_nanosleep() at all. Is there a reason for that?

You are right. It seems there is no reason for it.
clock_nanosleep is internally using a syscall.

I prepared attached patch and running the regression tests.

Do you like to test or review?

I cleaned up old code, which might be only required for Linux
kernels older than 2.6.0, which I do not going to support anyway.

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-rt-cleanup-and-allow-to-build-for-linuxthreads.patch
Type: text/x-diff
Size: 11284 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180107/62b2ebc0/attachment.patch>
