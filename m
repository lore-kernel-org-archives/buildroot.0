From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 09:21:54 +0100
Subject: [Buildroot] [PATCHv2] libcap: fix target install
In-Reply-To: <1293566135-8862-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 28 Dec 2010 16:55:35 -0300")
References: <1293566135-8862-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqslj8f1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> /usr/lib/libcap.so.* was installed via "install -D" but libcap.so.2 is
 Gustavo> a symlink so it was dereferenced.

 Gustavo> Also update the buildsystem patch so that the shared lib is +X.
 
 Gustavo>  define LIBCAP_INSTALL_TARGET_CMDS
 Gustavo> - install -D $(STAGING_DIR)/usr/lib/libcap.so.* $(TARGET_DIR)/usr/lib
 Gustavo> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
 Gustavo> + $(RM) -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 Gustavo>  endef

We use raw 'rm' plenty of other places, so I've fixed that.

Committed, thanks.

-- 
Bye, Peter Korsgaard
