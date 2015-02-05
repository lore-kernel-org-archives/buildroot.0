From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 05 Feb 2015 17:15:13 +0100
Subject: [Buildroot] grub2 failure with gcc-4.9
In-Reply-To: <20150205142015.4318baa2@free-electrons.com>
References: <54D367F9.4060108@free.fr>
 <20150205142015.4318baa2@free-electrons.com>
Message-ID: <54D39711.6010405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 05/02/2015 14:20, Thomas Petazzoni a ?crit :
> Dear Thierry Bultel,
>
> On Thu, 05 Feb 2015 13:54:17 +0100, Thierry Bultel wrote:
>
>> After some (printf) debugging, I found out that when 'loading' the
>> builtin modules at startup, some modules names are corrupted.
>> I am about to get into deeper investigation, but has anyone
>> encountered it ?
>
> Interesting.
>
> First suggestions:
>
>   - try with another gcc 4.9 toolchain (distro toolchain or something)
>
>   - try with different optimization levels (default of Buildroot is -Os,
>     try with -O0 and -O2)
>
> Thomas
>

With gcc-4.9 from Ubuntu

(in grub2.mk, I set TARGET_CC="/usr/bin/gcc" \
	TARGET_CFLAGS="-m32" \
)

... grub hangs.
