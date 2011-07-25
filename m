From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 25 Jul 2011 10:41:46 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <CAAXf6LVZ8tBGYDJevSVKia5buFCFOeO6LUM0vO0P2cx=0nqsPQ@mail.gmail.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <201107250920.26479.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LVZ8tBGYDJevSVKia5buFCFOeO6LUM0vO0P2cx=0nqsPQ@mail.gmail.com>
Message-ID: <201107251041.46720.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 25 July 2011 103710 Thomas De Schampheleire wrote:
> On Mon, Jul 25, 2011 at 9:20 AM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > Thomas*2, All,
> >
> > On Monday 25 July 2011 091116 Thomas Petazzoni wrote:
> >> Le Sun, 24 Jul 2011 16:50:50 +0200,
> >> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> >> > But this also means that you cannot properly use a 'local' package
> >> > from two buildroot installations, since the compilation process
> >> > happens in the local directory. Is that correct?
> >>
> >> Yes, this is unfortunately correct. The only other options would be :
> >>
> >> ?* Do the build out-of-tree, but this is already been discussed in
> >> ? ?another thread as being highly problematic for many packages ;
> >>
> >> ?* Make a copy of the complete source tree. This is reasonable for
> >> ? ?small projects, but for example, for something like the kernel, it
> >> ? ?is largely unreasonable, and one of the packages for which the
> >> ? ?"source override" mechanism is the most interesting is the kernel
> >> ? ?package.
> >>
> >> Do you see any other option ?
> >
> > Fake an out-of-tree build with some unionfs tricks. There is a FUSE-based
> > unionfs that works pretty well:
> > ? ?http://podgorny.cz/moin/UnionFsFuse
> >
> > The trick is to lure the package by making it believe it's being built
> > in-tree, while in fact the package dir is a unionfs mount with:
> > ?- the package source dir as the lowest-level, read-only branch
> > ?- the actual build dir as the highest-level, read-write branch
> 
> But this creates a dependency on the host kernel, right? It needs to
> have FUSE support.

Indeed. But what (recent) distro does not have FUSE enabled by default ?
Certainly, Debian has, so does Ubuntu.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
