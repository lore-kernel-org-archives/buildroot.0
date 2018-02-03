From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 20:32:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/wf111: do a direct download
In-Reply-To: <87lgg93mvi.fsf@dell.be.48ers.dk>
References: <cover.1517677545.git.yann.morin.1998@free.fr>
 <ef05e42aa7a51d33c666507728602993d04344bb.1517677545.git.yann.morin.1998@free.fr>
 <87lgg93mvi.fsf@dell.be.48ers.dk>
Message-ID: <20180203193207.GQ2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-02-03 20:16 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > We can now do a download without prior registration, so we can drop the
>  > requirement for a local, pre-downloaded tarball, now.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Julien CORJON <corjon.j@ecagroup.com>
>  > Cc: Antoine T?nart <antoine.tenart@free-electrons.com>
>  > ---
>  >  package/wf111/Config.in | 11 -----------
>  >  package/wf111/wf111.mk  |  7 +------
>  >  2 files changed, 1 insertion(+), 17 deletions(-)
> 
>  > diff --git a/package/wf111/Config.in b/package/wf111/Config.in
>  > index 081bd960cb..7b61ea195f 100644
>  > --- a/package/wf111/Config.in
>  > +++ b/package/wf111/Config.in
>  > @@ -19,17 +19,6 @@ config BR2_PACKAGE_WF111
>  
>  >  	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
> 
> When you click on the links on that page you are still served a login
> page, but direct download does indeed work.

Weird. I did not even try to click from the browser; I just copy-pasted
the URL to a wget and it worked...

> The question is if we are allowed to redistribute the tarballs?
> Otherwise we should set WF111_REDISTRIBUTE = NO
> 
> Do you use this package?

No I'm not, I was just fed up with it because of that stupid click-wrap
login page. So, when I noticed Julien updated the homepage, I took the
oportunity to check if the archives still required login. Nope, so I
updated the package.

> Looking at the .mk file we have this comment:
> 
> # Due to the stupidity of the package Makefile, we can't invoke
> # separately the build step and the install step and get a correct
> # behavior. So we do everything in the install step.
> 
> But as far as I can see, you CAN build the Linux driver outside the
> install step (E.G. make all).

I have not even had a cursory look at it, to be honest. I just checked
that the download for the three archives (armv5, armv7 and x86) was
working OK.

Someone that is atcually interested in that package would have to look
at it further...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
