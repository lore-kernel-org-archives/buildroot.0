From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 13:27:47 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build civetweb with a
 known non-working external MIPS toolchain
In-Reply-To: <20141208134645.21b6db36@free-electrons.com>
References: <1418042095-29450-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141208134645.21b6db36@free-electrons.com>
Message-ID: <5485A753.6090905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/2014 12:46 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 8 Dec 2014 12:34:55 +0000, Vicente Olivert Riera wrote:
> 
>> +    # This MIPS uClibc toolchain fails to build the civetweb package
>> +    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
>> +       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
>> +        return False
> 
> I have just updated the BR toolchains used by the autobuilders, so the
> version is now 2014.11 and not 2014.08.
> 
> Maybe some other exceptions in the autobuild-run script need to be
> updated as well.

Ok, I will check all the MIPS exceptions with the new toolchains to
check if they are still needed. Thanks.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
