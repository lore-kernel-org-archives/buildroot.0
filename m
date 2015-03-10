From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 22:54:19 +0100
Subject: [Buildroot] [PATCH v5 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <54FF656E.1030400@mind.be>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <CAHXCMMK00FKgwO0iHs3J3kguRsFvMD5hfBgUUJ8dKcdKw0CDSQ@mail.gmail.com>
 <20150310185612.10d9db1d@free-electrons.com>
 <54FF656E.1030400@mind.be>
Message-ID: <20150310225419.633df718@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 10 Mar 2015 22:43:10 +0100, Arnout Vandecappelle wrote:

>  I'm all for building in a subirectory by default and only do it directly in the
> tree when necessary.
> 
>  And in fact, I would not even introduce the _REQUIRES_IN_SOURCE_BUILD variable
> until it is proven to be necessary. BTW, Thomas, did you introduce something
> like that in your out-of-source-build branch?

Yes, I did have a flag that allows a package to say "I support
out-of-tree build". It defaulted to "NO" in generic-package, and to
"YES" in autotools-package and cmake-package, but can be overridden by
individual packages. For example, 'linux' can support out of tree build
even though it's a generic-package (well, now a kconfig-package), or an
autotools package may not support out of tree due to stupidities done
by the upstream developer.

However, this branch is now very old, and was far from being ready.

I really would like to put the smallest amount of work on Gwenhael
shoulders: I don't want to ask him, as a prerequisite of getting
gnuradio merged, to do some major surgery work deep in our package
infrastructure. So can we settle on a temporary solution that works for
gnuradio and is acceptable, and implement the grand plan of doing full
out of tree build at some later point?

Cheers,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
