From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 22:47:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <1455301707-8995-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455301707-8995-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160212224750.38fc5c37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 12 Feb 2016 19:28:27 +0100, Bernd Kuhls wrote:

>  -#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
> -+#if defined(__GLIBC__)
> ++#if defined(__GLIBC__) && !defined(__UCLIBC__)
>  +# if __GLIBC_PREREQ(2,11)

What about just:

#if defined(__GLIBC_PREREQ)
#if __GLIBC_PREREQ(2,11)
...
#endif
#endif

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
