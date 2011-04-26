From: David Anders <dave123_aml@yahoo.com>
Date: Tue, 26 Apr 2011 07:40:47 -0700 (PDT)
Subject: [Buildroot] devmem2
In-Reply-To: <87sjt53xjn.fsf@macbook.be.48ers.dk>
Message-ID: <969023.92986.qm@web161401.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

yes we've had all this argument before and devmem in buildroot has stayed the same and everyone has continued using devmem2. basically it still boils down to the request that devmem2 not be removed from buildroot.

Dave




--- On Tue, 4/26/11, Peter Korsgaard <jacmet@uclibc.org> wrote:

> From: Peter Korsgaard <jacmet@uclibc.org>
> Subject: Re: devmem2
> To: "David Anders" <dave123_aml@yahoo.com>
> Cc: "Peter Korsgaard" <jacmet@uclibc.org>, "Xianghua Xiao" <xiaoxianghua@gmail.com>, "Bj?rn Forsman" <bjorn.forsman@gmail.com>, buildroot at busybox.net
> Date: Tuesday, April 26, 2011, 9:19 AM
> >>>>> "David" == David
> Anders <dave123_aml@yahoo.com>
> writes:
> 
>  David> Peter,
> 
>  David> the primary commit that makes the devmem applet
> unusable for
>  David> most debugging is this one:
> 
>  David> commit 043246560fcd5bb7bfb2caa2db270c3c0e8e06f4
>  David> Author: Denis Vlasenko <vda.linux@googlemail.com>
>  David> Date:???Sun Oct 26 17:26:55 2008
> +0000
> 
>  David>? ???devmem: make it more
> script-friendly; don't do any reads
>  David>? ? ? and output nothing if
> writing was requested. -100 bytes
> 
> 
>  David> for board bring up and general development, for
> which devmem is
>  David> primarily used, having devmem report the value
> before the write
>  David> is important, as well as reporting the value
> after the write.
> 
> Ok, but adding a little shell wrapper to do that would be
> simple to do.
> 
> Forcing 2 extra read actions isn't that nice, both for the
> script-friendlyness, but also for registers where reads
> have side
> effects.
> 
> -- 
> Bye, Peter Korsgaard
> 
