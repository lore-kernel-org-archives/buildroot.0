From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 09 Feb 2014 10:17:05 +0100
Subject: [Buildroot] [git commit] kmod: really pass --disable-manpages
In-Reply-To: <7291a6ec-9696-4801-936d-fdab0d43bcdf@email.android.com> (Thomas
 De Schampheleire's message of "Sun, 09 Feb 2014 10:11:06 +0100")
References: <20140209083628.E9C0D9C8B1@busybox.osuosl.org>
 <7291a6ec-9696-4801-936d-fdab0d43bcdf@email.android.com>
Message-ID: <87ob2g3asu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> +KMOD_CONF_OPT += --disable-manpages
 >> +HOST_KMOD_CONF_OPT = --disable-manpages
 >> +
 >> ifeq ($(BR2_PACKAGE_ZLIB),y)
 >> KMOD_DEPENDENCIES += zlib
 >> KMOD_CONF_OPT += --with-zlib

 > Aargh, another oops, sorry.

No problem, that's why we have the autobuilders ;)

 > Isn't it safer to always use += for this type of variables?

Yes it is, but we typically don't do it for the first(/single)
assignment.

-- 
Bye, Peter Korsgaard 
