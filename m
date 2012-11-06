From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 02:05:52 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
In-Reply-To: <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
Message-ID: <50986270.4070804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 17:41, Fran?ois Perrad wrote:
>> >  $/home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
>> >  /home/bernd/.fbr/build/output/host/usr/bin/make all PERL_CORE=1
>> >  LIBPERL_A=libperl.so
>> >  qemu: Unsupported syscall: 240
>> >  qemu: Unsupported syscall: 240
>> >
>> >  First I got this error message with Debian Squeeze i386 (virtualbox guest,
>> >  Win XP host), but also on Debian wheezy amd64 running non-virtualized.
>> >
>> >  My .config can be found here:http://pastebin.com/yz1SzeB2
>> >  I am using buildroot as part of the FLI4L source package[1].
>> >
>> >  Kind regards, Bernd
>> >
> I could reproduce the lastest problem on the HEAD of Buildroot with
> qemu_x86_defconfig (which is a smaller config than your FLI4L config).

  Is it possible that this is because the target binary is created with
kernel headers 3.2, but you're running it on a host which is only 2.6.32
(squeeze)?  But then it should work on wheezy, because that has 3.2 as
well (at least since about four months IIRC).  Although...  240 on i386
is futex, which has existed already since long before 2.6.32.

  I do find this bug report:
https://bugs.launchpad.net/ubuntu/+source/qemu-linaro/+bug/758424
but I'm not sure if it is relevant.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
