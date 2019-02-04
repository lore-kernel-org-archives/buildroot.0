From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 21:11:30 +0100
Subject: [Buildroot] [PATCH v7 7/8] package/rtmpdump: Fix compilation
 issues with openssl 1.1.x
In-Reply-To: <8a058fda-b1f8-4ed6-9570-b47669b37d8a@mind.be> (Arnout
 Vandecappelle's message of "Mon, 4 Feb 2019 19:15:19 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-7-patrick.havelange@essensium.com>
 <87va1zx3zr.fsf@dell.be.48ers.dk>
 <8a058fda-b1f8-4ed6-9570-b47669b37d8a@mind.be>
Message-ID: <87ef8ns499.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/02/2019 11:06, Peter Korsgaard wrote:
 >>>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:
 >> 
 >> > From: Vadim Kochan <vadim4j@gmail.com>
 >> > Upstream is dead, other distros use gnutls exclusively,
 >> > so patch is not sent upstream.
 >> 
 >> So shouldn't we do the same?
 >> 
 >> What other distributions exactly?

 >  IIRC I checked at least Fedora and Debian, possibly also Gentoo and/or Arch.

Ok, which probably makes sense for a binary distribution.

It is not exactly clear to me where this patch comes from. Googling
around I see a very similar patch on this github repo:

https://github.com/JudgeZarbi/RTMPDump-OpenSSL-1.1

But that repo has an open issue about a crash in the handshake handling
(code that gets changed by this patch) and the README states:

I modified a few of the files in the librtmp directory to conform to the
new getters and setters in OpenSSL 1.1.0. I don't claim to be a security
expert, and neither have I had any experience with OpenSSL in a
programming sense, so I'm not sure exactly if it's correct, but it
compiles and seems to work for what I use it for.

Which does not sound very reassuring to me, so I have instead pushed a
patch to drop the openssl support for rtmpdump.

-- 
Bye, Peter Korsgaard
