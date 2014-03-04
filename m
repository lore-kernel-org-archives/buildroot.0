From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 23:19:59 +0100
Subject: [Buildroot] [PATCH v2] kmod: disable --gc-sections ld option
 when building for xtensa
In-Reply-To: <1393965031-25239-1-git-send-email-jcmvbkbc@gmail.com>
References: <1393965031-25239-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140304231959.0c3a2dec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Wed,  5 Mar 2014 00:30:31 +0400, Max Filippov wrote:
> This is a workaround for the following ld issue exhibited by --gc-sections
> option, until a proper fix for binutils is ready:
> 
> ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - instead of patching configure specify that -Wl,--gc-sections is not
>   supported by ld at configure time

Applied, thanks.

I have added in the commit log a link to the autobuilder result which
this commit is fixing, for reference.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
