From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Mar 2017 21:54:29 +0100
Subject: [Buildroot] [PATCH] configs/qemu: update xtensa linux to 4.9
In-Reply-To: <20170314215512.1f5a02af@free-electrons.com>
References: <1489517936-4563-1-git-send-email-jcmvbkbc@gmail.com>
 <20170314215512.1f5a02af@free-electrons.com>
Message-ID: <4a78d672-6fd6-a67f-3389-aeccc75223ea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Max,

On 14-03-17 21:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Mar 2017 11:58:56 -0700, Max Filippov wrote:
>> Linux configs are missing memmap= option that is required for xtfpga
>> boards configured w/o device tree starting with linux-4.9. Add it.
>>
>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>> ---
>>  board/qemu/xtensa-lx60/linux-4.8-nommu.config | 37 --------------------------
>>  board/qemu/xtensa-lx60/linux-4.8.config       | 36 -------------------------
>>  board/qemu/xtensa-lx60/linux-4.9-nommu.config | 38 +++++++++++++++++++++++++++
>>  board/qemu/xtensa-lx60/linux-4.9.config       | 36 +++++++++++++++++++++++++
>>  configs/qemu_xtensa_lx60_defconfig            |  8 +++---
>>  configs/qemu_xtensa_lx60_nommu_defconfig      |  8 +++---

 The new nommu kernel build fails, see
https://gitlab.com/buildroot.org/buildroot/builds/12524848

arch/xtensa/kernel/setup.c: In function 'cpu_reset':
arch/xtensa/kernel/setup.c:553:2: error: implicit declaration of function
'local_flush_tlb_all' [-Werror=implicit-function-declaration]
  local_flush_tlb_all();

 Can you have a look?

 Regards,
 Arnout


>>  6 files changed, 82 insertions(+), 81 deletions(-)
>>  delete mode 100644 board/qemu/xtensa-lx60/linux-4.8-nommu.config
>>  delete mode 100644 board/qemu/xtensa-lx60/linux-4.8.config
>>  create mode 100644 board/qemu/xtensa-lx60/linux-4.9-nommu.config
>>  create mode 100644 board/qemu/xtensa-lx60/linux-4.9.config
> 
> Applied to master, thanks.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
