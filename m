From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Nov 2018 00:42:45 +0100
Subject: [Buildroot] [PATCH] libnftnl: drop useless
 BR2_PACKAGE_LIBNFTNL_XML
In-Reply-To: <20181113212149.255fb576@windsurf>
References: <d8767e3da1e02d6a5f1770bf490028b1bab13e46.1542139148.git.baruch@tkos.co.il>
 <20181113212149.255fb576@windsurf>
Message-ID: <69681f58-047c-05ff-1b35-d0a6fe62baec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/11/2018 21:21, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 13 Nov 2018 21:59:08 +0200, Baruch Siach wrote:
>> Commit fa0d1ebff99 (libnftnl: bump to version 1.0.9) removed the mxml
>> dependency. Remove the redundant BR2_PACKAGE_LIBNFTNL_XML config symbol
>> as well.
>>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Do we need Config.in.legacy handling ?
> 
> We normally add Config.in.legacy handling when removing options, but on
> the other hand, this option has had no effect since 2018.02.

 Legacy handling is there mostly to make sure the appropriate alternative option
can be selected. In this case there is no alternative.

 Also, compare this to a situation where it would have been an automatic
optional dependency: in that case, the feature also disappears silently.

 That said: legacy handling costs nothing and can be useful for some users. And
it can be backported to 2018.02.x.

 Regards,
 Arnout
