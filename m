From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 17 May 2015 14:25:00 -0400
Subject: [Buildroot] [PATCH] libsodium: new package
In-Reply-To: <55587EF9.1010003@openwide.fr>
References: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
 <55587EF9.1010003@openwide.fr>
Message-ID: <CA+-urNTixTObmKHSWe5siw4wB3yqm_OTCCQdRHC5xoy9ZXRFNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, May 17, 2015 at 7:43 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Frank,
>
> Le 17/05/2015 01:38, Frank Hunleth a ?crit :
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>>  package/Config.in                |  1 +
>>  package/libsodium/Config.in      |  6 ++++++
>>  package/libsodium/libsodium.hash |  2 ++
>>  package/libsodium/libsodium.mk   | 14 ++++++++++++++
>>  4 files changed, 23 insertions(+)
>>  create mode 100644 package/libsodium/Config.in
>>  create mode 100644 package/libsodium/libsodium.hash
>>  create mode 100644 package/libsodium/libsodium.mk
>>
>
> Since you are adding a new library, some packages will try to link with it.
> As far I know, zeromq can link with libsodium, so a new dependency should be
> added in a follow up patch.

Thanks. I didn't know about the zeromq dependency. Before I submit a
new patch, do you know of an easy way to figure out what other
packages have a hidden dependency like this?

> There is even an upstream path to disable libsodium in zeromq:
> https://github.com/zeromq/zeromq4-x/commit/faaf4550263395b84e6a80d3f9d7ba8816cdd714

I looked at it. I'm not a zeromq user, so I don't really understand
why someone would want to have libsodium support disabled if they have
it. It seems simpler for now to make sure the dependency is there in
BR if libsodium is enabled. Maybe this is more of a desktop need?

Thanks,
Frank


>
> Care to take a look ?
>
> Best regards,
> Romain
