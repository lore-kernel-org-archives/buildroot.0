From: czankel <chris@zankel.net>
Date: Tue, 04 Dec 2012 00:36:32 -0800
Subject: [Buildroot] [PATCH v2] xtensa: add config option to enable
 longcalls option
In-Reply-To: <20121203140912.1e09f0ea@skate>
References: <50bc6a34.45e8440a.493d.4091@mx.google.com>
 <20121203140912.1e09f0ea@skate>
Message-ID: <50BDB610.7080304@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/3/12 5:09 AM, Thomas Petazzoni wrote:
> Dear Chris Zankel,
>
> On Mon, 3 Dec 2012 00:58:46 -0800, Chris Zankel wrote:
>> The longcalls option allows calls across a greater range of addresses.
>>
>> This option should be used when call targets can potentially be
>> out of range. It may degrade both code size and performance, but
>> the linker can generally optimize away the unnecessary overhead
>> when a call ends up within range.
>>
> Do we really want that as a configurable option? Isn't it possible
> instead to always generate longcalls, or to fix this on a per-package
> basis, when needed?
The actual distance between call and destination is probably very 
dependent on compiler versions and compile options, etc., so might be 
hard to figure out what packages are affected. We might end up with a 
lot of packages with special Xtensa  'treatments'. Probably better to 
just have it always there.

It should actually be fine to always compile with the longcalls option, 
but I didn't just want to change it without having the option to keep 
the old behavior, hence the option.

Thanks,
-Chris
