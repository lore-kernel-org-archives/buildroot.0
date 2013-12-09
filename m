From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 17:44:58 +0100
Subject: [Buildroot] [PATCH 00/38] Python infrastructure and package
	conversion
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWJroTt-Xu=AzKVidVZbyKUjVk-+a=+cGqCO890YQ4pvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 8, 2013 at 11:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This set of patches add a new infrastructure for Python packages,
> which support both distutils and setuptools based packages. It also
> converts all the current Python packages to this infrastructure, and
> adds a bunch of new Python packages that have been sitting in
> patchwork for a while.
>
> Thanks to this infrastructure, the vast majority of Python packages no
> longer need to write any <something>_CMDS. All they need to do is to
> explicitly say, through the <pkg>_SETUP_TYPE variable, whether the
> setup.py of the package is distutils-based or setuptools-based.
>
> When it's setuptools-based, then the infrastructure will automatically
> build host-setuptools an host-distutilscross.
>
> A short overview of the patches:
>
>  * Patches 1 and 2 make relatively unrelated fixes to the dialog
>    package, which were found while doing the Python conversion of
>    python-dialog.
>
>  * Patch 3 adds the Python infrastructure itself.
>
>  * Patches 4 to 25 convert all the existing Python packages to use the
>    new infrastructure.
>
>  * Patches 26 to 38 add new Python packages that have been sitting on
>    patchwork for some time, including some contributed by Ryan
>    Barnett, who did rebase them on the Python infrastructure.
>
> This complete set of patches is available on a Git branch at:
>
>   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python-pkg
>
> I have already started working on making the infrastructure work with
> Python 3 as well, and I have a bunch of patches that do this. However,
> they are not completely ready yet, and since Python modules anyway
> can't be used today with Python 3, merging this Python 2 only package
> infrastructure is not a regression.
>
> Of course, testing is more than welcome.
>

I must say I'm very happy with this Python infrastructure for
buildroot. It removes quite some code and creates better consistency.
It's also great that you incorporated the pending Python patches from patchwork!
I did a basic review of your patches and provided some minor comments,
but nothing big.

What kind of testing did you already do? Did you compile-test all
touched packages?

Thankas,
Thomas
