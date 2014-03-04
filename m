From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 19:36:42 +0100
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <53153191.9050506@ozlabs.org>
References: <1389862338.918265.958087681541.2.gpush@pablo>
 <53151AFC.3010402@zacarias.com.ar> <53152757.2020707@ozlabs.org>
 <5315300C.60102@zacarias.com.ar> <53153191.9050506@ozlabs.org>
Message-ID: <20140304183642.GB11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-03-04 09:51 +0800, Jeremy Kerr spake thusly:
> >> There are some scenarios where there's no point starting a SSH server
> >> (in my case, it's because there's no persistent storage, so no
> >> persistent host keys). However, I'd still like a ssh/scp client to be
> >> available.
> > 
> > Well you'll want at least one of the options of dropbear, there's no
> > point in excluding both.
> > My common sense tells me you'll always want the client anyway, it's no
> > security threat or space-consuming menace, so why not add just a SERVER
> > option maybe?
> > BR2_PACKAGE_DROPBEAR -> builds and install the client portion.
> > BR2_PACKAGE_DROPBEAR_SERVER -> installs the server bits (default=y for
> > compatibility reasons).
> 
> That sounds pretty good to me too. I'd be happy to implement whatever
> the general consensus is :)

OK for me. But make sure the server is "default y", so old .config files
still work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
