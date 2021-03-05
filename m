From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 5 Mar 2021 10:13:03 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <3995be7d-ce07-7b7a-d030-e6beab531a4f@benettiengineering.com>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home>
 <6cb4a8d7-bee8-5712-2cac-1259d01e288e@benettiengineering.com>
 <3995be7d-ce07-7b7a-d030-e6beab531a4f@benettiengineering.com>
Message-ID: <8410964c-6d3f-987f-3345-653bf9f1615b@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/5/21 9:55 AM, Giulio Benetti wrote:
> 
> 
> On 3/5/21 8:56 AM, Giulio Benetti wrote:
>> Hi Thomas, All,
>>
>> On 3/4/21 10:49 PM, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> Giulio, Heiko, Thomas DS there are specific questions for you below!
>>>
>>> On Thu, 04 Mar 2021 08:15:14 -0000
>>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>>
>>>>       nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4
>>>
>>> Some wonderful compiler issue.
>>>
>>> utf8.c: In function 'ast_utf8_copy_string':
>>> utf8.c:157:1: internal compiler error: Segmentation fault
>>>
>>> Giulio, does this look like a known NIOS2 issue ?
>>
>> Yes, I've filed it time ago here:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
>>
>> Then maintainer wanted me to provide all pre-preprocessed files and all
>> build flags. There the issue was showing using Codesourcery only, but
>> here we have a Buildroot toolchain, so better chance to dig.
>>
>> Anyway I can add patches to add the _BUG_ and use the -O0 workaround.
>> What about that?
> 
> I've already added that _BUG_ to toolchain/Config.in, need some time to
> pass CFLAGS to Asterisk in some way, at the moment -O3 is always
> appended after -O0.
> 

This ^^^ is fixed by this patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=232302

-- 
Giulio Benetti
Benetti Engineering sas
