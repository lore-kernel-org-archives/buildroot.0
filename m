From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2016 12:15:29 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
In-Reply-To: <CAGm1_ktsesfzLN6GKBuNviVc1Yn-_XegksJyLuycxY+heXy=VQ@mail.gmail.com>
References: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
 <20160101222835.GD2182@free.fr> <20160101224914.GE2182@free.fr>
 <CAGm1_ktsesfzLN6GKBuNviVc1Yn-_XegksJyLuycxY+heXy=VQ@mail.gmail.com>
Message-ID: <20160102111529.GG3477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2016-01-02 10:05 +0100, Yegor Yefremov spake thusly:
> On Fri, Jan 1, 2016 at 11:49 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2016-01-01 23:28 +0100, Yann E. MORIN spake thusly:
> >> On 2016-01-01 23:18 +0100, Yegor Yefremov spake thusly:
> >> > Add hash file and change download location to PyPi.
> >>
> >> Why did you change the location?
> >>
> >> I think we want to use upstream locations as much as possible, and only
> >> fallback to alternative locations when there is no upstream, or upstream
> >> is flaky.
> >
> > OK, I think I know why you wanted to download from PyPi: the current
> > package we have will download an archive named ae5b6cf.tar.gz without
> > the name of the package.
> >
> > That's because Bitbucket provides snapshots as such.
> >
> > Also, there is not 'tag' per-se in the repository; upstream only
> > updates the version in the setup.py script.
> >
> > I don't think it is bad to use a hash when there is no human-readable
> > version tagged. But we are currently using the short hash, when we
> > require the full hash.
> >
> > So, I'd suggest we fix it by using the Hg download method:
> >
> >     PYTHON_CAN_VERSION = 4085cffd2519f0ce21779e26b5c43ce8c007e9aa
> >     PYHTON_CAN_SITE = https://bitbucket.org/hardbyte/python-can
> >     PYHTON_CAN_SITE_METHOD = hg
> >
> > Then we have tarballs properly named with the package name and the full
> > hash.
> >
> > Care to update and respin, please? Thanks!
> 
> I don't always change download location for Python packages, but when
> I do, I change it to PyPi :-)
> 
> First of all it is simpler with checksums: you have official MD5 and
> in addition you add sha256.
> 
> PyPi is a standard place to download official package releases. Many
> Python packages in BR have PyPi. It is also very easy to add a new
> package using PyPi based package as template. I'm even thinking about
> making a PyPi helper.
> 
> Upstream repo can be used, if there are important fixes and official
> released is not planned.
> 
> What do you think?

As discussed on IRC: yeah, you were not the one who changed all the
other PyPi-related locations. ;-)

I was only referring to that very patch.

Still, I think we should use upstream locations, not some packaging
location. For example, switching to PyPi for Python packages would be
like switching to Debian for 'native' packages. We don't do that (except
when upstream has disapeared, is acting...)

The argument about the hash is only patially valid: md5 is long dead
now, and you still have to compute a sha256 anyway.

But as seen on IRC: let's see what others think.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
