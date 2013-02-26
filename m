From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Feb 2013 16:07:45 -0300
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <20130226200302.31af2041@skate>
References: <512C941A.1070207@zacarias.com.ar> <20130226193330.04f77759@skate>
 <512D01CB.3040301@zacarias.com.ar> <20130226200302.31af2041@skate>
Message-ID: <512D0801.3090508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/2013 04:03 PM, Thomas Petazzoni wrote:

> Another solution is to apply the attached patch, and use the
> --disable-allprogs option. Then, it builds and installs only libuuid.
> It then takes:
> 
> real	0m3.209s
> user	0m8.333s
> sys	0m1.196s
> 
> Best regards,

I just kill the includes from Makefile.am, it could be a conditional
patch and likely to change less in future versions of util-linux.
Building all at once kills the libuuid without wchar posibility, how
useful that is is up in the air, i didn't try removing WCHAR depends
from apps caused by this and seeing which ones make it.
Regards.
