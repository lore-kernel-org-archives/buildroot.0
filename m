From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Sep 2012 23:16:55 +0200
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <50517A99.4040700@mind.be>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
 <50517A99.4040700@mind.be>
Message-ID: <201209132316.55747.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Marek, All,

On Thursday 13 September 2012 08:18:01 Arnout Vandecappelle wrote:
> On 09/12/12 00:36, Marek Belisko wrote:
> > diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
> > new file mode 100755
> > index 0000000..2ed4569
> > --- /dev/null
> > +++ b/board/raspberrypi/post-build.sh
> > @@ -0,0 +1,23 @@
> > +TARGETDIR=$1
> > +# Set root password to 'root'. Password generated with
> > +# mkpasswd, from the 'whois' package in Debian/Ubuntu.
> > +sed -i 's%^root::%root:8kfIfYHmcyQEE:%' $TARGETDIR/etc/shadow
> NACK. Has nothing to do with RPi (although I think it's a good
> idea to update the skeleton with this change).

I'll shortly push a patch that allows one to specify the root password from
inside the menuconfig.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
