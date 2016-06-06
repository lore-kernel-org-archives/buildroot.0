From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jun 2016 23:25:55 +0200
Subject: [Buildroot] [PATCH 1/7] core/pkg-utils: add macro to
 escape-and-printf
In-Reply-To: <20160606230723.7ba46894@free-electrons.com>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <11da03a97bde4e0332be6577a83e1476566d8e9f.1465245732.git.yann.morin.1998@free.fr>
 <20160606230723.7ba46894@free-electrons.com>
Message-ID: <20160606212555.GB3706@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-06 23:07 +0200, Thomas Petazzoni spake thusly:
> On Mon,  6 Jun 2016 22:43:38 +0200, Yann E. MORIN wrote:
> 
> > +define PRINTF
> > +	printf '$(subst $(sep),\n,\
> > +			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
> > +				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
> > +					$(subst \,\\,$(1)))))\n'
> > +endef
> 
> Do we expect this to be used outside of fs/common.mk? Since it's not
> the case today, I would suggest to move it there.

Indeed I don;t plan on using it outside of the fs infra for now (I have
another series that will rely on it, but still in the fs infra).

However, this is generic enough that it is not specific to the fs infra.
Thus I believe it belong to pkg-utils.

If you still prefer I move it to fs/common.mk, that's also OK for me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
