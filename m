From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 26 May 2013 22:37:35 +0200
Subject: [Buildroot] [PATCH] Depend autotools targets on host-ccache
 when BR2_CCACHE is enabled.
In-Reply-To: <20130526194813.51f8e9bb@skate>
References: <201209061737.32826.rasasi78@gmail.com>
 <CAHXCMM+ho8PGrmePj9jU6vMurz1HeQXv1N99ZbLPusFJQxv4sw@mail.gmail.com>
 <20130526174406.30da6ad8@skate> <20130526190051.2fcbee44@skate>
 <CAHXCMMKHE+quVdK=HncViWGO=B38ncFKnBwvgn2AVLsW40KHFQ@mail.gmail.com>
 <20130526194813.51f8e9bb@skate>
Message-ID: <CAHXCMM+FgoVy61Nkr6QxGzT+pX4yNY4RTVuVa=JPM3kMBvJb-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2013/5/26 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Sun, 26 May 2013 19:44:33 +0200, Samuel Martin wrote:
>
>> In these cases, I rather suggest to build either a whole "small"
>> config, or at least the toolchain
>> before tweaking anything (packages, kernel or bootloader).
>>
>> Note that if we want to allow this use case, it may require adding BASE_TARGETS
>> to all *-menuconfig and packages' targets.
>>
>> I think we don't want to go this way.
>
> Being able to do "make linux-menuconfig" right after "make menuconfig"
> is a quite important use case, IMO. We should support that I believe.
>
> linux-menuconfig already depends on "dirs" so that it can work properly
> when ran after "make menuconfig" (when ccache is not enabled). But I
> see that it also depends on linux-configure. Maybe we just need to make
> the *-extract of all packages depend on $(BASE_TARGETS) or something
> like that?
>
Indeed, something like that seems doing the tricks :)

I'll cook a patch and submit it.

Regards,

-- 
Samuel
