From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 28 Aug 2014 11:51:30 +0200
Subject: [Buildroot] [PATCH 0/4] Use only elfutils package to provide
	the libelf library
In-Reply-To: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
References: <1409219230-17443-1-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <53FEFBA2.3030106@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/08/2014 11:47, Gregory CLEMENT wrote:
> Hi,
> 
> The libelf is currently provided by 2 packages libelf and
> elfutils. The first package provides an old version of the libelf
> which is no more compatible with a recent version of ltrace. Having
> both libraries could lead to the link on the wrong one during the
> build. It is what happened for ltrace.
> 
> To avoid this kind of issue, this patch set switch the dependecy from
> libelf to elfutils and finally removed the elfutils package.
> 
> I built and fully tested ltrace on ARM.
> I built and just ran avrdude on ARM.
> I didn't build kexec-lite.
> 
> Thanks,
> 
> Gregory
> 
> Gregory CLEMENT (4):
>   ltrace: Removes the libelf dependency
>   avrdude: Depend on elfutils instead of libelf to get the libel library
>   kexec-lite: Depends on elfutils instead of libelf to get the libelf
>     library
>   libelf: Removes the package

It seems that this last patch was too heavy:
"Is being held until the list moderator can review it for approval.

The reason it is being held:

    Message body is too big: 383953 bytes with a limit of 300 KB"

Is there a smarter way to create this patch with git?
Actually I am sure there is a smarter way (we can do everything with
git :) )but I don't know it.

> 
>  package/Config.in                               |     1 -
>  package/avrdude/Config.in                       |     2 +-
>  package/avrdude/avrdude.mk                      |     2 +-
>  package/kexec-lite/Config.in                    |     2 +-
>  package/kexec-lite/kexec-lite.mk                |     2 +-
>  package/libelf/Config.in                        |     7 -
>  package/libelf/libelf-0.8.10-Elf64-fixups.patch | 12361 ----------------------
>  package/libelf/libelf.mk                        |    23 -
>  package/ltrace/Config.in                        |     1 -
>  package/ltrace/ltrace.mk                        |     2 +-
>  10 files changed, 5 insertions(+), 12398 deletions(-)
>  delete mode 100644 package/libelf/Config.in
>  delete mode 100644 package/libelf/libelf-0.8.10-Elf64-fixups.patch
>  delete mode 100644 package/libelf/libelf.mk
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
