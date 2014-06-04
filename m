From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Wed, 4 Jun 2014 13:54:19 -0400 (EDT)
Subject: [Buildroot] How can I force re-compile of a local package with a
 single command?
In-Reply-To: <192375957.216176.1401896733024.JavaMail.root@mail>
Message-ID: <811570499.488964.1401904459698.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Makers,

I added a package to buildroot which has a lot of
warnings at compile time. I am currently fixing 
these warnings. But I am annoyed that 
<package>-rebuild does not force recompilation of 
source files (that have not changed). I mean some
files have warnings but still compile. Worth to 
mention that my package is local, i.e. buildroot 
rsyncs my sources, no tarball in dl/.

I need a way to force recompiling them to check 
and fix those warnings. So far I do:

 $ make <package>-dirclean
 $ make <package>

By intuition, I would have thought that:

 $ make <package>-rebuild
 $ make <package>-reconfigure

would do the job, but they don't. IMHO, for local
packages, this is counterintuitive. The thing is,
one might _want_ to recompile an object eventhough
the source has not changed. This is my case here.

Is there a single command I can issue to rebuild
_and_ force recompilation of my local package?

thanks,
Emeric
