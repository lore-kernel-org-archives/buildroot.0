From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:07:59 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
In-Reply-To: <20141116215017.GD10840@free.fr> (Yann E. MORIN's message of
 "Sun, 16 Nov 2014 22:50:17 +0100")
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141116220244.0175cc90@free-electrons.com>
 <20141116215017.GD10840@free.fr>
Message-ID: <87389ier40.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2014-11-16 22:02 +0100, Thomas Petazzoni spake thusly:
 >> On Sun, 16 Nov 2014 18:21:04 +0100, Bernd Kuhls wrote:
 >> 
 >> > Please add the upstream bugtracker URL to your patch: 
 >> > https://bugzilla.clamav.net/show_bug.cgi?id=11170
 >> 
 >> I believe Yann's patch is not an appropriate upstream solution, and a
 >> configure.ac check should be added instead.

 > That's what I think, too. But see what Peter had to say about that (as
 > pointed out by Bernd):
 >     http://patchwork.ozlabs.org/patch/406336/

 > Now, upstream has both patches in their bug tracker: the original from
 > Bernd that adds a check in ./configure (well, rather in
 > m4/reorganization/headers.m4, but that gives a configure-time check),
 > and my patch, does just slightly expands the current test to recognise
 > uClibc.

Just to clarify - I don't object against a configure script, my comment
on http://patchwork.ozlabs.org/patch/406336/ was simply that the
existing HAVE_BACKTRACE check didn't work for uClibc and it made more
sense to fix that than add an additional HAVE_EXECINFO_H check.

 > But back to Buildroot: we need a fix before the release, and that patch
 > is what Peter asked for.

Yeah, and I've committed it. When upstream decides (and perhaps makes a
new release) we can update and get rid of the patch.

-- 
Bye, Peter Korsgaard
