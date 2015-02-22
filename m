From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 14:16:23 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/freerdp: install server
 key and certificate
In-Reply-To: <20150222124741.2743fb7c@free-electrons.com>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <4bfcb4d735dcded5ba4328260a13970af1023c0b.1424558036.git.yann.morin.1998@free.fr>
 <20150222124741.2743fb7c@free-electrons.com>
Message-ID: <20150222131623.GB4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-22 12:47 +0100, Thomas Petazzoni spake thusly:
> On Sat, 21 Feb 2015 23:36:23 +0100, Yann E. MORIN wrote:
> 
> > +define FREERDP_INSTALL_KEYS
> > +	$(INSTALL) -D $(@D)/server/X11/server.key \
> > +		      $(TARGET_DIR)/etc/freerdp/keys/server.key
> > +	$(INSTALL) -D $(@D)/server/X11/server.crt \
> > +		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
> 
> No explicit '-m' ?

Yup, I forgot it.

But now I wonder what those should be: 0644 or 0600 ?

I am leaning more toward 0644 so non-root can start a FreeRDP server
(e.g. with weston). Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
