From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 20:38:58 +0100
Subject: [Buildroot] [PATCH] asterisk: replace $(HOST_DIR)/usr/bin with
 $(HOST_DIR)/bin
In-Reply-To: <20180227191835.30654-1-thomas.de_schampheleire@nokia.com>
 (Thomas De Schampheleire's message of "Tue, 27 Feb 2018 20:18:35
 +0100")
References: <20180227191835.30654-1-thomas.de_schampheleire@nokia.com>
Message-ID: <87k1uynrxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > Commit 0f9c0bf3d5cd did a global replace of $(HOST_DIR)/usr/bin to
 > $(HOST_DIR)/bin. But later, a new occurrence of $(HOST_DIR)/usr/bin snuck
 > into the sources via commit 05e306d8d33 which added asterisk.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  package/asterisk/asterisk.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
 > index f14c008111..28b85da562 100644
 > --- a/package/asterisk/asterisk.mk
 > +++ b/package/asterisk/asterisk.mk
 > @@ -287,7 +287,7 @@ HOST_ASTERISK_LICENSE_FILES = COPYING
 >  # so do not inherit the target setup.
 >  HOST_ASTERISK_AUTORECONF = NO
 
 > -HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/usr/bin/xml2-config
 > +HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/bin/xml2-config

It shouldn't really matter because of the usr symlink, but it cannot
hurt either - Committed, thanks.

-- 
Bye, Peter Korsgaard
