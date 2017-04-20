From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:30:57 +0200
Subject: [Buildroot] [PATCH] check-package: move parts to subdirectory
In-Reply-To: <20170419180621.16765-1-ricardo.martincoski@gmail.com>
References: <20170419180621.16765-1-ricardo.martincoski@gmail.com>
Message-ID: <20170420223057.0cdcdede@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 15:06:21 -0300, Ricardo Martincoski wrote:
> Currently check-package script use many files in the same directory.
> 
> Keep the main script at support/scripts/check-package and move the rest
> to a subdirectory.
> 
> The modules were previously prefixed to make easy to identify which
> script they belong to.
> It's not needed when using a subdirectory, so remove the prefix.
> 
> Note: if this commit is checked out and the script is run, and later on
> a previous version is checked out, the file
> support/scripts/checkpackagelib/__init__.pyc
> needs to be manually removed to prevent Python interpreter to look for
> checkpackagelib package when only the checkpackagelib module is
> available.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> The note above can be removed when applying if you think it is not
> needed.
> ---
>  support/scripts/check-package                          | 18 +++++++++---------
>  support/scripts/checkpackagelib/__init__.py            |  0
>  .../{checkpackagebase.py => checkpackagelib/base.py}   |  2 +-
>  .../{checkpackagelib.py => checkpackagelib/lib.py}     |  4 ++--
>  .../lib_config.py}                                     | 12 ++++++------
>  .../lib_hash.py}                                       | 12 ++++++------
>  .../lib_mk.py}                                         | 12 ++++++------
>  .../lib_patch.py}                                      |  6 +++---
>  .../{check-package.txt => checkpackagelib/readme.txt}  |  7 +++----
>  9 files changed, 36 insertions(+), 37 deletions(-)
>  create mode 100644 support/scripts/checkpackagelib/__init__.py
>  rename support/scripts/{checkpackagebase.py => checkpackagelib/base.py} (78%)
>  rename support/scripts/{checkpackagelib.py => checkpackagelib/lib.py} (93%)
>  rename support/scripts/{checkpackagelib_config.py => checkpackagelib/lib_config.py} (93%)
>  rename support/scripts/{checkpackagelib_hash.py => checkpackagelib/lib_hash.py} (88%)
>  rename support/scripts/{checkpackagelib_mk.py => checkpackagelib/lib_mk.py} (96%)
>  rename support/scripts/{checkpackagelib_patch.py => checkpackagelib/lib_patch.py} (92%)
>  rename support/scripts/{check-package.txt => checkpackagelib/readme.txt} (95%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
