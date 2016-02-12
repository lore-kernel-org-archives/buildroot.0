From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 22:49:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <1455304949-16808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455304949-16808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160212224934.32cd9661@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 12 Feb 2016 20:22:29 +0100, Bernd Kuhls wrote:

>  -#if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
> -+#if defined(__GLIBC__)
> -+# if __GLIBC_PREREQ(2,11)
> ++#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)

If you put both on the same line, aren't we back to the musl build
issue, where testing if a macro is defined *and* using it in the same
condition doesn't work ?

Did you verify this solution with a build against a musl toolchain ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
