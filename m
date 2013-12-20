From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:45:57 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: fix typo
 BR2_TOOLCHAIN_HAS_THREAD
In-Reply-To: <20131220095020.565215ee@skate>
References: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
 <20131220095020.565215ee@skate>
Message-ID: <20131220224557.GB3484@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-20 09:50 +0100, Thomas Petazzoni spake thusly:
> On Thu, 19 Dec 2013 22:02:23 +0100, Thomas De Schampheleire wrote:
> 
> >  comment "souphttpsrc needs a toolchain w/ wchar, threads"
> > -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
> > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> 
> Do you know if there is a way of making kconfig complain loudly if
> there is a reference to an undefined symbol?

No, this is not even a warning.

When Kconfig parsess a 'depends on' line, if the symbol does not exist
yet, it is added to the list of symbols, in case it is defined later on.

But then there is no way to know if a symbol was added because there was
a corresponding 'config' (or 'menuconfig' or 'choice') entry in any of
the Config.in files, or because it was added due to it being listed in a
'depends on' (or a 'select').

We can't even rely on the symbol having no type, since it is valid for a
symbol to have no type (can't recall off-the-top-of-my-head what case it
was, but it is valid in the Kconfig grammar).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
