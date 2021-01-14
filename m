From: Mauricio Litinow <mauricio.penteado@litinow.com>
Date: Thu, 14 Jan 2021 15:00:48 +0000
Subject: [Buildroot] Buildroot ARM with Altera FPGA de10-standard
In-Reply-To: <c6f6425d6673f9ae60641de8a595af8d@umbiko.net>
References: <mailman.9.1610539203.245130.buildroot@busybox.net>
 <c6f6425d6673f9ae60641de8a595af8d@umbiko.net>
Message-ID: <2793fb72-6cbf-14b0-ea39-6a18a7b0d489@litinow.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,


Many thanks for your attention.

I have never been able to run Buildroot on my de10-standard card, 
hopefully this situation will change soon.

I was trying to use the Buildroot version 2017 because that info 
described on the bitlog blog is all that I have.


If I change it to use the last version of Buildroot, please can you 
share with me what Terasic document describes the 'Target Options' and 
the 'Toolchain' settings ? It is yet very confused in my mind.


Also, what GCC linaro and kernel headers version should I use with the 
last version of the Buildroot?


Kind regards,

Mauricio


On 14/01/2021 06:08, Andreas Ziegler wrote:
> Hi Mauricio,
>
>> Date: Wed, 13 Jan 2021 10:47:53 +0000
>> Message-ID: <80f01170-5252-b7d6-0095-5c72d958f086@litinow.com>
>
>> Unfortunately, in step 7.1 - "Configuring Buildroot" my terminal hangs
>> out for too much time.
>
>> Please, how long should this step take to finish? Should it be more than
>> 5 days?
>
> Buildroot compiles a few files to display the ncurses menu. With a 
> fresh installation it should be finished in a few seconds.
>
>> Is there some way to enable log messages or building progress messages?
>
> Buildroot outputs compiler warnings on stderr and makefile output on 
> stdout, so you should see something, _unless_ your terminal somehow 
> redirects output. You might check if 'make -v' produces output.
>
> If you need additional output, invoke Buildroot with 'V=1' after the 
> make command. [1]
>
> ? $ make V=1 -C buildroot nconfig
>
> Are you really using Buildroot version 2017? In that case you should 
> switch to a newer version [2]. You do not need architecture or 
> toolchain related commands when invoking Buildroot, this information 
> is entered later under 'Target Options' and 'Toolchain' as outlined in 
> the Terasic document.
>
> Good luck,
> Andreas
>
> [1] https://buildroot.org/downloads/manual/manual.html#make-tips
> [2] https://buildroot.org/download.html
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
