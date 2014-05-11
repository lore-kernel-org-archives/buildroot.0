From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 May 2014 22:41:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-09
In-Reply-To: <20140511145522.GH4096@tarshish>
References: <20140510063010.4D1F81010DF@stock.ovh.net>
 <536E86B1.4050005@mind.be> <20140511043405.GB4096@tarshish>
 <536F8C6E.1050004@mind.be> <20140511145522.GH4096@tarshish>
Message-ID: <536FE087.1030103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/14 16:55, Baruch Siach wrote:
> Hi Arnout,
> 
> On Sun, May 11, 2014 at 04:42:54PM +0200, Arnout Vandecappelle wrote:
>> On 11/05/14 06:34, Baruch Siach wrote:
[snip]
>>> Your patch is correct, I guess, but as far as I understand it doesn't solve 
>>> the host architecture dependency problem that is causing the host-protobuf 
>>> failure above.
>>
>>  True. We could add a dependency on BR2_HOSTARCH for that. Except that Kconfig
>> doesn't support string comparison AFAIK. So we'd need to create bool symbols for
>> all the supported host architectures...
> 
> How would that solve the problem? Host packages are selected directly from 
> Makefiles, regardless of Kconfig settings, isn't it? Or do you intend to add 
> host architecture dependencies to all reverse dependencies of host-protobuf 
> (currently: protobuf-c, protobuf, python-protobuf, and their reverse 
> dependencies)?

 Exactly. But I don't really think it's worthwhile to do that - except for the
autobuilder, there is probably nobody who tries building on anything except x86.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
