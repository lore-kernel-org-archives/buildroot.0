From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:39:03 +0200
Subject: [Buildroot] [PATCH] package/dehydrated: new package
In-Reply-To: <20180618121309.10606-1-arnout@mind.be>
References: <20180618121309.10606-1-arnout@mind.be>
Message-ID: <20180626233903.58cb6365@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jun 2018 14:13:09 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> dehydrated is an ACME client written in bash. It should be able to run
> under zsh as well, but this hasn't been tested so it isn't enabled for
> now.
> 
> Normally, we would want an init script to start dehydrated, and an
> example configuration file. However, it is very difficult to do this
> in a generic way in Buildroot:
> - we normally don't have cron running;
> - we have no standard location for webroot;
> - we have no standard location for certificates;
> - we have no standard way to restart/reload the webserver.
> So instead, provide brief documentation of how to use dehydrated in the
> help text.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

> In the hash file, I made a little (IMO) improvement of how we typically
> handle things: in addition to the URL of the signature file, I also
> added the PGP fingerprint and the URL where I got the key. This
> establishes a kind of informal TOFU approach: when someone updates the
> package, they can verify that it was signed with the same key, or (if
> the key is renewed by then) check on keybase if it really is the same
> person. Without this, and adversary could just upload a tarball and
> signature with some different key and nobody would be any wiser.

This looks interesting to me, but I'm a bit worried about the additional
complexity for newcomers who are adding new packages or updating
existing packages. It is not easy to understand how to do all this PGP
verification, and the overall reasoning behind storing those details in
the .hash file. Of course, when you understand PGP and have a bit of
a security mindset, it all makes sense, but for newcomers, it may not
be that trivial. Not necessarily a reason not to do it, but it's worth
considering this aspect.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
