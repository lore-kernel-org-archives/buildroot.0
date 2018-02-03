From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 23:24:38 +0100
Subject: [Buildroot] [PATCH v2 1/2] network-manager: Bump to version
 1.10.2
In-Reply-To: <20180202133523.GA8864@x230> (Petr Vorel's message of "Fri, 2 Feb
 2018 14:35:24 +0100")
References: <20180201234516.5031-1-petr.vorel@gmail.com>
 <20180202115635.0fdaab93@windsurf.lan> <20180202133523.GA8864@x230>
Message-ID: <87372h1zkp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Hi Thomas,
 >> > +ifeq ($(BR2_PACKAGE_JANSSON),y)
 >> > +NETWORK_MANAGER_CONF_OPTS += --enable-ovs
 >> > +NETWORK_MANAGER_DEPENDENCIES += jansson
 >> > +else
 >> > +NETWORK_MANAGER_CONF_OPTS += --disable-ovs
 >> > +endif

 >> It is somewhat weird to introduce this here, and then add an explicit
 >> option in a second patch.
 > Oh, you're right.

 >> Perhaps PATCH 1/2 could just do --disable-ovs unconditionally, and
 >> PATCH 2/2 add the rest. If you agree, I can rework locally before
 >> applying, I understand it's a lot of nitpicking for such a small
 >> change :)
 > OK, please do it as I'm on a way to Fosdem, so I'd do it next week.
 > Thanks!

Committed both after reworking as suggested by Thomas, thanks.

-- 
Bye, Peter Korsgaard
