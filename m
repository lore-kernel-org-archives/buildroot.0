From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 24 Oct 2015 15:16:52 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix
 build issue with some toolchains
In-Reply-To: <20151024122806.GA3632@free.fr>
References: <20151019210337.3699681DEC@busybox.osuosl.org>
 <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
 <20151024122806.GA3632@free.fr>
Message-ID: <CAEYzJUHSNkf1644CWs6u8bo8+q31G0bKmMBv1hj6rJXbsKfaPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 24 October 2015 at 14:28, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Bj?rn, All,
>
> On 2015-10-24 14:01 +0200, Bj?rn Forsman spake thusly:
>> This patch caused an unfortunate regression that prevents any handlers
>> from being registered (runtime issue).
>> This means it cannot perform any update. Upstream has reverted it.
>>
>> See discussion:
>> https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ
>
> Care to send a rever for it, please?

Done.

> Also, if you can disable the package for the affected toolchains and/or
> architectures, that would be great as well.

That's more difficult: I'm not sure of the exact set is. I might
disable too much.

The original commit mentions these autobuild errors:

http://autobuild.buildroot.net/results/de9/de920298075d32f3de83a0cfb7417846eb833425/
http://autobuild.buildroot.net/results/975/975915aa33005806e78260bae385cd4b3e359ca8/
http://autobuild.buildroot.net/results/c54/c54e7a2ea353d95d41a1e966de0dffa7b6ac432e/
http://autobuild.buildroot.net/results/019/0198596ebfed05ab86552b628da2274d55bf42ae/

but also say that there are "many more". I _think_ the commonality is
BR2_MIPS_NABI64=y, but then again the commit message also mentions
issues on x86-64, but I didn't see that in the above autobuild
configs.

> Thanks for the report! :-)

No problem :-)

- Bj?rn
