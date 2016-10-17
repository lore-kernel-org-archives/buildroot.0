From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Oct 2016 22:48:14 +0200
Subject: [Buildroot] [PATCH v11 4/4] core: only remove O from
	MAKEOVERRIDES
In-Reply-To: <2e3bb5cb-3101-ab44-da26-37ac0226a3d4@mind.be>
References: <20161016115423.17881-1-s.martin49@gmail.com>
 <20161016115423.17881-5-s.martin49@gmail.com>
 <2e3bb5cb-3101-ab44-da26-37ac0226a3d4@mind.be>
Message-ID: <CAHXCMMKbTnchbsUyBgw=pNMe4zYKv-V51DgEENG2qm4f43fezw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 16, 2016 at 7:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 16-10-16 13:54, Samuel Martin wrote:
>> For no apparent reason, MAKEOVERRIDES is not treated the same way
>> depending on whether O is set or not on the command line:
>> * when O is set on the command line (i.e. out-of-tree build): all
>>   variables were stripped away from MAKEOVERRIDES;
>> * when O is not set on the command line (i.e. in-Buildroot-source-tree
>>   build): all variables are kept and forwarded to the sub-make call.
>>
>> This change cleans things up by only removing the relevant variables
>> from MAKEOVERRIDES when appropriate (i.e. removing O from MAKEOVERRIDES
>> when O is set on the command line) keeping all other variables as-is in the
>> sub-make call; O is set on the sub-make call anyway.
>
>  I'm not sure about this one. Clearing MAKEOVERRIDES makes sure that whatever we
> set on the commandline of Buildroot's make will not get passed down to
> sub-makes. I don't see anything for which it would be useful to pass it down to
> sub-makes as commandline overrides.
>
>  Note that whatever we specify on the command line will be passed down in two
> ways (unless it's overridden by the Makefile, like is done for O): it is passed
> in the environment, and it is passed in MAKEFLAGS in the environment. So even if
> we clear MAKEOVERRIDES, things still get passed down but just in the environment.

Interesting, I did not know that.

>
>  So, I don't see a good reason to apply this patch.

Fair enough.

Regards,


-- 
Samuel
