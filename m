From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 14:13:43 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump  version to 1.6
In-Reply-To: <7e-5f9abe80-1-60a72780@84134619>
References: <20201029135017.652486f7@windsurf.home>
 <7e-5f9abe80-1-60a72780@84134619>
Message-ID: <20201029141343.18ad9770@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Oct 2020 14:06:45 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> At least that's how I interpret this comment in the NEWS for 1.5 [0]:
> 
> - added support for bias flags which are a new functionality first available in
>   linux v5.5; subsequently the library now requires v5.5 kernel headers to
>   build;
> 
> But maybe Bartosz can clarify on this, as he basically is the "upstream" :)

Wow, actually things are even worse. The latest upstream commit goes
like this:

    treewide: make linux v5.10 a hard requirement for libgpiod
    
    The library now uses v2 of the GPIO uAPI. The new user interface is
    scheduled for release as part of linux v5.10. Linux v5.10-rc1 is now
    tagged so make v5.10 headers a requirement for the build and update
    all tests to check for the correct version.
    
    Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

So a userspace package requires a not-even released Linux kernel
version, without backward compatibility for older kernel versions. This
seems like a really really odd decision from upstream :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
