From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 6 Jul 2017 12:01:53 +0200
Subject: [Buildroot] [PATCH] download: allow for BR2_PRIMARY_SITE(_ONLY)
 environment override
In-Reply-To: <8760f6zynp.fsf@dell.be.48ers.dk>
References: <20170705123359.19116-1-m.niestroj@grinn-global.com>
 <87inj7ym6z.fsf@dell.be.48ers.dk>
 <fc0894de-0269-61e4-5acd-2adbe0007bf9@grinn-global.com>
 <8760f6zynp.fsf@dell.be.48ers.dk>
Message-ID: <0b665ee9-9f6d-f612-1ade-67616281488c@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05.07.2017 17:33, Peter Korsgaard wrote:
>>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:
> 
>   > Hi,
>   > On 05.07.2017 16:48, Peter Korsgaard wrote:
>   >>>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:
>   >>
>   >> > Allow BR2_PRIMARY_SITE and BR2_PRIMARY_SITE_ONLY .config options to be
>   >> > overriden by environment variables with the same names.
>   >>
>   >> > This is usefull for CI build environments, so primary site can be
>   >> > overridden without .config change. That way download can be speeded up
>   >> > if using mirror servers in the same network as CI.
>   >>
>   >> You can already pass these as make arguments (E.G. make
>   >> BR2_PRIMARY_SITE=".."). Is there any real reason why that cannot be used
>   >> by the CI setup instead?
>   >>
> 
>   > 1. Environment variable allows to set this configuration in a single
>   > place, so in case of multiple CI jobs we do not need to modify the
>   > "make" step in each one.
> 
> Ok, but this is just a one-time step, right?

That is right.

> 
>> 2. In case of CI setups that are configured by a file in project git
>   > repository (such as gitlab CI) we do not need to hardcode
>   > BR2_PRIMARY_SITE there.
> 
> You can always do 'make BR2_PRIMARY_SITE="$BR2_PRIMARY_SITE"' to grab
> the value from the environment instead of hardcoding it.

Thanks for that hint. It covers the most desirable use case for me.

> 
>> 3. As a developer I want to have BR2_PRIMARY_SITE set in ~/.bashrc or
>   > something similar, so I do not need to issue
>   > "make BR2_PRIMARY_SITE=some_really_long_uri" every time in multiple
>   > Buildroot projects / board configurations that I have on my workstation.
> 
> We really try to not add any more magic environment variables affecting
> the build.
> 
> You could always add a brmake shell alias in your ~/.bashrc which passes
> these arguments.
> 

I still think that using environment variable with make command instead
of brmake alias is more comfortable for a developer. But I get your
point, so I will not insist on this patch :)

-- 
Regards,
Marcin Niestroj
