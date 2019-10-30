From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Oct 2019 11:26:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: fix build with
 python 3.8
In-Reply-To: <20191030093605.4210-1-fontaine.fabrice@gmail.com>
References: <20191030093605.4210-1-fontaine.fabrice@gmail.com>
Message-ID: <20191030112645.1bcc5b66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 10:36:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/fa515627ae888d08fc10074e8d9f6e9dbede91a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...py-import-escape-from-html-instead-o.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
> 
> diff --git a/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch b/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
> new file mode 100644
> index 0000000000..4c9b43a146
> --- /dev/null
> +++ b/package/python-web2py/0001-gluon-languages.py-import-escape-from-html-instead-o.patch
> @@ -0,0 +1,46 @@
> +From 4a5204f7847e6b83d7d2f4fe54244e2087117d9e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 30 Oct 2019 10:08:35 +0100
> +Subject: [PATCH] gluon/languages.py: import escape from html instead of cgi
> +
> +import escape from html instead of cgi to fix the following build
> +failure with python 3.8:

Does this work fine with Python 2.x ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
