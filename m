From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 20 Oct 2019 21:20:53 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-10-19
In-Reply-To: <CAFOYHZA-XVvOdcJOCPGOEa2U5EbYHkDsdAicWXnB+u-mHZyf7Q@mail.gmail.com>
References: <5dabfbc3.1c69fb81.10a68.d6d1SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZA-XVvOdcJOCPGOEa2U5EbYHkDsdAicWXnB+u-mHZyf7Q@mail.gmail.com>
Message-ID: <CAFOYHZBNr87YKHL6c55jkKC7pLUf6jjQTBqYtgTTM+a6DJPf0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Answering my own question,

On Sun, Oct 20, 2019 at 9:08 PM Chris Packham <judge.packham@gmail.com> wrote:
>
> On Sun, Oct 20, 2019 at 7:16 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Recent build failures and runtime-tests failures
> > ================================================
> >
> > This is the list of Buildroot build failures that occurred on
> > 2019-10-19, and for which you are a registered architecture developer,
> > package developer or defconfig developer. This list also include
> > runtime tests failures. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Results for the 'master' branch
> > -------------------------------
> >
> > Build failures related to your packages:
> >
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >   powerpc    |        micropython-1.11        | http://autobuild.buildroot.net/results/b85b2214576030026a8e04d142a77a2648379417
> >
>
> Just had a quick look at this. I think the problem is that there are a
> few helper scripts that need to be run using python3 (or with make
> PYTHON=python2). Should I unconditionally add host python3 as a
> dependency or is there a way of doing it only if the build machine
> doesn't have a python3 interpreter.

Looks like BR2_PYTHON3_HOST_DEPENDENCY might do the trick. It
certainly seems to work
