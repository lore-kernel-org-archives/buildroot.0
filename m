From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Aug 2015 14:22:47 +0300
Subject: [Buildroot] [PATCH 1/1] msmtp: don't try to use IDN feature
In-Reply-To: <55CC79B1.2010003@syscom-instruments.com>
References: <1439463011-29089-1-git-send-email-viallard@syscom-instruments.com>
 <55CC79B1.2010003@syscom-instruments.com>
Message-ID: <20150813112247.GY25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

On Thu, Aug 13, 2015 at 01:04:17PM +0200, Viallard Anthony wrote:
> On 08/13/2015 12:50 PM, Anthony Viallard wrote:
> >Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> >---
> >  package/msmtp/msmtp.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> >index bff2620..7c8261e 100644
> >--- a/package/msmtp/msmtp.mk
> >+++ b/package/msmtp/msmtp.mk
> >@@ -10,6 +10,7 @@ MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
> >  MSMTP_DEPENDENCIES = host-pkgconf
> >  MSMTP_CONF_OPTS = \
> >  	--without-libidn \
> >+	--disable-gai-idn \
> >  	--without-libgsasl
> >  MSMTP_LICENSE = GPLv3+
> >  MSMTP_LICENSE_FILES = COPYING
> 
> I don't known if there is a consensus about IDN usage for buildroot. I
> didn't see an option in the config about it. I presume IDN should be
> disabled for all package, am I right ?
> 
> autoconf can't see if AI_IDN is really supported (http://sourceforge.net/p/msmtp/code/ci/907916e8089ea9303a7c091b763087530c88a063/).
> It seems weird but this is the case apparently.
> 
> Before I did the above patch, msmtp failed to send mail. The output was:
> 
> msmtp: cannot locate host smtp.mandrillapp.com: Bad value for ai_flags

Excellent. Please add that to the commit log. If someone later feels the need 
for IDN, that person should come up with a solution.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
