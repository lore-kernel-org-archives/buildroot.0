From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Wed, 27 Aug 2014 15:32:22 +0300 (IDT)
Subject: [Buildroot] [PATCH 2/2] phidgetwebservice: new package
In-Reply-To: <20140826204722.GC29733@tarshish>
References: <1409084887-30450-1-git-send-email-yba@tkos.co.il>
 <1409084887-30450-2-git-send-email-yba@tkos.co.il>
 <20140826204722.GC29733@tarshish>
Message-ID: <alpine.DEB.2.02.1408271531070.5746@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
Thanks for the help. I believe that I fixed these issues in v2 of the 
patch that I submitted an hour ago.

  - yba


On Tue, 26 Aug 2014, Baruch Siach wrote:

> Date: Tue, 26 Aug 2014 23:47:22 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 2/2] phidgetwebservice: new package
> 
> Hi Yonatan,
>
> On Tue, Aug 26, 2014 at 11:28:07PM +0300, Jonathan Ben-Avraham wrote:
>>
>> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
>> ---
>
> [snip]
>
>> diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
>> new file mode 100644
>> index 0000000..01e7b11
>> --- /dev/null
>> +++ b/package/phidgetwebservice/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_PHIDGETWEBSERVICE
>> +	bool "phidgetwebservice"
>> +	depends on BR2_PACKAGE_LIBPHIDGET
>
> For non obvious dependencies the general rule is that you 'select' that
> dependency. See http://buildroot.net/downloads/manual/manual.html under
> "Choosing depends on or select". Note that you must also copy here the
> dependencies of selected packages, in this case threads support.
>
>> +	help
>> +          phidgetwebservice (the Phidget WebService) provides an HTTP
>
> This line should be indented like the rest, tab + two spaces.
>
>> +	  front-end to the libphidget device control API. This provides
>> +	  an alternative to the libphidget C linkage interface for
>> +	  controlling locally attached Phidgets USB devices and it also
>> +	  allows you to control Phidget USB devices remotely when the host
>> +	  running the phidgetwebservice has an exposed network interface.
>> +
>> +	  The phidgetwebservice client program uses the libphidget HTTP
>> +	  functions to send commands to the phidgetwebservice.
>> +
>> +	  http://phidgets.com/
>
> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
