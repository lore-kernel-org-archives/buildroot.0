From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 13:39:34 +0100
Subject: [Buildroot] [PATCH] alsa-lib: FLAT: Disable alsa lib when FLAT
 bianry is selected.
In-Reply-To: <CAJxxZ0NkAviss7TVczJhJogiLFU3Ts4KS8sqstEfK1H=Fkv4rQ@mail.gmail.com>
References: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
 <20131111112128.60a4a348@skate>
 <CAJxxZ0NkAviss7TVczJhJogiLFU3Ts4KS8sqstEfK1H=Fkv4rQ@mail.gmail.com>
Message-ID: <20131111133934.50d39c5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Mon, 11 Nov 2013 18:54:27 +0800, Sonic Zhang wrote:

> > The problem is really that we need shared library support, no that
> > specifically the FLAT binary format is causing problems. If another
> > binary format doesn't support shared libraries, then we would have to
> > exclude it as well.
> 
> Some alsa-lib code include head file dlfcn.h, which doesn't exist in
> the FLAT GNU toolchain, while it does in the ELF/FDPIC GNU toolchain.
> So, alsa-lib has no error with BR2_PREFER_STATIC_LIB is selected in
> the 2nd case.

Yes, but it's wrong: if you use <dlfcn.h>, then clearly, you're not a
fully static lib system.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
