From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 May 2018 23:19:18 +0200
Subject: [Buildroot] [PATCH 3/3] weston: add weston-imx variant when
 using imx-gpu-viv
In-Reply-To: <20180517130810.GA6584@g751.home>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
 <20180516155201.10279-4-gary.bisson@boundarydevices.com>
 <2d58cd37-effa-a5bf-5f9b-6d1e143062db@mind.be>
 <20180517130810.GA6584@g751.home>
Message-ID: <a461da37-e484-57b9-be4d-f91ffbea9cae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-05-18 15:08, Gary Bisson wrote:
> Hi Arnout,
> 
> On Wed, May 16, 2018 at 11:24:17PM +0200, Arnout Vandecappelle wrote:
>>
>>
>> On 16-05-18 17:52, Gary Bisson wrote:
[snip]
>>> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
>>> +ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)
>>
>> WESTON_CONF_OPTS += --enable-imxg2d
> 
> Ok, I forgot you wanted that --enable-xxx options to be explicit
> although it ends up in the 'unrecognized options'.

 So I took a look at the configure.ac, and of course they got it wrong;
--enable-imxg2d will disable it. So your patch was correct.

 Reading documentation is apparently difficult :-)

 Since I'm not entirely convinced of the config option myself anyway:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Thanks for the review. I'll add that in the V2 once it is decided what
> to do about the config option.
> 
> Regards,
> Gary
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
