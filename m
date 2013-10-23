From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 20:29:59 +0200
Subject: [Buildroot] [PATCH 2/2] kobs-ng: test kernel version for
	redefines
In-Reply-To: <1382532900-18456-1-git-send-email-alyoshin.s@gmail.com>
References: <1382518620-26320-2-git-send-email-alyoshin.s@gmail.com>
 <1382532900-18456-1-git-send-email-alyoshin.s@gmail.com>
Message-ID: <CAAXf6LUFSvTsX0HOsjmTcz-n-36qj0h-rT6BjK2MHee=kpsByg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 23, 2013 at 2:55 PM, Sergey Alyoshin <alyoshin.s@gmail.com> wrote:
> kobs-ng failed to build with 2.6.36, because enum tested with #ifndef
>
> mtd.c: In function 'mtd_open':
> mtd.c:696:42: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
> function)
> mtd.c:696:42: note: each undeclared identifier is reported only once for each
> function it appears in
> mtd.c: In function 'mtd_set_ecc_mode':
> mtd.c:896:43: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
> function)
> mtd.c:914:43: error: 'MTD_FILE_MODE_RAW' undeclared (first use in this
> function)
>
> Do kernel version test before enum redefines.
>
> Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
> ---
>  package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Normally, when you send a new version of a patch, one would mark it as
'v2' in the subject, and provide a quick summary of the changes with
the previous version (below the '---' line).

But as for the actual patch:

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile-tested with 2.6.36, 3.1.11 and 3.2 kernel headers)
