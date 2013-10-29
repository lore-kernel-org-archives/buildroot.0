From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 29 Oct 2013 12:06:03 +0100
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <CAAXf6LVCHQQrheFikG=dS+xGdPgPBXQq4hJbQEKJ6GQY817OMA@mail.gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
 <52683BBC.7070506@mind.be>
 <CAHkwnC_3oA+DKkUxVweB0Xt5wqWt11epFujXvmStEu25hGQNOA@mail.gmail.com>
 <5268F861.6050803@mind.be>
 <CAHkwnC9s0ZqVoE-5pZFwxb4adFw0hD3+SxrF4ri7jStbxypjTA@mail.gmail.com>
 <526A27FA.10602@mind.be>
 <CAHkwnC9z_ySjX_dW3cfj-zDS1rz2_NDeh43n7YTk_JLgrAGJ=A@mail.gmail.com>
 <CAHkwnC-aOXqGYFmurSNGRmRw60KJWSPc2upe66QjC+Mz6SX50g@mail.gmail.com>
 <CAAXf6LVCHQQrheFikG=dS+xGdPgPBXQq4hJbQEKJ6GQY817OMA@mail.gmail.com>
Message-ID: <CAHkwnC_33h8rz=xC3gT1MLXxN4cB=dogJs3Ff+zKKvLbqcHq5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 29, 2013 at 10:35 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Fabio,
>
> On Tue, Oct 29, 2013 at 9:36 AM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
> [..]
>>>>  Have you tested it with various combinations of dependencies?
>>>
>>> I've tested enabling "BR2_CCACHE" and "BR2_STRIP_sstrip" with
>>> qemu_x86_defconfig and seems works fine.
>>> The circular dependencies are gone.
>>> I think the patch now does not introduce any regression.
>>>
>>> I'm testing the whole patch set with top-level parallel make and
>>> enabling "BR2_CCACHE" and "BR2_STRIP_sstrip".
>>
>> The update patch seems to works fine.
>> I found only an issue when enabling top-level parallel make and
>> disabling /usr/bin/xz,
>> but that is not a regression and it's an issue to solve with another patch.
>>
>
> Can you elaborate on this? What is the problem you're seeing exactly,
> and how did you 'disable /usr/bin/xz' ?
To disable /usr/bin/xz i've just renamed it so buildroot doesn't find
a suitable xz.
The host-ccache source file is a tar.xz so the host-xz is a dependency
of host-ccache.
I need to add a rule to ensure the right order.

> When buildroot cannot find a working xzcat version, it builds one
> itself through host-xz. This should still work in case of parallel
> builds.
> The same principle applies when the 'tar' version on host is
> non-existing or too old.

Yes i think is affected by the same problem.

Thanks
-- 
Fabio Porcedda
