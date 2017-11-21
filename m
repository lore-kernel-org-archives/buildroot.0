From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 21 Nov 2017 20:56:07 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171121092441.GW29237@lianli.shorne-pla.net>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <06A8EC8A-0A08-4632-B0C8-B4085462304E@openadk.org>
 <20171121092441.GW29237@lianli.shorne-pla.net>
Message-ID: <0FD345D7-B239-40A5-95E9-5912EB6AC5DA@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 21.11.2017 um 10:24 schrieb Stafford Horne <shorne@gmail.com>:
> 
>> On Tue, Nov 21, 2017 at 04:56:06AM +0100, Waldemar Brodkorb wrote:
>> Hi Joel,
>> 
>> Stafford is working on some issues we seen with uClibc-ng and NPTL.
>> The testsuite showed over 100 errors. He could already identify some issues and I pushed the changes to master. Can you try uClibc-ng master and test if your problems still exist?
>> 
>> Sorry for topposting I have limited access to my mail account..
>> 
> 
> Hello,
> 
> I have talked to Joel about this.  He is getting issues throughout the system
> calls.  I seem to have only seen these issues in nptl.  Maybe I havent been
> looking close enough.  Waldemar, do you think the lastest uclibc-ng is broken in
> more places than nptl now?

The results for linuxthreads when using the uclibc-ng testsuite are not so bad. With NPTL we have right now 99 errors. 
The problem is that I took the code from the old uclibc fork and merged the glibc nptl stuff. So with Stafford the first time an or1k expert is looking into it.
It took me very long to start with the runtime testing as I had a non working kernel config for a long time.

> I found a few more issues last night, but also I noticed that Christian Svensson
> has possibly already fixed the issues over here:
> 
>  https://github.com/bluecmd/or1k-glibc/commits/master
> 
> -Stafford

I think this was the base for my try to integrate NPTL support.

I hope we can identify the open issues and make the port a well working port like Arm, nds32, Mips, Xtensa and Arc.

best regards
 Waldemar 
