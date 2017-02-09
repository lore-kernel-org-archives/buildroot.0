From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 09:41:41 +0100
Subject: [Buildroot] [PATCH 1/1] automake: fix unescaped left brace
 warning patch.
In-Reply-To: <20170209000710.13754-1-Adamduskett@outlook.com>
References: <20170209000710.13754-1-Adamduskett@outlook.com>
Message-ID: <20170209094141.3fe22e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 19:07:10 -0500, Adam Duskett wrote:

>  .../0002-fix-unescaped-left-brace-warning.patch       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/automake/0002-fix-unescaped-left-brace-warning.patch
> 
> diff --git a/package/automake/0002-fix-unescaped-left-brace-warning.patch b/package/automake/0002-fix-unescaped-left-brace-warning.patch
> new file mode 100644
> index 0000000..a33b1f1
> --- /dev/null
> +++ b/package/automake/0002-fix-unescaped-left-brace-warning.patch
> @@ -0,0 +1,19 @@
> +Automake currently has a unescaped left brace in it's automake.in folder
> +that generates the warning:
> +Unescaped left brace in regex is deprecated, passed through in regex;
> +This patch fixes this warning.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

I am *really* uncomfortable about merging patches touching the automake
code base if those patches are not upstream. So please submit this
upstream, and if it gets accepted, then we can integrate it in
Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
