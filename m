From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Dec 2019 20:58:36 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: fix runtime issue with
 Python 3
In-Reply-To: <1a56a5b4-e64b-3844-7352-d12c6407585b@mind.be>
References: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com>
 <1a56a5b4-e64b-3844-7352-d12c6407585b@mind.be>
Message-ID: <20191203205836.66e9c82a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Dec 2019 20:36:17 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Just guessing here, but: originally this file was downloaded with
> urlopen_closing() instead of being read from a local file.

Ah, that must be it!

> Since we only use genrandconfig in the autobuilders in python2 (cfr.
> the shebang)

I'm not sure why you say "in python2" ? The shebang in genrandconfig is:

#!/usr/bin/env python

and I indeed noticed the issue with Python 3.x because I started using
genrandconfig on my updated Fedora system, which now uses Python 3.x as
"python".

>, nobody noticed that this broke when I switched to
> reading from file instead of URL two years ago (84929a53a4).

Indeed. I'll update the commit log and resend.

Thanks for the hint!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
