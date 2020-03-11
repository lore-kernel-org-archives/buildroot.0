From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 18:35:42 +0100
Subject: [Buildroot] [PATCH/next v2 3/4] package/openrc: add libselinux
 support
In-Reply-To: <20200311172623.GN5357@scaer>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-4-unixmania@gmail.com>
 <20200311172623.GN5357@scaer>
Message-ID: <20200311173542.GO5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CArlos, Adam, All,

On 2020-03-11 18:26 +0100, Yann E. MORIN spake thusly:
> On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> > If the libselinux package is selected, add the package to the dependency list
> > and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes
> 
> This SELinux stuff has always been a bit boo-I-dont-want-too-touch for
> me, because it looks overly complex, so just adding the dependency
> without explanations on how openrc uses/fits with SELinux is a bit too
> much for me to handle, so I defer to a SELinux-knowledgeable maintainer
> to look a it...

WHAT I forgot to say above the current commit log, is that it is not
that helpful: it just repeats in english what the patch does, which is
anyway already pretty trivial to see... What a commit log should say, is
why the patch exists, and how the patch works.

Totally hypotetical commit log:

    package/openrc: add libselinux support

    OpenRC has suport for SELinux contexts, but we currently forcibly
    disable it.

    When SELinux is enabled, we know a policy will be installed, so we
    can enable SELinux support in OpenRC.

    Signed-off-by: you
    Signed-off-by: the other

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
