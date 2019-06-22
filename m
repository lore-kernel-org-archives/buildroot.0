From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Jun 2019 00:35:38 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <20190622214410.4bc6022e@windsurf>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
Message-ID: <29b577b0-8c65-7038-929b-ad2828ec7495@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/06/2019 ? 21:44, Thomas Petazzoni a ?crit?:
> On Thu, 20 Jun 2019 12:07:18 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> From: Romain Naour <romain.naour@gmail.com>
>>
>> Even if gcc 7 is still maintained for some time (gcc 7.5 is pending),
>> switch to gcc 8.x since it has been released since 2018-05-02 and
>> gcc 9.x is available since 2019-05-03.
>>
>> We have been having toolchains in the autobuilders with gcc
>> 8.x for a while, so the vast majority of the problems should have
>> already been solved.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>> v3: rebase patch on top of master branch sha1:
>>     04efb17c863606cdbc2405d01c3d48d6868c5245 (Giulio)
>> ---
>>  package/gcc/Config.in.host | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks.

Thanks for merging this series :)

> 
> What do we do with the older gcc versions ? We now have 4.9, 5, 6, 7, 8
> and 9, which is quite a bit more than the normal number of 3 versions
> we want to support.
> 
> Arnout: do you still think gcc 4.9 is needed at this point ? If it is
> the case, should we keep gcc 4.9, but drop gcc 5 and 6 ?

Currently glibc >= 2.29 needs gcc >= 5 on all architectures.
So we can only build a toolchain with gcc 4.9 with uClibc and musl.
The upcoming release of glibc will require at least gcc 6.2 on all architectures
[1].

If a toolchain with gcc 4.9 is really needed, it can be build with the 2019.02
LTS version.

Thomas, I have the same question about gdb 7.12.x.

[1]
https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
