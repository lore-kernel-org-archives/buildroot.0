From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Jan 2018 14:06:55 -0200 (BRST)
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
In-Reply-To: <87tvvakkmq.fsf@dell.be.48ers.dk>
References: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
 <87tvvakkmq.fsf@dell.be.48ers.dk>
Message-ID: <875670032.71418.1516896415562.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Sjoerd Venema" <srg.venema@gmail.com>, casantos at datacom.ind.br
> Cc: buildroot at busybox.net
> Sent: Thursday, January 25, 2018 1:45:17 PM
> Subject: Re: Migrated from 2017.08 to 2017.11, rfkill issues

>>>>>> "Sjoerd" == Sjoerd Venema <srg.venema@gmail.com> writes:
> 
> Adding Carlos Santos, who added the util-linux rfkill support.
> 
> > Hi,
> > I just installed 2017.11 on a fresh machine and imported my config.
> > In 2017.11 I had used the rfkill package, so I got a notification that this
> > is now legacy, so I unchecked it in the "legacy" section. I noticed that it
> > was now selected at the util-linux section.
> 
> > However, I get the following error, no matter if rfkill is selected or not:
> 
> You didn't paste the output of the configure step, but please check that
> it passes --disable-rfkill is you disable the
> BR2_PACKAGE_UTIL_LINUX_RFKILL option.
> 
> >   CC       sys-utils/rfkill-rfkill.o
> >   CCLD     setsid
> > sys-utils/rfkill.c:67: error: ?RFKILL_TYPE_FM? undeclared here (not in a
> > function)
> 
> What is your toolchain configuration? RFKILL_TYPE_FM got added to the
> kernel headers a long time ago (commit 875405a7793e9c35fa, during the
> 2.6.33 cycle), so it sounds quite odd that your toolchain doesn't know
> it.

Notice that the problem happens when compiling host-util-linux. The
toolchain should not be relevant in this case.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
