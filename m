From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Fri, 24 Jun 2011 17:14:15 -0400
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <4E04C9EE.4050206@rossvideo.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
 <4E04C9EE.4050206@rossvideo.com>
Message-ID: <BANLkTi=m8QyX9YMrp_eeMUT=SMiU6D6Jbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, Matias
After looked into the scripts. I believe you are right. But somehow I have
problem with building target gdb server when I put this flags there. I am
keep digging now.

thanks

raymond
On Fri, Jun 24, 2011 at 1:31 PM, Matias Garcia <mgarcia@rossvideo.com>wrote:

> Hi Raymond,
>
> You can put those in the BR2_TARGET_OPTIMIZATIONS setting under the
> Toolchain page e.g.
>
> (-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double)  Target
> Optimizations
>
> I selected a generic powerpc target because I didn't need the -mtune when I
> was specifying -mcpu already. As far as I know, 8548 and 8540 work out to
> the same code.
>
> I switched to the external CodeSourcery build tools for two reasons: (1) it
> allowed us to compile our application with -O3 (which we need) while the
> standard GNU toolchain caused some errors, and (2) they're supported by the
> Freescale/Mentor/CodeSourcery relationship, and not all of the patches get
> applied to mainline (particularly for newer processors). I had to add an
> option to the external wrapper so that it would call the toolchain with
> '-te500v2' which is a shortcut for the optimizations you list below. In that
> case, you can build your own applications without calling any options
> explicitly.
>
> Cheers,
> Matias
>
>
> On 11-06-24 10:27 AM, raymond zhao wrote:
>
>> Hi,
>> I am using freescale's p1020 CPU. It is a e500v2 core. How could I
>> config the build root to tune the tool chain for the following
>> options:
>>
>> -mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=double
>>
>>  From the menuconfig, I can only select CPU as 8540.
>>
>> Thanks,
>>
>> Raymond
>> ______________________________**_________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/9bd90154/attachment.html>
