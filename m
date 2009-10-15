From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 15 Oct 2009 12:09:17 +0200
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <4AD6ED89.6020902@mimc.co.uk>
References: <4AD6ED89.6020902@mimc.co.uk>
Message-ID: <1255601357.3933.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2009-10-15 at 10:38 +0100, Mark Jackson wrote:
> Correct me if I'm missing something here ...
> 
> After I've run a successful build the output/target directory contains
> a copy of the target files.  Fine.
> 
> If I then, say, remove a package via 'make menuconfig', I have to then
> perform a 'make dirclean; make' to generate a new set of target files.
> 
> This, of course, causes a re-compile of *everything* !!

You can use 'make package-clean' (with package substituted by the name
of the package) before deselecting the package. This will uninstall it
from staging and target areas.


Sven
