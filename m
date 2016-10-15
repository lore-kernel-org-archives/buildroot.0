From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:19:27 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/mono: bump to version
	4.6.0.245
In-Reply-To: <1476374658-32604-2-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Thu, 13 Oct 2016 18:04:18 +0200")
References: <1476374658-32604-1-git-send-email-angelo.compagnucci@gmail.com>
 <1476374658-32604-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87twceq89s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > * Bump to mono 4.6.0.245
 > * Enabling previously disabled aot cause this version doesn't
 >   compile without
 > * Fixing removed licensing file in mcs/COPYING.LIB

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 > Changelog:

 > Fixed license and license files as suggested by Peter

 >  package/mono/mono.hash |  2 +-
 >  package/mono/mono.mk   | 12 ++++++------
 >  2 files changed, 7 insertions(+), 7 deletions(-)

 > diff --git a/package/mono/mono.hash b/package/mono/mono.hash
 > index c275e15..4d05458 100644
 > --- a/package/mono/mono.hash
 > +++ b/package/mono/mono.hash
 > @@ -1,2 +1,2 @@
 >  # sha256 locally computed
 > -sha256 900c2cc25ee55adeec04e1ae889316efc127c82cc0c392f928421f19f8f5b633  mono-4.4.2.11.tar.bz2
 > +sha256 2981f518cace63bfe10953fecd57c7fef040077a1ac617967dde5466062c1327  mono-4.6.0.245.tar.bz2
 > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
 > index 3d0b9bc..2d9dc8d 100644
 > --- a/package/mono/mono.mk
 > +++ b/package/mono/mono.mk
 > @@ -4,12 +4,12 @@
 >  #
 >  ################################################################################
 
 > -MONO_VERSION = 4.4.2.11
 > +MONO_VERSION = 4.6.0.245
 >  MONO_SITE = http://download.mono-project.com/sources/mono
 >  MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 > -MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
 > -MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING.LIB mcs/COPYING \
 > -	eglib/COPYING external/Newtonsoft.Json/Tools/7-zip/copying.txt
 > +MONO_LICENSE = GPLv2 or MIT (compiler, tools), MIT (libs) or commercia

You missed 'l' in commercial.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
