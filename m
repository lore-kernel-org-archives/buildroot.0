From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 22 Mar 2015 12:30:26 +0200
Subject: [Buildroot] [RFC 00/11] common init infrastructure
In-Reply-To: <550DD772.1010009@mind.be>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <550DD772.1010009@mind.be>
Message-ID: <20150322103026.GA21403@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sat, Mar 21, 2015 at 09:41:22PM +0100, Arnout Vandecappelle wrote:

> - Although we have a dependency on python, we don't currently use python for any
> of the core functionality (i.e., just building). Personally I like python a lot,
> but now you already have to know make and shell pretty well in order to touch
> the buildroot core. Adding python to the mix is making the threshold even higher.
Ah, I see. I decided to go with python specifically to avoid extra dependencies,
after looking at the language stats in support/scripts.
Now indeed python scripts there are not build scripts.

> - The generation script looks a bit complicated, while on the other hand the
> .run files are really terse. I'd prefer a bit more verbosity in the .run files,
> especially if that can make the generation script a bit simpler.
Makes sense. And it may help to drop python dependency at some point.
I need to think on this and maybe try things to see what could work better.

Initially the format was somewhat simplier, with prefixed lines.
Definitely easier to parse, but there were some quirks with that approach.
