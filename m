From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 27 Jan 2018 21:16:26 -0800
Subject: [Buildroot] Compiling gcc for the target?
In-Reply-To: <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
References: <45535c2a-31b5-8063-d749-926f7c2f023f@longlandclan.id.au>
 <20180128033001.gf7u5ix6twj7dghu@tarshish>
 <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
Message-ID: <CAMo8Bf+=vAWQmx4ciVPD7ZeaN6H4eht1CJr7hWBgKDf1UnMgNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stuart,

On Sat, Jan 27, 2018 at 8:45 PM, Stuart Longland
<stuartl@longlandclan.id.au> wrote:
> In short though, I actually need a root FS with a compiler so that I can
> build software within that environment.  It's a requirement of Gentoo's
> release engineering tool, catalyst.
>
> Basically, I've managed to cross *everything else* I need, except gcc.
> gcc needs gcc to bulid gcc.  Specifically, gcc needs g++? which is even
> worse.
>
>> There used to be support for target toolchain, but this support has been
>> removed long ago. See the FAQ at
>>
>>   https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target
>
> Thats, unfortunate.  I can understand its an atypical use case for
> buildroot and sadly, building gcc seems to be far more difficult than it
> ought to be.

You could build both cross- and cross-native toolchains with crosstool-NG
and then use cross-toolchain as an external toolchain for the buildroot. I did
that for xtensa target architecture.

-- 
Thanks.
-- Max
