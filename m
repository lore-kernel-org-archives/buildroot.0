From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 21 Jan 2015 21:46:28 +0100
Subject: [Buildroot] [PATCH 1/1] pppd: add config option to install
 scripts shipped with pppd's source
In-Reply-To: <20150121181954.GI4375@free.fr>
References: <1421195844-865-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <54B802AD.2070701@zacarias.com.ar> <20150121181954.GI4375@free.fr>
Message-ID: <54C01024.8020706@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Morin, Gustavo,

On 01/21/2015 07:19 PM, Yann E. MORIN wrote:
> Zoltan, All,
> 
> On 2015-01-15 15:10 -0300, Gustavo Zacarias spake thusly:
>> On 01/13/2015 09:37 PM, Zoltan Gyarmati wrote:
>>
>>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>>> ---
>>>  package/pppd/Config.in | 8 ++++++++
>>>  package/pppd/pppd.mk   | 5 +++++
>>>  2 files changed, 13 insertions(+)
>>>
>>> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
>>> index b77d7b0..6933fcf 100644
>>> --- a/package/pppd/Config.in
>>> +++ b/package/pppd/Config.in
>>> @@ -22,6 +22,14 @@ config BR2_PACKAGE_PPPD_RADIUS
>>>  	help
>>>  	  Install RADIUS support for pppd
>>>  
>>> +config BR2_PACKAGE_PPPD_INSTALL_SCRIPTS
>>> +	string "Install these PPP scripts"
>>> +	default ""
>>> +	help
>>> +	  Space delimited list to specify which scripts
>>> +	  need to be installed from pppd source tree's
>>> +	  scripts directory
>>> +
>>
>> Hi.
>> Isn't just simpler to copy those scripts that are useful/have no extra
>> dependencies (like bash, expect, perl)?
>> Otherwise it's just like a post-build script.
>> Regards.
> 
> I concur with Gustavo: just install them, conditionally to the required
> package being enabled, like:
> 
>   - needs nothing? Install it.
>   - needs bash? Install if bash is 'y'.
>   - And so on...

OK, looking beck now it sounds better than my first approach, will
resend an updated patch, thanks for the review!

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150121/6e79d5b3/attachment.asc>
