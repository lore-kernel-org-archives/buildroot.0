From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 30 Dec 2017 04:34:14 +0200
Subject: [Buildroot] [PATCH 1/1 v2] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <20171229150446.197ea731@windsurf.lan>
References: <20171228214333.8340-1-stefan.froberg@petroprogram.com>
 <20171228230743.1e6c59ab@windsurf>
 <5a5a8ab0-25f3-a3a2-bf5a-b9c7fe851c66@petroprogram.com>
 <20171229144204.00605c4e@windsurf.lan>
 <3ca77bc6-5613-bc51-be89-0b241fd6d204@petroprogram.com>
 <20171229150446.197ea731@windsurf.lan>
Message-ID: <774e53d5-5fbd-b59d-2b2f-9b4737dd2784@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello


Thomas Petazzoni kirjoitti 29.12.2017 klo 16:04:
> Hello,
>
> On Fri, 29 Dec 2017 15:48:48 +0200, Stefan Fr?berg wrote:
>
>> Yeah, there is no other way for external toolchains than generic flags
>> passing (and possibly patching)
>> or compiler wrapper (well, there is specs file but it's ...soooo messy...).
> And since the different method needed for external toolchains would
> also work for internal toolchains, there is no point in doing a
> solution that only works for internal toolchains. See my point ?

Except can you be absolute sure that -fpic and -fpie will never happen
in the same commandline
when using just flags?

>> Personally, Im only interested of internal toolchain
>> (and I think this is not the first case that internal/external
>> toolchains have different rules?)
> We generally try to have internal and external toolchains supported in
> the same way. You may only be interested in internal toolchains, but
> Buildroot as a project needs to keep the feature parity between
> internal and external toolchains, so we would like to have a solution
> that solves both situations.
>
> Thomas

Actually, not true. You already have options like "Enable compiler
link-time-optimization support",
"Enable compiler OpenMP support" and "Enable graphite support".
(with pretty spartan description I might add)

All those are optimization related, activated by built-time
configuration switches.
Mine is security related and also activated by built-time configuration
switch.

And when selecting External toolchain then ...*poof* ... they all vanish
into the air.

So if buildroot would really treat both external and internal toolchain
equally then those options should
also be added when using external toolchain.

-S-
