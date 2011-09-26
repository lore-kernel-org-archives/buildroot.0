From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2011 09:44:59 +0300
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <87mxdsxpe8.fsf@macbook.be.48ers.dk>
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 <87mxdsxpe8.fsf@macbook.be.48ers.dk>
Message-ID: <20110926064459.GB28996@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Sep 25, 2011 at 11:50:39PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  Baruch> Add the C++ Portable Components libraries.
> 
>  Baruch> The Data/ODBC components is disabled because its dependency
>  Baruch> (unixODBC) is not in Buildroot.
> 
>  Baruch> The Data/MySQL component is build tested only. It probably requires an
>  Baruch> additional RPATH to actually run, because libmysqlclient resides in a
>  Baruch> non-standard location under /usr/lib/mysql.
> 
> Thanks, a few comments:

[snip]

> With those changes it builds until it gets to the FPU stuff, which
> breaks on (atleast) ARM:
> 
> .. -c src/FPEnvironment.cpp -o /home/peko/source/buildroot/output/build/poco-1.4.2/Foundation/obj/Linux/arm/release_shared/FPEnvironment.o
> In file included from src/FPEnvironment_C99.cpp:37,
>                  from src/FPEnvironment.cpp:48:
> include/Poco/FPEnvironment_C99.h:56: error: 'FE_DOWNWARD' was not declared in this scope
> include/Poco/FPEnvironment_C99.h:57: error: 'FE_UPWARD' was not declared in this scope
> 
> The FE_* macros afaik only supposed to be defined if the arch can
> efficiently handle it, which isn't the case for ARM.

It builds here for ARM (BR2_ARM_TYPE="ARM926T") using the CodeSourcery 
toolchain (with a little toolchain support fix I'll send shortly).

> fenv.h the
> supporting functions are only enabled on uClibc if UCLIBC_HAS_FENV is
> enabled in the .config, which it isn't for our uClibc defconfigs.
> 
> I'm not exactly sure how to fix this. Any ideas?

Is there a way to depend on UCLIBC_HAS_FENV?
Is depending on glibc an option?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
