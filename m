From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Apr 2019 13:13:16 +0200
Subject: [Buildroot] [git commit] system/skeleton: remove password
 expiration from shadow
In-Reply-To: <20190331151701.4de2bc12@windsurf>
References: <20190320220327.47BF2814A6@busybox.osuosl.org>
 <20190331151701.4de2bc12@windsurf>
Message-ID: <5beb32e0-a6df-fbbf-47fa-f841d3fda549@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/03/2019 15:17, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> On Wed, 20 Mar 2019 23:06:29 +0100
> Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:
> 
>> commit: https://git.buildroot.net/buildroot/commit/?id=be8d11c7e55d8dfe395774c04a7a35b949aa6d97
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> The fields in /etc/shadow were set as follows:
>>
>> root::10933:0:99999:7:::
>>
>> This sets the date of last password change to Jan 1, 2000, the minimum
>> password age to 0 days, the maximum password age to near-infinity, and a
>> warning period of 7 days. In practice, this means the password never
>> expires. So all of this is quite useless.
>>
>> On the other hand, mkusers creates lines without all of these options.
>> It just sets ::::: which disables password expiration completely.
>>
>> To make things consistent, do the same for the skeleton entries.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> It seems like you applied your own patch here, but without replying to
> your original e-mail to say it was applied, and the patch state in
> patchwork was also not set to Accepted. Seems like you perhaps pushed
> it by mistake.

 I don't remember intentionally applying that patch... I guess it was still in
my repo and I failed to check what I was pushing... Sorry for that.

 Regards,
 Arnout

> 
> Anyway, no big deal, I was about to apply it, and that's what made me
> discover that it was already applied :)
> 
> Best regards,
> 
> Thomas
> 
