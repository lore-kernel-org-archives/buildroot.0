From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 1 Apr 2009 02:11:48 +0200
Subject: [Buildroot] User defined packages?
In-Reply-To: <200903311637.14499.lsargent@txdigital.com>
References: <FD8B1EC7-BDA6-4BF5-9A65-5BF62E054683@cannasoftware.com>
	<200903312108.58755.markus.heidelberg@web.de>
	<200903311637.14499.lsargent@txdigital.com>
Message-ID: <200904010211.48696.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, please keep the list in the reply.
So quoting the whole mail.

Lloyd Sargent, 31.03.2009:
> On Tuesday 31 March 2009 14:08:58 Markus Heidelberg wrote:
> > Lloyd Sargent, 31.03.2009:
> > > As a noob on this list, if there isn't already a way to add user
> > > defined packages, could I suggest the following?
> > >
> > > In package/Config.in add the following line:
> > >
> > > source "user_package/Config.in"
> > >
> > > In a new directory named "user_package" have a file called Config.in
> > > with the following:
> > >
> > > menu "User Packages"
> > > source "package/YourUserDefinedPackage/Config.in"
> >
> > I guess you meant user_package/ here and not package/
> 
> Oops! Yeah, that's what I means :)
> 
> > > endmenu
> > >
> > > The advantage to this is that it allows users to add to their list of
> > > packages without affecting (or in anyway touching) the files within
> > > the "package" directory. And it gives noobs such as myself a feeling
> > > of security that they aren't messing up something important.
> >
> > For a real feeling of security you should use a VCS.
> 
> Actually, I use Subversion, but there you go... :)
> 
> > I personally don't like the idea of a separate package directory.
> > Putting them into package/ only touches package/Config.in. You can add a
> > new 'menu "My Packages"' at the end of the file or wherever if you like,
> > this doesn't affect the official files much.
> 
> I was looking at it going forward. We have a need to update our packages from 
> time to time. It seems to me easier to copy a directory than go in and edit a 
> file over and over.

I did the same: updating to newer releases. But when working in a VCS
(git for me), it should not be necessary to bother with copying files or
directories around at all. Rebasing onto the next release or merging the
changes in should do it.

Markus
