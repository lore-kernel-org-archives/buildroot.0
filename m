From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 16:44:31 +0100
Subject: [Buildroot] [PATCH 1/2] bluez5_utils-headers: new package
In-Reply-To: <d71612af-2ba8-1997-333b-eb56a7b28c98@blach.pl>
References: <20180913115656.11794-1-grzegorz@blach.pl>
 <20180915000534.210ed343@windsurf>
 <d71612af-2ba8-1997-333b-eb56a7b28c98@blach.pl>
Message-ID: <f61bbe06-edff-c9d7-58cf-d3e63027e233@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gregorz,

On 17/09/2018 13:14, Grzegorz Blach wrote:
> On 9/15/18 12:05 AM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 13 Sep 2018 13:56:55 +0200, Grzegorz Blach wrote:
>>> Header files from bluez utils version 5.x.
>>>
>>> Separated headers are required to break circular dependencies
>>> when python3 is build with bluetooth support.
>>>
>>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
>>
>> What are the changes compared to the previous iteration ?
> 
> - bluez5_utils-headers/bluez5_utils_headers.hash now is a symlink to
> bluez5_utils/bluez5_utils.hash. Previously it was a copy of this file.
> 
> - In bluez5_utils_headers.mk I added 'BLUEZ5_UTILS_HEADERS_DL_SUBDIR =
> bluez5_utils', because package bluez5_utils-headers and bluez5_utils downloads
> exactly the same file.

 I've reworked both patches a little more and applied to master, thanks.

 The changes are:

- made bluez5_utils-headers a blind option (cfr. mesa3d-headers);
- let python3 select bluez5_utils-headers if bluez5_utils is enabled;
- correct the name of the .mk and .hash files (- instead of _);
- don't indent inside a make condition;
- add a comment in both bluez5_utils and bluez5_utils-headers that the versions
should be kept in sync.


 Regards,
 Arnout
