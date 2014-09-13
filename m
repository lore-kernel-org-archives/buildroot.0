From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 10:00:37 +0200
Subject: [Buildroot] [PATCH] lua: fix license path for lua 5.2
In-Reply-To: <1410564156-4818-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Fri, 12 Sep 2014 19:22:36 -0400")
References: <1410564156-4818-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <874mwc9cgq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > The file containing the license for lua 5.1 was removed and the license
 > text was added to the readme in 5.2.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > ---
 >  package/lua/lua.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/lua/lua.mk b/package/lua/lua.mk
 > index 9afec6c..b95fd30 100644
 > --- a/package/lua/lua.mk
 > +++ b/package/lua/lua.mk
 > @@ -12,7 +12,11 @@ endif
 >  LUA_SITE = http://www.lua.org/ftp
 >  LUA_INSTALL_STAGING = YES
 >  LUA_LICENSE = MIT
 > +ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 > +LUA_LICENSE_FILES = doc/readme.html
 > +else
 >  LUA_LICENSE_FILES = COPYRIGHT
 > +endif

I prefer to swap the logic as newer versions are more likely to be
similar to 5.2 than 5.1.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
