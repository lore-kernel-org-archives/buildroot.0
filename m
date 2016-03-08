From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Mar 2016 16:03:56 +0000
Subject: [Buildroot] [PATCH] rtptools: disable for MIPS Codescape
 toolchains
In-Reply-To: <20160308163256.764be70e@free-electrons.com>
References: <1457446983-17165-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160308163256.764be70e@free-electrons.com>
Message-ID: <56DEF7EC.20904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 08/03/16 15:32, Thomas Petazzoni wrote:
> Vicente,
> 
> On Tue, 8 Mar 2016 14:23:03 +0000, Vicente Olivert Riera wrote:
>> Codescape toolchains don't provide rpcsvc/ypclnt.h, therefore rtptools
>> fails to build showing an error like this one:
>>
>> host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
>>  #include <rpcsvc/ypclnt.h>   /* YP */
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/5a8abdd4918a721c1bddbf68a16d99bea90a59a9/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Isn't the problem that the Codescape toolchain don't provide RPC
> support at all ? 

Yes, that's the problem.

> Or is it really a bug limited to <rpcsvc/ypclnt.h>.
> 
> I don't really like to add random toolchain exclusions without a more
> serious explanation than "header file is not in toolchain".

Ok. Perhaps we should make rtptools package depeding on
BR2_TOOLCHAIN_HAS_NATIVE_RPC?


Regards,

Vincent.

> 
> Thomas
>
