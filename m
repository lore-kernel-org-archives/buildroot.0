From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 Oct 2014 15:13:13 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-05
In-Reply-To: <20141006094333.211d8a76@free-electrons.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
Message-ID: <5432DBB9.8030507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/06/2014 04:43 AM, Thomas Petazzoni wrote:

>>      powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/ec9f1d7680aa50357d9a6646cef610dcaa1e8041/
> 
> Missing termcap library. Gustavo, maybe ?

Hi.
I'll give this a look, from a quick one "there's no termcap lib" so the
solution would be to just nuke support for it (it tries to automatically
detect it).

>>      powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/3fe67d9760abbb5c9fbcabf8672ec537a4bffa71/
>>      powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/31d4cffaf0541c5dcb21de609dc97c0d303c2111/
> 
> vgdb-invoker-ptrace.c: In function 'waitstopped':
> vgdb-invoker-ptrace.c:319:24: error: 'PTRACE_GETSIGINFO' undeclared (first use in this function)
>           res = ptrace (PTRACE_GETSIGINFO, pid, NULL, newsiginfo);
>                         ^
> 
> Missing uClibc definitions it seems. Gustavo ?

ptrace support for powerpc is incomplete in uclibc (same problem that
affected enlightenment in commit 37acd25ee1376de5734415ac60be16991ee6d150).
I'll try to work around it even though patches to fix it are already in
upstream uclibc/uclibc-ng since it won't cover external toolchains.
Regards.
