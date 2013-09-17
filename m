From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:50:24 +0200
Subject: [Buildroot] [PATCH v2] Add support for eglibc-2.17 multiarch
 layout, from Linaro 2013.07+
In-Reply-To: <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
References: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
 <5237F574.9070700@mind.be>
 <1379411093-37240-1-git-send-email-greg.beresford@zbdsolutions.com>
 <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
Message-ID: <20130917205024.0bd97ef9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue, 17 Sep 2013 13:01:14 -0400, Frank Hunleth wrote:

> Thanks for posting the patch. I've been trying it out, but I think
> that I'm running into a bigger problem of how the shared library
> search path works now. I.e. /usr/lib is not searched by default
> anymore even though that's where many buildroot packages install their
> libraries.
> 
> Here's the new search path:
> 
> /lib/arm-linux-gnueabihf/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/
> /usr/lib/arm-linux-gnueabihf/tls/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/neon/
> /usr/lib/arm-linux-gnueabihf/tls/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/
> /usr/lib/arm-linux-gnueabihf/v7l/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/v7l/neon/
> /usr/lib/arm-linux-gnueabihf/v7l/vfp/
> /usr/lib/arm-linux-gnueabihf/v7l/
> /usr/lib/arm-linux-gnueabihf/neon/vfp/
> 
> I can think of a few hacks to get around this, but is there a right
> way that I should be configuring buildroot to deal with this
> multiarch/multilib toolchain feature?

I haven't had the time yet to try the patch and experiment with this
problem specifically, but I believe one of the possible solutions is to
continue to install the libraries in /lib and /usr/lib, and
creates /lib/arm-linux-gnueabihf/ -> /lib
and /usr/lib/arm-linux-gnueabihf/ -> /usr/lib symbolic links.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
