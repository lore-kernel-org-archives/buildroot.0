From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 15:52:19 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <555884B7.5030806@openwide.fr>
References: <20150517063017.77AD4100D35@stock.ovh.net>
 <20150517124934.20a9c661@free-electrons.com>
 <555884B7.5030806@openwide.fr>
Message-ID: <20150517155219.6acb4d2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 17 May 2015 14:08:23 +0200, Romain Naour wrote:

> >>       xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/c1ef3b4fae3ddf3206ee79141dc36bef50085b6a/
> > 
> > Max, can you have a look at this one?
> 
> There is a patch for this one but with some comment on it:
> http://patchwork.ozlabs.org/patch/470073/
> 
> The proposal was to disable ptrace for xtensa with uClibc/uClibc-ng toolchains,
> but those toolchain can also be fixed by a patch like this one for PowerPC:
> http://git.buildroot.net/buildroot/commit/?id=e0a4d9fa6fa68b95181fbaf1babcbb3cf2c9c63b
> 
> Or better yet, use the upstream commit made by Baruch Siach:
> http://git.uclibc.org/uClibc/commit/?id=de6561f6669308e5d2297589b39a217d4c14df1c
> 
> Waldemar, can you have a look for uClibc-ng ?

Hum, Xtensa is using uClibc master, not uClibc-ng. And Xtensa uses the
uClibc commit 7bf35c8b7d4a1f97174eb49f47f33946b282114c, whic includes
commit de6561f6669308e5d2297589b39a217d4c14df1c.

So why are we seeing the issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
