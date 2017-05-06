From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 May 2017 10:17:51 +0200
Subject: [Buildroot] [PATCH 2/3] core: allow having a list of "cmake"
 candidates
In-Reply-To: <1806928464.21765876.1494024222751.JavaMail.zimbra@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
 <1494016231-50639-3-git-send-email-casantos@datacom.ind.br>
 <20170505210928.GB3001@scaer>
 <1806928464.21765876.1494024222751.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170506081751.GB2934@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2017-05-05 19:43 -0300, Carlos Santos spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: "Carlos Santos" <casantos@datacom.ind.br>
> > Cc: buildroot at buildroot.org
> > Sent: Friday, May 5, 2017 6:09:28 PM
> > Subject: Re: [Buildroot] [PATCH 2/3] core: allow having a list of "cmake" candidates
> >> @@ -10,9 +10,10 @@
> >>  #
> >>  BR2_CMAKE_VERSION_MIN = 3.1
> >>  
> >> -BR2_CMAKE ?= cmake
> >> -ifeq ($(call suitable-host-package,cmake,\
> >> -	$(BR2_CMAKE) $(BR2_CMAKE_VERSION_MIN)),)
> >> +BR2_CMAKE_CANDIDATES ?= cmake
> > 
> > Do not rename the variable; keep it named BR2_CMAKE.
> > 
> > It was named as such so that one could do:
> > 
> >    $ make BR2_CMAKE=/path/to/my/cmake3
> > 
> > and we want to keep it as such, so people can override the cmake they
> > want to use.
> > 
> > By the way, I hope you knew you could do that, didn't you? ;-)
> 
> I did not rename the variable. It is still BR2_CMAKE and you still can
> pass it in the command line (yes, I knew).
> 
> >> +BR2_CMAKE ?= $(call suitable-host-package,cmake,\
>     ^^^^^^^^^^^^^

Right, I missed the conditional assignment here.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> >> +	$(BR2_CMAKE_CANDIDATES) $(BR2_CMAKE_VERSION_MIN))
> >> +ifeq ($(BR2_CMAKE),)
> >>  BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> >>  BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> >>  endif
> >> --
> >> 1.8.3.1
> 
> -- 
> Carlos Santos (Casantos) - DATACOM, P&D
> ?The greatest triumph that modern PR can offer is the transcendent 
> success of having your words and actions judged by your reputation, 
> rather than the other way about.? ? Christopher Hitchens

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
