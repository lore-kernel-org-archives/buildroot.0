From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 17:50:14 +0100
Subject: [Buildroot] [PATCH v5 00/13] use host-systemd to enable units
In-Reply-To: <CAFvCimVGu5Bv3GFUmaQtkBjUHbWFoSbagCLsp3_Mb+yztJLH5g@mail.gmail.com>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
 <20191218174847.GD4247@scaer>
 <CAFvCimVGu5Bv3GFUmaQtkBjUHbWFoSbagCLsp3_Mb+yztJLH5g@mail.gmail.com>
Message-ID: <20191219165014.GE26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-12-19 14:50 +0100, J?r?my ROSEN spake thusly:
> Ok, my bad for having you work on it that much, I have still lot to learn about all?
> those conventions?

Well, what I did was mostly cosmetics, so that did not warrant a respin.

> One specific point I don't agree with below, but it's just a detail at this point
> 
>   35c11a027c package/systemd: add host variant
>   ? ? ? - reformatting in commit log
>   ? ? ? - declare host variant after target variant
>   ? ? ? - simplify comments
>   ? ? ? - slight reordering of variable (HOST_SYSTEMD_NINJA_ENV moved)
>   ? ? ? - reformatting for mutli-line variable (HOST_SYSTEMD_HOST_TOOLS)
>   ? ? ? - don't split HOST_SYSTEMD_CONF_OPTS in two sets
> 
> well, it's applied now, but I did that in a very specific way
> * Variables I specifically set were in the first set
> * Disabling all optional features was in the second set
> The point was to help maintainability.

We almost never do that in Buildroot (I was about to say 'never', but we
may or may not have a few cases), but overall, it is not needed. We only
do additive settings for those parts that are conditional, which is not
the case here.

Still, the two sets are properly separated, with all the =yes first, and
the =false last.

> Apart from that, nothing suspicious on my side

Thanks! :-)

Regards,
Yann E. MORIN.

> thx a lot
> --
> 
> +---------------------------------------------------------------------------------------------------------------------+
> |                               | J?r?my ROSEN                                                              |
> | [1]3D"SMILE"[2] ?        | Architecte technique                                                                |
> |                               | [3]3D"email" ? [4]jeremy.rosen at smile.fr?                                  |
> | 20 rue des Jardins            | [5]3D"phone" ? +33 6 88 25 87 42?                                         |
> | 92600 Asni?res-sur-Seine | [6]3D"url" ? [7]http://www.smile.eu                                            |
> |                               | [8]3D"Twitter" ? [9]3D"Facebook" ? [10]3D"LinkedIn" ? [11]3D"Github" |
> +---------------------------------------------------------------------------------------------------------------------+
> 
> [12]3D"D?couvrez
> 
> Links:
> 1. http://www.smile.eu/
> 2. http://www.smile.eu/
> 3. Image: http://ftp.smile.fr/client/Communication/signature/img/mail.png
> 4. mailto:jeremy.rosen at smile.fr
> 5. Image: http://ftp.smile.fr/client/Communication/signature/img/phone.png
> 6. Image: http://ftp.smile.fr/client/Communication/signature/img/web.png
> 7. http://www.smile.eu/
> 8. https://twitter.com/GroupeSmile
> 9. https://www.facebook.com/smileopensource
> 10. https://www.linkedin.com/company/smile
> 11. https://github.com/Smile-SA
> 12. https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
