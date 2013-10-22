From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Oct 2013 08:38:22 +0200
Subject: [Buildroot] [PATCH] kobs-ng: check Linux version for mtd enum
	redefine
In-Reply-To: <CAOxVtSRpiU5wOFJdzSMDtZvcCro583eugwroCu0BdYNaeYhu7A@mail.gmail.com>
References: <CAOxVtSRpiU5wOFJdzSMDtZvcCro583eugwroCu0BdYNaeYhu7A@mail.gmail.com>
Message-ID: <CAAXf6LXhJCTSZ+CkFEhWuCpYBU1AmDNava6duSuLQ1mdpbVnCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Mon, Oct 21, 2013 at 6:33 PM, Sergey Alyoshin <alyoshin.s@gmail.com> wrote:
> With current  package/kobs-ng/kobs-ng-fix-mtd-defines.patch
> kobs-ng failed to build with 2.6.26, because enum tested with #ifndef
>
> mtd.c: In function 'mtd_open':
> mtd.c:696:42: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in
> this function)
> mtd.c:696:42: note: each undeclared identifier is reported only once
> for each function it appears in
> mtd.c: In function 'mtd_set_ecc_mode':
> mtd.c:896:43: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in
> this function)
> mtd.c:914:43: error: 'MTD_FILE_MODE_RAW' undeclared (first use in this function)
>
> Updated package/kobs-ng/kobs-ng-fix-mtd-defines_v2.patch is attached.
> Test built with Linux 2.6.36

Could you send a proper patch against buildroot, directly in the mail
(not attached)? Have a look at
http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot
for more info on this.

Take into account that patches in package/foo/ should be named
'foo-0001-description.patch'.

Don't forget a description and Signed-off-by line in both the patch
against buildroot as the containing patch against kobs-ng.

Thanks for your contribution,

Thomas
