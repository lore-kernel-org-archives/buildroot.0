From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 24 Jan 2013 11:34:29 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
	output directory
In-Reply-To: <20130123164536.58d9e607@skate>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <2395397.i0MApMWjWq@sagittae> <20130123164536.58d9e607@skate>
Message-ID: <3919453.Rx41mcZzrx@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wednesday 23 January 2013 16:45:36 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 22 Jan 2013 18:12:49 +0100, J?r?me Pouiller wrote:
> > > This last point is the main reason. For now, the
> > > LINUX_OVERRIDE_SRCDIR mechanism is barely usable because it does a
> > > complete rsync of the Linux source tree, which is very annoying.
> > > So, switching all packages to out of tree build sounds like an
> > > interesting solution.
> > 
> > And what about building in a subdirectory of source directory ?
> 
> I am not sure why you think it would solve any problem, but it is
> anyway not possible for packages for which <pkg>_OVERRIDE_SRCDIR is
> used: we certainly do *not* want to build in a subdirectory of the
> source directory.
Mainly because packages not compiling out-of-source won't need to be rsynced 
between SRCDIR ans BUILDDIR.

Next it may solve questions about of dirclean behaviour.

Finally because I like idea that a directory contains all files related to a 
package.

Sure, overrided packages have be to handled differently. 

But it is only an idea, not sure it is a good idea :-) .

-- 
J?r?me Pouiller
