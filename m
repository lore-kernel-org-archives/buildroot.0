From: Mike Zick <minimod@morethan.org>
Date: Thu, 10 Jul 2014 03:20:21 -0500
Subject: [Buildroot] [rpi-userland] Trying to dlopen libGLESv2,
 can't resolve libEGL function symbols
In-Reply-To: <CABqEe+mvMi6aLkCbc1_0XZMN-RX7c9MNMYQOoPU5yc7KY6_iAg@mail.gmail.com>
References: <CABqEe+mvMi6aLkCbc1_0XZMN-RX7c9MNMYQOoPU5yc7KY6_iAg@mail.gmail.com>
Message-ID: <20140710032021.57b3bb8a@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Jul 2014 02:38:44 -0400
"IoriBranford ." <ioribranford@gmail.com> wrote:

> My expertise runs thin here, so, I don't see where else the issue
> could be. Hopefully someone can help?
> Thanks.
>

Find out where the loader is looking for the libraries:
 $ LD_DEBUG=libs witchfire

Compare that list of paths with where the libraries actually are at,
it my just be a stale ldconfig cache file.

Mike
