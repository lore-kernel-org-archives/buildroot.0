From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 23:46:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-02-16
In-Reply-To: <87a89gpjtk.fsf@dell.be.48ers.dk>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
 <87a89gpjtk.fsf@dell.be.48ers.dk>
Message-ID: <20170220234612.249e1084@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 23:40:39 +0100, Peter Korsgaard wrote:

> I agree. There has also recently been some security issues, but like you
> say our package is ancient.
> 
> Will you send a patch?

I'll try, but it's not a one-liner. If you make oracle-mysql
unavailable, then the only mysql provider is mariadb. But mariadb has
an additional BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS dependency, which needs
to be propagated to all reverse dependencies of BR2_PACKAGE_MYSQL.

Not sure how to handle this case: there are quite a few packages
selecting mysql:

package/collectd/Config.in:     select BR2_PACKAGE_MYSQL
package/dovecot/Config.in:      select BR2_PACKAGE_MYSQL
package/kodi/Config.in: select BR2_PACKAGE_MYSQL
package/poco/Config.in: select BR2_PACKAGE_MYSQL
package/qt/Config.sql.in:       select BR2_PACKAGE_MYSQL
package/qt5/qt5base/Config.in:  select BR2_PACKAGE_MYSQL
package/sconeserver/Config.in:  select BR2_PACKAGE_MYSQL

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
