From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Date: Sun, 26 Jul 2015 21:59:09 +0200 (CEST)
Subject: [Buildroot] [PATCH v6 1/1] rtl8821au: new package
In-Reply-To: <20150725161334.GI3662@free.fr>
References: <1437691280-23926-1-git-send-email-christian@paral.in>
 <alpine.LNX.2.00.1507241546220.30794@localhost>
 <20150725161334.GI3662@free.fr>
Message-ID: <alpine.LNX.2.00.1507262133400.12764@T520.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2015, Yann E. MORIN wrote:

> Ulli, all,
> 
> On 2015-07-24 15:50 +0200, Hans Ulli Kroll spake thusly:
> > Note : I'm new on the list, so I had insert this tread by hand !
> 
> Welcome! :-)
> 

Thanks

> > The I think the difference between the version from ASUS and mine based
> > the one Edimax are in the handling of the LED.
> > Maybe there are more ...
> 
> Well, if that's the only difference, we can consider that to be a minor
> issue that can be resolvdd by back-/forward-porting it from one code
> base to the other.
> 

This ways only a quick look at some code I'm working (at this time) on.
As I said there is maybe more.

> > > --- /dev/null
> > > +++ b/package/rtl8821au/0001-disable-default-debug.patch
> > 
> > I do add some kind of "disable debug message"
> > This will take some time, I'm currently working in the code.
> 
> Great! :-)
> 

So, now the driver is *allways* build with debug info, see
CONFIG_RTLWIFI_DEBUG
but you *must* enable this while loading the driver i.e.

insmod rtl8821au debug=5

To be very verbose, default is debug=0 for no debug output.

For the code itself :
I've done *a lot* functions renames and other things.
I use the rtl8821ae driver as some kind of pattern and the rtl8192cu 
driver for the USB part.

Ulli
