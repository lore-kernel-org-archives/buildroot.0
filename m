From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 21:50:41 +0200
Subject: [Buildroot] Future of linphone package,
 was: Re: [PATCH/next 2/4] DEVELOPERS: add initial list of Buildroot
 developers
In-Reply-To: <f8fu8dx2gc.ln2@ID-313208.user.individual.net>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <670f6e5c-e513-6b3f-ed82-4da1ddc3d141@lucaceresoli.net>
 <20160823134138.6f9818ef@free-electrons.com>
 <f8fu8dx2gc.ln2@ID-313208.user.individual.net>
Message-ID: <20160823215041.358d2e66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 19:54:55 +0200, Bernd Kuhls wrote:

> the last patches to linphone were done by me but please do not add
> me to the list of developers for this package because I do not use
> it on a buildroot-build system myself.
> 
> The problem with linphone is that buildroot carries version 3.6 which
> received its last bump in 2013. The current release 3.9.1 was done in
> November 2015, so upstream is still alive.
> 
> Since version 3.7.0[1] linphone requires the belle-sip[2] package. Last
> year I briefly tried to bump linphone and failed, afair because I could
> not cross-compile antlr3[3], which is a dependency[4] of belle-sip.

And according to https://github.com/BelledonneCommunications/belle-sip,
this package needs Java to be compiled, so not a nice dependency
(though we already have a few packages that depend on Java on the host
as a build dependency).

Since nobody cares about linphone, what about deprecating it? This way,
it will still be there for a while, but no longer visible in
menuconfig. If anybody shows up and says that he is interested in
linphone, then he will notice and hopefully let us know.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
