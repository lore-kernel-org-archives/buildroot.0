From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Mar 2017 20:57:28 +0200
Subject: [Buildroot] [PATCH 1/1] lighttpd: source default file from
 startup script
In-Reply-To: <1980559102.275301.1488998652295.JavaMail.zimbra@savoirfairelinux.com>
References: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
 <20170308173420.525msvchrmgpajia@tarshish>
 <1980559102.275301.1488998652295.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20170308185728.7sxkq3vbzx6hufrj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Philipp,

On Wed, Mar 08, 2017 at 01:44:12PM -0500, Philipp Skadorov wrote:
> ----- Original Message -----
> > On Wed, Mar 08, 2017 at 10:21:14AM -0500, Philipp Skadorov wrote:
> >> +NAME=lighttpd
> >> +DAEMON=/usr/sbin/$NAME
> >> +PID_FILE="/var/run/$NAME.pid"
> >> +CONF_FILE="/etc/$NAME/$NAME.conf"
> > 
> > Should be
> > 
> >  CONF_FILE="/etc/default/$NAME.conf"
> > 
> > to mach the commit log text.
> 
> You are referring to the package original config file, /etc/lighttpd/lighttpd.conf.
> It has gone nowhere from /etc/lighttpd dir.
> 
> Before the daemon is run with it, the new file /etc/default/lighttpd
> is sourced (if present) to set up the custom environment.

You are right, of course. I mixed it up. Sorry for the noise.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
