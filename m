From: Leonid <Leonid@a-k-a.net>
Date: Mon, 15 Oct 2007 04:03:28 -0700
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <47128B0E.5040501@promwad.com>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net><47120EE5.9040508@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F79@ehost011-3.exch011.intermedia.net>
	<47128B0E.5040501@promwad.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F7F@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ivan:

As I see also on other systems, /dev/null is normally created with 660
permission like many other devices (/dev/console for example). I thought
that buildroot runs udev with correct user to be able to rewrite all
devices in /dev without trouble. 

So, I suppose, my question is this: is it some intrinsic buildroot
udev-related bug or something wrong in my own system which results in
such error? What would you recommend to do?

Thanks,

Leonid.

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Ivan Kuten
Sent: Sunday, October 14, 2007 2:33 PM
To: Leonid
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Some devices are not created in the ext2
filesystem.

> I also see some error from udev:
> 
> Populating /dev using udev: cannot open /dev/null
> done
> 
> /dev/null is certainly present:
> 
> # ls -al /dev/null
> crw-rw----    1 root     root       1,   3 Dec 31 17:00 /dev/null
> 
> What this error is about?
> 

I think it can not just open /dev/null. If udev is run as udev user,
crw-rw----    1 root     root       1,   3 Dec 31 17:00 /dev/null

/dev/null could not be opened because rw-rw--- but not rw-rw-rw

BR,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
