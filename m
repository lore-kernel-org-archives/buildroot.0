From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 5 Feb 2007 11:57:55 +0100
Subject: [Buildroot] XSERVER [was Re: svn commit: trunk/buildroot/package:
	cairo dillo libgtk12 libgtk2 metacity p etc...]
In-Reply-To: <8803519.post@talk.nabble.com>
References: <20070204194743.5047748658@busybox.net>
	<8803519.post@talk.nabble.com>
Message-ID: <20070205105755.GG5399@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 05, 2007 at 01:59:38AM -0800, Daniel Laird wrote:
>
>
>aldot wrote:
>> 
>> Author: aldot
>> Date: 2007-02-04 11:47:41 -0800 (Sun, 04 Feb 2007)
>> New Revision: 17769
>> 
>> Log:
>> - the $(XSERVER) target can be provided by different X server impls.
>> Adjust users
>> - rdesktop needs an xserver impl
>> 
>> 
>> Modified:
>>    trunk/buildroot/package/Makefile.in
>>    trunk/buildroot/package/cairo/cairo.mk
>>    trunk/buildroot/package/dillo/dillo.mk
>>    trunk/buildroot/package/libgtk12/libgtk12.mk
>>    trunk/buildroot/package/libgtk2/libgtk2.mk
>>    trunk/buildroot/package/metacity/metacity.mk
>>    trunk/buildroot/package/pango/pango.mk
>>    trunk/buildroot/package/rdesktop/rdesktop.mk
>>    trunk/buildroot/package/rxvt/rxvt.mk
>>    trunk/buildroot/package/xorg/xorg.mk
>> 
>> ...
>> 
>Cool, I posted a thread the other day about how to deal with packages that

I must have missed that thread, sorry.

>could be configured with X and without X(in the case where you use DirectFB
>for example)
>I presume we could add a DirectFB option to the list of XSERVERS: (as there
>is a DirectFB Xserver)
>
>Secondly, Would you also have anything against if XSERVERS empty then
>configure packages as --without-x  (or equivalent)
>
>Then we could also check if DirectFB then use --enable-directfb for packages
>that care.
>
>What do you think.

(1) update directfb t othe current, stable (thus hopefully supported)
   version.
   DirectFB used to change their API far too fast last time i looked at
   it, so it was extremely inconvenient to use. Perhaps this has changed
   since then -- it was a couple of years back, two, or maybe three,
   dunno.
(2) flesh-out the directfb config to allow for (relatively) fine-grained
   configuration: Just bare core / some nifty other stuff that may be
   useful.
(3) update XSERVER accordingly
(4) provide an $(ENABLE_DIRECTFB) or the like for use by interrested packages
etc, etc.

The order is significant here, at least from my POV. _First_ fix the
directfb package not to use ancient, deprecated stuff.. YMMV
