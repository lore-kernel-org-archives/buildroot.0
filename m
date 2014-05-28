From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 22:04:06 +0200
Subject: [Buildroot] [PATCH 1 of 2] infra: permissions/users/device
	tables: avoid adding empty entries
In-Reply-To: <f9a9da19bf34a6862ec5.1400762140@argentina> (Thomas De
 Schampheleire's message of "Thu, 22 May 2014 14:35:40 +0200")
References: <patchbomb.1400762139@argentina>
 <f9a9da19bf34a6862ec5.1400762140@argentina>
Message-ID: <87fvjtbrgp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > In pkg-generic.mk, an entry would be added to each of the permissions,
 > devices and users tables, even if FOO_PERMISSIONS/DEVICES/USERS is empty. In
 > that last case, the entry would contain only the separator, which is
 > substituted to '\n' in fs/common.mk.
 > For configurations with many packages, this would render the build output a
 > bit odd, containing many \n instances (even though the end result in the
 > target would of course be the same).

 > This patch cleans up the build output by only adding to these tables when
 > the package actually specified contents for them.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
