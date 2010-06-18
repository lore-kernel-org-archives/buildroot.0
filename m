From: Ossy <ossy1980@gmx.net>
Date: Fri, 18 Jun 2010 23:13:48 +0200
Subject: [Buildroot] installing kernel modules fails due to not existing
 directory
In-Reply-To: <4C193741.4010108@gmx.net>
References: <4C193741.4010108@gmx.net>
Message-ID: <4C1BE18C.5010804@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

Just for documenting how I worked around this issue:

I omitted the following options in the linux kernel configuration:
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set

After that modification, the modules were installed successfully into 
the target/lib/modules-2.6.33.X directory (without local suffix).

Kind regards,
Marcus

Am 16.06.2010 22:42, schrieb Ossy:
> Dear buildrootmailinglist,
>
> I wasn't able to run a simple make with linux kernel 2.6.33.X (same
> version as headers). It was not possible to install the modules.
>
> The reason might be this:
> WARNING: Couldn't open directory
> ..buildroot-dev/output/target/lib/modules/2.6.33.5: No such file or
> directory
>
> This directory is indeed not there, but I found:
> ossy at debian-virtual:~/buildroot/buildroot-dev/output/target/lib/modules$ ll
> drwxr-xr-x 3 ossy ossy 86 15. Jun 14:06
> 2.6.33.5-dockstarViaBR-00109-g5fd095b-dirty
> So how do I make sure to use 2.6.33.5 and not the git-generated name?
> Or is it the script which should use the git-generated name?
>
> I tried to create a link, but it was removed after running make.
>
> Thanks for your help.
>
>
> Kind regards,
> Marcus
>
> ...
> DEPMOD 2.6.33.5-dockstarViaBR-00109-g5fd095b-dirty
> make[1]: Leaving directory
> `/home/ossy/buildroot/buildroot-dev/output/build/linux-2.6.33.5'
> + rm -f
> /home/ossy/buildroot/buildroot-dev/output/target/lib/modules/2.6.33.5/build
> /home/ossy/buildroot/buildroot-dev/output/target/lib/mod
> ules/2.6.33.5/source
> +
> /home/ossy/buildroot/buildroot-dev/output/staging/bin/arm-linux-depmod26
> -b /home/ossy/buildroot/buildroot-dev/output/target 2.6.33.5
> WARNING: Couldn't open directory
> /home/ossy/buildroot/buildroot-dev/output/target/lib/modules/2.6.33.5:
> No such file or directory
> FATAL: Could not open
> /home/ossy/buildroot/buildroot-dev/output/target/lib/modules/2.6.33.5/modules.dep.temp
> for writing: No such file or di
> rectory
> make: ***
> [/home/ossy/buildroot/buildroot-dev/output/target/lib/modules/2.6.33.5/modules.dep]
> Fehler 1
> ...
>
>
> ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .git/FETCH_HEAD
> 5fd095b3748115d7cbe89524332e4b310550b7c3 branch 'master' of
> http://git.buildroot.net/buildroot
