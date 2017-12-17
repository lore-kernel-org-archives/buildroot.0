From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 17 Dec 2017 16:30:59 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: Support configure option
 --with-linker-hash-style
In-Reply-To: <20171216162337.667a30da@windsurf>
References: <20171215232530.9388-1-stefan.froberg@petroprogram.com>
 <20171216162337.667a30da@windsurf>
Message-ID: <05e7f492-8a32-5f93-701d-377442ccd2b9@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Well, I was just worried that if setting the linking hash style to stone
(aka "gnu") then could
it maybe break builds in some other archs than x86, x86_64 and ARM ?

So I played carefull and made it configurable by choice.

Im not sure but I think that option has been hiding in GCC since 4.x and
buildroot lowest is 4.9.
So if it's okay I can cook another patch where it just set's it in stone
without choice ?

-S-

Thomas Petazzoni kirjoitti 16.12.2017 klo 17:23:
> Hello,
>
> On Sat, 16 Dec 2017 01:25:30 +0200, Stefan Fr?berg wrote:
>> This will set the default hash style that GCC will 
>> always use during linking.
>>
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Could you explain the motivation for configuring the default hash
> style? If "gnu" gives the best application startup time, why would we
> use a different one?
>
> Generally, the commit log lacks a bit of background, i.e the "why" we
> would want such a change.
>
> Thanks!
>
> Thomas
