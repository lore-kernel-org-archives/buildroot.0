From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 03 Jun 2010 07:37:20 +0200
Subject: [Buildroot] Creating autotargets packages
In-Reply-To: <063801cb02da$42ef0d80$c8cd2880$@pauljones.id.au>
References: <063801cb02da$42ef0d80$c8cd2880$@pauljones.id.au>
Message-ID: <1275543440.9566.15.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 03 juin 2010 ? 15:04 +1000, Paul Jones a ?crit :
> Hi,
> 
>  
> 
> I?m trying to create a package for Mono, which uses the autotools
> build system. I created a simple mono.mk file based on the sample in
> the Buildroot documentation, but I get an error (see below) and I
> don?t know enough about how the build system works to troubleshoot.
> Any pointers would be appreciated!
> 
>  
> 
> >>> mono 2.6.4 Extracting
> 
> >>> mono 2.6.4 Patching package/mono
> 
> for file in config.guess config.sub; do for i in
> $(find /home/peejay/mini2440-dev/buildroot-x86/output/build/mono-2.6.4
> -name $file); do cp package/gnuconfig/$file $i; done; done
> 
> >>>   Patching libtool
> 
>  
> 
> Applying buildroot-libtool.patch using plaintext: 
> 
> patching file ltmain.sh
> 
> Hunk #1 FAILED at 273.
> 
> Hunk #2 succeeded at 5412 (offset 3005 lines).
> 
> Hunk #3 FAILED at 2551.
> 
> Hunk #4 FAILED at 2895.
> 
> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
> 
> Hunk #6 FAILED at 5937.
> 
> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> 
> Patch failed!  Please fix buildroot-libtool.patch!
> 
>  
> 
> Applying buildroot-libtool.patch using plaintext: 
> 
> patching file ltmain.sh
> 
> Hunk #1 FAILED at 273.
> 
> Hunk #2 succeeded at 5412 (offset 3005 lines).
> 
> Hunk #3 FAILED at 2551.
> 
> Hunk #4 FAILED at 2895.
> 
> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
> 
> Hunk #6 FAILED at 5937.
> 
> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> 
> Patch failed!  Please fix buildroot-libtool.patch!
> 

Hi Paul,

It seems the libtool patch does not apply. Add the following line to
your mono.mk :

MONO_LIBTOOL_PATCH = NO

Before 

$(eval $(call AUTOTARGETS,package,mono))

Regards,


-- 
Lionel Landwerlin
