From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Apr 2016 22:57:14 +0200
Subject: [Buildroot] [PATCH v2 3/4] python/python3: globalize *.pyc
	files compilation
In-Reply-To: <1462020471-29986-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020471-29986-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLJz9FjgJYg2c2a1dsMoP-52kdMvZ38LTR9=Vy563maxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sat, Apr 30, 2016 at 2:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Currently, each python package (be it the python interpreter package
> itself or external python modules) is responsible for compiling its
> .py into .pyc files. Unfortunately, this is not ideal as some packages
> only install .py files without compiling them into .pyc files. In this
> case, if the Buildroot configuration specifies to keep only the .pyc
> files, the .py files are removed and lost.
>
> To address this, this commit changes the logic by making the
> compilation of .pyc files a global operation: the python interpreter
> packages register a target finalize hook that is in charge of
> compiling all installed .py files.
>
> The *.pyc generation on a per package basis is disabled in the
> python-package infrastructure by passing the "--no-compile" option to
> setup.py.
>
> The *.pyc generation for the Python interpreter internal modules is
> disabled through --disable-pyc-build configure option.
>
> A small helper script is used to perform the compilation, the purpose
> of this script is to abort the compilation process if one of the .py
> file cannot be compiled. It has been provided by Samuel Martin and
> integrated into this commit.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> [Thomas:
>  - rework for python 3.5
>  - integrate Samuel proposal that allows to detect compilation
>    failures.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
