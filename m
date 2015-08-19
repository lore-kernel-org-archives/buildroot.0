From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Wed, 19 Aug 2015 07:30:00 +0300 (IDT)
Subject: [Buildroot] Telnet server in target file system
In-Reply-To: <CAJ2oMhLG6camYr4xyojWJTZq8BbB87E_CFJ+2ZQfn4h-uo+PYA@mail.gmail.com>
References: <CAJ2oMhLG6camYr4xyojWJTZq8BbB87E_CFJ+2ZQfn4h-uo+PYA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1508190711540.26165@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ran,
See reply below...

On Tue, 18 Aug 2015, Ran Shalit wrote:

> Date: Tue, 18 Aug 2015 17:04:26 +0300
> From: Ran Shalit <ranshalit@gmail.com>
> To: buildroot at busybox.net
> Subject: [Buildroot] Telnet server in target file system
> 
> Hello,
>
> I would like to ask how is best to add telnet support in target file system.
> Is it required to add NETKITTELNET package
> Symbol: BR2_PACKAGE_NETKITTELNET
>
> Or is it suffecient to add TELNETD option in busybox.
>
> Regards,
> Ran
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Quoting Arnaud Aujon arnaud.aujon on this list from Fri Dec 13 17:51:45 
UTC 2013:

"The 'netkittelnet' package has been removed, since it has been deprecated 
since 2012.11. 'busybox' provides a telnet client and should be used 
instead."

See also in the menuconfig top level menu "Legacy config options  --->" 
"netkittelnet has been removed". If you select a legacy option, or you try 
to build a rootfs using a new Buildroot version with an old .config file 
that has the BR2_PACKAGE_NETKITTELNET set, then the Buildroot make will 
fail with

Makefile.legacy:12: *** "You have legacy configuration in your .config! 
Please check your configuration.".  Stop.
make[1]: Leaving directory `/home/yba/x86_64/buildroot'
make: *** [all] Error 2

So yes, use the BusyBox telnetd server.

Best regards,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
