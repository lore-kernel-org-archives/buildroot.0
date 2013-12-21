From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sat, 21 Dec 2013 18:54:57 +0100
Subject: [Buildroot] How to create the package from software using
 "bootstrap" to configure?
In-Reply-To: <20131221144653.4af8deff@skate>
References: <CAMduVEcRz63T4e5Fa_4iDm-H9e9RuOWkDMNTXAHe6VtZsLXhtg@mail.gmail.com>
 <20131221144653.4af8deff@skate>
Message-ID: <CAMduVEdFGug0_xhipRUJqnhMCELZ72Q6vcZLhWVAQzDdbBDuyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks. I have created Config.in and avrdude.mk as attached, and they
seem to work (however I want to test it better before I submit the
patch proposal).

Thanks & greetings,
Wojtek


On Sat, Dec 21, 2013 at 2:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Wojciech Zabolotny,
>
> On Sat, 21 Dec 2013 14:15:44 +0100, Wojciech Zabolotny wrote:
>
>> AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
>> AVRDUDE_SITE =
>> http://github.com/kcuzner/avrdude/tarball/$(AVRDUDE_VERSION)
>> AVRDUDE_LICENSE = GPLv2 AVRDUDE_INSTALL_TARGET = YES
>> AVRDUDE_AURORECONF = YES
>>
>>
>> define AVRDUDE_CONFIGURE_CMDS
>>         (cd $(@D)/avrdude; \
>>                 ./bootstrap --prefix=$(TARGET_DIR)/usr
>> --parallel=$(PARALLEL_JOBS) ;\
>>                 ./configure --prefix=$(TARGET_DIR)/usr \
>>         )
>> endef
>>
>> define AVRDUDE_BUILD_CMDS
>>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude
>> endef
>>
>> define AVRDUDE_INSTALL_TARGET_CMDS
>>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude install
>> endef
>>
>> $(eval $(generic-package))
>
> Make it an autools-package instead, and specify AVRDUDE_AUTORECONF =
> YES. This will have the same effect as calling avrdude's bootstrap
> script.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: B191 ACF0 7909 83FA 3F9B  450C 407E 3C4B 4569 D119
confidential: 2BF3 F90F 6EA8 7D35 59FD  5080 78ED 33DE 1312 D8F8
-------------- next part --------------
A non-text attachment was scrubbed...
Name: avrdude.mk
Type: application/octet-stream
Size: 505 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131221/1f467c09/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 323 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131221/1f467c09/attachment-0001.obj>
