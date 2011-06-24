From: Matias Garcia <mgarcia@rossvideo.com>
Date: Fri, 24 Jun 2011 13:31:26 -0400
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
Message-ID: <4E04C9EE.4050206@rossvideo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Raymond,

You can put those in the BR2_TARGET_OPTIMIZATIONS setting under the 
Toolchain page e.g.

(-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double)  
Target Optimizations

I selected a generic powerpc target because I didn't need the -mtune 
when I was specifying -mcpu already. As far as I know, 8548 and 8540 
work out to the same code.

I switched to the external CodeSourcery build tools for two reasons: (1) 
it allowed us to compile our application with -O3 (which we need) while 
the standard GNU toolchain caused some errors, and (2) they're supported 
by the Freescale/Mentor/CodeSourcery relationship, and not all of the 
patches get applied to mainline (particularly for newer processors). I 
had to add an option to the external wrapper so that it would call the 
toolchain with '-te500v2' which is a shortcut for the optimizations you 
list below. In that case, you can build your own applications without 
calling any options explicitly.

Cheers,
Matias

On 11-06-24 10:27 AM, raymond zhao wrote:
> Hi,
> I am using freescale's p1020 CPU. It is a e500v2 core. How could I
> config the build root to tune the tool chain for the following
> options:
>
> -mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double
>
>  From the menuconfig, I can only select CPU as 8540.
>
> Thanks,
>
> Raymond
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
