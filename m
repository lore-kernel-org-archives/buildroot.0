From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 17:51:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: use official
 tarball
In-Reply-To: <CAJe0E3d3hPaNj=FkDLpQU94c22eNAAgP2QUQggT_A1F8vbS22w@mail.gmail.com>
References: <20210306140202.2251697-1-fontaine.fabrice@gmail.com>
 <CAJe0E3d3hPaNj=FkDLpQU94c22eNAAgP2QUQggT_A1F8vbS22w@mail.gmail.com>
Message-ID: <0bf8ad1b-f2a4-4871-5b3c-79e6b28fc892@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/03/2021 16:28, Guillaume Bres wrote:
> Fabrice,
> 
> indeed pybind is a problem since 2.6.0 and "python setup.py" requires a minimal
> cmake build prior itself.
> 
> I initiated a couple discussions that explained this, a couple of weeks a go,
> but it went unnoticed.
> I proposed a solution for this package, a week ago, that also went unnoticed?
> https://patchwork.ozlabs.org/project/buildroot/patch/20210227100959.28281-1-guillaume.bressaix at gmail.com/
> <https://patchwork.ozlabs.org/project/buildroot/patch/20210227100959.28281-1-guillaume.bressaix@gmail.com/> 

 I went back to that patch and commented on it. It indeed looks like a better
approach than this patch, so I've marked this patch as Rejected.

> In the attached commit message you will find a link to the discussions and my
> explanations.
> This contribution would allow both pybind?+ python-pybind.
> 
> Anyway, I would say I never?get answers to my contributions, and?its?been like
> this for years now.
> Its become very complicated to contribute to buildroot .

 I hear what you're saying. We're really struggling to improve the situation,
but with the huge backlog of patches we have, we're barely keeping afloat with
just the easy security updates and build fixes. There are not many "difficult"
patches that get our time (it took me more than an hour to review the pybind11
patch).


 Regards,
 Arnout

> Pybind was only the 1st part of a patch serie that is now totally forgotten.?
> These days I also have patches pending (for about a month) that would unlock a
> very interesting patch serie?for the community, but stuck and soon forgotten.
> 
> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix at gmail.com <mailto:guillaume.bressaix@gmail.com>>
> 
> 
> Le?sam. 6 mars 2021 ??15:04, Fabrice Fontaine <fontaine.fabrice@gmail.com
> <mailto:fontaine.fabrice@gmail.com>> a ?crit?:
> 
>     Use official tarball provided by pypi to avoid the following build
>     failures:
> 
>     FileNotFoundError: [Errno 2] No such file or directory: 'cmake'
> 
>     or
> 
>     OSError: [Errno 2] No such file or directory: 'pybind11/include'
> 
>     These failures are raised since version 2.60 and
>     https://github.com/pybind/pybind11/commit/fd61f5038eac57a96f0d2dbcf2a4f125bc91f1ca
>     <https://github.com/pybind/pybind11/commit/fd61f5038eac57a96f0d2dbcf2a4f125bc91f1ca>
> 
>     Here is an extract of
>     https://github.com/pybind/pybind11/blob/master/.github/CONTRIBUTING.md
>     <https://github.com/pybind/pybind11/blob/master/.github/CONTRIBUTING.md>:
> 
>     "If you want to use the classic "direct" usage of python setup.py, you
>     will need CMake 3.15+ and either make or ninja preinstalled (possibly
>     via pip install cmake ninja), since directly running Python on setup.py
>     cannot pick up and install pyproject.toml requirements. As long as you
>     have those two things, though, everything works the way you would
>     expect:"
> 
>     Fixes:
>     ?-
>     http://autobuild.buildroot.org/results/ee1ca23f082550a64dc3e169d95cda0f251c6fc1
>     <http://autobuild.buildroot.org/results/ee1ca23f082550a64dc3e169d95cda0f251c6fc1>
>     ?-
>     http://autobuild.buildroot.org/results/07f4db8eaaae0e37edc8aa73635a4fa218bc1fa2
>     <http://autobuild.buildroot.org/results/07f4db8eaaae0e37edc8aa73635a4fa218bc1fa2>
> 
>     Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com
>     <mailto:fontaine.fabrice@gmail.com>>
>     ---
>     ?package/python-pybind/python-pybind.hash | 5 +++--
>     ?package/python-pybind/python-pybind.mk <http://python-pybind.mk>? ?| 3 ++-
>     ?2 files changed, 5 insertions(+), 3 deletions(-)
> 
>     diff --git a/package/python-pybind/python-pybind.hash
>     b/package/python-pybind/python-pybind.hash
>     index a68ac846e2..4f3fc9a4a1 100644
>     --- a/package/python-pybind/python-pybind.hash
>     +++ b/package/python-pybind/python-pybind.hash
>     @@ -1,4 +1,5 @@
>     -# Locally calculated
>     -sha256? cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a?
>     python-pybind-2.6.1.tar.gz
>     +# md5, sha256 from https://pypi.org/pypi/pybind11/json
>     <https://pypi.org/pypi/pybind11/json>
>     +md5? c87d54e1ca1d0982ad54af888c682d93? pybind11-2.6.1.tar.gz
>     +sha256? ab7e60a520fe6ae25eca939191bb2ac416cd58478ce754740238a8bf1af18934?
>     pybind11-2.6.1.tar.gz
>     ?# License files, locally calculated
>     ?sha256? 83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb?
>     LICENSE
>     diff --git a/package/python-pybind/python-pybind.mk
>     <http://python-pybind.mk> b/package/python-pybind/python-pybind.mk
>     <http://python-pybind.mk>
>     index a6a1bdb976..97dd80ffc7 100644
>     --- a/package/python-pybind/python-pybind.mk <http://python-pybind.mk>
>     +++ b/package/python-pybind/python-pybind.mk <http://python-pybind.mk>
>     @@ -5,7 +5,8 @@
>     ?################################################################################
> 
>     ?PYTHON_PYBIND_VERSION = 2.6.1
>     -PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>     +PYTHON_PYBIND_SOURCE = pybind11-$(PYTHON_PYBIND_VERSION).tar.gz
>     +PYTHON_PYBIND_SITE =
>     https://files.pythonhosted.org/packages/d8/47/2eb4be23fa8cc1a08c855c012c1aa4348d06ab1a5527f876515bbf689644
>     <https://files.pythonhosted.org/packages/d8/47/2eb4be23fa8cc1a08c855c012c1aa4348d06ab1a5527f876515bbf689644>
>     ?PYTHON_PYBIND_LICENSE = BSD-3-Clause
>     ?PYTHON_PYBIND_LICENSE_FILES = LICENSE
>     ?PYTHON_PYBIND_SETUP_TYPE = setuptools
>     -- 
>     2.30.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
