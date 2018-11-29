From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Nov 2018 23:44:06 +0100
Subject: [Buildroot] [PATCH v1] freetype: bump version to 2.9.1
In-Reply-To: <87o9a77t3p.fsf@dell.be.48ers.dk>
References: <20181128191517.24636-1-ps.report@gmx.net>
 <87o9a77t3p.fsf@dell.be.48ers.dk>
Message-ID: <20181129234406.0c8f81f2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 29 Nov 2018 17:20:58 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
> 
>  > According to [1]:
>  > - fixes CVE-2018-6942  
> 
> It is always great to add a short description what this is about. I've
> added:
> 
> A NULL pointer dereference in the Ins_GETVARIATION() function within
> ttinterp.c could lead to DoS via a crafted font file.
> 
> (from https://security-tracker.debian.org/tracker/CVE-2018-6942)

O.k, will try to add some the next time...

> 
> 
> > --- a/package/freetype/freetype.mk
>  > +++ b/package/freetype/freetype.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################  
>  
>  > -FREETYPE_VERSION = 2.9
>  > +FREETYPE_VERSION = 2.9.1
>  >  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>  >  FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
>  >  FREETYPE_INSTALL_STAGING = YES
>  > @@ -14,6 +14,9 @@ FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
>  >  FREETYPE_DEPENDENCIES = host-pkgconf
>  >  FREETYPE_CONFIG_SCRIPTS = freetype-config  
>  
>  > +# since 2.9.1 needed for freetyep-config install  
> 
> s/freetyep/freetype/

Ups, thanks for fixing...

> 
> > +FREETYPE_CONF_OPTS = --enable-freetype-config  
> 
> We probably also need this for the host variant. Committed after adding
> that, thanks.
> 

Was not sure about this as FREETYPE_FIX_CONFIG_FILE and FREETYPE_FIX_CONFIG_FILE_LIBS
are only applied for the target build, but the option will not hurt for the host build...

Thanks for all the fixes ;-)

Regards,
Peter
