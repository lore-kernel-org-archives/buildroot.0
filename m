From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Aug 2012 18:57:15 +0200
Subject: [Buildroot] [PATCH 04/36] package/vde2: new package
In-Reply-To: <20120814152425.725d87e6@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-4-git-send-email-yann.morin.1998@free.fr>
 <20120814152425.725d87e6@skate>
Message-ID: <201208141857.16332.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 14 August 2012 15:24:25 Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:52 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > +# For now, we install only the libraries
> > +# Installing the complete VDE suite can come in a later patch
> > +# In that case, do not forget to update the license!
> > +define VDE2_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libvde*.so*    \
> > +	                      $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/vde2/vde_l3
> > +	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/vde2/vde_l3/*.so   \
> > +	                      $(TARGET_DIR)/usr/lib/vde2/vde_l3
> > +endef
> 
> Again, "make install" ?

As I only want to install the libs, I know of no rule to install only libs.
But, I can upgrade the package to perform a full install, that would probably
be easy.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
