From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:32:18 +0100
Subject: [Buildroot] [PATCH 1/1] python3: drop PYTHON3_VERSION_{MINOR,
	MAJOR} variable
In-Reply-To: <1395818305-25027-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Wed, 26 Mar 2014 08:18:25 +0100")
References: <1395818305-25027-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87lhvwk5nh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > ---
 >  package/python3/python3.mk |    8 +++-----
 >  1 file changed, 3 insertions(+), 5 deletions(-)

 > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
 > index ce75e46..21576bf 100644
 > --- a/package/python3/python3.mk
 > +++ b/package/python3/python3.mk
 > @@ -4,11 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON3_VERSION_MAJOR = 3.4
 > -PYTHON3_VERSION_MINOR = 0
 > -PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
 > -PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.xz
 > -PYTHON3_SITE          = http://python.org/ftp/python/$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
 > +PYTHON3_VERSION = 3.4.0
 > +PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 > +PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)

Strike that - PYTHON3_VERSION_MAJOR is used in several places:

git grep PYTHON3_VERSION_
package/python3/python3.mk:     rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
package/python3/python3.mk:     rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
package/python3/python3.mk:     for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYT
package/python3/python3.mk:     chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so
package/python3/python3.mk:PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(
 
-- 
Bye, Peter Korsgaard
