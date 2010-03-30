From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Tue, 30 Mar 2010 17:26:14 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
Message-ID: <4BB20A06.1090407@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Tue, Mar 30, 2010 at 4:20 PM, Yann E. MORIN 
<yann.morin.1998@anciens.enib.fr> wrote:

    Sasha, All,

    On Tuesday 30 March 2010 142701 Sasha Sirotkin wrote:
     > I compiled an external toolchain with glibc support using
    crosstools-ng
     > as recommended. I managed to compile buildroot without any issues.
     > However, when I try to use the resulting image /sbin/init segfaults.
     > With uclibc there are no such issues. I'm using the latest
    versions of
     > everything on ARM with EABI.

    By default, gcc will emit armv5t instructions. What's your target CPU?
    init segfaulting can be a symptom of using a bad instruction set, so if
    your CPU is armv4, and you did not tell gcc to default to armv4, then
    you will hit this segfault issue.



As I already mentioned, it works fine with uClibc, so it is definitely 
not a CPU instructions issue. At any rate, my CPU is AT91, i.e. armvte 
instruction set.
