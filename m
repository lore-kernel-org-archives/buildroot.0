From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 22:47:27 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libplatform: bump
 version to 2.1.0"
In-Reply-To: <20170306211543.6a601e2a@free-electrons.com>
References: <20170306181200.381-1-bernd.kuhls@t-online.de>
 <20170306211543.6a601e2a@free-electrons.com>
Message-ID: <29eadaba-75a0-91b8-8254-7fa83a15c71f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 21:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  6 Mar 2017 19:11:59 +0100, Bernd Kuhls wrote:
>> This reverts commit 2ac3045453d701b1fbea0d04333642a76fbfecc4.
>>
>> This commit was part of the Kodi 17 series and was committed too early,
>> current Kodi 16 is incompatible with this bump and needs to be
>> reverted, fixes https://bugs.busybox.net/show_bug.cgi?id=9711
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  .../0001-p8-platform-config-fix-lookup-paths.patch | 38 --------------------
>>  ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 40 ++++++++++++++++++++++
>>  package/libplatform/libplatform.hash               |  2 +-
>>  package/libplatform/libplatform.mk                 |  8 ++---
>>  4 files changed, 45 insertions(+), 43 deletions(-)
>>  delete mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
>>  create mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch
> 
> Thanks, both commits applied. Perhaps we need to apply them to the LTS
> version of Buildroot as well?

 Also, perhaps comments should be added to libplatform and libcec to mention
that their version must be synchronised with kodi?

 Regards,
 Arnout

> 
> Also, Bernd: what is the plan with Kodi 17 ? We still don't have a
> solution for the ugly patches needed on libraries that Kodi depends on.
> Would it be possible to make progress on this ?
> 
> Thanks,
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
