From: Eial Czerwacki <eial@scalemp.com>
Date: Mon, 18 Jan 2016 11:09:58 +0200
Subject: [Buildroot] could not read symbols: Bad value error on musl
 based buildroot env on rpi2 config.
In-Reply-To: <569CA956.2050103@mind.be>
References: <569BB682.4000707@scalemp.com> <569BFB04.4050000@mind.be>
 <569C84F2.1050309@scalemp.com> <569CA956.2050103@mind.be>
Message-ID: <569CABE6.8090901@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/18/2016 10:59 AM, Arnout Vandecappelle wrote:
>  [Please don't top-post, but reply in-line like I do below.]
>
> On 18-01-16 07:23, Eial Czerwacki wrote:
>> Greetings,
>>
>> the pastebin can be found at http://paste.ubuntu.com/14565509/
>  Hm, no reference to /usr/local/lib there...
>
>  First of all, can you confirm that this happened while building host-python? I
> don't see what else it could be, but just to be sure.
seems like:
make[1]: *** [sharedmods] Error 1
make[1]: Leaving directory
`/u/eial/workspace/buildroot-9999/output/build/host-python-2.7.11'
make: ***
[/u/eial/workspace/buildroot-9999/output/build/host-python-2.7.11/.stamp_built]
Error 2

>
>  Then, could you try to grep in the host-python build directory for the
> occurence of /usr/local/lib? It must come from somewhere...
just did it, non found
>
>
>> what makes it a bit weirder is that on my 64 bit gentoo machine (this is
>> a 32 bit ubuntu 12.04 machine) it compiles well.
>  I don't expect it has anything to do with that, it's just that your gentoo
> machine has a python installed in /usr/local while your ubuntu machine doesn't.
well I wasn't that accurate apparently, the system I'm running on it is
a CentOS 6.5 which builds the buildroot on a fs which is nfs mounted
from a ubuntu machine.
I think this setup is so exotic that it doesn't worth while to continue
research especially when my home systems works.
it is up to you.
>
>  Regards,
>  Arnout
>
> [snip]
