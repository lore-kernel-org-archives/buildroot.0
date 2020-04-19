From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Apr 2020 17:43:43 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: new package
In-Reply-To: <20200419161656.00eeb386@windsurf.home>
References: <20191101080135.23413-1-james.hilliard1@gmail.com>
 <20200419161656.00eeb386@windsurf.home>
Message-ID: <CADvTj4q_k4Lp_pU6Nzdgdx2oB_QqkX1frPcfSraL8eCVjrFVQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 19, 2020 at 8:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  1 Nov 2019 02:01:35 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> This package fails to build on a number of CPU architectures:
>
>   http://autobuild.buildroot.net/?reason=python-greenlet%
>
> It seems like it contains some architecture-specific code, as it fails
> like this:
>
> greenlet.c:347:2: error: #error "greenlet needs to be ported to this platform, or teached how to detect your compiler properly."
>
> Could you have a look ?
I went ahead and just disabled the failing architectures for now as adding
support for the missing architectures looks pretty tricky since I don't really
know much assembly.
https://patchwork.ozlabs.org/project/buildroot/patch/20200419233823.29410-1-james.hilliard1 at gmail.com/

I went ahead and opened issues upstream to track support for these missing
architectures:
https://github.com/python-greenlet/greenlet/issues/163
https://github.com/python-greenlet/greenlet/issues/164
https://github.com/python-greenlet/greenlet/issues/165
https://github.com/python-greenlet/greenlet/issues/166
>
> Are you receiving daily e-mail with the build failures that occur for
> the packages you are listed for in the DEVELOPERS file ?
Yes, just hadn't gotten around to looking at this one yet.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
