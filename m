From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 21 Oct 2011 18:21:18 +0200
Subject: [Buildroot] [PATCH 1/3] lsof: fix permission of extracted files
In-Reply-To: <20111021085540.666a392d@skate>
References: <1319148323-26856-1-git-send-email-damian@veritymedical.co.uk>
 <20111021085540.666a392d@skate>
Message-ID: <201110211821.18822.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damian, Thomas, All,

On Friday 21 October 2011 08:55:40 Thomas Petazzoni wrote:
> Le Fri, 21 Oct 2011 00:05:23 +0200,
> Damian Kaczmarek <damian@veritymedical.co.uk> a ?crit :
> 
> > +LSOF_EXTRACT_CMDS = \
> > +        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
> > +                $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
> > +        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
> 
> I would prefer:
> 
> define LSOF_EXTRACT_CMDS
>         $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
>                 $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
>         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
> endef
> 
> since this is what we use for all other pkg_something_CMDS.

Valid for both solutions:
Tested-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
