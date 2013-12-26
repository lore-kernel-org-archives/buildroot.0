From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 14:38:21 +0100
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <20131226113006.GA24120@localhost>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131225173455.0c413356@skate> <20131225201731.GA7812@localhost>
 <20131225212829.603981b9@skate> <20131225203252.GB7812@localhost>
 <20131226104037.6cb81f36@skate> <20131226113006.GA24120@localhost>
Message-ID: <20131226143821.14a5094c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Thu, 26 Dec 2013 08:30:07 -0300, Ezequiel Garcia wrote:

> > > Right. And in parallel, we can also take care of upstreaming a patch
> > > which uses HAVE_POSIX_MADVISE to handle such case.
> > 
> > The problem is what should we use in replacement of posix_madvise()
> > when it is not available.
> > 
> 
> madvise()?
> 
> If you do:
> 
>   #define posix_madvise madvise

Are they strictly equivalent? Also, the code uses some POSIX_MADV_*
constants, while madvise() provides MADV_* constants.

> Problem is, I'm not sure there's a clean way to detect posix_madvise /
> madvise presence; it must be done by hand in the configure script.

AC_CHECK_FUNCS([posix_madvise]) should do the trick.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
