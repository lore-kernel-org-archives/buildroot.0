From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Nov 2018 12:41:00 +0100
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163-ETpiKCs0B2@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
 <bug-11476-163-ETpiKCs0B2@https.bugs.busybox.net/>
Message-ID: <15a9f365-6533-b286-5a25-ade9d8f291cf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 03/11/2018 ? 12:31, bugzilla at busybox.net a ?crit?:
> https://bugs.busybox.net/show_bug.cgi?id=11476
> 
> --- Comment #6 from romain.naour at gmail.com ---
> (In reply to goldstar611 from comment #5)
> Hi,
> 
> Are you using libitm ?
> If not, you can workaround this issue by disabling libitm with:
> HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
> 
> This issue is trigged with gcc5 + libitm and Fortify_Source.
> I'm able to reproduce it on x86_64.
> 
> Unfortunately, we don't test the toolchain build with all possible options.
> For example, Fortify_Source option is not enabled while building pre-built
> Bootlin toolchains [1]. That's why this issue is only discovered now...
> This is something that can be improved on our side.

There is an interesting issue with Fortify_Source :)

Best regards,
Romain

> 
> Any additional testing are welcome, feel free to run a matrix of PPC big endian
> you are interested in and report to us or upstream if it works or not.
> 
> About gcc5, at some point it will be removed from Buildroot. I can't say when.
> 
> [1] https://toolchains.bootlin.com
> 
> Best regards,
> Romain
> 
