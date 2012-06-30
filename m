From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 30 Jun 2012 23:22:03 +0100
Subject: [Buildroot] Buildroot and top-level parallel make
In-Reply-To: <4FEEF5A2.7060506@mind.be>
References: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
 <4FEEF5A2.7060506@mind.be>
Message-ID: <CA+wH295gMd7ZP9LQzDyV25hNnU0VFZWTpLsd271aHxU=vULcDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 June 2012 13:48, Arnout Vandecappelle <arnout@mind.be> wrote:
> ?AFAIK nobody is actually working on this. ?Myself I have had a little
> thought about it before, and the main problem seems that there are a few
> targets in the top-level Makefile that depend on the left-to-right
> evaluation order of dependencies.
>
> ?It would of course be difficult to verify that a top-level parallel make
> works, but now we have the autobuild system it can be done...

redo has the rather nice --shuffle option to help shake out issues
with parallel builds:
https://github.com/apenwarr/redo/#dependency-problems-that-only-show-up-during-parallel-builds

Admittedly I only had a quick look, but it doesn't look like GNU make
has something similar which is a shame. OpenBSD make does as one of
its debug options though:
http://www.openbsd.org/cgi-bin/man.cgi?query=make

Alex
