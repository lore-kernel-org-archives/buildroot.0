From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 8 Aug 2018 17:19:41 -0700
Subject: [Buildroot] [PATCH] ncurses: make host-ncurses use host terminfo
In-Reply-To: <4b28a0d6-dc95-4d3b-6ecb-a4607935f6e2@mind.be>
References: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
 <8736wec3d8.fsf@dell.be.48ers.dk> <87wot1gd9a.fsf@dell.be.48ers.dk>
 <4b28a0d6-dc95-4d3b-6ecb-a4607935f6e2@mind.be>
Message-ID: <bc073331-b18b-0091-d77e-fcc7325d6f59@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2018 01:37 PM, Arnout Vandecappelle wrote:
> On 08-08-18 16:10, Peter Korsgaard wrote:
>> The question is how to fix it. The logical solution would be to set
>> TERMINFO to get it to put the database somewhere else, but that doesn't
>> work because run_tic.sh overwrites it:
>>
>> # don't use user's TERMINFO variable
>> TERMINFO=${DESTDIR}$ticdir ; export TERMINFO
>             ^^^^^^^^^^
>   So, set DESTDIR?
>
>   Or actually, why is this script called at all? The whole point of Hollis's
> patch was to use the system's terminfo, so why should we generate the terminfo
> at all? In other words, can't we just pass --disable-db-install ?
I agree that we don't want to generate terminfo in the /host/ ncurses. I 
can confirm that adding --disable-db-install fixes the build behavior 
that I also see (building host-ncurses writes to my ~/.terminfo).

I can't imagine a problem, but I just haven't yet been able to rebuild a 
full toolchain with --disable-db-install.

Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180808/bc8c4ea2/attachment.html>
