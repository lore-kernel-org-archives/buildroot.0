From: Will Newton <will.newton@gmail.com>
Date: Sat, 26 Jul 2014 19:57:43 +0100
Subject: [Buildroot] Linaro toolchains no good for ARM softfp?
In-Reply-To: <CANxTyt4MwgdRLP7m_Vt_S78kgdbvqOqU07cVfU=UtnFgTaS7Rw@mail.gmail.com>
References: <CANxTyt4MwgdRLP7m_Vt_S78kgdbvqOqU07cVfU=UtnFgTaS7Rw@mail.gmail.com>
Message-ID: <CAFbHwiS_fBvZ8coXeUq3xNFF85MskKMR7dVy8KDLpqUen1=UXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 26, 2014 at 7:15 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> All,
>
> Back in buildroot-2013.xx, I was able to select the Linaro toolchains
> for my ARM Cortex-A8 processor with softfp (just for experiment
> against a modern toolchain, not really for everyday use in my
> projects).  But now, the Linaro toolchains are only allowed if the
> ABIhf option is set.  When I google around, I get to places like
> https://wiki.linaro.org/WorkingGroups/ToolChain/FAQ#Does_Linaro_GCC_toolchain_support_Cortex-A7_along_with_NEONv2_.26_VFPv4.3F
> which make me think that Linaro is not limited to hard fp.  Not so?

Linaro has traditionally supported both hard and soft float in its
toolchains with multilibs. However due to the way this multilib is
handled being non-standard and not upstream teh patch enabling it has
been dropped from the 4.9 based toolchains. So yes, it was possible
but not any more.
