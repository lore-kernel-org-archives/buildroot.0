From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:43:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: force the use of python2
In-Reply-To: <1457044168-31810-1-git-send-email-martin@barkynet.com>
References: <1457044168-31810-1-git-send-email-martin@barkynet.com>
Message-ID: <20160306154341.30fc8162@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Thu,  3 Mar 2016 22:29:27 +0000, Martin Bark wrote:
> Remove the patches to use a python variable and instead force python2
> into the PATH.
> 
> Upstream the python variable was recently removed
> (see https://github.com/nodejs/node/commit/c3e50ca) and due to dependencies
> directly calling python there is a reluctance to change this.  Instead it
> is recommended to add python2 into PATH as the nodejs build machines do
> (see https://github.com/nodejs/node/issues/418 and
> https://github.com/nodejs/node/issues/2735).
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  ...ch => 0003-fix-musl-USE-MISC-build-issue.patch} |   0
>  .../nodejs/0.10.42/0003-use-python-variable.patch  |  43 --------
>  .../0004-Fix-support-for-uClibc-ng.patch}          |   0
>  ...d.patch => 0003-Fix-va_list-not-declared.patch} |   0
>  ...hon-variable-instead-of-hardcoding-Python.patch | 112 ---------------------
>  .../0004-Fix-support-for-uClibc-ng.patch}          |   0
>  package/nodejs/nodejs.mk                           |  18 +++-
>  7 files changed, 16 insertions(+), 157 deletions(-)
>  rename package/nodejs/0.10.42/{0004-fix-musl-USE-MISC-build-issue.patch => 0003-fix-musl-USE-MISC-build-issue.patch} (100%)
>  delete mode 100644 package/nodejs/0.10.42/0003-use-python-variable.patch
>  rename package/nodejs/{5.6.0/0005-Fix-support-for-uClibc-ng.patch => 0.10.42/0004-Fix-support-for-uClibc-ng.patch} (100%)
>  rename package/nodejs/5.6.0/{0004-Fix-va_list-not-declared.patch => 0003-Fix-va_list-not-declared.patch} (100%)
>  delete mode 100644 package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
>  rename package/nodejs/{0.10.42/0005-Fix-support-for-uClibc-ng.patch => 5.6.0/0004-Fix-support-for-uClibc-ng.patch} (100%)

Both patches applied. It is a little bit sad that upstream removed the
variable to define the path to the Python interpreter. But oh well,
this allows us to remove quite a few patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
