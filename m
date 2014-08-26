From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 26 Aug 2014 14:59:55 +0300 (IDT)
Subject: [Buildroot] Phidgets library and web server?
In-Reply-To: <20140825172643.GA29733@tarshish>
References: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
 <20140825172643.GA29733@tarshish>
Message-ID: <alpine.DEB.2.02.1408261453450.6714@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Aug 2014, Baruch Siach wrote:

> Date: Mon, 25 Aug 2014 20:26:43 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Phidgets library and web server?
> 
> Hi Yonatan,
>
> On Sun, Aug 24, 2014 at 10:40:39AM +0300, Jonathan Ben Avraham wrote:
>> I have integrated the Phidgets (http://www.phidgets.com/)
>> libphidget-2.1.8.20140319 and phidgetwebservice into my Buildroot tracking
>> branch.
>>
>> I have tested on x86 and i.MX287.
>>
>> The Phidgets software license is LGLP Version 3. No publicly accessible
>> repo, just tarball downloads.
>>
>> Uses autoconf build system.
>>
>> Requires glibc and libusb.
>>
>> From the Phidgets site:
>>
>> "Phidgets are a set of user friendly building blocks for low cost USB
>> sensing and control from your PC."
>>
>> My client is using Phidgets products on a custom i.MX287 board rather than a
>> PC, for control of a home kitchen and restaurant appliance using GPIO's and
>> ADC's. I personally have no commercial interest in Phidgets.
>>
>> I can commit to maintaining for six months on arm, x86 and ppc.
>>
>> My question to you is, is this the type of package that we want to add to
>> Buildroot? Should I submit patches? Or is there a "contrib" dir where I
>> could put the patches?
>
> Just submit a patch.
>
> One problem I see with libphidget is that there seems to be no way to download
> older versions. The only downloadable tarball is at
> http://www.phidgets.com/downloads/libraries/libphidget.tar.gz, which
> apparently points to the latest version. Having an automatically upgraded
> download source is strongly discouraged, as it makes the build produce
> different results at different times.
>
> The preferred solution would be to have upstream provide access to immutable
> per-version tarballs.
>
> An alternative solution might be to store the libphidget tarballs on the
> Buildroot backup download server (http://sources.buildroot.net).
>
> Any other suggestions?
>
> baruch

Hi Baruch,
Thanks for the tip. I found that Phidgets has a per-version download using 
this URL http://www.phidgets.com/downloads/libraries/ with the exact 
tarball name, e.g. 
http://www.phidgets.com/downloads/libraries/libphidget_2.1.8.20140319.tar.gz.
That is, no web server indexing of 
http://www.phidgets.com/downloads/libraries but the contents can be seen 
using http://www.phidgets.com/old_drivers.php.
Regards,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
