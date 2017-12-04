From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Dec 2017 21:33:58 +0100
Subject: [Buildroot] status of odroidc2's support?
In-Reply-To: <20171204112421.275a5e06@windsurf.lan>
References: <trinity-8c598823-c6de-4b88-91b4-43ba7c4de257-1512369327653@3c-app-mailcom-bs14>
 <20171204091310.5295266f@windsurf.home>
 <trinity-c7b00df8-109a-4988-8762-2b7898dda327-1512376040564@3c-app-mailcom-bs15>
 <20171204112421.275a5e06@windsurf.lan>
Message-ID: <20171204203358.GA3832@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, daggs, All,

On 2017-12-04 11:24 +0100, Thomas Petazzoni spake thusly:
> On Mon, 4 Dec 2017 09:27:20 +0100, daggs wrote:
> > strange, when running menuconfig, I see only gcc 6 and gcc 7 in the version selection menu. what am I missing?
> > I think the branch already supports gcc5
> 
> Meh, it's the recent introduction of Cortex-A35 (commit
> e9960da6ec84d0fc4f3d7ef8d9db5b1e29d79358 from Yann, added in Cc) that
> broke this.
> 
> Due to this commit, Cortex-A35 is now the first AArch64 core, and
> therefore the one selected by default instead of Cortex-A53.
> 
> So, a defconfig that has just
> 
> BR2_aarch64=y
> 
> will now build for Cortex-A35 instead of Cortex-A53. However,
> Cortex-A35 support was only added in gcc 6.x, so only gcc 6.x/7.x are
> allowed.
> 
> Dagg, you can for now fix that by selecting Cortex-A53 explicitly in
> your defconfig:
> 
> BR2_aarch64=y
> BR2_cortex_a53=y
> 
> Yann, do you think we should add a "default BR2_cortex_a53 if
> BR2_aarch64 || BR2_aarch64eb" in the choice ?

Yes, adding a better default value makes sense.

The re-organisation was so that the list gets sorted. It is not an
endosement of a better default.

I'll send a patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
