From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Dec 2013 11:58:59 +0100
Subject: [Buildroot] libsvgtiny/NetSurf status
In-Reply-To: <CACjG4BLSNd+qguuT2Pb08z=5rQPS2AGKQaefqcKKVCbDK4xT+g@mail.gmail.com>
 (arnaud aujon's message of "Fri, 13 Dec 2013 11:48:35 +0100")
References: <CACjG4BLSNd+qguuT2Pb08z=5rQPS2AGKQaefqcKKVCbDK4xT+g@mail.gmail.com>
Message-ID: <87d2l1yq30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "arnaud" == arnaud aujon <arnaud.aujon@gmail.com> writes:

 > Hi,

 > I'm having a look at libsvgtiny package. libsvgtiny is part of the
 > netsurf browser project.  The current version in Buildroot is quite
 > old (2 years old) and the project released a new version 8 months
 > ago.  The problem is the project is using a new build infrastructure
 > that is split into several git repositories.  Here is the list of
 > repositories for the Netsurf project http:// git.netsurf-browser.org/

 > To build libsvgtiny, we need to checkout/build buildsystem, libdom,
 > libparsersutils and libwapcaplet.

And these are not part of the release tarball?


 > The buildsystem (basically only contains Makefiles) should be
 > packaged as a host package right ?

It's not really for the host, so perhaps it would make more sense to
have it as a target package (which only installs it under staging).


 > What about the dependency on the project libraries ? Should I create
 > a package for every dependency even if they are going to be used only
 > for this library ?  Or is it possible to create a "bundle" ?

I think the cleanest would be seperate packages, but I don't really know
much about netsurf and its libraries.


 > Moreover, netsurf browser is pretend to be a small and fast web
 > browser and can work with a frambuffer, does anyone already try it ?
 > I guess, if the work to bump libsvgtiny is done, we could add NetSurf
 > easily.

Yes, sounds good. I added libsvgtiny some time ago as I had a look at it
for a project, but I never ended up using it in the end, so no problem
from me to bump the version.

-- 
Bye, Peter Korsgaard
