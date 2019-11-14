From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 21:56:02 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/python-huepy: fix build
 with python3.8
In-Reply-To: <20191114201407.6370-1-aussedat.louis@gmail.com>
References: <20191114201407.6370-1-aussedat.louis@gmail.com>
Message-ID: <20191114205602.GE26360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis, All,

On 2019-11-14 21:14 +0100, Louis Aussedat spake thusly:
> Fixes:
>   - http://autobuild.buildroot.net/results/240c397a6479b98f30b63b5135bfb2e45281de7d
> 
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-huepy/0001-fix-import-with-python3.patch | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 package/python-huepy/0001-fix-import-with-python3.patch
> 
> diff --git a/package/python-huepy/0001-fix-import-with-python3.patch b/package/python-huepy/0001-fix-import-with-python3.patch
> new file mode 100644
> index 0000000000..e04eacb228
> --- /dev/null
> +++ b/package/python-huepy/0001-fix-import-with-python3.patch
> @@ -0,0 +1,8 @@
> +--- a/huepy/__init__.py
> ++++ b/huepy/__init__.py
> +@@ -1,4 +1,4 @@
> +-from hue import COMMANDS
> ++from .hue import COMMANDS
> + 
> + __all__ = list(COMMANDS.keys())
> + __version__ = '1.0.1'
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
