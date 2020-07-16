From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 16 Jul 2020 23:28:17 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: bad startup
 file names
In-Reply-To: <87sgdrs9r2.fsf@dell.be.48ers.dk>
References: <20200626104116.3412-1-sveyret@gmail.com>
 <87sgdrs9r2.fsf@dell.be.48ers.dk>
Message-ID: <20200716232817.753c7b99@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 16 Jul 2020 18:30:25 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "St?phane" == St?phane Veyret <sveyret@gmail.com> writes:  
> 
>  > When booting, a Raspberry Pi will load the appropriate start files,
>  > depending on the provided configuration. For example, if the config.txt
>  > file contains ?gpu_mem=16? the board will automatically load the
>  > cut-down startup files (start_cd.elf and fixup_cd.dat on non-Rpi4).  
> 
>  > Unfortunately, even when the appropriate version is selected in the
>  > configuration menu, if the rpi-firmware makefile takes the good files,
>  > it renames them to non-qualified, i.e. start.elf and fixup.dat. But as
>  > these are not the files searched by the Raspberry Pi, the board will not
>  > start.  
> 
>  > This patch will set the names of the files to load as constant in the
>  > config.txt file. This guarantees that the rpi firmware blobs do not take
>  > any other corner-case decision based on any other as-yet unknown
>  > conditions.  
> 
>  > This eases the maintenance, as only the names of the source files
>  > matter; the destination filenames are constants, and so are the
>  > filenames in config.txt.  
> 
>  > Fixes: #13026  
> 
>  > Signed-off-by: St?phane Veyret <sveyret@gmail.com>  
> 
>  > ---
>  > Changes v2 -> v3:
>  >   - factorization of start file copy, rework on code (suggested by
>  >     Yann E. MORIN).
>  > Changes v1 -> v2:
>  >   - update config.txt instead of keeping firmware name (suggested by
>  >     Yann E. MORIN).  
> 
> Committed to 2020.02.x and 2020.05.x, thanks.
> 

This one needs [1] too...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=59c3426c5197fc2df1c8307543ed54edbb22f595
