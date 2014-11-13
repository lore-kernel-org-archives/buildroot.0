From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 13 Nov 2014 21:20:52 +0100
Subject: [Buildroot] [PATCH] Update github helper URL.
In-Reply-To: <CAAXf6LWNoKjSPRrjpDROBHK6xvqC1cP6BsybRuMX64veGOTc7A@mail.gmail.com>
References: <1415908080-19350-1-git-send-email-iawillia@us.ibm.com>
 <54650D55.9060107@mind.be>
 <CAAXf6LWNoKjSPRrjpDROBHK6xvqC1cP6BsybRuMX64veGOTc7A@mail.gmail.com>
Message-ID: <CAHXCMMKNN0jRG4EeuRmDz+fm+vpX7UWJ4P+-Uwa_My7PGzq9Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 13, 2014 at 9:06 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Thu, Nov 13, 2014 at 8:58 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 13/11/14 20:48, Patrick Williams wrote:
>>> Github changed the URL syntax from 'archive' back to 'tarball'.
>>>
>>> Signed-off-by: Patrick Williams <iawillia@us.ibm.com>
>>> ---
>>>  package/pkg-download.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>>> index 4cfb913..03907f1 100644
>>> --- a/package/pkg-download.mk
>>> +++ b/package/pkg-download.mk
>>> @@ -56,7 +56,7 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
>>>  domainseparator=$(if $(1),$(1),/)
>>>
>>>  # github(user,package,version): returns site of GitHub repository
>>> -github = https://github.com/$(1)/$(2)/archive/$(3)
>>> +github = https://github.com/$(1)/$(2)/tarball/$(3)
>>>
>>>  ################################################################################
>>>  # The DOWNLOAD_* helpers are in charge of getting a working copy
>>>
>>
>>  Yep, that seems to work! So Yann, stop working :-)
>>
>>  I haven't tested if it's exactly the same tarball. It redirects to a URL
>> containing legacy.tar.gz instead of tar.gz, so who knows...
>
> I can't follow all this madness.

It seems people at github are like weathervane... ;-)
http://git.buildroot.net/buildroot/commit/?id=507d6a637ba51e9799acd4c8a0b614fc9842b4e2

-- 
Samuel
