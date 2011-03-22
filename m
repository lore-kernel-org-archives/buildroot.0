From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Mar 2011 21:55:02 +0200
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D88F97B.4060605@michaelburghart.de>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
Message-ID: <20110322195502.GA8662@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Tue, Mar 22, 2011 at 08:33:15PM +0100, Michael Burghart wrote:
> what I do not understand: I get the following error:
> 
> make[4]: Entering directory
> `/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
> ./dftables
> /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c
> make[4]: ./dftables: Kommando nicht gefunden
> 
> 
> So I tried it manually and did a cd into the directory:
> cd /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/
> 
> then I invoked the dftables command manually:
> ./dftables
> /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c
> 
> got "File not found":
> - -bash: ./dftables: Datei oder Verzeichnis nicht gefunden
> 
> Did a ls on that file and it exists! So why did it produce an "File not
> foound" error
> mb at einstein:/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre> ls
> - -l ./dftables
> - -rwxr-xr-x 1 mb users 8015 22. M?r 15:18 ./dftables
> 
> 
> How can that be? I am really puzzled now...

Quoting the execve(2) man page:

       ENOENT The  file  filename  or  a script or ELF interpreter does not exist, or a
              shared library needed for file or interpreter cannot be found.

This means that the format of the executable is wrong. What is the output of 
'file dftables'?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
