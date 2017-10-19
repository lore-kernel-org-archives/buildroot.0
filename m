From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Oct 2017 15:49:23 -0400
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
In-Reply-To: <1194870383.14285518.1508429896191.JavaMail.zimbra@datacom.ind.br>
References: <20171017204407.27704-1-Adamduskett@outlook.com>
 <1508352524.9366.4.camel@embedded.rocks>
 <1194870383.14285518.1508429896191.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAFSsvmqLzKA+gDJVK1SdiSEAmHHuqTJfyQC-f05pi_q40QVBqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Henrique;

On Thu, Oct 19, 2017 at 12:18 PM, Henrique Marks
<henrique.marks@datacom.ind.br> wrote:
> Hello
>
>
>>
>> On Tue, 2017-10-17 at 16:44 -0400, Adam Duskett wrote:
>>> Other changes:
>>> - The coroutine2 library has been removed.  As such it has been removed
>>>   from the boost.mk file, the boost Config.in file, and a new entry has
>>>   been added to Config.in.legacy explaining that it has been removed.
>>>
>>> - Add LICENSE_1_0.txt sha256sum to boost.hash
>>>
>>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>>> ---
>>>  Config.in.legacy         | 6 ++++++
>>>  package/boost/Config.in  | 4 ----
>>>  package/boost/boost.hash | 7 +++++--
>>>  package/boost/boost.mk   | 9 ++++-----
>>>  4 files changed, 15 insertions(+), 11 deletions(-)
>>>
>
> I think this is just wrong, according to boost release notes:
>
> http://www.boost.org/doc/libs/1_65_1/
>
> * This is coroutine, the original one, now deprecated *
>
> Coroutine (deprecated)
> Coroutine library.
>
> Author(s)
> Oliver Kowalke
> First Release
> 1.53.0
> Standard
>
> * This is coroutine2, the new one *
>
> Coroutine2
> (C++11) Coroutine library.
>
> Author(s)
> Oliver Kowalke
> First Release
> 1.59.0
> Standard
>
> I can't find the information coroutine2 has been removed from the release notes.
>
> Please double check this, we use these package :-)
>
If you download the latest boost, and check the libs/coroutine2
folder, there is no longer a src directory.
Trying to build with "--without-libraries=coroutine2" results in the error:
"error: wrong library name 'coroutine2' in the --without-<library> option."

It seems to have been effectively removed!

> --
> Dr. Henrique Marks
> henrique.marks at datacom.ind.br
> R. Am?rica, 1000 - Eldorado do Sul - RS
> CEP: 92990-000 - Brasil
> Fone: +55 51 3933 3000 - Ramal 3466
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Adam
