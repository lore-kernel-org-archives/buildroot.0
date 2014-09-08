From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 8 Sep 2014 20:46:05 +0000
Subject: [Buildroot] Question about openssh.mk
In-Reply-To: <20140908214016.51926cb9@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD7B2@ex-mb3.corp.adtran.com>
 <20140908214016.51926cb9@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AD897@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Yes, that's what we want to do: openssh uses $(LD) and
> $(TARGET_LDFLAGS) as if they were the compiler. In which case have you
> identified this to not work?

Okay, then it should probably be LDFAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)".

> No, it's not "legacy crap". TARGET_CONFIGURE_OPTS does LD=$(TARGET_LD)

Sorry!  I meant no offense. :)

> and LDFLAGS=$(TARGET_LDFLAGS), assuming that the packages are really
> using $(LD) as the linker and $(LDFLAGS) as the flags for the linker.
> This is not what OpenSSH is doing, which is the reason why we override
> those variables specifically for OpenSSH.
> 
> > Still working on it, may have an update to this later on today.
> 
> It would be easier if you let us know about the real problem :-)

For some reason, it breaks on every third or so build.  I dunno why.
Working on it.  I don't even have enough info to tell you where it is
breaking (at the moment).  I'll keep you advised.

It probably has something to do with the fact that I use
BR2_PREFER_STATIC_LIB=y
Though, I have built with this several times today and I only got the
error once out of three times.  It is complaining that it cannot build
a shared object with openssl.a as it is statically linked.

Like I said, I don't really have enough info to tell you what is broken.

Andy

> 
> Thanks for your report!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
