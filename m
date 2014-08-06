From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 22:02:26 +0200
Subject: [Buildroot] [PATCH v2 3/3] rpi-userland: Fix vcfiled startup
In-Reply-To: <CA+sos7-tgC8taOAwp8o6LBPoT5DsDaUUJTToTPw2W_yQMHEnrA@mail.gmail.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
 <20140806173351.GF3891@free.fr>
 <1234544963.1762589.1407346848783.JavaMail.zimbra@advansee.com>
 <CA+sos7-tgC8taOAwp8o6LBPoT5DsDaUUJTToTPw2W_yQMHEnrA@mail.gmail.com>
Message-ID: <20140806200226.GD1587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit, All,

On 2014-08-06 21:56 +0200, Beno?t Th?baudeau spake thusly:
> > On Wednesday, August 6, 2014 7:33:51 PM, Yann E. MORIN wrote:
> >> On 2014-08-06 15:39 +0200, Beno?t Th?baudeau spake thusly:
> >> > +PIDFILE="/var/run/$NAME/$NAME"
> >>
> >> Are you sure about the path to the PID file?
> >> What about:
> >>     PIDFILE="/var/run/$NAME.pid"
[--SNIP--]
> I have checked the code, and this path can be overridden by defining
> VCFILED_LOCKFILE, so I can set it to '/var/run/vcfiled.pid' if you
> really prefer. It's up to you. You tell me.

Well, I think it would be better, yes. There's no need to create a
directory just to put the PID file.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
