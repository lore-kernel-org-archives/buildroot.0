From: Benjamin Tietz <benjamin@micronet24.de>
Date: Wed, 22 Aug 2007 21:22:55 +0200
Subject: [Buildroot] buildroot-20070720
In-Reply-To: <032a01c7e4e2$b5fb0fe0$980b7356@atmel.com>
References: <1187730489.15882.7.camel@86-115-11-152>
	<20070821230818.GS11697@aon.at>
	<1187754477.4494.11.camel@86-115-11-152>
	<20070822080818.GA7523@aon.at>
	<00e901c7e4b6$d77a8460$070514ac@atmel.com>
	<20070822124029.GA9846@aon.at>
	<032a01c7e4e2$b5fb0fe0$980b7356@atmel.com>
Message-ID: <20070822192255.GA4736@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 06:43:45PM +0200, Ulf Samuelsson wrote:
> >>
> >>Is there any chance that buildroot is moving over to "git"?.
> > 
> > given that there is a svn backend for git, this doesn't make much sense
> > to me. They should just pull upstream, git should be able to take care
> > for (most of) the rest, but i'll not mandate how atmel does their
> > busyness here ;)
> > 
> 
> Personally, I have never used git except just cloning a tree.
> 
> If I understand you correctly, I can pull stuff using git from the svn server
> and then add the stuff I get from my friends and do a merge
> and put back the end result using git talking to the svn server, right?
> 
> Best Regards
> Ulf Samuelsson
Nearly. You can't do that with the native git tools. 
There exist some tools, e.g. connecting your local git-repository to
some other type of repository. git-svn does that for svn.
	git-svn init <SVN-URL> 
will make your repo able to use svn. Afterwards do
	git-svn fetch
to pull the svn-tree, and
	git-svn commit
to push back the changes.

best regards
Benjamin
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
