From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 4 Nov 2020 15:02:25 +0100
Subject: [Buildroot] [PATCH] package/python-remi: bump version to
 2020.10.30
In-Reply-To: <87tuu52wuj.fsf@dell.be.48ers.dk>
References: <20201102140000.1753870-1-gwenj@trabucayre.com>
 <87361p4kgd.fsf@dell.be.48ers.dk>
 <20201104110531.7b3ae222@x230_1.trabucayre.com>
 <87tuu52wuj.fsf@dell.be.48ers.dk>
Message-ID: <20201104150225.5d7fb0e8@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
On Wed, 04 Nov 2020 12:19:16 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:  
> 
> Hello,
> 
>  >> For example, if you're using pip, instead of
>  >> https://github.com/user/proj/archive/master.zip use
>  >> git+https://github.com/user/proj.git#egg=proj make: ***
>  >> [package/pkg-generic.mk:250:
>  >> /tmp/instance-0/output-1/build/python-remi-2020.10.30/.stamp_built] Error
>  >> 1
>  >> 
>  >> http://autobuild.buildroot.net/results/3a6/3a62359d0e183d45e50e999fc2c58f7805bda142/build-end.log
>  >>   
>  > Weird: I'm unable to reproduce this failure... (in-tree and out-tree
>  > build).   
> 
> Notice that both failures are with python 2.7, so possibly it is related
> to that?
> 
I found why I'm not able to reproduce: my docker has no setuptools-scm.
Since https://github.com/dddomodossola/remi/pull/404 setuptools-scm is required
to obtain version from git instead of setup.py variable.
With an archive, no .git directory...
> 
>  >> Any specific reason to not get the package from pypi?
>  >>   
>  > No. I will try it if it's fix this error. But this requires to downgrade
>  > python-remi to 2020.8.6  
> 
> Ok. Mayve contact upstream and ask why pypi isn't updated?
> 
2020.10.30 is a bit recent...
I prepare a fix to downgrade python-remi and to move to pypi.
> -- 
> Bye, Peter Korsgaard

Gwen
