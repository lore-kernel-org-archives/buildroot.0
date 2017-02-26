From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 26 Feb 2017 22:34:50 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
In-Reply-To: <20170226164509.GC4043@free.fr>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
 <o8uvu7$rgc$1@blaine.gmane.org> <20170226164509.GC4043@free.fr>
Message-ID: <1488144890.10882.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben, hi Yann,

On Sun, 2017-02-26 at 17:45 +0100, Yann E. MORIN wrote:
> Ben, All,
> 
> On 2017-02-26 16:32 +0000, Ben Boeckel spake thusly:
> > On Sat, 25 Feb, 2017 at 18:51:29 GMT, Yann E. MORIN wrote:
> > > cmake 3.7 causes serious regressions in some cmake-based
> > > packages,
> > > related to how RPATH is handled.
> > > 
> > > See for example:
> > > 
> > > ? - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54
> > > c7abf973691b39a0ca1bb4e07d749593a/
> > > ? - freerdp??: http://autobuild.buildroot.org/results/5d4/5d429d0
> > > e288754a541ee5d8be515454c5fccd28b/
> > > ? - libcec???: http://autobuild.buildroot.org/results/3f3/3f3593b
> > > ab7734dd274faf5b5690895e9424cbb89/
> > > 
> > > (and many others)
> > > 
> > > All causes the link to be attemped against host libraries, which
> > > is
> > > definitely not appropriate...
> > > 
> > > Properly fixing this so close to the release is problematic; we'd
> > > risk
> > > having to hunt down packages one by one.
> > 
> > Could you please submit a report to CMake's issue tracker?
> > Regressions
> > are taken seriously and it'd be nice to have this fixed for 3.8.0
> > (which
> > is currently in its RC cycle).
> > ????https://gitlab.kitware.com/cmake/cmake/issues
> 
> Yes, that would be awesome.
> 
> However, I don't know how to caracterise the bug with a minimal
> reproducer.
> Nor am I able to explain exactly what happens in details...
> 
> Maybe J?rg (which has already made an extensive analyis of the
> problem)
> or you (if you are knowledgeable about cmake) could do it? ;-)

In fact, I already submitted a report [1] to the CMake mailing list
some weeks ago. I was not sure, if this is a bug or a lack of
understanding at that moment.

Ray Donnelly replied in that thread he has a PR [2] in the loop "[..]
that asks the linker (via the compiler) what its implicit
search directories are instead.?It is the right way to do it IMHO, but
I need to find time to finish it unfortunately."

I did not checked the PR, yet.

[1] http://public.kitware.com/pipermail/cmake/2017-February/064970.html
[2] https://gitlab.kitware.com/mingwandroid/cmake/commit/b937ff949d8fda
ab7d8b812d503f67f8cef69532

J?rg
