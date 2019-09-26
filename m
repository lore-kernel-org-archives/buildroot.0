From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Sep 2019 08:55:36 +0200
Subject: [Buildroot] [PATCH v3] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <3ef870e5-4b17-e4c3-aa17-1bb69c911e99@mind.be>
References: <20190803140433.27967-1-arnout@mind.be>
 <20190925220223.12bc3db7@windsurf> <20190925204103.GG7274@scaer>
 <3ef870e5-4b17-e4c3-aa17-1bb69c911e99@mind.be>
Message-ID: <20190926085536.3bfe0907@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 23:28:05 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > As much as I like to keep backward compatibility when it makes sense,
> > external-deps has been broken for ~18 months now (since we moved
> > downloads to sub-directories), and no one complained. It's even been in
> > an LTS for 7 months now, and still no complain so far...
> > 
> > Besides, show-info is a versatile and easily extendable solution to
> > extract this kind of information from Buildroot.
> > 
> > So, what's the point in keeping external-deps?  
> 
>  Kill it with fire!

Do we really want to do that? Remember that we removed source-check,
and Thomas DS wanted to reintroduce it because it was useful in his
use-case ?

I'm all for dropping duplicated functionality to keep a sane code base
and a clear user experience (when there's gazillions of ways to achieve
the same thing, it's very confusing for users). But breaking stuff for
existing users is not nice, and I know our BDFL is also not happy with
breaking things.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
