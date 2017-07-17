From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Jul 2017 13:03:05 +0100
Subject: [Buildroot] [PATCH v6 1/4] infra: add support for MIPS NaN
In-Reply-To: <20170717113412.6306d69a@windsurf>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
 <20170716164000.415ca6f3@windsurf> <20170717113412.6306d69a@windsurf>
Message-ID: <aea83bb8-c45f-527b-3c38-71b98f50cc50@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 17/07/17 10:34, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 16 Jul 2017 16:40:00 +0200, Thomas Petazzoni wrote:
> 
>> Applied to master, thanks!
> 
> This patch is causing some build failures with external toolchains:
> 
>   http://autobuild.buildroot.net/results/ca1/ca1b769709f2566789e0030221c6837af95459f3/build-end.log
> 
>   http://autobuild.buildroot.net/results/970/9700c17425c9a10e4f0b72a0932268274068e64a/build-end.log
> 
> Is it because the gcc of this external toolchain is too old ?

Yes, the -mnan= option was introduced in gcc 4.9.0 by this commit:

0bd32132d471995f3e333138363d1d928a9dde60

The gcc of that external toolchain is 4.8.2.

> What can we do about this ?

I guess we could use an option called BR2_GCC_SUPPORTS_MNAN in order to
avoid adding the -mnan option to the CFLAGS and to the tc-wrapper if the
external toolchain hasn't selected that option. For internal toolchain,
since the oldest gcc version we support is 4.9.4, then it should be
always selected.

Vincent

> 
> Best regards,
> 
> Thomas
> 
