From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Jun 2017 22:13:28 -0300
Subject: [Buildroot] [PATCH 4/4 v2] tools: move check-package out of
 support/scripts/
References: <eb8cb9682d84d1f110044a1448f18ef95ad79e84.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <594725387e9d9_57503f9d8c005fc8489c9@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 18, 2017 at 11:01 AM, Yann E. MORIN wrote:

[snip]
>  rename {support/scripts => tools}/checkpackagelib/base.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_config.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_hash.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_mk.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/lib_patch.py (100%)
>  rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)

nit: there are 6 more comments using the old path.

-# See support/scripts/checkpackagelib/readme.txt before editing this file.
+# See tools/checkpackagelib/readme.txt before editing this file.

It could be fixed when applying using this sed:
sed -e 's,support/scripts/,tools/,g' -i tools/checkpackagelib/*.py

Another option is to remove the 6 comments if you think they are too repetitive.

Regards,
Ricardo
