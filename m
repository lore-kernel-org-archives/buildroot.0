From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 14:58:08 +0100
Subject: [Buildroot] [PATCH 3/6] pkg-python: support host-python
 dependency different from the python in the target
In-Reply-To: <20140329142626.08cebfac@skate>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-4-git-send-email-s.martin49@gmail.com>
 <20140329114728.GF3227@free.fr> <20140329142626.08cebfac@skate>
Message-ID: <20140329135808.GJ3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Samuel, All,

On 2014-03-29 14:26 +0100, Thomas Petazzoni spake thusly:
> On Sat, 29 Mar 2014 12:47:28 +0100, Yann E. MORIN wrote:
> 
> > I thionk we should explicitly check for (empty), 'python2' or 'python3',
> > and abort on any other value:
> > 
> >     ifeq ($($(2)_FORCE_HOST_PYTHON),python2)
> >     $(2)_DEPENDENCIES += host-python
> >     else ifeq ($($(2)_FORCE_HOST_PYTHON),python3)
> >     $(2)_DEPENDENCIES += host-python3
> >     else
> >     $$(error Incorrect value '$($(2)_FORCE_HOST_PYTHON)' for $(2)_FORCE_HOST_PYTHON)
> >     endif
> >     endif
> 
> Hum, most packages will *not* define <pkg>_FORCE_HOST_PYTHON I believe.
> Or do you plan to modify all packages that depend on host-python so
> that they all define a value for <pkg>_FORCE_HOST_PYTHON ?
> 
> I believe the idea was that if <pkg>_FORCE_HOST_PYTHON is not defined,
> then we default to whatever Python version has been selected.

That's what is done a few lines above in Samuel's patch:

    +ifeq ($($(2)_FORCE_HOST_PYTHON),)
     $(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
    +else
     [my code proposal here]
    +endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
