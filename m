From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jul 2017 08:14:47 +0200
Subject: [Buildroot] [PATCH 1/1] host-mariadb: add host-openssl
 dependency
In-Reply-To: <CAFSsvmoJFa01=6uQzaS6YvXoE6Zs=05D1RxW42Ws+4EL6Gmtmg@mail.gmail.com>
References: <20170727133548.30285-1-aduskett@gmail.com>
 <20170727171043.076dd40d@windsurf.lan>
 <CAFSsvmoJFa01=6uQzaS6YvXoE6Zs=05D1RxW42Ws+4EL6Gmtmg@mail.gmail.com>
Message-ID: <20170728081447.09e2f63a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Jul 2017 18:34:52 -0400, Adam Duskett wrote:

> > This means that host-mariadb does not require host-openssl, but uses
> > OpenSSL if available. So the proper solution is to pass some option at
> > configure time to tell host-mariadb to not attempt to use OpenSSL.
> > Indeed, we are not really interested in having OpenSSL support in
> > host-mariadb.
> >  
> True; what about if host-openssl is already selected?
> 
> > It apparently needs an SSL implementation, but has a small bundled one
> > based on yassl. Can you try:
> >
> > HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
> >
> > and see if it fixes the problem for you ?  
> This works and properly builds mariadb.  That being said; should is there
> a way to check if host-openssl is already selected? Or does it not matter?

We currently have no way to know if a host package is selected, because
we don't have Config.in options for most host packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
