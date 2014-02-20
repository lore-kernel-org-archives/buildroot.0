From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 20 Feb 2014 16:04:03 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <530615B1.1000205@mind.be>
References: <20140220095550.GA16493@pc-eric>
 <CAAXf6LXRsk=roB4ogDfjcHwPZKB2YCUraR34bV3qi72ewuvK1A@mail.gmail.com>
 <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
 <CAAXf6LWybp29EWQM6AsTPJ0r=PS1AYfU6ZmkYm3jEutxoZ8LEg@mail.gmail.com>
 <530615B1.1000205@mind.be>
Message-ID: <CAAXf6LW5iCFe7nQRrJkdSnEqy2+v0_A61jbShMHZPCPY1LGOMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 20, 2014 at 3:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/02/14 15:28, Thomas De Schampheleire wrote:
>> Hi Fabio,
>>
>> On Thu, Feb 20, 2014 at 3:13 PM, Fabio Porcedda
>> <fabio.porcedda@gmail.com> wrote:
>> [..]
>>>
>>> Yes, it's a thing to fix for proper parallel bulding support, it's on
>>> my todo list.
>>>
>>> The targets target-finalize, target-purgelocales,
>>> target-generatelocales, toolchain-eclipse-register can be executed in
>>> parallel after building the generic targets?
>>
>> Since you can select both purgelocales and generatelocales, I would
>> expect they need to be sequential: first purge then generate (as done
>> today).
>
>  True.
>
>> I'd also expect that target-finalize should be finished before
>> starting the locale stuff, as the post-build script or overlay may add
>> additional locale stuff that needs to be purged.
>
>  Hm, I would actually expect the reverse: whatever my post-build script
> or overlay does should be final, and not be removed again by
> purgelocales. But that is in fact not what happens at the moment.

I also had the same doubt, but what I wrote is just to mimic the
non-parallel behavior.
The changing of the order of locale stuff and post-build is not
related to the parallel build.

Best regards,
Thomas
