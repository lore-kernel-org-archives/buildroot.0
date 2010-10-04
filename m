From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Oct 2010 19:02:04 +0200
Subject: [Buildroot] can't resolve symbol 'atexit'
In-Reply-To: <AANLkTinDdVF2W2sgU24qBHfDVztgJ-kEy=FQyeuE7fyH@mail.gmail.com>
References: <AANLkTinDdVF2W2sgU24qBHfDVztgJ-kEy=FQyeuE7fyH@mail.gmail.com>
Message-ID: <20101004190204.0405bdc3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anthony,

On Mon, 4 Oct 2010 14:26:53 +0100
anthony henderson <development@fair-games.com> wrote:

> I've got busy box working well with my software, however I've tried
> to run an exe provided by the board vendor and get the following
> error "can't resolve symbol 'atexit'" is there a way to fix this?
> It's a bit hard to find details on google, I think it's to do with
> different versions of uClibc?  However when I've opened buildroot and
> looked in toolchain -> uClibc I can't see any options to do with
> atexit.  Can anyone point me in the right direction, thanks.

You cannot expect a random binary taken from your vendor to work with a
random version/configuration of uClibc. Basically, you need to get the
source code for this application and recompile it with the toolchain
used to build your embedded system.

The uClibc library does not provide a stable ABI, both accross versions
and configurations.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
