From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Nov 2014 10:19:15 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <546FD581.8000206@openwide.fr>
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
 <CAHXCMM+WdJe+pHi4GNi7QT9Vd=43LoRzXhU05byPPZ5uLRT=Ww@mail.gmail.com>
 <546792E3.5060007@openwide.fr>
 <CAHXCMMKm5G9VgK4Jj5z711fcPdjLFdhbvFVO0iBaduFT8pCq1w@mail.gmail.com>
 <546FD581.8000206@openwide.fr>
Message-ID: <CAHXCMMJ_cpaVxZhPuwuUxVzOM4=2bYVgKcW2pJodF=FHaD92MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 22, 2014 at 1:14 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Samuel, Volker,
>
> Le 15/11/2014 19:20, Samuel Martin a ?crit :
>> Romain, Volker,
>>
>> On Sat, Nov 15, 2014 at 6:52 PM, Romain Naour <romain.naour@openwide.fr> wrote:
>>> Hi Volker,
>>>
>>> Le 15/11/2014 18:26, Samuel Martin a ?crit :
>>>> Hi Volker,
>>>>
>>>> On Sat, Nov 15, 2014 at 5:00 PM, Volker Krause <volker.krause@kdab.com> wrote:
>>>>> This is rarely needed by packages, but convenient to have when it is.
>>>>>
>>>
>>> There is only one package (openpowerlink) that set this variable in buildroot
>>> and the expected value is "x86" or "x86_64".
>>
>> Hmm... this is in the openpowerlink source?
>> I think it'd better do (to be more robust):
>> ---
>> string(REGEX REPLACE "i*86" "x86" CMAKE_SYSTEM_PROCESSOR
>> ${CMAKE_SYSTEM_PROCESSOR})
>> ---
>> But that's another story ;-)
>
> I used "if(CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")" instead, because the meaning of
> * is not the same as in shell. I had "i6x86"...

Good catch!

>
> I found "^i.86$" in cmake sources:
> http://www.cmake.org/gitweb?p=cmake.git;a=blob;f=Modules/FindJNI.cmake;h=3dcb0d0aaf019a69766b26db36ddbdab6aee3fa7;hb=HEAD#l46
>
> I send a patch to fix that in openpowerlink sources:
> http://patchwork.ozlabs.org/patch/413219/
>
> Best regards,
> --
> Romain Naour
>
> OPEN WIDE Ing?nierie - Paris
> 23/25, rue Daviel| 75013 PARIS
> http://ingenierie.openwide.fr
>
> Le blog des technologies libres et embarqu?es :
> http://www.linuxembedded.fr



-- 
Samuel
