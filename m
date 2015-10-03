From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 16:15:35 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/rpm: bump to version 4.12.0.1
In-Reply-To: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Thu, 3 Sep 2015 11:23:48 -0400")
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87h9m85988.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > The provided "bump" (suggested by Baruch Siach) switches from the rpm5
 > implementation to rpm.org's more active stream.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > ---
 > Changes v2 -> v3:
 >   - Cleanup configuration dependency to beecrypt/libnss; following
 >      convention (suggested by Baruch Siach).

 > Changes v1 -> v2:
 >   - Package change introduced in change set 2.
 > ---
 > +#ifeq ($(BR2_PACKAGE_LIBCAP),y)
 > +RPM_DEPENDENCIES += libcap
 > +RPM_CONF_OPTS += --with-cap
 > +#else
 > +RPM_CONF_OPTS += --without-cap
 > +#endif

Why is this commented out? You don't select libcap in Config.in.

-- 
Bye, Peter Korsgaard
