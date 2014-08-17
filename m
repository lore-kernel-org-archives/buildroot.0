From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 17 Aug 2014 08:18:51 -0400
Subject: [Buildroot] [PATCH] package/erlang: build host-erlang with
 support for openssl
In-Reply-To: <20140817090126.GA5274@free.fr>
References: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr>
 <87a973zj6w.fsf@dell.be.48ers.dk> <20140817090126.GA5274@free.fr>
Message-ID: <CA+-urNTBKMEqxC4AAq+EyVEakbDvdeKoyQu+C=h-8cioKR=LsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Peter, All,

On Sun, Aug 17, 2014 at 5:01 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Peter, All,
>
> On 2014-08-17 09:09 +0200, Peter Korsgaard spake thusly:
>> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>
>>  > Erlang uses openssl for all things crypto.
>>  > Since there are host Erlang tools that use crypto (such as rebar), we
>>  > need to build host-erlang with support for crypto, and thus it shall
>>  > depends on openssl.
>>
>>  > Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
>>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>  > Cc: Frank Hunleth <fhunleth@troodon-software.com>
>>  > Cc: Johan Oudinet <johan.oudinet@gmail.com>
>>
>>  > ---
>>  > Note: I am not sure whether this is the correct solution, to match the
>>  > host SSL support to the target SSL support. I'll let the erlang experts
>>  > enhance that patch if need be. ;-)
>
> (Sorry, I should have removed this post-comit note in this v2)
>
>> Sorry, I must have missed the discussion about this. What exactly does
>> it fix?
>
> Some Erlang packages (like ejabberd) use an Erlang script to do part of
> the configure and build steps, thus we need a host Erlang.
>
> This script may need to do some crypto stuff (e.g. to compute hashes,
> or do https). In the Erlang world, all crypto stuff is implemented by
> using oppenssl as the crypto backend.
>
> So, we need a host Erlang with crypto support, and thus linked with
> openssl.
>
>> Do we need it for 2014.08?
>
> Well, it can well wait for after the release, if you're not at ease with
> it. Currently, we have no package that require Erlang, not even the host
> Erlang.
>
> However, since our host-erlang not being ssl-aware, it means no one is
> really using it, and thus bumping should not cause a regressiopn for
> anyone.

FWIW, I use it and a few other people I know use host-erlang.

> No one, but me, has complained so far. ;-)

I find it amazing too that I haven't run into the issue or heard from
anyone else. I have a couple build environments that I thought were
minimal, but they clearly must have had the openssl dev packages
installed or I would have seen it.

Anyway, I agree with Yann, that there's no rush on getting the fix in
for this release. Now that we know how the issue manifests itself,
it's pretty easy to identify.

Thanks,
Frank
