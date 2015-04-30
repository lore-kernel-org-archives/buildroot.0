From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 30 Apr 2015 15:43:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 4.0.1
In-Reply-To: <874mnxwxc2.fsf@dell.be.48ers.dk>
References: <1430379540-4459-1-git-send-email-angelo.compagnucci@gmail.com>
 <1430379540-4459-3-git-send-email-angelo.compagnucci@gmail.com>
 <874mnxwxc2.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VkjBRTxHWirfCubhyaADuio5RJcJNN4A5M842E=xJ-Xiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,


2015-04-30 15:38 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch:
>  > * bumps mono version to 4.0.1.
>  > * Removes no more needed patches included upstream
>  > * Removes profile switches no more present in configure
>
> So what does that mean? Does it build all profiles or are some of them
> dropped upstream?

"We no longer build the reference assemblies for the .NET 2.0, .NET
3.5 or .NET 4.0 APIs, we now ship binaries of the reference assemblies
(API contracts, without any actual executable code in them).
Mono will now only build the .NET 4.5 assemblies as well as the
mobile-based profiles."

So older mono software will run unmodified on mono 4 without having
old assemblies around.

>
>  >        http://download.mono-project.com/sources/mono/
>
>  > -if BR2_PACKAGE_MONO
>  > -
>  > -config BR2_PACKAGE_MONO_20
>  > -    bool "2.0/3.5 .Net Runtime"
>  > -    help
>  > -      This option enables the installation of the 2.0/3.5 version
>  > -      of the Mono .Net runtime to the target
>  > -
>  > -config BR2_PACKAGE_MONO_40
>  > -    bool "4.0 .Net Runtime"
>  > -    help
>  > -      This option enables the installation of the 4.0 version
>  > -      of the Mono .Net runtime to the target
>  > -
>  > -config BR2_PACKAGE_MONO_45
>  > -    bool "4.5 .Net Runtime"
>  > -    help
>  > -      This option enables the installation of the 4.5 version
>  > -      of the Mono .Net runtime to the target
>  > -
>  > -endif
>  > -
>  >  comment "mono needs a toolchain w/ IPv6, threads"
>  >      depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
>
> It doesn't apply:
>
> Applying patch #466431 using 'git am -s3'
> Description: [2/2] package/mono: bump to version 4.0.1
> Applying: package/mono: bump to version 4.0.1
> Using index info to reconstruct a base tree...
> M       package/mono/Config.in
> Falling back to patching base and 3-way merge...
> Auto-merging package/mono/Config.in
> CONFLICT (content): Merge conflict in package/mono/Config.in
> Removing package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch
> Removing package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch
> Removing package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
> Failed to merge in the changes.
> Patch failed at 0001 package/mono: bump to version 4.0.1
> The copy of the patch that failed is found in:
>    /home/peko/source/buildroot/.git/rebase-apply/patch
>
>
> Judging from the IPv6 comment above it seems like your tree is now
> uptodate. Could you please rebase your patches against HEAD and resend?

Ouch! Probably it was changed right under my nose!

Will resend in minutes!

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
