From: Rob Landley <rob@landley.net>
Date: Sun, 9 Nov 2008 19:49:02 -0600
Subject: [Buildroot] Server administration,
	and does buildroot have a maintainer?
Message-ID: <200811091949.03358.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The web page still says Buildroot's maintainer is Erik Andersen, who seems 
kind of busy with other things these days, has handed off all the other 
projects on this server, and last posted to this list 8 months ago.

I ask because Morris got cracked earlier today, and over on freenode we're 
discussing reinstalling it with Gentoo Embedded.  The crack itself was just 
an automated script kiddie compromising apache, and didn't even seem to 
notice _what_ server their bots had hit.  Denys spotted it within 24 hours, 
and OSUOSL has good backups so they could confirm the data seems to be fine, 
but it's generally a good idea to reinstall after getting rootkitted 
_anyway_.

The current server infrastructure is starting to smell.  Morris was 
administered by Erik, who really hasn't got time anymore.  (He made noises 
about reinstalling with a newer Debian version back in May, but doesn't seem 
to have actually done so.)  We were discussing reinstalling with something 
uClibc-based back in August (off-list) because of this, but Mike objected 
that actually using uClibc for real production use wasn't feasible due to a 
lack of manpower (and you wonder why Bernhard is uClibc maintainer now?), and 
the thread was tabled.  Now we're paying attention again.

We're looking at gentoo embedded because then we'd be dogfooding uClibc and 
busybox, which is cool.  (No, buildroot is not an option; you have no package 
management, and the project has still never had an actual _release_.  The 
OSUOSL guys would really like something that's actually capable of being A) 
administered after installation, B) reliably reproduced.)  The OSUOSL guys 
have an auto-administration system that a couple variants of Gentoo are 
already registered in, and are willing to at least look at extending it to 
handle gentoo embedded.  (An alternative is that Solar and I can admin it, 
and since he's the gentoo embedded maintainer it doesn't get much better than 
that...)

This is probably going to result in some service interruptions later this 
week.  (For one thing we're moving the mailing list off the virtual machine 
and onto OSUOSL dedicated mail servers.  Hopefully you guys won't be impacted 
by that part, but you never know; I'm not quite sure what URL the archives 
will wind up at yet.)  But getting svn and the web repository viewer and 
mantis (bug database) and so on up under the new system's going to be a bit 
intersting, and will almost certainly involve some downtime while all the 
data is transferred and various .config files are hit with large hammers.

Bernhard and Denys have been pinged, and if buildroot has a maintainer I'd 
like to keep him/her in the loop.  (If said maintainer is still Erik, then 
he's aware of the crack already, he just said he didn't have time to properly 
deal with it just now and delegated it back to the rest of us.)

Rob
