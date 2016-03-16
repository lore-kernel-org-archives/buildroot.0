From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:09:32 +0100
Subject: [Buildroot] [PATCH 1/4] libcap: bump version
In-Reply-To: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 21:20:08 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877fh28483.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > attr is no longer a dependency, not even optional.

 > Refresh our patches, and drop the backport from upstream.

It would have been good to mention something about the new host-gperf
dependency, but ok.
 
 >  define HOST_LIBCAP_BUILD_CMDS
 >  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
 > -		LIBATTR=yes RAISE_SETFCAP=no
 > +		RAISE_SETFCAP=no
 >  endef
 
 >  define HOST_LIBCAP_INSTALL_CMDS
 >  	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
 > -		LIBATTR=yes RAISE_SETFCAP=no prefix=/usr lib=lib install
 > +		RAISE_SETFCAP=no prefix=/usr lib=lib install
 >  endef

Not related to this bump, but this looks wrong. We shouldn't use DESTDIR
/ set prefix to /usr for host builds. From a quick look the prefix is at
least used in libcap.pc, so other host packages will get wrong info if
they use pkgconfig to find host-libcap.

Committed, thanks.

-- 
Bye, Peter Korsgaard
