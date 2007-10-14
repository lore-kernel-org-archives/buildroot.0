From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 15 Oct 2007 00:33:02 +0300
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C02528F79@ehost011-3.exch011.intermedia.net>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net>
	<47120EE5.9040508@promwad.com>
	<406A31B117F2734987636D6CCC93EE3C02528F79@ehost011-3.exch011.intermedia.net>
Message-ID: <47128B0E.5040501@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
