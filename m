From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 9 Dec 2011 18:27:34 -0500
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <87ty59l5y1.fsf@macbook.be.48ers.dk>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
Message-ID: <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 9, 2011 at 5:45 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> ?Peter> I'll try the specific .config next.
>
> Which just finished building here without any problems and no
> usr/lib64. Any ideas?

I too am not able to reproduce this build failure.

Starting with a fresh, basic, install of openSUSE 12.1 x86_64 (i.e.
not adding any extra packages above and beyond what the installer
chooses by default) then:

# zypper -n install git-core gcc ncurses-devel gcc-c++ bison flex
texinfo patch gmp-devel mpfr-devel mpc-devel

After that I ran a default build using the latest buildroot from git;
it succeeded. Then I tried using the config as provided in the initial
email (I only had to change it to download the CS toolchain) and it
too succeeded. I do end up with a target/usr/lib64 directory which
appears to contain everything yours does (quick glance) but it doesn't
seem to be a problem.

I then installed the "glibc-devel-32bit" package and tried again. It
too succeeded (after a "make clean"). I installed that package because
the presence of the "/usr/include/gnu/stubs-32.h" file this package
installs was interfering with a prior yocto build I had performed (so
I thought it might also be a culprit here too, but it wasn't).

Best regards,
    Trevor
