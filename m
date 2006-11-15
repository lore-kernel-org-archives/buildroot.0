From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Wed, 15 Nov 2006 07:20:33 -0800 (PST)
Subject: [Buildroot] C++ cross compiler
In-Reply-To: <loom.20061115T152329-249@post.gmane.org>
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
	<loom.20061115T152329-249@post.gmane.org>
Message-ID: <24139.82.171.61.116.1163604033.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,
   The build completes without an error, just no
arm-linux-g++ compiler gets built.  So I'm not sure
if the patch would fix the problem.

Nina


>  <nina.holly@...> writes:
>
>>
>> Hi,
>>     Is it possible to generate a C++ (g++) cross compiler
>> for ARM usng buildroot?  I have been able to generate
>> a GCC cross compiler for ARM using buildroot.
>>
>> Thanks for any pointers.
>>
>> Nina
>>
> This is in make menuconfig: Toolchain options: Build/install
> c++ compiler and libstdc++
>
> Also, if you get the problem raised here:
> http://bugs.uclibc.org/view.php?id=904
>
> applying the patch in the first Note solves the problem.
> http://gcc.gnu.org/bugzilla/attachment.cgi?id=6132
>
> Method: save the text of the patch from the link, as something like
> libstdc++-3.4.0-uclibc.patch and then copy the file to
> toolchain/gcc/<version>/
>
> You will need to repatch & rebuild the toolchain ... make dirclean first.
>
> Regards,
> MikeW
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
