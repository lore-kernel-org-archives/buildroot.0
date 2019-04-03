From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 23:18:30 +0200
Subject: [Buildroot] [PATCH next 1/1] package/libwebsockets: bump
 version to 3.1.0
In-Reply-To: <CAFSsvmo4vvANQse18AxJ8RyK4KZfLWBBZVAafeNUAM_G5EKc=g@mail.gmail.com>
References: <20190223201736.106101-1-aduskett@gmail.com>
 <20190225222058.1d0a106b@windsurf.home>
 <CAFSsvmo4vvANQse18AxJ8RyK4KZfLWBBZVAafeNUAM_G5EKc=g@mail.gmail.com>
Message-ID: <20190403231830.2cc94b07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed, 27 Feb 2019 12:19:17 -0500
Adam Duskett <aduskett@gmail.com> wrote:

> We are removing the check for three reasons that I can see:
> 1) Libwebsockets works just fine with both libev and libevent with
> this check removed.
> 2) Some people may be using libwebsockets with libev and libevent
> installed, and this is the least disruptive patch.
> 3) If I had set a check in the make file that favored either libev or
> libevent over the other, who is to say that one should take
>     precedence over the other?

Where do we stand with this? I remember we discussed it on IRC.

If libwebsockets is only using libev *or* libevent, this should be
reflected in the .mk file, and the libwebsockets should not be patched.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
