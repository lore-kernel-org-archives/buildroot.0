From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 6 Apr 2011 00:00:50 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
	permissions
In-Reply-To: <20110405234253.2d0c2700@surf>
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
	<20110405215447.135159ef@surf> <87ipuswjux.fsf@macbook.be.48ers.dk>
	<BANLkTimBTeADgaq2F_MhNY-2UTUQGXz0=g@mail.gmail.com>
	<20110405234253.2d0c2700@surf>
Message-ID: <BANLkTikZ0Dw6ssSc-F9ea2PV2PTxbysj7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/4/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> On Tue, 5 Apr 2011 22:32:52 +0200
> Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:
>
>> Yes, that's how I meant. Sorry for any bad description.
>>
>> I thing this would also make many packages installed by e.g. autoconf
>> preserve their permissions without any extra code.
>
> How does this wrapper works ? I'd like to check if it solve my dbus
> issue, because I'm not sure that the dbus build system installs it with
> the correct ownership (permission will probably be correct, but I'm not
> sure about ownership).

There is none yet, but as I think of it, it just adds a line in the
device_table.txt with the path and permission to the installed files.

install -o 1000 -g 1000 -m 755 mybinary /usr/bin/mybinary

("install" is actually the wrapper) would put a line like this in
device_table.txt:

/usr/bin/mybinary  f  755 1000 1000 - - - - -

Not very familiar with device_table.txt syntax, but you get the idea.
