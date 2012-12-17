From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 18:27:19 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <2112128925.1003709.1355759859440.JavaMail.root@advansee.com>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be>
 <2112128925.1003709.1355759859440.JavaMail.root@advansee.com>
Message-ID: <50CF55F7.9090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 16:57, Beno?t Th?baudeau wrote:
> Dear Arnout Vandecappelle,
>
> On Monday, December 17, 2012 4:50:37 PM, Arnout Vandecappelle wrote:
>> On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
>>> +IMX_LIB_INCLUDE = \
>>> +	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
>>> +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
>>> +	-I$(LINUX_DIR)/include
>>
>>    Actually, I wonder if this is the right thing to do... This is a
>> userspace library that requires a platform-specific linux/xxx.h. For
>> an
>> external toolchain, these headers don't exist in
>> $(STAGING_DIR)/usr/include/linux
>>
>>    Directly using $(LINUX_DIR)/include means that the headers are not
>> patched for userspace. For those platform-specific headers that's
>> probably not a problem, but it's not good for e.g. linux/types.h.
>>
>>    An easy workaround is to use -idirafter instead of -I.  However,
>> perhaps it's an even better idea to do 'make headers_install' as part
>> of
>> the normal linux build process, so that packages depending on those
>> headers can use the patched version. But then again, is it a good
>> idea to
>> replace the toolchain's kernel headers with a new set of kernel
>> headers?
>>
>>    Any advice is welcome!
>
> FYI, I've successfully built the 11.09.01 version under BuildRoot without the
> "-I$(LINUX_DIR)/include", and the issue that you mention is only for this
> folder. I had to make a patch to make the headers install work, but that should
> not be related. Can you try with your package?

  ipu/mxc_ipu_hl_lib.h needs linux/mxcfb.h which only exists in the imx 
kernels.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
