From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 17 Nov 2015 21:16:31 +0100
Subject: [Buildroot] [PATCH 01/21 RFC] package/libecore: do not build
 anything at patch time
In-Reply-To: <564B1B90.4080307@openwide.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <5e4ec100e9c6dda1262d9b84cd5a63f75ebc3864.1447713615.git.yann.morin.1998@free.fr>
 <20151117121649.32a08094@free-electrons.com> <564B1B90.4080307@openwide.fr>
Message-ID: <564B8B1F.5070009@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Yann, Thomas,

Le 17/11/2015 13:20, Romain Naour a ?crit :
> Hello Yann, Thomas,
> Le 17/11/2015 12:16, Thomas Petazzoni a ?crit :
>> Dear Yann E. MORIN,
>>
>> On Mon, 16 Nov 2015 23:46:56 +0100, Yann E. MORIN wrote:
>>> Trying to build anything at patch time will result in a broken
>>> legal-info, as the needed host dependencies are not yet built.
>>>
>>> Make that hook a pre-configure hook rather than a post-extract
>>> hook.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Peter Korsgaard <jacmet@uclibc.org>
>>> Cc: Romain Naour <romain.naour@openwide.fr>
>>
>> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> Even though this will probably conflict with the EFL rework from
>> Romain. However I believe this patch should be merged in master, since
>> it actually fixes legal-info.
> 
> Ok, it's not a big problem. The merge conflict will be easily resolved by
> removing the libecore package ;-)
> 
> Actually makekeys is not build by the upcoming host-efl package, I'll check if
> we still need it.

We can just forget about makekeys tool since it's only used when X11 with XCB
support is enabled.

Best regards,
Romain
