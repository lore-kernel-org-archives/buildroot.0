From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 09:46:13 +0000
Subject: [Buildroot] [PATCH 1/2] uclibc: add a missing function member
 to siginfo.h
In-Reply-To: <20140109104043.02d07109@skate>
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140109104043.02d07109@skate>
Message-ID: <52CE6FE5.9070305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2014 02:40 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 8 Jan 2014 17:32:43 +0000, Vicente Olivert Riera wrote:
>> Applying an upstream patch to add a missing function member on ia64,
>> mips and sparc arches.
>>
>> Upstream patch URL:
>>     http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b4e6e61e2f7c6fb4bf59f66efaa74591a2112912
>>
>> Fixes:
>>     http://autobuild.buildroot.net/results/fa0/fa03ecc087a4b30df8b0366bb238be3d167a56d9/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Siggh. This is again the kind of things that will make package builds
> work with internal uClibc toolchain, but fail badly with external
> uClibc toolchains, which are likely to not contain the gazillions of
> backported uClibc patches that we carry around.
>
> I have the feeling that this is a growing problem, and I'm not sure how
> to handle it. To me, the fact that the uClibc community is completely
> inactive in terms of releases is really a major issue.
>
> A solution would be to not support any uClibc based external toolchain,
> but that means we would no longer support Blackfin external toolchains
> for example, which is really not desirable.
>
> Best regards,
>
> Thomas
>

Yes, I understand what you mean, but what do you want to do? I mean, if 
uClibc don't release new version, aren't you going to upgrade external 
toolchains anymore?

I think we should fix this for the Buildroot toolchain, because is "our" 
toolchain and is "our" problem. If external toolchains don't apply those 
patches, then that will be their problem. They can upgrade the toolchain 
packaging uClibc to a git version number, so no releases is needed. Of 
course I understand that having a release is better because that means 
that the state is consistent, it shouldn't fail, has been tested, etc., 
but if that's not happening, again, is not our problem.

Best regards,

-- 
Vincent
