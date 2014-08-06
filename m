From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 6 Aug 2014 21:56:27 +0200
Subject: [Buildroot] [PATCH v2 3/3] rpi-userland: Fix vcfiled startup
In-Reply-To: <1234544963.1762589.1407346848783.JavaMail.zimbra@advansee.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
 <20140806173351.GF3891@free.fr>
 <1234544963.1762589.1407346848783.JavaMail.zimbra@advansee.com>
Message-ID: <CA+sos7-tgC8taOAwp8o6LBPoT5DsDaUUJTToTPw2W_yQMHEnrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, Aug 6, 2014 at 7:40 PM, Beno?t Th?baudeau
<benoit.thebaudeau@advansee.com> wrote:
> Dear Yann E. MORIN,
>
> On Wednesday, August 6, 2014 7:33:51 PM, Yann E. MORIN wrote:
>> Benoit, All,
>>
>> On 2014-08-06 15:39 +0200, Beno?t Th?baudeau spake thusly:

[...]

>> Otherwise, see below...
>>
>> > Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
>> [--SNIP--]
>> > diff --git a/package/rpi-userland/S94vcfiled
>> > b/package/rpi-userland/S94vcfiled
>> > new file mode 100755
>> > index 0000000..25a0fcd
>> > --- /dev/null
>> > +++ b/package/rpi-userland/S94vcfiled
>> > @@ -0,0 +1,47 @@
>> > +#!/bin/sh
>> > +
>> > +NAME=vcfiled
>> > +DESC="VideoCore file server daemon $NAME"
>> > +DAEMON="/usr/sbin/$NAME"
>> > +DAEMON_ARGS=""
>> > +CFGFILE="/etc/default/$NAME"
>> > +PIDFILE="/var/run/$NAME/$NAME"
>>
>> Are you sure about the path to the PID file?
>> What about:
>>     PIDFILE="/var/run/$NAME.pid"
>
> Yes, sure, this is the path used by vcfiled, which creates its PID file itself
> rather than relying on start-stop-daemon -m for that.

I have checked the code, and this path can be overridden by defining
VCFILED_LOCKFILE, so I can set it to '/var/run/vcfiled.pid' if you
really prefer. It's up to you. You tell me.

[...]

Regards,
Beno?t
