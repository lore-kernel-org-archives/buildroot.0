From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 09:33:59 +0200
Subject: [Buildroot] [PATCH v7 1/9] package/patchelf: add patch for
 rpath sanitization under a root directory
In-Reply-To: <7d636c88-385f-63b4-b3af-36bf6309a9e7@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-2-git-send-email-wg@grandegger.com>
 <7d636c88-385f-63b4-b3af-36bf6309a9e7@mind.be>
Message-ID: <a7db20e0-4c40-e06d-5f8b-f565d900bc81@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 20.07.2017 um 01:17 schrieb Arnout Vandecappelle:
> 
> 
> On 05-07-17 18:53, Wolfgang Grandegger wrote:
>> The patch allows to use patchelf to sanitize the rpath of the buildroot
>> libraries and binaries using the option "--make-rpath-relative <rootdir>".
>> Recent versions of patchelf will not built on old Debian and RHEL systems
>> due to C++11 constructs. Therefore we stick with v0.9 for the time being.
> 
>   One more thing (but that can be a completely separate follow-up patch).
> 
>   Currently, in most cases, we clear the rpath completely. But patchelf also has
> functionality to remove the RUNPATH entry in the dynamic section. Although this
> doesn't really make the file smaller (the space for the original string is kept,
> the old string is just overwritten with X's), removing the RUNPATH entry could
> speed up dynamic loading slightly. It's also just weird to see these empty
> RUNPATH strings when you do a readelf.
> 
>   The code to do that is already there, in the rpRemove section. It's pretty
> simple to factor it out.

OK, will take care later.

Wolfgang.
