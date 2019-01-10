From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Jan 2019 22:13:48 +0100
Subject: [Buildroot] [PATCH] checkpackagelib: fix Python3 execution
In-Reply-To: <20190110205539.10468-1-patrickdepinguin@gmail.com>
References: <20190110205539.10468-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LWeDp8v3SSzLkj+CMdbiPfzRm9ZYCjWsL_4en1imDOhqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue., 10 ene. 2019 a las 21:52, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> The relative imports do not work in Python 3. Adding the leading dot works
> both in Python2 and Python3.
>
> This may cause problems if ever you would try to call the helper .py files
> directly, but this is not currently needed/supported.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/checkpackagelib/lib.py        |  2 +-
>  utils/checkpackagelib/lib_config.py | 10 +++++-----
>  utils/checkpackagelib/lib_hash.py   | 10 +++++-----
>  utils/checkpackagelib/lib_mk.py     | 10 +++++-----
>  utils/checkpackagelib/lib_patch.py  |  4 ++--
>  5 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
> index 91f4ad49b7..06b147a470 100644
> --- a/utils/checkpackagelib/lib.py
> +++ b/utils/checkpackagelib/lib.py
> @@ -1,6 +1,6 @@
>  # See utils/checkpackagelib/readme.txt before editing this file.
>
> -from base import _CheckFunction
> +from .base import _CheckFunction

It's also possible to replace all these imports with:

from checkpackagelib.base import ...

I.e. use an absolute import. If you like it better...


/Thomas
