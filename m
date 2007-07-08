From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 15:27:11 +0200 (CEST)
Subject: [Buildroot] missing expat-dirclean target
In-Reply-To: <20070708131108.GL4096@aon.at>
References: <0707081407520.26961@somehost> <20070708121822.GH4096@aon.at>
	<0707081504270.3987@somehost> <20070708131108.GL4096@aon.at>
Message-ID: <0707081519090.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jul 2007, Bernhard Fischer wrote:

> On Sun, Jul 08, 2007 at 03:07:18PM +0200, Cristian Ionescu-Idbohrn wrote:
> >
> > Looks like stuff is removed both from STAGING_DIR and TARGET_DIR.  Is
> > this the correct behaviour?
>
> I think removing stuff from both staging_dir and target_dir is the way
> to go, yes.

Alright.  I still wish every makefile had a target called called
<something>-uninstall to do that.

> Consider somebody intending to turn off a package. The usual intuitive
> way is IMHO to make foo-clean then reconfigure to remove that package.
>
> I'm open to alternative suggestions, of course.

This is how I wish it was done (looks more intuitive to me):

<something>-clean	does the usual 'make clean' stuff
<something>-dirclean	wipes out the build directory
<something>-uninstall	wipes whatever was installed


-- 
Cristian
