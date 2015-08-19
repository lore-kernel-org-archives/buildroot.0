From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 23:02:51 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <55663493.1040500@mind.be>
References: <20150521212150.3f39f1c1@free-electrons.com>
 <20150521214726.19fc73fa@free-electrons.com>
 <20150521220438.624c6697@free-electrons.com>
 <55663493.1040500@mind.be>
Message-ID: <20150819230251.6aaa54e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 27 May 2015 23:18:11 +0200, Arnout Vandecappelle wrote:

> > 23332 pts/5    S+     0:01  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
> > 23969 pts/5    S      0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVE
> > 23970 pts/5    T      0:19  |       |       \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
>                  ^
>  This means that the 'make' instance either got a SIGSTOP or ptrace(). Is there
> some administrative process running on that machine that is doing something
> funky with it? Or is it the autobuild-run script that is sending some signal?

This machine is gcc75, so I don't really control all what is happening.
But not much seems to be going on on this machine.

The autobuild-run script does send a SIGTERM to subprocesses when the
main autobuild-run process is killed. But this is normally not the
case, unless you hit Ctrl+C.

>  Have you tried running it within the timeout? Maybe that one is doing SIGSTOP
> or ptrace() for some reason...

I haven't tried running without the timeout, but I've tried to do a
manual build of host-relang-rebar *under* timeout, and it worked just
fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
