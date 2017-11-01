From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 1 Nov 2017 20:03:19 +0200
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031230519.3feb2619@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
Message-ID: <20171101180319.qs5oueonqz2robr5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Tue, Oct 31, 2017 at 11:05:19PM +0100, Thomas Petazzoni wrote: 
> > microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/20a9a75f701ce70c2ae434085a85ad8d34adc67b | ORPH
> >          arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/46844b028989808aa7340c14af22f2855ec803d8 | ORPH
> 
> Not sure. Is it just:
> 
> make[2]: *** [jim/libjim.a] Error 1
> make[2]: *** Waiting for unfinished jobs....
> usb_modeswitch.c: In function 'checkSuccess':
> usb_modeswitch.c:1579:7: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
>     if (i == CheckSuccess-1) {
> 
> That makes the build fail?

No. The cause is a few lines above that:

UNAME_MACHINE = ppc64le
UNAME_RELEASE = 3.10.0-514.10.2.el7.ppc64le
UNAME_SYSTEM  = Linux
UNAME_VERSION = #1 SMP Fri Mar 3 16:16:38 GMT 2017
child process exited abnormally
    while executing
[...]
make[2]: *** [jim/libjim.a] Error 1
make[2]: *** Waiting for unfinished jobs....

> Baruch, you are the last person who bumped this package, could you have a look?

The autobuilder indicates[1] that it only fails on Peter's gcc112 Powerpc 
host. Debugging this requires access to a Powerpc host.

[1] http://autobuild.buildroot.net/?reason=usb_modeswitch-2.5.0

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
