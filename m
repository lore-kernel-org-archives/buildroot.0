From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Date: Tue, 13 Nov 2018 01:59:09 +0000
Subject: [Buildroot] [PATCH] package/linux-tools: add support for
 pcitest tool
In-Reply-To: <49e881db-abf6-4cd4-c149-b6a1ac8449dd@mind.be>
References: <676a63fc4e656a81398dc1fca048f3e2bdea327e.1541701306.git.gustavo.pimentel@synopsys.com>
 <20181109221454.1329d46e@windsurf>
 <49e881db-abf6-4cd4-c149-b6a1ac8449dd@mind.be>
Message-ID: <0a4fedba-eecd-eefc-c1cf-2c401cc8df18@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2018 21:39, Arnout Vandecappelle wrote:
> 
> 
> On 09/11/2018 22:14, Thomas Petazzoni wrote:
>> Hello Gustavo,
>>
>> Thanks for this contribution, however, I have a question below.
>>
>> On Thu,  8 Nov 2018 19:22:30 +0100, Gustavo Pimentel wrote:
>>
>>> +define PCI_BUILD_CMDS
>>> +	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
>>> +		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
>>> +		echo "At least kernel 4.7 must be used." ; \
>>
>> I tried building with 4.18, but still ran into this error. Indeed, it's
>> only in 4.19 that your patch
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_commit_tools_pci-3Fid-3D1ce78ce09430a5ffb987015ab2e24d145690b9a3&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=bkWxpLoW-f-E3EdiDCCa0_h0PicsViasSlvIpzZvPxs&m=42FtAgE43Y-ecR9vgGhkkdOiiFMdSJR9VC4_qQjO2uA&s=0c1L3G6rzwM1VCMyKHTixgwJlepqW9_c3sEIS6V2Qpg&e=
>> was added, which adds the Makefile.
>>
>> So, either you fallback to building pcitest.c manually if there is no
>> Makefile, or the error message should be updated to say "At least
>> kernel 4.19 must be used".
> 
>  Also, your patch mentions 3 different kernel versions: in the commit log it's
> 4.20, in the help text it's not mentioned (it should be), in the error message
> it's 4.7, and in the comment about DESTDIR it's 4.14.

Ok, I will fix it, should all be 4.20

> 
>  But if it's only available in 4.19+, that thing about DESTDIR is irrelevant,
> no? So it should always be DESTDIR, never INSTALL_ROOT?

It was a copy & paste from linux-tool-iio.mk.in I will fixed it.
Thanks.

> 
>  Regards,
>  Arnout
> 
