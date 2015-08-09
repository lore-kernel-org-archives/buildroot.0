From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 09 Aug 2015 20:05:11 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/jsoncpp: bump version to
 1.6.5
In-Reply-To: <20150809145443.GB2570@tarshish>
References: <1439123310-6602-1-git-send-email-bernd.kuhls@t-online.de>
 <20150809145443.GB2570@tarshish>
Message-ID: <1439143511.12501.11.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, Bernd,

On So, 2015-08-09 at 17:54 +0300, Baruch Siach wrote:
> Hi Bernd,
> 
> On Sun, Aug 09, 2015 at 02:28:30PM +0200, Bernd Kuhls wrote:
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  .../jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch | 12 
> > +++++++-----
> >  package/jsoncpp/jsoncpp.mk                                   |  2 
> > +-
> >  2 files changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > -snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > -snprintf.patch
> > index 7935849..1178cc2 100644
> > --- a/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > -snprintf.patch
> > +++ b/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > -snprintf.patch
> > @@ -16,6 +16,8 @@ Upstream status: sent upstream
> >  package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
> >  
> >  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > +(bumped patch to jsoncpp 1.6.5)
> > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> I think this patch is not needed anymore. See 
> https://github.com/open-source-parsers/jsoncpp/pull/232. I haven't 
> tested 
> though.
> 
> baruch
> 
> >   src/lib_json/json_writer.cpp | 2 --
> > @@ -25,15 +27,15 @@ diff --git a/src/lib_json/json_writer.cpp 
> > b/src/lib_json/json_writer.cpp
> >  index 83102fd2bb86..f7ad1e21bbc0 100644
> >  --- a/src/lib_json/json_writer.cpp
> >  +++ b/src/lib_json/json_writer.cpp
> > -@@ -29,8 +29,6 @@
> > - 
> > - #if defined(_MSC_VER) && _MSC_VER < 1500 // VC++ 8.0 and below
> > +@@ -31,8 +31,6 @@
> >   #define snprintf _snprintf
> > + #elif defined(__ANDROID__)
> > + #define snprintf snprintf
> >  -#elif __cplusplus >= 201103L
> >  -#define snprintf std::snprintf
> >   #endif
> >   
> > - #if defined(_MSC_VER) && _MSC_VER >= 1400 // VC++ 8.0
> > --- 
> > + #if defined(__BORLANDC__)  
> > +---
> >  2.1.4
> >  
> > diff --git a/package/jsoncpp/jsoncpp.mk 
> > b/package/jsoncpp/jsoncpp.mk
> > index 63b18e6..132e264 100644
> > --- a/package/jsoncpp/jsoncpp.mk
> > +++ b/package/jsoncpp/jsoncpp.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ##################################################################
> > ##############
> >  
> > -JSONCPP_VERSION = 1.6.1
> > +JSONCPP_VERSION = 1.6.5
> >  JSONCPP_SITE = $(call github,open-source
> > -parsers,jsoncpp,$(JSONCPP_VERSION))
> >  JSONCPP_LICENSE = Public Domain or MIT
> >  JSONCPP_LICENSE_FILES = LICENSE
> 

I already submitted a patch for jsoncpp version bump and removing the
snprintf-patch:
http://patchwork.ozlabs.org/patch/502324/

Best regards
J?rg Krause
