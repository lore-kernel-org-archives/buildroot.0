From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 11:54:08 +0100
Subject: [Buildroot] Analysis of build results for 2016-03-07
In-Reply-To: <20160308112522.47fc4935@free-electrons.com>
References: <20160308073022.EFA101019EE@stock.ovh.net>
 <20160308112522.47fc4935@free-electrons.com>
Message-ID: <56DEAF50.80206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/08/16 11:25, Thomas Petazzoni wrote:
>>           arm |                     owfs-3.1p1 | NOK |http://autobuild.buildroot.net/results/b9f1a0a7ac54d0cf00f4880a36bd43ad988fcd30/
>> >      powerpc |                     owfs-3.1p1 | NOK |http://autobuild.buildroot.net/results/2c741fef7ba203b156b674dddcbe1b8b8a32c048/
> ../../../owlib/src/include/compat_netdb.h:69:24: fatal error: rpc/netdb.h: No such file or directory
>   # include <rpc/netdb.h>
>
> Arnout ?

  Looks like it doesn't properly check for RPC availability. I'll check if RPC 
can be disabled, otherwise do the tirpc-if-not-rpc dance.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
