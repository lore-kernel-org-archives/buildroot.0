From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Aug 2015 14:39:05 +0300
Subject: [Buildroot] [PATCH] package/tn5250: fix static linking problem
In-Reply-To: <55DDA318.2050008@imgtec.com>
References: <1440579591-23594-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150826090804.GG8919@tarshish> <55DD824B.6030700@imgtec.com>
 <20150826103248.GH8919@tarshish> <55DD9D29.6090308@imgtec.com>
 <20150826111255.GI8919@tarshish> <55DDA318.2050008@imgtec.com>
Message-ID: <20150826113905.GJ8919@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Wed, Aug 26, 2015 at 12:29:28PM +0100, Vicente Olivert Riera wrote:
> On 08/26/2015 12:12 PM, Baruch Siach wrote:
> > On Wed, Aug 26, 2015 at 12:04:09PM +0100, Vicente Olivert Riera wrote:
> >> On 08/26/2015 11:32 AM, Baruch Siach wrote:
> >>> On Wed, Aug 26, 2015 at 10:09:31AM +0100, Vicente Olivert Riera wrote:
> >>>> On 08/26/2015 10:08 AM, Baruch Siach wrote:
> >>>>> On Wed, Aug 26, 2015 at 09:59:51AM +0100, Vicente Olivert Riera wrote:
> >>>>>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >>>>>> +TN5250_CONF_ENV += LIBS="-lssl -lcrypto -lz"
> >>>>>
> >>>>> Please use pkg-config. See package/vsftpd/vsftpd.mk for example.
> >>>>
> >>>> that was my first approach and it didn't work. Does it work for you?
> >>>
> >>> Please try http://patchwork.ozlabs.org/patch/510797/. Works for me :-).
> >>
> >> yeah, that one works. I was missing "libcrypto". But, I don't understand
> >> why do you need to put libcrypto manually since it's already listed in
> >> the openssl.pc file, and then libcrypto pulls libz. Doesn't work
> >> recursively?
> > 
> > I tried "--libs openssl" here, and it works as well. I'm not sure which one is 
> > better.
> 
> indeed, it works. Now I'm wondering which which mistake I made.
> 
> I think just "--libs openssl" is better since it seems to act
> recursively and pull all the other libraries as well. If you send a v2
> of your patch, you can keep my reviewed-by and my tested-by, since I
> have already done the test.

Just did.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
