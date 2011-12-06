From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Dec 2011 09:27:42 -0300
Subject: [Buildroot] [PATCH 2/4] Supply better default uClibc config
 file when using ct-ng
In-Reply-To: <4EDE0850.10502@carallon.com>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-3-git-send-email-will_wagner@carallon.com>
 <201112052233.51317.yann.morin.1998@anciens.enib.fr>
 <5b4fbca78f7b4e45fa487a81d96270a5@zacarias.com.ar>
 <4EDE0850.10502@carallon.com>
Message-ID: <3868db5e043aa6832def5df2f82867fe@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.12.2011 09:19, Will Wagner wrote:

>> It's quite simple actually, if we support any form of uClibc 
>> 0.9.30.x
>> there are packages which won't build unless functionality 
>> backporting is
>> done.
>> For example udev needs needs 
>> 99c1547124d7f410a3e3db66aa5816e53a96c156
>> for 0.9.31 (and would so for 0.9.30.x)
>> Any takers for undeprecating and testing a ton of packages against
>> 0.9.30.x?
>> Maybe the backporting is there for ct-ng toolchains?
>> Regards.
>>
>
> I had not noticed that 0.9.30 was marked as deprecated, added that to 
> ct-ng.
>
> Not sure we need to rush to remove 0.9.30 as it is already marked
> deprecated, but when we do remove it I guess we should remove from
> ct-ng toolchains as well.
>
> Will

And digging a little further it seems the udev bump broke it with 
uClibc 0.9.31.x too.
I guess it's time to do some more backporting for that.
Any particular need to keep 0.9.30.x around if it's already deprecated?
I see a point in people wanting 0.9.31.x because of the threading 
differences.
But i think 0.9.30.x is just going to add troubles than solving 
anything.
Regards.
