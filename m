From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 02 Mar 2018 21:59:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: needs readline
In-Reply-To: <20180118044042.4cclk2qlu6fb37ha@tarshish>
References: <20180113224532.2715-1-bernd.kuhls@t-online.de>
 <20180114053204.qzh6l3xgqywgcmyr@sapphire.tkos.co.il>
 <ver4jexs69.ln2@ID-313208.user.individual.net>
 <20180118044042.4cclk2qlu6fb37ha@tarshish>
Message-ID: <1520024398.13943.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Bernd,

On Thu, 2018-01-18 at 06:40 +0200, Baruch Siach wrote:
> Hi Bernd,
> 
> On Wed, Jan 17, 2018 at 10:23:11PM +0100, Bernd Kuhls wrote:
> > Am Sun, 14 Jan 2018 07:32:04 +0200 schrieb Baruch Siach:
> > > On Sat, Jan 13, 2018 at 11:45:32PM +0100, Bernd Kuhls wrote:
> > 
> > [...]
> > > > +	select BR2_PACKAGE_READLINE
> > > 
> > > I don't think that this is the correct fix. The bluez README file says:
> > > 
> > >         --disable-client
> > > 
> > >                 Disable support for the command line client
> > > 
> > >                 By default the command line client is enabled and uses
> > >                 the readline library. For specific systems where BlueZ
> > >                 is configured by other means, the command line client
> > >                 can be disabled and the dependency on readline is
> > >                 removed.
> > > 
> > > So this does not look like a decision to make readline a mandatory
> > > dependency,
> > > but a bug that needs to be fixed upstream.
> > 
> > this commit https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?
> > id=70b8b754f8e6f9abe9211c686b279dbef16bf666
> > 
> > "client: Make use of bt_shell.
> > Use bt_shell instead of readline directly."
> > 
> > removed readline code from client code and replaced it with calls to 
> > bt_shell, bt_shell itself is not used exclusively by client code anymore, 
> > see the commit I mentioned in my patch ( https://git.kernel.org/pub/scm/
> > bluetooth/bluez.git/commit/?id=bee3796113196da1b3f56da42fcae4d9bae6695e )
> > and the many source code files which include "src/shared/shell.h".
> > 
> > Afaics this does look like an outdated README file and not a bug in the 
> > source code, what do you think? Before writing to the bluez devs I would 
> > like to reach a consensus about what to ask them ;)
> 
> IMO you can simply ask them whether readline is now a mandatory dependency. If 
> it is, then an update patch for the README file would be nice.
> 

Any news on this issue? Would be great to have this fixed before the
next release.

I had a quick look and I would say that the README is indeed outdated
and readline is necessary for all parts depending on libshared-
{glib,mainloop}, which is true for most (all?) tools and bluetoothd.

Best regards,
J?rg Krause
