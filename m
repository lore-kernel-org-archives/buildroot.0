From: Andreas Naumann <dev@andin.de>
Date: Thu, 27 Aug 2020 08:05:10 +0200
Subject: [Buildroot] make sdk - relocate - ccache not working as expected
In-Reply-To: <CANQCQpbLRCR=Npcga=edQwhxNVULeuamzE+NmU0Hi5VSZBO+jg@mail.gmail.com>
References: <2b30abbf-41ab-253e-0c91-6bb6cf5e36a5@jcz.nl>
 <CANQCQpYLf0veHYzjNeYcq3_FdTF+4ig85YbNq5RVJvyaqKL0pA@mail.gmail.com>
 <d0c7e492-7055-1829-4fdb-15a298680407@jcz.nl>
 <CANQCQpbLRCR=Npcga=edQwhxNVULeuamzE+NmU0Hi5VSZBO+jg@mail.gmail.com>
Message-ID: <3ad15996-d061-7b31-ed55-d74b821ef79a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On 06.08.20 16:42, Matthew Weber wrote:
> Thomas / Yann,
> 
> On Sat, Jun 6, 2020 at 6:27 AM Jaap Crezee <jaap@jcz.nl> wrote:
>>
>> Hi Matt, all,
>>
>> On 2020-06-01 13:32, Matthew Weber wrote:
>>> The ccache callback's path is compiled into the toolchain-wrapper, so
>>> you'd have to disable ccache and do a clean build before doing the
>>> make sdk.  Or set the BR_NO_CCACHE=1 environment variable when using
>>> your sdk.  Something I've done in my sdk exports is adjust the
>>> toolchain wrapper before running make sdk. Here's an untested example
>>> of something you could add to your post build script or adjust the
>>> tarball to have this change after make sdk runs.
>>
>> This made me thinking; after doing a search I figured out the following workaround works for me:
>>
>> CCACHE_DIR=<somewhere-the-user-running-under-can-write-to>
>>
>> I consider this a bug in the toolchainwrapper (I guess). What do fellow buildroot users think?
>>
> 
> What do you guys think, as you can see in the previous couple emails
> it seems like it is a bug?  I can send my toolchain wrapper fixup (a
> couple emails earlier in the thread) to be done when someone runs
> `make sdk` that fixes it (or maybe it's just a hack).

Dont know if it's a bug but I use the CCACHE_DIR env successfully. Your 
change just disables ccache altogether does it? I think that's not 
something I'd always want.

regards,
Andi

> 
> Regards,
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
