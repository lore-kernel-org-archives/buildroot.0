From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 29 May 2018 00:43:49 -0300
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
References: <20180528194429.GF2965@scaer>
Message-ID: <5b0ccc753f59_1c272ab87ea319a052883@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, May 28, 2018 at 04:44 PM, Yann E. MORIN wrote:

[snip]
> Why do we even use pip to install those? Can't we just rely on the
> verions actually packaged in the distro instead? I.e.
> 
>     apt-get install python-configobj python-configparser etc...
> 
> Of course, provided that the module is indeed packaged in the distro...
> As far as I can see, there should be everything we need, no?

Indeed. Yes.

> The only two for which I have a doubt are bzr (python-bzrlib) and
> mercurial (python-hglib); all the others are in stretch-20171210.

Don't worry about these. They were probably installed by the apt-get command,
pip only listed them.

> But if we apt-get install python-flake8, then it should bring all its
> dependencies I guess:

Yes. We don't even need to install python-pip.

[snip]
> Note that I don't care if stretch packages a different version than what
> we curently have; I'd prefer that we use the distro-packaged versions,
> since we know that apt-get *is* reproducible as we use a fixed version
> of the distro.

OK. Simple and effective solution.

Notice we will be downgrading flake8 from
3.5.0 (mccabe: 0.6.1, pycodestyle: 2.3.1, pyflakes: 1.6.0) from 2017-10-23
to
3.2.1 (pyflakes: 1.3.0, pycodestyle: 2.2.0, mccabe: 0.5.3) from 2016-11-21

Anyone curious can see the changelog here:
http://flake8.pycqa.org/en/latest/release-notes/index.html#x-release-series

>> Are you preparing a patch?
> 
> When we agree on the directions, yes I can.

Reproducible images with less code and less maintenance effort in exchange of
using a not-so-bleeding-edge version. Makes sense to me.

I am only in doubt how future-proof is this solution, if some day we will
*need* a new version, i.e. to something related to Python3 in 2020 (it's only a
wild guess!, I don't know any current limitation, I don't know the internals of
flake8).
But then probably debian will have a newer version of flake8, so we can update
the stretch version. And we can always go back to using pip if really needed.


Regards,
Ricardo
