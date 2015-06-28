From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 17:36:14 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <5581FE10.8090103@mind.be>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
 <20150615111757.03ec0b48@free-electrons.com> <5581FE10.8090103@mind.be>
Message-ID: <CAHkwnC_PvCceELLUyeUoM0BEq9Pg3vJQS8TDMjeWiU9kcuZQ4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 18, 2015 at 1:09 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/15/15 11:17, Thomas Petazzoni wrote:
> [snip]
>> Also, and while this is definitely reaching much further than doing
>> top-level parallel build, I'm wondering if we shouldn't do the
>> Buildroot builds within a well-controlled chroot. This would allow us
>> to control the host environment, and ultimately cache the build results
>> and re-use them across builds. This is clearly not simple, as we need
>> to capture all the dependencies that have been built, their version,
>> their configuration, etc. I have no idea if it is reasonable to do that
>> in Buildroot, or if it is really too complicated to be compatible with
>> the "keep it simple" principle of Buildroot.
>
>  That starts to smell more and more like NixOS... I.e., too complicated for
> buildroot. But if someone proposes a patch and its diffstat looks acceptable,
> the option is of course still open.

Maybe at least initially can be solved using an external script that
prepare the system and launch buildroot inside the chroot.

BR
-- 
Fabio Porcedda
