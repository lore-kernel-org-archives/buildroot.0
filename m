From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:33:47 +0200
Subject: [Buildroot] [PATCH 2/6] uclibc: add libgcc_s_resume fix
In-Reply-To: <20150614162409.GC8165@tarshish>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614162409.GC8165@tarshish>
Message-ID: <20150614223347.3f0525b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 14 Jun 2015 19:24:09 +0300, Baruch Siach wrote:

> > +When built with gcc 5.1, uClibc-ng fails to build with the following
> > +issue:
> 
> This patch is for uClibc.

Bad copy/paste, indeed.

> > +   librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
> > +   rt-unwind-resume.c:(.text+0x3c): undefined reference to
> 
> Is that the full error message? I have that strange feeling that something is 
> missing. Same goes for the uClibc-ng patch.

Gah, again a copy/paste issue (though different than the previous one).
The full error message is:

  LD librt-0.9.33.2.so
librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
collect2: error: ld returned 1 exit status
make[2]: *** [lib/librt.so] Error 1

I'll update the commit log accordingly.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
