From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 15:30:01 +0200
Subject: [Buildroot] Cross-compiling Cyrus in Buildroot
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E53AB59.3020607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Hi Cyrus and Buildroot developers,
>
> I'm working to add cyrus-sasl and cyrus-imapd (http://www.cyrusimap.org/)
> to buildroot (http://www.buildroot.net/) for use on embedded systems.
>
> On my road I hit various problems with the cross-build process:
> configuration, compilation and installation.
> I could work around some, but not really fix them as they should.

After a couple cleanup cycles my work on cyrus-imapd and cyrus-sasl has
reached a pretty stable shape. It is not perfect, but it is working.

Here's the status w.r.t. the problems I previously reported.
There is not much news, since I received almost no feedback so far.

> Here's a list of the issues I found:
> - cyrus-sasl: apparent CFLAGS mismatch on saslauthd;

I applied my proposed patch to disable saslauthd.

> - cyrus-sasl: makemd5 is wrongly cross-compiled;

I applied my proposed patch which allows to correctly host-compile
makemd5.
I wonder if it should be applied upstream.

> - cyrus-sasl: installs files with "arm-linux-" prefix

Fixed with --program-prefix=''.

> - cyrus-imapd: imtest does not cross-compile correctly;

I applied my proposed patch to disable imtest.

> - cyrus-imapd: static binaries are huge, cannot build them shared;
> - cyrus-imapd: choose binaries to (build and) install;

Not solved. The good thing is that ????? ???????? Dilyan Palauzov
volounteered to update the cyrus-imapd buildsystem
(http://asg.andrew.cmu.edu/archive/message.php?mailbox=archive.cyrus-devel&searchterm=automake&msg=3040),
which would fix these two issues, and possibly also the previous one
with imtest.

I'm going to send a patch series with the current status of my work.
I'd like to know from the buildroot developers whether it is good
enough to be applied or the mentioned problems are too big.

Luca
