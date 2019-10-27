From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 22:05:55 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/python3: enable openssl
 support
In-Reply-To: <3ffb29aca2a4567927523a2bd47131e0b85ce094.camel@orolia.com>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
 <20191027153853.23532-2-nicolas.carrier@orolia.com>
 <20191027164142.448565b4@windsurf.dhcp.lyon.intranet>
 <3ffb29aca2a4567927523a2bd47131e0b85ce094.camel@orolia.com>
Message-ID: <6a118b42-0980-159d-0545-e9f7af1d2fa1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 16:50, Nicolas Carrier wrote:
> On Sun, 2019-10-27 at 16:41 +0100, Thomas Petazzoni wrote:
>> On Sun, 27 Oct 2019 15:39:08 +0000
>> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
>>
>>> If a python script is ran or used as (or in) a custom script like
>>> post
>>> build, but requires ssl, then it will fail since it's explicitly
>>> disabled
>>> by default.
>>>
>>> This patch enables it unconditionnally.
>>>
>>> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
>>>
>>> ---
>>>
>>> Changes v1 -> v2:
>>>   - split the two original patches in two
>>>   - removed the ssl support option
>>
>> I don't understand. Why did you drop the SSL option ?
> 
> We've discussed it a long time with Romain yesterday and ended up
> deciding that since usually, there are no options added to host tools,
> I wouldn't add one for host python and python 3.

 Usually, but not always :-). We already have a few which have suboptions.

 I checked the build time on my machine: 75s for host-python3, and 35s for
host-openssl. So that it a significant increase. So (although I originally also
thought that it was better to not make it optional), I agree with Thomas that
openssl should only be built if explicitly requested.

 Regards,
 Arnout
