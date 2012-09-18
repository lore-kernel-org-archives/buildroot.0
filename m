From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Sep 2012 22:45:03 +0200
Subject: [Buildroot] [PATCH 08/11] package/pulseaudio: fix
	build-dependency on gettext
In-Reply-To: <20120918195840.7d2af5af@skate>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-9-git-send-email-yann.morin.1998@free.fr>
 <20120918195840.7d2af5af@skate>
Message-ID: <201209182245.03550.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 18 September 2012 19:58:40 Thomas Petazzoni wrote:
> On Mon, 17 Sep 2012 00:57:53 +0200, Yann E. MORIN wrote:
> > In its Config.in, pulseaudio declares a dependency on gettext
> > using the documented construct:
> >     select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> > 
> > but in its .mk file, declares a dependency on the package:
> >     PULSEAUDIO_DEPENDENCIES = [...] $(if $(BR2_PACKAGE_GETTEXT),gettext) [...]
> > 
> > instead of the documented:
> >     $(if $(BR2_NEEDS_GETTEXT),gettext)
> > 
> > Fix that.
> 
> Some other packages seem to suffer from the same problem, for example
> diffutils. Why are you fixing pulseaudio separately, and not diffutils,
> which gets fixed in your 11/11 patch:
> 
> -DIFFUTILS_DEPENDENCIES = \
> -       $(if $(BR2_PACKAGE_GETTEXT),gettext)
> +DIFFUTILS_DEPENDENCIES = $(gettext)

Yes, that's an oversight on my part. I quickly fixed it when I encountered
the issue, and forgot to extract it into their own cset.

I'll separate that, wait for some more review a litle longer, and repost
the series later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
