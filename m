From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Apr 2018 10:24:51 +0200
Subject: [Buildroot] [PATCH] download/git: fix trasnform-name
In-Reply-To: <5ac9c6165105e_7b0e2af9278483201172d@ultri4.mail>
References: <20180407212614.15639-1-yann.morin.1998@free.fr>
 <5ac9c6165105e_7b0e2af9278483201172d@ultri4.mail>
Message-ID: <20180408082451.GA2327@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-08 04:34 -0300, Ricardo Martincoski spake thusly:
> > download/git: fix trasnform-name
> trasnform -> transform

Meh, that is my signature. A mail from me with no typo is not from me...
;-)

> On Sat, Apr 07, 2018 at 06:26 PM, Yann E. MORIN wrote:
> > When a package contains a relative symlink which first component is '..'
> > (thus pointing one directory higher), for example package 'meh' contains
> > this symlink:
> > 
> >     foo/bar -> ../buz
> > 
> > then it would be stored as 'meh-version./buz' because of the
> > transform-name pattern replacement.
> > 
> > Fix it to only match the leading './'.
> > 
> > Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> With the typo in the subject fixed:
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> [tarball generation fixed for 18xx-ti-utils and linux-firmware, see the test
>  script at http://patchwork.ozlabs.org/patch/896012/ ]
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> 2 packages are fixed by this patch:
> 18xx-ti-utils
> before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769469
> after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769909
> linux-firmware
> before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769511
> after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769952
> 
> All failures with this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146714/failures
> at91bootstrap3 v3.8.6, gummiboot, kvm-unit-tests, kvmtool, mcelog, trace-cmd,
> uemacs, xloader
> also occured for 2018.02:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146633/failures

Sorry, but I'm not following. You mean that 18xx-ti-utils and
linux-firmware are already broken on 2018.02? That is strange, because
we haven't backported those git download changes in the LTS branch...

And indeed, I can't reproduce the issue locally, using tar-1.29. What
version of tar are you using? We've recently black-listed 1.26 and
below, and now require 1.27 <= tar <= 1.29

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
