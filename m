From: Shawn J. Goff <shawn7400@gmail.com>
Date: Mon, 04 Feb 2013 18:39:43 -0500
Subject: [Buildroot] Insufficient RPC options for crosstool-ng toolchain
In-Reply-To: <20130205003238.2ec5aa65@skate>
References: <511037F4.8090906@gmail.com> <20130205003238.2ec5aa65@skate>
Message-ID: <511046BF.1070902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/2013 06:32 PM, Thomas Petazzoni wrote:
> Dear Shawn J. Goff,
>
> On Mon, 04 Feb 2013 17:36:36 -0500, Shawn J. Goff wrote:
>> I'm getting an error about a missing rpc_msg.h while building
>> conntrack-tools. That package selects libtirpc if
>> !BR2_TOOLCHAIN_HAS_NATIVE_RPC. I'm having BR build the toolchain using
>> ct-ng; I looked at the  toolchain-crosstool-ng/Config.in and it selects
>> BR2_TOOLCHAIN_HAS_NATIVE_RPC because the ct-ng config that ships with BR
>> uses glibc 2.9. My ct-ng config uses glibc 2.14, which doesn't have
>> native RPC support.
> Correct.
>
>> I started to make a patch that allows for explicitly selecting
>> BR2_TOOLCHAIN_HAS_NATIVE_RPC like the external-toolchain allows,
> Seems like the good solution yes.
>
>> but I
>> ran across check_glibc function and the ext-toolchain-checked stamp and
>> it looks like quite a lot, so I wanted to find out if you actually want
>> all that for this fix.
> What problems did you encounter exactly? It should be fairly similar to
> what we do for external toolchains I believe, no?

No problems, it just that when I started down the path, I thought it 
would be just an option, but there turned out to be this whole 
toolchain-checked thing behind it, so I wanted to make sure that is 
what's wanted before I do it.
