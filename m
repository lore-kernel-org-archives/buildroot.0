From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 11:05:06 +0200
Subject: [Buildroot] Discussion on per-package logging
In-Reply-To: <20171011105809.2bf05267@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
Message-ID: <995022ba-f346-09be-8f8b-9e64699cc242@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 10:58, Thomas Petazzoni wrote:
> One first issue with top-level parallel build is simple: the build
> output of several packages is mixed up, making the overall build output
> mostly unreadable. 

 For the record (since I'm sure this must have been discussed before), why isn't
the --output-sync option sufficient? Output from parallel make is expected to be
garbled in any parallel build. When a user calls 'make -j', we can expect them
to also provide --output-sync=recurse option.

 Regards,
 Arnout

> Therefore, an idea is to log the build output in log
> files per package, and only keep the ">>> foo 1.0 Building" messages on
> the standard output. It turns out this is not as easy as it sounds, and
> it seems like there is no good solution for that.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
