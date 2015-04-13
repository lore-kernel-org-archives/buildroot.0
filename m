From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 00:29:42 +0200
Subject: [Buildroot] [PATCHv2 09/21] pkg-download: remove support for
 the SHOW_EXTERNAL_DEPS DL_MODE
In-Reply-To: <20150413204017.GI29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413203115.GG29025@free.fr> <20150413223318.3429cc65@free-electrons.com>
 <20150413204017.GI29025@free.fr>
Message-ID: <552C4356.4030006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/04/15 22:40, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-04-13 22:33 +0200, Thomas Petazzoni spake thusly:
>> On Mon, 13 Apr 2015 22:31:15 +0200, Yann E. MORIN wrote:
>>> That's weird, the output looks like that:
>>>
>>>     $ make external-deps
>>>     make -C /home/ymorin/dev/buildroot/buildroot O=/home/ymorin/dev/buildroot/O/. external-deps
>>>     [--SNIP--]
>>>     gcc-4.8.4.tar.bz2
>>>     gdbm-1.11.tar.gz
>>>     genext2fs-1.4.1.tar.gz
>>>       GEN     /home/ymorin/dev/buildroot/O/./Makefile
>>>     genimage-7.tar.xz
>>>     genpart-1.0.2.tar.bz2
>>>     [--SNIP--]
>>>
>>> Weird that the message about our Makefile wrapper is irght in the middle
>>> of that... :-/
>>
>> Weird, indeed. Could it be because external-deps is implement itself as
>> a call to $(MAKE) _external-deps ?
> 
> Well, I'm no longer able to reproduce it... I'll try to get a
> reproducible setup and will report back...

 Try 'touch O/.config; make external-deps'.

 You probably did something like:

make O=O foo_defconfig
make O=O external-deps

 After foo_defconfig, .config is more recent than auto.conf so silentoldconfig
is run, and that one depends on the dependency-less outputmakefile target.
Really silly inheritance from the kernel's kconfig infra.


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
