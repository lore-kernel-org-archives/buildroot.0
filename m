From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 11:55:48 +0200
Subject: [Buildroot] Discussion on per-package logging
In-Reply-To: <995022ba-f346-09be-8f8b-9e64699cc242@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <995022ba-f346-09be-8f8b-9e64699cc242@mind.be>
Message-ID: <20171011115548.7c8172ff@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 11:05:06 +0200, Arnout Vandecappelle wrote:

>  For the record (since I'm sure this must have been discussed before), why isn't
> the --output-sync option sufficient? Output from parallel make is expected to be
> garbled in any parallel build. When a user calls 'make -j', we can expect them
> to also provide --output-sync=recurse option.

Ah, I indeed forgot to cover the -O/--output-sync option. The drawback
with -Orecurse is that you don't see anything happening for the entire
duration of a given package build step. Also I'm not sure if the ">>>
foo 1.0 Building" message will actually be grouped with the build of
that package, which makes the analysis of the build output a bit
difficult.

I'll do a bit of testing and report.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
