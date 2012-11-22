From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 22 Nov 2012 12:18:05 +0100
Subject: [Buildroot] crosstools build fails when hard fpu is selected
In-Reply-To: <20121122095217.7408e82a@skate>
References: <50ACAB98.90607@wanadoo.fr> <20121121132549.7c180f2f@skate>
 <50ADE660.6000802@wanadoo.fr> <20121122095217.7408e82a@skate>
Message-ID: <50AE09ED.5000007@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 22/11/2012 09:52, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Thu, 22 Nov 2012 09:46:24 +0100, Thierry Bultel wrote:
>
>> I thought that is was due to the fact that the "Use soft float by
>> default" option was not available when using an external toolchain (why
>> ?) but I have the same issue when crosstol-ng is built within buildroot
>> (and the option deselected of course)
>>
>> I am still investigating, but if you have a clue I would appreciate
>
>> /home/tbultel/x-tools/arm-unknown-linux-gnueabi/lib/gcc/arm-unknown-linux-gnueabi/4.6.3/../../../../arm-unknown-linux-gnueabi/bin/ld:
>> error: ../lib/libncurses.so.5.9 uses VFP register arguments,
>> ../obj_s/hardscroll.o does not
>
>  From a quick look, it smells like not everybody has been built with the
> same CFLAGS or something like that. Like part of it has been built with
> hardfp, and some other with softfp. I would think "use VFP register
> arguments" means hardfp (floating point values are passed to functions
> through the floating-point registers). So libncurses.so.5.9 would be
> hardfp, and hardscroll.o would be softfp or soft-float and that cannot
> be linked together.
>
> Are you sure you disabled BR2_SOFT_FLOAT in Buildroot? Check the entire
> build log of ncurses to see which compiler flags are being passed.
>

Yes, I am definitively sure that BR2_SOFT_FLOAT is disabled in my .config
However I have BR2_PREFER_SOFT_FLOAT=y which is automatically set.

Looking at the build log, there are no '-mfpu=' flags at all when 
invoking crosstool's gcc

I do not reproduce the issue with the CodeSourcery as external 
toolchain, letting me think that my crosstool configuration is
wrong.

best regards
Thierry

> Best regards,
>
> Thomas
>
