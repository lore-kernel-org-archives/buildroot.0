From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 09:22:55 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <f768f65b-c4e3-89ea-60e7-37e1a68012bb@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Apr 2021 22:10:59 +0200")
References: <20210403022316.8719-1-tianyuanhao@aliyun.com>
 <20210403070130.GN24043@scaer>
 <60bc4344-1e6d-f264-8449-2e44ee787526@aliyun.com>
 <f768f65b-c4e3-89ea-60e7-37e1a68012bb@mind.be>
Message-ID: <87ft02eey8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  To fix this, we can simply use "CONFIG_EAP_[A-Z0-9_]*" to disable all the EAP
 > options. I think EAP is the only one in that situation, but I haven't checked
 > all config options. There's also CONFIG_DPP that matches CONFIG_DPP2, but I
 > don't think that's actually intentional...

 >  So I think indeed the better solution is to change the patsubst lines.

 >  However, that's a much bigger change which requires a bit of testing and
 > double-checking (and deciding what to do with e.g. DPP2). So for now, I've
 > applied this patch, thanks. This patch can be backported to the stable branches.

We only added disabling logic post-2021.02, so it only affects master.

Should the disabling logic (and this patch) be backported to 2021.02.x?

-- 
Bye, Peter Korsgaard
