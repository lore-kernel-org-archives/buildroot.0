From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Tue, 30 Sep 2014 01:11:17 +0530
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <CAAXf6LVco1ikU6rfBSyNf_WZZfv4nBP1fhwcajfzoAN07wLZ7A@mail.gmail.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
 <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
 <20140929152136.4d7cee9c@free-electrons.com>
 <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
 <20140929183824.5b7bc3e5@free-electrons.com>
 <CAJO1S92HBmxKivtoqZDEjGYt5e6xiQkrHnCPLi1H0O4E9xtixg@mail.gmail.com>
 <CAAXf6LVco1ikU6rfBSyNf_WZZfv4nBP1fhwcajfzoAN07wLZ7A@mail.gmail.com>
Message-ID: <CAJO1S93CyRMH62V4+OU+403h0_p=9G247fT2foT5t1G36ZndsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-Sep-2014 12:44 AM, "Thomas De Schampheleire" <
patrickdepinguin@gmail.com> wrote:
>
> Hi Kantanu,
>
> (please don't top post)
>
> On Mon, Sep 29, 2014 at 8:43 PM, Kantanu Kumar Mohapatra
> <kantanukumar@gmail.com> wrote:
> > Many thanks.
> >
> > Yaa I too found it as the place to take the source. The thing is, uboot
> > tools is under auto-target. That's I am not much familiar with, how to
make
> > changes to that to take the source?
> >
> > I'll be thankful if you could help me to make changes to that makefile.
>
> Have a look at the manual chapter regarding adding new packages. It
> explains the different variables that exist, both for the generic and
> autotools infrastructures.
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages
>
> What Thomas Petazzoni suggested is to change the variable
UBOOT_TOOLS_VERSION.
>
> Best regards,
> Thomas

Thanks Thomas. I have tried with changing the tools version, that's not
working, as buildroot 10 not having uboot tool separate. fw_printenv comes
integrated with uboot-tools-10.03.

I can see the target fw_printenv, gets compiled like this,
$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
-DUSE_HOSTCC -o $@ \
$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c

I am using here another -D flag in uboot-tools-10.03. Same thing want to
replicated for uboot tools 14 and same source only want to take.

Thanks,
Kantanu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/c74e064e/attachment.html>
