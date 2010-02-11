From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2010 18:15:35 +0100
Subject: [Buildroot] install mplayer and libman
In-Reply-To: <SNT129-W5540E0733692DCE9EA1609B94E0@phx.gbl>
References: <SNT129-W5540E0733692DCE9EA1609B94E0@phx.gbl>
Message-ID: <20100211181535.249d2646@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Feb 2010 18:09:21 +0100
Tony Mozi <spooflinux@hotmail.fr> wrote:

> So, I tick in 
>      Toolchain  --->
>      [*] Enable large file (files > 2 GB) support?
> 
> And I run 'make'.
> 
> There is no difference!
> 
> Have you got an idea?

Yes. After changing this option, you must rebuild the toolchain and the
system completely.

So, run "make clean" before running make again.

BTW, the compilation error you have seems to mean that mplayer requires
largefile support to work properly. It should probably be fixed in
mplayer's Config.in.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
