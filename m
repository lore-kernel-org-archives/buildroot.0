From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 10:43:08 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <55C4B65A.3010804@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
 <55C4B65A.3010804@green-communications.fr>
Message-ID: <20150808104308.2438494b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain Raybaud,

On Fri, 07 Aug 2015 15:44:58 +0200, Sylvain Raybaud wrote:

> OK I can make a virtual package, that seems to make sense. However,
> according to section 17.11.6, it seems that I'll have to patch all
> packages that depend on mysql, because there is some special magic to
> add in the depender's Config.in, am I right? Is this the way to go?

We could do something like jpeg (virtual), libjpeg and jpeg-turbo. This
way, dependers can continue to do a "select BR2_PACKAGE_MYSQL", and
there is a "choice" in mysql/Config.in to choose between the original
MySQL or MariaDB. Of course the original MySQL package will have to be
renamed to some other name than mysql.

I think the mechanism where the package depending on the virtual
package do "depends on BR2_PACKAGE_HAS_<foo>" is very good for cases
like OpenGL and al. where we have potentially an arbitrary/unlimited
number of providers.

But for things like libjpeg/jpeg-turbo or mysql/mariadb, where we know
the choice will be limited to a few alternatives, it probably makes
sense to have something like libjpeg.

I've Cc'ed Yann, to get his opinion on the matter.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
