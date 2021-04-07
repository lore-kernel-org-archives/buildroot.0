From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 09:32:47 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <87ft02eey8.fsf@dell.be.48ers.dk>
References: <20210403022316.8719-1-tianyuanhao@aliyun.com>
 <20210403070130.GN24043@scaer>
 <60bc4344-1e6d-f264-8449-2e44ee787526@aliyun.com>
 <f768f65b-c4e3-89ea-60e7-37e1a68012bb@mind.be>
 <87ft02eey8.fsf@dell.be.48ers.dk>
Message-ID: <606433e8-9626-09a8-2d1b-4a85065f91da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/04/2021 09:22, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  To fix this, we can simply use "CONFIG_EAP_[A-Z0-9_]*" to disable all the EAP
>  > options. I think EAP is the only one in that situation, but I haven't checked
>  > all config options. There's also CONFIG_DPP that matches CONFIG_DPP2, but I
>  > don't think that's actually intentional...
> 
>  >  So I think indeed the better solution is to change the patsubst lines.
> 
>  >  However, that's a much bigger change which requires a bit of testing and
>  > double-checking (and deciding what to do with e.g. DPP2). So for now, I've
>  > applied this patch, thanks. This patch can be backported to the stable branches.
> 
> We only added disabling logic post-2021.02, so it only affects master.
> 
> Should the disabling logic (and this patch) be backported to 2021.02.x?

 I applied it to next at the time, not to master, so I guess that was for a
reason :-)

 I don't like putting this kind of risky changes on the stable branch. Since a
follow-up patch was needed, it clearly was indeed risky. The first patch of that
series was kind of a fix because it made sure that the wpa_supplicant build
actually corresponds to the Buildroot configuration. The patch that introduced
the CTRL_IFACE issue however was really a feature patch.

 So no, no backporting needed.

 Regards,
 Arnout
