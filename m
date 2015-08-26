From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Aug 2015 13:32:48 +0300
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
In-Reply-To: <55DD824B.6030700@imgtec.com>
References: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150826090804.GG8919@tarshish> <55DD824B.6030700@imgtec.com>
Message-ID: <20150826103248.GH8919@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi vincente,

On Wed, Aug 26, 2015 at 10:09:31AM +0100, Vicente Olivert Riera wrote:
> On 08/26/2015 10:08 AM, Baruch Siach wrote:
> > On Wed, Aug 26, 2015 at 09:59:51AM +0100, Vicente Olivert Riera wrote:
> >>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >> +TN5250_CONF_ENV += LIBS="-lssl -lcrypto -lz"
> > 
> > Please use pkg-config. See package/vsftpd/vsftpd.mk for example.
> 
> that was my first approach and it didn't work. Does it work for you?

Please try http://patchwork.ozlabs.org/patch/510797/. Works for me :-).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
