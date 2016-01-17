From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 17 Jan 2016 11:33:43 -0500
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117122340.3b07b5ed@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <CA+-urNTGae35+MuvCzE3UE0POL0NJxfGRciXaZf8ohDdq_a-RQ@mail.gmail.com>
 <20160117122340.3b07b5ed@free-electrons.com>
Message-ID: <CA+-urNSaEmBp=wsP_kjzk=63T3xt+9wBY-yLJzsXagi5QH2iQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jan 17, 2016 at 6:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 16 Jan 2016 20:42:55 -0500, Frank Hunleth wrote:
>
>> > Frank, can you investigate why it builds on x86_64 but not on aarch64 ?
>>
>> I looked into this a little. My suspicion is that the atomic intrinsic
>> macros in the Erlang code have not been ported to aarch64, but I'm
>> having trouble following the code. I've inquired on the Erlang mailing
>> list and will report back.

It turns out that other people have gotten Erlang to work on aarch64
without libatomic_ops installed. That doesn't work for Buildroot since
other programs could depend on libatomic_ops. I've filed a bug against
Erlang to track this at http://bugs.erlang.org/browse/ERL-78.
Specifying '--disable-native-ethr-impls' to ./configure seems to
workaround the issue, but I don't know if it has other consequences.
Hopefully the Erlang maintainers will get to this sooner rather than
later, but they're a pretty busy group.

Regards,
Frank

>
> Excellent, thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
