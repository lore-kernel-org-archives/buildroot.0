From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 17 Sep 2018 14:14:08 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils-headers: new package
In-Reply-To: <20180915000534.210ed343@windsurf>
References: <20180913115656.11794-1-grzegorz@blach.pl>
 <20180915000534.210ed343@windsurf>
Message-ID: <d71612af-2ba8-1997-333b-eb56a7b28c98@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/15/18 12:05 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 13 Sep 2018 13:56:55 +0200, Grzegorz Blach wrote:
>> Header files from bluez utils version 5.x.
>>
>> Separated headers are required to break circular dependencies
>> when python3 is build with bluetooth support.
>>
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> 
> What are the changes compared to the previous iteration ?

- bluez5_utils-headers/bluez5_utils_headers.hash now is a symlink to 
bluez5_utils/bluez5_utils.hash. Previously it was a copy of this file.

- In bluez5_utils_headers.mk I added 'BLUEZ5_UTILS_HEADERS_DL_SUBDIR = 
bluez5_utils', because package bluez5_utils-headers and bluez5_utils 
downloads exactly the same file.

> It is customary to:
> 
>   - Add a patch title prefix which differs for each version. You can do
>     this using 'git format-patch -v2' or 'git format-patch
>     --prefix="PATCH v2"'
> 
>   - Add a changelog of what changed between each version, either in the
>     cover letter (you can generate a template cover letter using git
>     format-patch --cover) or in each patch, below the "---" sign.

Ok, I'll do that with future patches

> Thomas
> 
