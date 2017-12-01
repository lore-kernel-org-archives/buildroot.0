From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 1 Dec 2017 10:43:59 -0500
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <CAJtjsKZ3pesoXori66O93Dnw2_QrkwD0J=9Jnen4ORxbzuYZPA@mail.gmail.com>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <CA+-urNSgFcRjQz1pce9iG-7dxw0_BLC5M1Jt6cvLamqfarstGw@mail.gmail.com>
 <CAJtjsKZ3pesoXori66O93Dnw2_QrkwD0J=9Jnen4ORxbzuYZPA@mail.gmail.com>
Message-ID: <CA+-urNSMAxWzYALvJwW=478ZA6VaAEGYSRmLRaXV6NC-yMHCPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Fri, Dec 1, 2017 at 10:16 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Frank, All,
>
> On Thu, Nov 30, 2017 at 5:31 PM, Frank Hunleth
> <fhunleth@troodon-software.com> wrote:
>>
>> On Thu, Nov 30, 2017 at 10:42 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
>>>
>>> This change bumps the Erlang version from 19.3 to 20.0. As a new major
>>> release, there are a few incompatibilities. Details are here:
>>> http://www.erlang.org/news/114
>>
>> Thanks for doing this. I had been holding on to a nearly identical
>> patch, but it breaks several erlang packages currently in Buildroot.
>> It didn't look easy to fix, and then I got busy. As I'm sure that
>> you're aware, ejabberd builds fine. I don't think there are many of us
>> Erlang/Buildroot users, so if this still breaks erlang packages that
>> you don't use, I'm fine with removing them.
>>
>> Two comments:
>>
>> 1. Do you want to bump to Erlang 20.1 since that's the latest?
>
> No, I tried it but it has a compiler bug that breaks some Erlang
> packages in Buildroot.
> For example, I got the following error in erlang-p1-xmpp package:
> https://bugs.erlang.org/browse/ERL-493
>
> I think it's better to skip OTP 20.1 for now.
>
> I'm not aware of Erlang packages that are broken by OTP 20.0. So same
> question as Thomas's one, what are those packages?

My mistake. I ran into the compiler bug too, but looking back at my
experiment, it was OTP 20.1 and not OTP 20.0. I'd have to rerun
everything to get the list of errors from 20.1. I agree with you about
sticking with OTP 20.0 for now.

Frank

>
>> 2. Should we remove support for non-SMP builds now that it's
>> deprecated? I've actually never used the option due to it disabling
>> NIF features used by some libraries.
>
> Excellent question. I haven't thought about it and I've never used
> this option neither.
> Since it is now deprecated, I guess we can remove it.
> Should I remove it in another patch or revise this patch in a v2 that
> does both a bump to version 20.0 and a commit to remove the option to
> disable compilation of the SMP emulator?
