From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 16:55:31 +0200
Subject: [Buildroot] [PATCH] openresolv: new package
In-Reply-To: <CANQCQpa-n4we3SnN+ZoGd+3mxufqnO5jVVAdFYZXtyjtWczneQ@mail.gmail.com>
References: <1533648586-60818-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180814161200.08d4a984@windsurf>
 <CANQCQpa-n4we3SnN+ZoGd+3mxufqnO5jVVAdFYZXtyjtWczneQ@mail.gmail.com>
Message-ID: <20180814165531.7943c53b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 09:37:05 -0500, Matthew Weber wrote:

> > Are you sure it needs a bash shell ? Indeed in
> > https://github.com/rsmarples/openresolv, the #1 argument for resolvconf
> > compared to its Debian variant is:
> >
> > ""
> > Works with POSIX shell and userland
> > ""  
> 
> This dialog should have been included in the description related to
> use of getopts vs getopt in the script.
> 
> https://github.com/rsmarples/openresolv/commit/a694a49c41ffdc0e215320459af009d44482b065#commitcomment-29850615

I think Paresh got it wrong somehow. Busybox provides both getopt and
getopts. getopt is non-POSIX, while getopts is POSIX (see
https://en.wikipedia.org/wiki/Getopt#Shell and
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/getopts.html).

Minimal Buildroot system with our default Busybox configuration:

# getopts
-sh: getopts: usage: getopts optstring var [arg]
# getopt
getopt: missing optstring argument

Both are provided. getopt is a separate program, getopts is a shell
built-in.

I added a comment on the Github issue.

> Missed this, looks like they are mimic'n a configure script.  It is
> working as a autotools pkg, but I'll pull the commands over to a
> generic.

Please don't pull the full commands from autotools-package with all the
environment variables and options that only make sense for
real-autotools based packages: only include the minimal set of
variables/options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
