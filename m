From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jan 2013 11:29:43 -0300
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
Message-ID: <50E6E757.10809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2013 11:17 AM, Samuel Martin wrote:

> We quickly talked about this during the last Buildroot Dev. Days.
> 
> IIRC, Thomas and Peter were not very fond of this kind of solution.
> (guys, feel free to correct me if I speak with my ass ;)).
> 
> btw, afaics:
> - *-config provided by the imagemagick package wrap some calls to pkg-config;
> - many packages in BR install handwritten scripts like this, as well
> as some *.pc files.
> So what about just use pkgconf since it's properly handled in BR?
> (I agree it may mean patching many packages that only search for
> *-config scripts)
> - in this patch serie, only libgcrypt does not provide a *.pc file :-(
> 
> Regards,

I agree *-config files aren't nice, but they are still here and quite used.
When the scenario is a "not very standard" *-config file that can't be
easily fixed, one could just avoid the autopatcher and do it the old
fashion way.
It's a good goal to get rid of them, but realistically it won't happen
anytime soon - you'll need to get *.pc files for *-config packages that
don't provide them, and you'll also need to patch a lot to get them to
use said pc files (with the added dep to host-pkgconf which is now small
given my migration away from pkg-config hehe).
Long story short, they're still here, so why not do it nicely until we
get rid of them all?
Just for fun, try to autoreconfigure PHP and see what happens. It's a
heavy user of *-config scripts :)
Regards.
