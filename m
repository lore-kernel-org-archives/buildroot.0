From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2016 19:12:05 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libgsm: new package
In-Reply-To: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160109181205.GD3444@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-26 20:26 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: - fixed typo
> v2: - added hash
>     - updated 0001-cross.patch to reflect libgsm version
>     - added license info (Thomas)
>     - optimized license infos (Thomas)
> 
>  package/Config.in               |    1 +
>  package/libgsm/0001-cross.patch |  205 +++++++++++++++++++++++++++++++++++++++
>  package/libgsm/Config.in        |    6 ++
>  package/libgsm/libgsm.hash      |    2 +
>  package/libgsm/libgsm.mk        |   41 ++++++++

So I had a look at this, and I am a bit sceptical...

If the intent was to use libgsm with Asterisk, then I think there is a
bit of a confusion in my head (and probably a lot of confusion in
Asterisk) because:

  - Asterisk comes with its own bundled version of libgsm

  - I was not able to tel Asterisk to use the libgsm from the system
    (i.e. it insisted on either using the budled version, or completely
    failed to configure (or build?, I can't recall...))

So, I',m not sure what the intent for this package was, but if was only
to be used by Asterisk, then it is not currently possible to do so...

If it was meant to provide libgsm globaly, wihtout just Asterisk in
mind, then I'll do a proper review of it later.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
