From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 9 Sep 2016 11:38:13 -0300
Subject: [Buildroot] [PATCH 5/6] linux-headers: remove deprecated
	versions
In-Reply-To: <20160908221853.398542f6@free-electrons.com>
References: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
 <1473359942-15810-5-git-send-email-gustavo@zacarias.com.ar>
 <20160908221853.398542f6@free-electrons.com>
Message-ID: <d6dc4465-1d7a-659b-aa32-f53d1821a98a@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/16 17:18, Thomas Petazzoni wrote:

>> +config BR2_KERNEL_HEADERS_4_0
>> +	bool "kernel headers version 4.0.x are no longer supported"
>> +	select BR2_KERNEL_HEADERS_4_1
>
> Wouldn't it be safer to select in this case the immediately older
> kernel header version that's still available?
>
> Imagine the user is running a 4.0 kernel, and therefore has chosen 4.0
> kernel headers. With your change, the toolchain will now be rebuilt
> with 4.1 kernel headers... while the user is running a 4.0 kernel. Not
> good.
>
> Default to an older version seems safer to me.
>
> What do you think?
>
> Thanks,
>
> Thomas

Hi.
Indded, however it's been like this for ages and i was continuing the 
(likely wrong) tradition.
I can respin and send a follow-up patch that addresses the older 
retirements as well.
Regards.
