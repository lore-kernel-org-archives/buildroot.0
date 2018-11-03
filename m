From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 11:44:16 +0100
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <36c0075b-ff46-2d57-7fda-96e23621ddc6@mind.be>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181011170948.3594d391@windsurf>
 <1677556181.2913340.1539345049511.JavaMail.zimbra@datacom.com.br>
 <20181013145512.6a135309@windsurf>
 <1901226171.9682.1541193229814.JavaMail.zimbra@datacom.com.br>
 <20181102222518.24d7bb60@windsurf>
 <36c0075b-ff46-2d57-7fda-96e23621ddc6@mind.be>
Message-ID: <20181103114416.17be42df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Nov 2018 23:30:10 +0100, Arnout Vandecappelle wrote:

> > To me, this is exactly like what happens if you enable both Dropbear
> > and OpenSSH. It installs two init scripts with different names, even if
> > in practice, only one SSH server will start. We don't handle this
> > "conflict" for the SSH servers, I don't see why we should have some
> > special thing to handle it for logging daemons.  
> 
>  There is one big difference with the HTTP daemon, however: even if busybox
> httpd is enabled, we don't install an init script for it. However, S01logging is
> installed unconditionally, even if the user didn't consciously choose for
> busybox as its logging provider.

Well, my point was not simply for Busybox HTTP server, but for HTTP
servers in general. We have S50apache and S50lighttpd for example, and
possibly others as well. We have S50dropbear and S50sshd.

So the problem doesn't exist today for the Busybox HTTP server, because
we don't have an init script for it (but we may add one at some point
in the future). But it already exists for tons of other
daemons/services.

>  In that sense, it does make sense to offer an option to choose between the
> logging providers.

No, see above :-)

>  However, as I mentioned before, I see this as completely orthogonal to the
> S01logging cleanup, because this series is in fact mostly about standardizing
> the format of the init scripts. So Carlos, if you prefer to keep it as
> S01logging, that's fine.

On this, I totally agree, it is independent from Carlos work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
