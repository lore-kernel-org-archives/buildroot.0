From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Dec 2015 22:13:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/eigen: install .pc file
In-Reply-To: <20151228220540.262dfc9c@free-electrons.com>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
 <6208cd9e3ec1e0da22459393104981ab0e43d69b.1451329553.git.yann.morin.1998@free.fr>
 <20151228220540.262dfc9c@free-electrons.com>
Message-ID: <20151228211312.GC3446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-28 22:05 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Mon, 28 Dec 2015 20:08:54 +0100, Yann E. MORIN wrote:
> > Other packages will look for eigen3.pc to detect the presence of eigen3.
> > 
> > eigen3.pc is usually installed by eigen's cmake buildsystem, but we do a
> > manual install to not depend on host-cmake just to install header files.
> > But in doing so, we forgot to install the .pc file.
> > 
> > Manually sed the source .pc.in to generate the final .pc file.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/eigen/eigen.mk | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> 
> Applied, thanks.

:-)

> Since I forgot to fix it in the commit, I did a
> follow-up commit to fix the indentation. You used a mix of tabs and
> spaces in a not very consistent way.

Well, it was not really 'inconsistent' since I did it on purpose:
  - the sed's -e expression were all aligned (with tabstop=8)
  - the install's source and destination were aligned (with tabstop=8)

But OK, your fix provides another kind of 'consistency' ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
