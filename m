From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Nov 2014 07:06:48 -0300
Subject: [Buildroot] [PATCH 1/1] package/network-manager: NM needs
 ISC-DHCPC or DHCPCD
In-Reply-To: <20141126065754.GN2374@sapphire.tkos.co.il>
References: <1416983821-2729-1-git-send-email-nroach44@gmail.com>
 <20141126064539.GM2374@sapphire.tkos.co.il> <54757952.4010007@gmail.com>
 <20141126065754.GN2374@sapphire.tkos.co.il>
Message-ID: <5475A638.3020005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/26/2014 03:57 AM, Baruch Siach wrote:

>>> We usually use 'select' for this kind of dependencies. Something like 
>>> (untested):
>>>
>>> 	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
>>
>> Ah, okay. I was wondering about that, thanks.
>>
>> I'll leave this version up for now as my other questions are still
>> valid. Furthermore, is there a preference as to DHCPCD vs ISC?
> 
> I think we should default to the more lightweight one. I guess it's dhcpcd in 
> this case.

+1, the ISC DHCP 4.1.x series even though ESV (extended support) will
EOL (end-of-life) by december, and even though i don't know which one
will be the new ESV (likely 4.3.x) 4.2.x+ bundles bind libraries, so
ouch for bloat.
Regards.
