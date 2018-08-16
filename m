From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 16 Aug 2018 21:52:25 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <20180816001829.3f7a1436@windsurf>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf> <87ftzf9v7u.fsf@dell.be.48ers.dk>
 <20180816001829.3f7a1436@windsurf>
Message-ID: <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2018-08-16 0:18 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Wed, 15 Aug 2018 23:27:17 +0200, Peter Korsgaard wrote:
>
>>  >> Perhaps we could backport the changes and add as patches for the
>>  >> affected defconfigs?
>>
>>  > The problem is that it will still affect anyone doing a U-Boot build,
>>  > outside of the defconfigs.
>>
>> Ok. Is this a new failure introduced by something we do
>> wrong/differently in Buildroot, or just something that is broken by
>> building with newer compilers?
>
> I don't think it's related to building with new compilers. It's just
> some U-Boot versions that are broken if libfdt headers are already
> available in the include path.
>

I can try to have a look somewhere next week.

From the previous solution, I have a feeling that we can only go so
far in trying to solve the issue from Buildroot. We did already one
thing, and it seems insufficient for some u-boot versions.
There is a risk that what we do to fix these new failures, may break
some of those that work today.
We could implement some kind of detection to see how we need to solve
the issue depending on the u-boot at hand, but it could be cumbersome.

An alternative solution is to document the known solution to this
problem (the patches). We can apply these patches to the defconfigs
inside buildroot, and let users with custom u-boots apply the patches
themselves (i.e. make them aware from release notes or documentation
but don't solve it automatically).

Best regards,
Thomas
