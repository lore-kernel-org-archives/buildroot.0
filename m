From: Eric Malkowski <eric@bvwireless.net>
Date: Thu, 19 Feb 2009 09:49:35 -0500
Subject: [Buildroot] Shell history w/ ASH spans multiple ash instances
In-Reply-To: <8763j6bvf5.fsf@macbook.be.48ers.dk>
References: <499CEA40.1000907@bvwireless.net>
	<8763j6bvf5.fsf@macbook.be.48ers.dk>
Message-ID: <499D717F.9010003@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I thought I'd try this list first since:

1. Busybox is an integral part of buildroot
2. buildroot's default config for busybox is in effect and if it's just 
a config thing, then it's good to know what's up.

To follow up briefly: In looking at the source in libbb it appears 
disabling CONFIG_FEATURE_EDITING_SAVEHISTORY will stop libbb from 
writing to ~/.ash_history
Older versions I've used had SAVEHISTORY enabled but didn't dynamically 
load it from various instances of interactive shells causing thr 
cross-shell history sharing -- perhaps this is a new "feature".  I don't 
need the history saved and loaded constantly or on shell exit so I'll 
try turning that off.

Sorry for using the wrong list -- but at least you can see my reasoning 
for starting w/ the buildroot list.

If anything further is needed w/ this topic, I'll move over to the 
busybox list.

Thanks,

-Eric Malkowski

Peter Korsgaard wrote:
>>>>>> "Eric" == Eric Malkowski <eric@bvwireless.net> writes:
>>>>>>             
>
> Hi,
>
>  Eric> In the past, if multiple shells were started on console and ssh for
>  Eric> instance, the command history was always unique per shell instance.
>
>  Eric> Any advice greatly appreciated.
>
>  Eric> BTW: I'm using busybox 1.13.2 per stock buildroot config.
>
> Please direct busybox questions to the busybox list - busybox at busybox.net
>
>   
