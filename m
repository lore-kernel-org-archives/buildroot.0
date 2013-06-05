From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Jun 2013 15:02:06 +0100
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <877gi8ekf6.fsf@dell.be.48ers.dk>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8iPpv-_t2-M2zbbqAvGvLJBES=fvkC6nUgy1MLGLqqhEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2013 14:50, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
>  Markos> From: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> Several object files are shared between the libbz2.so shared library
>  Markos> and the libbz2.a static one. MIPS will refuce to build a relocatable
>  Markos> object when creating a new shared library with the following error:
>
>  Markos> blocksort.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used
>  Markos> when making a shared object; recompile with -fPIC
>
>  Markos> This is because these files are build without -fPIC when creating the
>  Markos> static library and later on they are used to build the shared one.
>
>  Markos> This is easily fixed if we add the shared library build rule before
>  Markos> creating the static library so object files are always compiled with
>  Markos> -fPIC.
>
> This works, but is afaik less efficient for the static lib case.
>
> The real fix is imho to build the object files twice, like how libtool
> does it.
>
> If you look at the Debian package, they work around it by adding a
> seperate .c -> .sho build rule, which adds -fPIC, and then link the .so
> file with the .sho files instead.
>
> --
> Bye, Peter Korsgaard

Hi Peter,

Ok I will send a new patch based on the debian patch.

--
Regards,
Markos Chandras
