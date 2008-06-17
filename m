From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 17 Jun 2008 17:53:38 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20080617133035.AC6F63C786@busybox.net>
References: <20080617133035.AC6F63C786@busybox.net>
Message-ID: <20080617155338.GI27792@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2008 at 06:30:35AM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2008-06-17 06:30:35 -0700 (Tue, 17 Jun 2008)
>New Revision: 22401
>
>Log:
>toolchain/uclibc: strip libpthread

Those are options in uclibc-menuconfig.

By unconditionally stripping it (and not even using the flags!) you
foobar'ed somebody's setup who wanted to retain just uClibc/lib/lib*so's
debug symbols.
