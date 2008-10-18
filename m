From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 18 Oct 2008 22:22:39 +0200
Subject: [Buildroot] i386 target root file system missing directories
In-Reply-To: <COL0-DAV51D06D09F1EBF13F929E6F8D2D0@phx.gbl>
References: <COL0-DAV4103F240DBC50EEFAE20318D2D0@phx.gbl>
	<e4c675870810180052g314a2641oe501318f3a343f62@mail.gmail.com>
	<877i86m5hb.fsf@macbook.be.48ers.dk>
	<COL0-DAV51D06D09F1EBF13F929E6F8D2D0@phx.gbl>
Message-ID: <e4c675870810181322y4d32dfdfve6fb74e15a75b0a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

 removing .root everything goes fine. I used minimal root filesystem
and after I changed but I did not removed .root file flag. I think
this thread could be closed.

 [may be another subject change would arise]

 I have tried many different configurations and I feel root was
bloated then I removed it but buildroot make does not install all
choose packages but just few:

roberto at rafbook:~/gles/buildroot$ du -ks project_build_i586/ugles/root/
22204	project_build_i586/ugles/root/
roberto at rafbook:~/gles/buildroot$ mv -f project_build_i586/ugles/root/
project_build_i586/ugles/root.prev
roberto at rafbook:~/gles/buildroot$ make

[...]

roberto at rafbook:~/gles/buildroot$ du -ks project_build_i586/ugles/root/
5944	project_build_i586/ugles/root/

 I tried 'make help' but it was useless. Have I to 'make clean' and
'make' everything again? It would be a very time consuming approach...

 thanks,
Roberto A. Foglietta

2008/10/18 John Schimandle <john_schimandle@hotmail.com>:
> Roberto,
>
> You have to determine the source of the skeleton to find out where the
> problem is located. It took me a while to find it because of all the
> variable indirection that occurs in buildroot. A simple way to track down
> the problem is to just rebuild the root file system from the root directory
> of build root and then inspect the output of make for the source of the
> skeleton.
>
> rm target_build_ARCH/project/.root  # ARCH and project are specific to your
> buildroot configuration
> make >make.log 2>&1
> grep skeleton make.log
>
> You should see a shell command like
>
> cp -fa ......./target_skeleton  target_build_ARCH/project/root
>
> This will give you the source root directory for your skeleton. You can then
> check the source root directory tree for the missing directories. If the
> directories are located here then there is some other problem where they are
> being removed later in the build process.
>
> I also changed the title on this thread because it is not related to the
> Atmel architecture
>
> Regards,
>
> John
>
> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
> Sent: Saturday, October 18, 2008 5:51 AM
> To: Roberto A. Foglietta
> Cc: John Schimandle; buildroot at uclibc.org
> Subject: Re: [Buildroot] Atmel file system skeleton missing /sys directory
>
>>>>>> "Roberto" == Roberto A Foglietta <roberto.foglietta@gmail.com> writes:
>
> Hi,
>
>  Roberto>  Playing with the i386 target I see /proc /sys and sometime
> Roberto> /usr/lib are missing. The last one in particular when no any
> Roberto> package 'mkdir' it the main 'make' fails in running a 'find'
>  Roberto> in that not existent directory.
>
> Can you be more specific? target/generic/target_skeleton has both /sys,
> /proc and /usr/lib.
>
> --
> Bye, Peter Korsgaard
>
>



-- 
/roberto
