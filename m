From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 23:27:15 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/softether: Fix iconv-related
	compile error
In-Reply-To: <1426107668-9110-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Wed, 11 Mar 2015 22:01:08 +0100")
References: <1426107668-9110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <8761a7jhks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > libiconv can also be enabled, and compiled before softether, with
 > BR2_ENABLE_LOCALE disabled, this patch improves libiconv detection.

 > Fixes
 > http://autobuild.buildroot.net/results/f47/f473882cd35445cbe5b3b15635d555340183951a/
 > http://autobuild.buildroot.net/results/72e/72eab3a6f162e3c5eac380f88b54d4f314d52445/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Simplify libiconv check (Thomas)

 >  package/softether/softether.mk |   10 ++++++----
 >  1 file changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/package/softether/softether.mk b/package/softether/softether.mk
 > index 8f8734d..70b76b8 100644
 > --- a/package/softether/softether.mk
 > +++ b/package/softether/softether.mk
 > @@ -14,14 +14,14 @@ SOFTETHER_LICENSE_FILES = LICENSE
 >  SOFTETHER_DEPENDENCIES = host-softether openssl readline
 >  SOFTETHER_AUTORECONF = YES
 
 > -ifeq ($(BR2_ENABLE_LOCALE),)
 > +ifeq ($(BR2_PACKAGE_LIBICONV),y)

Hmm, what does this really change? LIBICONV=y if !BR2_ENABLE_LOCALE, so
these should be equivalent, right?

-- 
Bye, Peter Korsgaard
