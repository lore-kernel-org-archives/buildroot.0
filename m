From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 8 May 2016 11:09:35 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <e3cfa132-94c0-2b3d-7593-3286bab1e535@mind.be>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be> <572AEB2E.1050305@gmail.com>
 <572AFC1F.3070004@gmail.com> <20160505142533.67f8e473@free-electrons.com>
 <572D9A1E.20609@gmail.com> <e3cfa132-94c0-2b3d-7593-3286bab1e535@mind.be>
Message-ID: <572F024F.3000609@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 08/05/2016 01:41, Arnout Vandecappelle ha scritto:
> I've just seen bluez5 requires glibc or musl toolchain.
>> I tried to rebuild all with glibc (instead of uClibc) but the RPi3 
>> refuses to
>> boot due to a kernel panic.


In the meanwhile I did something weird... but it seems to work.
I used uClibc adding in the config file the following:

UCLIBC_HAS_REGEX=y
UCLIBC_HAS_WORDEXP=y
UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE=y

then I removed the dependency of bluez5_utils from glibc and tried to 
set the latest version: 5.39.

Well... I don't know if it might explode in few minutes but it compiles 
fine and bluez5 is (almost) working.
I have to fix some things like the path of bluetoothd 
(/usr/libexec/bluetooth/ instead of /usr/sbin) and errors on dbus 
(org.bluez.Error.Failed)

But the most important questions is: it's obvious that if I was able to 
enable wordexp in uClibc and you didn't enable it - there is a good 
reason, which I don't know. Perhaps is it not safe?

Best regards
Marco
