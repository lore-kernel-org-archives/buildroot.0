From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Aug 2016 12:35:11 +0300
Subject: [Buildroot] [PATCHv2] package/systemd: fix build with old
 toolchains
In-Reply-To: <1472549377-22268-1-git-send-email-yann.morin.1998@free.fr>
References: <1472549377-22268-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160830093511.ykvjhugty2xhg4rf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Aug 30, 2016 at 11:29:37AM +0200, Yann E. MORIN wrote:
> Toolchains using glibc-2.18 or older do not define O_TMPFILE, which
> causes build failures on some archs.
> 
> systemd has a definition for O_TMPFILE if it is missing, but only
> defines it for i386 or x86_64. Furthermore, the header defining it is
> not included everywhere O_TMPFILE is used.
> 
> Fix that with three patches backported from upstream:
>   - include the needed header where it is needed (he!),
>   - define O_TMPFILE for all archs, according to linux-4.8rc3,
>   - no longer guard against undefined O_TMPFILE in fileio.

This last patch is not a pure build fix, but more of a feature enhancement. 
Don't know if it fits in master.

Also, your patches are missing sign-off.

An autobuild reference in the commit log would also be nice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
