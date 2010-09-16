From: William Wagner <will_wagner@carallon.com>
Date: Thu, 16 Sep 2010 09:03:11 +0100
Subject: [Buildroot] external toolchain question
In-Reply-To: <20100915211903.6097235c@surf>
References: <4C910D9F.2060308@carallon.com> <20100915211903.6097235c@surf>
Message-ID: <4C91CF3F.5050007@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  On 15/09/2010 20:19, Thomas Petazzoni wrote:
> On Wed, 15 Sep 2010 19:17:03 +0100
> William Wagner<will_wagner@carallon.com>  wrote:
>
>> I'm trying to get a crosstool-ng toolchain working and running into a
>> few problems. One thing I found with c++ support was that libstdc++
>> was being copied into target/usr/lib but it was located in
>> staging/lib.
> What's inside staging/ is just a bare copy of the toolchain sysroot. As
> the toolchain sysroot organization depends on the toolchain, libstdc++
> might be located in lib/ or usr/lib in staging.
>
> For the target, I thought that it'd be a good idea to have it under
> usr/lib regardless of whether it was in lib/ or usr/lib/ in the staging
> directory. This is because "essential" applications do not usually
> depend on libstdc++, so the natural location for libsdc++ is usr/lib.
>
> Is it causing any sort of problem for you ?
With libstdc++ in /usr/lib on target but /lib in staging I was getting 
an error in gdb when it tried to load libstdc++, moving the library 
fixed the problem.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
