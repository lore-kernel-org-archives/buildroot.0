From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:58:13 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
In-Reply-To: <87oaozzbsj.fsf@dell.be.48ers.dk>
References: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
 <20150211153232.2dcd2b32@free-electrons.com>
 <87oaozzbsj.fsf@dell.be.48ers.dk>
Message-ID: <20150214085813.341d2811@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 12 Feb 2015 11:03:56 +0100, Peter Korsgaard wrote:

> The problem is that the configure script is confused. While this is
> related to linking, -fuse-ld=gold is an argument to the compiler driver
> to tell it what linker to execute, NOT an option to tell the linker to
> behave differently. So it shouldn't get prefixed with -Wl when passed
> though the compiler driver.
> 
> Qt does the right thing when it uses it, but the configure script does:
> 
>     if linkerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
>        CFG_USE_GOLD_LINKER=yes
> 
> This should be compilerSupportsFlag instead.
> 
> I'll create a patch and apply / send upstream.

Thanks. In the mean time, I've marked the original patch from Peter
Seiderer as Rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
