From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 15 Feb 2021 00:46:35 +0100
Subject: [Buildroot] [PATCH] package/libgeos: fix build failure due to
 Gcc Bug 68485
In-Reply-To: <20210213225155.6b83e879@windsurf.home>
References: <20210212224238.1938197-1-giulio.benetti@benettiengineering.com>
 <20210213225155.6b83e879@windsurf.home>
Message-ID: <4164497f-c16c-99c9-e6e7-70e77c16c368@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 2/13/21 10:51 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Fri, 12 Feb 2021 23:42:38 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Package libgeos manifests Microblaze Gcc Bug 68485 resulting in a build
>> failure due to an Internal Compiler Error.
>>
>> As done for other packages in Buildroot work around this Gcc Bug by
>> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/0da/0daa6b259aea5381fad86d01e6dd026b1c8ad073/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libgeos/libgeos.mk | 8 ++++++++
>>   1 file changed, 8 insertions(+)
> 
> Applied to master, thanks. Could you check if this bug still exists
> with gcc 10.x, and if it does, ping on the gcc bug report ?

I've just tried to build with gcc 10.2 and unfortunately it still have 
that bug. So I've just pinged gcc bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485#add_comment

Let's see what they answer.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
