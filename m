From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2013 18:35:20 +0200
Subject: [Buildroot] gst-fsl plugins imx53 build error
In-Reply-To: <519CF7C1.90907@freescale.com>
References: <84A636242B704DF3A957F6A111BD4ACA@JohanW7>
 <51ADF5A9C82CA04683FC48E400BD16523F0B72@039-SN2MPN1-011.039d.mgd.msft.net>
 <CB37095658C54EDB8D6AB2B9EB168DC9@JohanW7> <20130522164137.46f92fa0@skate>
 <519CF7C1.90907@freescale.com>
Message-ID: <51A38B48.1050901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Daiane,

On 22/05/13 18:52, Daiane Angolini wrote:
> On 05/22/2013 11:41 AM, Thomas Petazzoni wrote:
>> Dear Sagaert Johan,
>>
>> On Wed, 22 May 2013 16:25:42 +0200, Sagaert Johan wrote:
>>
>>> No , kernel 3.4.44 with custom patches specific for the TX53 module.
>>> There seems to be an error 'unsupported platform' don't know if it is
>>> related to the used kernel or if something else is causing this.
>>
>> As Angolini replied to you (without Cc'ing the list, unfortunately),
>> you have to use a Freescale kernel for this gst-fsl plugin to work. The
>> mainline kernel cannot work.
>
> imx-lib 12.09 was not developed/tested to be used on imx53.  12.09 is for
> imx6 only, although the imx53 source code was the base for 12.09.
>
> The kernel you need to use is
>
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_2.6.35_11.09.01
>
>
> It would be better if you could use imx-lib from 11.09.01 as well.
>
> And fsl multimedia package is 2.0.3 for imx53

  So the version to use depends on the platform? That's good to know. 
I'll try to update the buildroot integration to automatically select the 
correct version. (Unfortunately it doesn't look like I'll have time for 
that the coming months...)


> But, I don't understand yet which version is included in buildroot tree,
> so I'm not sure if this information can help you.
>
> Regarding unsupported platform you must use PLATFORM = "IMX51" during
> configure/make process

  So IMX51 is both for i.MX53 and i.MX51?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
