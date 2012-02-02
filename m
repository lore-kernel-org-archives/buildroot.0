From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 1 Feb 2012 22:40:42 -0500
Subject: [Buildroot] [PATCH v2] mdev.conf: Add ttyO devices
In-Reply-To: <87mx92ci3e.fsf@macbook.be.48ers.dk>
References: <1325564832-3149-1-git-send-email-fhunleth@troodon-software.com>
 <87mx92ci3e.fsf@macbook.be.48ers.dk>
Message-ID: <CA+-urNTAU868R8gnWobgWkTKOpK9J=9Lje5jYCHQxjygMXPz1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 1, 2012 at 5:19 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>
> ?Frank> This is needed to support the serial ports on OMAP/AM335x devices
> ?Frank> when using mdev.
>
> ?Frank> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ?Frank> ---
> ?Frank> ?package/busybox/mdev.conf | ? ?1 +
> ?Frank> ?1 files changed, 1 insertions(+), 0 deletions(-)
>
> ?Frank> diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
> ?Frank> index 247c0ed..7fb71bc 100644
> ?Frank> --- a/package/busybox/mdev.conf
> ?Frank> +++ b/package/busybox/mdev.conf
> ?Frank> @@ -20,6 +20,7 @@ tty ? ? ? ? ? root:tty 666
> ?Frank> ?tty[0-9]* ? ? ?root:tty 660
> ?Frank> ?vcsa*[0-9]* ? ?root:tty 660
> ?Frank> ?ttyS[0-9]* ? ? root:root 660
> ?Frank> +ttyO[0-9]* ? ? root:root 660
>
> What does this exactly do? Isn't root:root / perm 660 default anyway?

I just removed the line from my configuration, and everything works
fine. At the moment, I do not understand how I had seen the console
not work without the line last month. However, it is clearly not
needed. Please disregard the patch. Sorry about the noise.

Frank

>
> --
> Bye, Peter Korsgaard
