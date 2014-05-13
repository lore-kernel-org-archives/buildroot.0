From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 13 May 2014 10:55:05 +0200
Subject: [Buildroot] [PATCH] build log: add message when starting
 target-finalize target
In-Reply-To: <5370F1DD.1000004@mind.be>
References: <3230f72b2606158b2575.1399904367@argentina>
 <5370F1DD.1000004@mind.be>
Message-ID: <CAHkwnC_6LiqsYA8Ha4hkO+uZ-kN+sGRzUS2RvEYG+D9kFsS7nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, May 12, 2014 at 6:07 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/05/14 16:19, Thomas De Schampheleire wrote:
>> The target-finalize target does a large number of actions (removing
>> unnecessary files, stripping objects, etc.) but does not have a header. This
>> makes it seem that all these actions are done as part of the last action
>> before target-finalize, for example:
>>     >>> makedevs undefined Installing to target
>>
>> To make a clear distinction, add a message to the beginning of
>> target-finalize:
>>     >>>   Finalizing target directory
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>>
>> ---
>>  Makefile |  1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> Note: in system/system.mk there are a number of smaller items that are
>> executed before target-finalize but do not have any message associated with
>> them. This includes the adding to securetty, the setting of issue and
>> hostname, ... Adding a message to each of these small targets is probably
>> too much, but if we could find an elegant way to add a message to the group
>> of system/system.mk, that would be nice.
>
>  IMHO those targets should be converted into command variables that are expanded
> inside the target-finalize rule. I think that that makes it much more
> understandable what this target is doing.
>
>  In fact, Fabio has a patch series doing exactly that. Fabio, if you would
> resend your series, I suggest to include this patch in it as well. Although most
> likely this patch will still be committed for 2014.05 while Fabio's series is
> too risky at this point.

I've sent a patch for converting taget-purgelocales that was already merged:

http://git.buildroot.net/buildroot/commit/?id=58d82dda1a3df4bfe00bc0c2c4257840030fff95

I've not already cooked a patch to convert system.mk targets because i
was not sure it was required or useful, but after reading your
thoughts i understands that is a useful thing so I will cook a patch
for converting those targets.

Regards
-- 
Fabio Porcedda
