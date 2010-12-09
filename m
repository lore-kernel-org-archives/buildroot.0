From: Heiko Zuerker <heiko@zuerker.org>
Date: Thu, 09 Dec 2010 12:26:57 -0600
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <4D0112E5.301@zacarias.com.ar>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D00DFEE.7090103@zacarias.com.ar>
	<20101209105559.10305jzi16ub75cs@www.home.zuerker.org>
	<AANLkTi=T0idFP0k6fFXP3ex6dsupLxMGPgJwz+V4DCkM@mail.gmail.com>
	<4D0112E5.301@zacarias.com.ar>
Message-ID: <20101209122657.12946lktv4rsa84k@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Gustavo Zacarias <gustavo@zacarias.com.ar>:

> On 12/09/10 14:28, Pkun wrote:
>
>> 2010/12/9 Heiko Zuerker <heiko at zuerker.org <mailto:heiko@zuerker.org>>
>>
>>     Quoting Gustavo Zacarias <gustavo@zacarias.com.ar
>
> Yes, that's the problem, even if they were similar it shouldn't be used.
> Try changing...
> $(MAKE) CC="$(TARGET_CC)" -C $(@D)
> to
> $(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)
> in package/iproute/iproute2.mk

Yes that was the issue, now it's going further.
I'll send in a patch for it.

Thanks for the help!

It now blows up because it can't find xtables.h. Seems like the  
external toolchain (ct-ng 1.9.0) didn't include that from the kernel.
I'll do some more testing on it.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
