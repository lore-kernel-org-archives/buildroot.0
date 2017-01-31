From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 31 Jan 2017 20:43:27 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-29
In-Reply-To: <20170131042747.e5mchgg5btbereoc@tarshish>
References: <20170130072925.E0B0B20CD6@mail.free-electrons.com>
 <CAFOYHZDvPhhUcSn3G3tGG0sOLZcesWJL0a0USCnFT-pbsh=Qhw@mail.gmail.com>
 <20170131042747.e5mchgg5btbereoc@tarshish>
Message-ID: <CAFOYHZAB7EcUYCY6xdHGpx_pZuBaVTkGCAxpOq9Fky7qY1gJGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
On Tue, Jan 31, 2017 at 5:27 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Chris,
>
> On Tue, Jan 31, 2017 at 05:05:05PM +1300, Chris Packham wrote:
>> On Mon, Jan 30, 2017 at 8:29 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> >
>> >          arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/dde54ccefa32af1f46a4af5b6caed822c3209dfc
>>
>> Looks like a common problem with musl-libc not liking applications
>> that include linux headers directly. I've reported the issue upstream
>> https://github.com/appneta/tcpreplay/issues/275 if I get time I'll see
>> if I submit a fix for it.sl
>
> This is a libc/kernel issue. I'm not sure libc users can do much about that.
>
> This build failure is fixed by commit 69ced963555b (musl: workaround kernel
> if_ether.h header conflict). The autobuilder needs a rebuild of its pre-built
> toolchains to take effect.
>

Hmm openwrt went a different way
https://github.com/openwrt/packages/pull/1386/commits/a0968fae

Did you try getting your patch into musl? It seems like a logical fix
but the fact they've got a FAQ on this specific problem makes me think
they must have something against this type of solution.
