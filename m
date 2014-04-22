From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 22 Apr 2014 12:41:13 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
 for kernels older than 3.x.
In-Reply-To: <20140418213924.6d5a3ebf@skate>
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20140418213924.6d5a3ebf@skate>
Message-ID: <53564749.5060409@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, Thomas,

Thomas Petazzoni wrote:
> Dear Ryan Barnett,
>
> On Fri, 18 Apr 2014 14:28:16 -0500, Ryan Barnett wrote:
>> From: Matt Poduska <mjpodusk@rockwellcollins.com>
>>
>> In the case where DEVTMPFS is desired for older kernels where the
>> support is experimental, it's still possible to enable the option in
>> the board's specific linux .config instead of relying on buildroot to
>> make the modification.
>>
>> Signed-off-by: Matt Poduska <mjpodusk@rockwellcollins.com>
>> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>> ---
>>   linux/linux.mk |    8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> Which problem is this fixing? I remember having used devtmpfs prior to
> 3.x, and it was working well. For versions prior to 2.6.32, the

And in fact I have targets here that are stuck on 2.6.37, they happily
use devtmpfs and it works just fine.

So I NACK this change, or if there's a strong motivation to apply it
I would at least conceive a backward-compatibility path.

-- 
Luca
