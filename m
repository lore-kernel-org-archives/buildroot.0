From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:59:18 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-02-16
In-Reply-To: <20170220234612.249e1084@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 20 Feb 2017 23:46:12 +0100")
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
 <87a89gpjtk.fsf@dell.be.48ers.dk>
 <20170220234612.249e1084@free-electrons.com>
Message-ID: <8760k4piyh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 20 Feb 2017 23:40:39 +0100, Peter Korsgaard wrote:

 >> I agree. There has also recently been some security issues, but like you
 >> say our package is ancient.
 >> 
 >> Will you send a patch?

 > I'll try, but it's not a one-liner. If you make oracle-mysql
 > unavailable, then the only mysql provider is mariadb. But mariadb has
 > an additional BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS dependency, which needs
 > to be propagated to all reverse dependencies of BR2_PACKAGE_MYSQL.

Gaah :/

 > Not sure how to handle this case: there are quite a few packages
 > selecting mysql:

 > package/collectd/Config.in:     select BR2_PACKAGE_MYSQL
 > package/dovecot/Config.in:      select BR2_PACKAGE_MYSQL
 > package/kodi/Config.in: select BR2_PACKAGE_MYSQL
 > package/poco/Config.in: select BR2_PACKAGE_MYSQL
 > package/qt/Config.sql.in:       select BR2_PACKAGE_MYSQL
 > package/qt5/qt5base/Config.in:  select BR2_PACKAGE_MYSQL
 > package/sconeserver/Config.in:  select BR2_PACKAGE_MYSQL

Hmm, using depends on probably isn't really nice either. I don't think
the actual dependency is really such a big deal though, as libaio
supports quite a lot of architectures, and the ones it doesn't are
unlikely to use mysql.

-- 
Bye, Peter Korsgaard
