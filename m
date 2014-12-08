From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 15:26:43 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build civetweb with a
 known non-working external MIPS toolchain
In-Reply-To: <5485A753.6090905@imgtec.com>
References: <1418042095-29450-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141208134645.21b6db36@free-electrons.com> <5485A753.6090905@imgtec.com>
Message-ID: <5485C333.6020405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 12/08/2014 01:27 PM, Vicente Olivert Riera wrote:
> On 12/08/2014 12:46 PM, Thomas Petazzoni wrote:
>> Dear Vicente Olivert Riera,
>>
>> On Mon, 8 Dec 2014 12:34:55 +0000, Vicente Olivert Riera wrote:
>>
>>> +    # This MIPS uClibc toolchain fails to build the civetweb package
>>> +    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
>>> +       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
>>> +        return False
>>
>> I have just updated the BR toolchains used by the autobuilders, so the
>> version is now 2014.11 and not 2014.08.
>>
>> Maybe some other exceptions in the autobuild-run script need to be
>> updated as well.
> 
> Ok, I will check all the MIPS exceptions with the new toolchains to
> check if they are still needed. Thanks.
> 
> Cheers,
> 

I have successfully built conntrack-tools, rt-test and civetweb packages
using the new br-mipsel-o32-full-2014.11 toolchain. I will send a patch
to remove those exceptions from the autobuild-run script.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
