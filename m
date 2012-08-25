From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 19:15:38 +0200
Subject: [Buildroot] [PATCH v4 2/2] nodejs: new package
In-Reply-To: <1344827150-25067-3-git-send-email-net147@gmail.com>
References: <1344827150-25067-1-git-send-email-net147@gmail.com>
 <1344827150-25067-3-git-send-email-net147@gmail.com>
Message-ID: <20120825191538.4f545a35@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonathan,

Le Mon, 13 Aug 2012 13:05:50 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  package/Config.in        |  1 +
>  package/nodejs/Config.in | 20 +++++++++++++++
>  package/nodejs/nodejs.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 package/nodejs/Config.in
>  create mode 100644 package/nodejs/nodejs.mk

nodejs includes V8 for executing the JavaScript code, and V8 generates
machine code to provide good performances when executing JavaScript.
This means that V8 is architecture dependent: apparently, in deps/v8/,
only IA32, x86-64, ARM and MIPS are supported.

However, I don't understand how you select the target architecture or
how it is detected. Some comments in the configure script also seem to
imply that on ARM, only ARMv7 is supported by V8.

Have you checked this, or did you try only a x86->x86 build?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
