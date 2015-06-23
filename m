From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 22:56:46 +0200
Subject: [Buildroot] [PATCH 1/1] sudo: enable pam support
In-Reply-To: <1434734352-6500-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Fri, 19 Jun 2015 13:19:12 -0400")
References: <1434734352-6500-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87616e5ek1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > Configure the sudo utility to support PAM if the framework is enabled.
 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > ---
 >  package/sudo/sudo.mk  | 13 ++++++++++++-
 >  package/sudo/sudo.pam | 12 ++++++++++++
 >  2 files changed, 24 insertions(+), 1 deletion(-)
 >  create mode 100644 package/sudo/sudo.pam

 > diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
 > index a1a8328..9fa1cd6 100644
 > --- a/package/sudo/sudo.mk
 > +++ b/package/sudo/sudo.mk
 > @@ -16,9 +16,20 @@ SUDO_CONF_OPTS = \
 >  	--without-umask \
 >  	--with-logging=syslog \
 >  	--without-interfaces \
 > -	--without-pam \
 >  	--with-env-editor
 
 > +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 > +define SUDO_INSTALL_PAM_CONF
 > +	$(INSTALL) -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo

This should use the -D option to ensure the destination directories gets
created. Committed with that fixed, thanks!

-- 
Bye, Peter Korsgaard
