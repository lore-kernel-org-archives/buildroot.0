From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Feb 2017 17:45:09 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
In-Reply-To: <o8uvu7$rgc$1@blaine.gmane.org>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
 <o8uvu7$rgc$1@blaine.gmane.org>
Message-ID: <20170226164509.GC4043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

On 2017-02-26 16:32 +0000, Ben Boeckel spake thusly:
> On Sat, 25 Feb, 2017 at 18:51:29 GMT, Yann E. MORIN wrote:
> > cmake 3.7 causes serious regressions in some cmake-based packages,
> > related to how RPATH is handled.
> >
> > See for example:
> >
> >   - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
> >   - freerdp  : http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
> >   - libcec   : http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/
> >
> > (and many others)
> >
> > All causes the link to be attemped against host libraries, which is
> > definitely not appropriate...
> >
> > Properly fixing this so close to the release is problematic; we'd risk
> > having to hunt down packages one by one.
> 
> Could you please submit a report to CMake's issue tracker? Regressions
> are taken seriously and it'd be nice to have this fixed for 3.8.0 (which
> is currently in its RC cycle).
>     https://gitlab.kitware.com/cmake/cmake/issues

Yes, that would be awesome.

However, I don't know how to caracterise the bug with a minimal reproducer.
Nor am I able to explain exactly what happens in details...

Maybe J?rg (which has already made an extensive analyis of the problem)
or you (if you are knowledgeable about cmake) could do it? ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
