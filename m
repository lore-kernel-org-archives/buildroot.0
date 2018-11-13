From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Date: Tue, 13 Nov 2018 01:18:15 +0000
Subject: [Buildroot] [PATCH] package/linux-tools: add support for
 pcitest tool
In-Reply-To: <20181109221454.1329d46e@windsurf>
References: <676a63fc4e656a81398dc1fca048f3e2bdea327e.1541701306.git.gustavo.pimentel@synopsys.com>
 <20181109221454.1329d46e@windsurf>
Message-ID: <cbe0ff94-41cd-e88e-107f-171c853f16e6@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/11/2018 21:14, Thomas Petazzoni wrote:
> Hello Gustavo,
> 
> Thanks for this contribution, however, I have a question below.
> 
> On Thu,  8 Nov 2018 19:22:30 +0100, Gustavo Pimentel wrote:
> 
>> +define PCI_BUILD_CMDS
>> +	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
>> +		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
>> +		echo "At least kernel 4.7 must be used." ; \
> 
> I tried building with 4.18, but still ran into this error. Indeed, it's
> only in 4.19 that your patch
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_commit_tools_pci-3Fid-3D1ce78ce09430a5ffb987015ab2e24d145690b9a3&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=bkWxpLoW-f-E3EdiDCCa0_h0PicsViasSlvIpzZvPxs&m=qVWqkVnASamZzXF3WT9zuVfDKzd-ifqSCFv7Y-iN10s&s=hndtmBXj6oMoxc26JB-kTsCWJbyEVOy2kYhSbLfqMng&e=
> was added, which adds the Makefile.
> 
> So, either you fallback to building pcitest.c manually if there is no
> Makefile, or the error message should be updated to say "At least
> kernel 4.19 must be used".

You're right. I'll update the error message.
Thanks.

Gustavo

> 
> Best regards,
> 
> Thomas
> 
