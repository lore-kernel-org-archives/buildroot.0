From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 20 Mar 2013 09:16:46 -0700
Subject: [Buildroot] [PATCH] quota: util-linux libmount is needed to
	build mount
In-Reply-To: <51498C0C.5040202@zacarias.com.ar>
References: <1363753355-27054-1-git-send-email-gilles.talis@gmail.com>
 <51498C0C.5040202@zacarias.com.ar>
Message-ID: <CAKcgs2y2SxVhTLXfPcoC=xgi3pB2oH+V_zT_YxhmwHGUsb_i=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

2013/3/20 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 03/20/2013 01:22 AM, Gilles Talis wrote:
>
>> quota configuration explicitly selects util-linux mount package,
>> but mount requires libmount to build.
>>
>> Explicitly select libmount to fix this.
>
> But it's not the proper fix realy, see line 92 of util-linux.mk - it
> won't build ANY util-linux binary unless BR2_PACKAGE_UTIL_LINUX_BINARIES
> is set, hence it may pass in the autobuilders but you'll never get
> util-linux mount (and quota will cry when used).
> The proper fix is the one i've sent before.
I simply just missed the patch you have sent earlier on this issue.
All apologies.
Thanks for pointing out.

regards
Gilles.
