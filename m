From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 06 Dec 2011 12:19:28 +0000
Subject: [Buildroot] [PATCH 2/4] Supply better default uClibc config
 file when using ct-ng
In-Reply-To: <5b4fbca78f7b4e45fa487a81d96270a5@zacarias.com.ar>
References: <1323108498-2398-1-git-send-email-will_wagner@carallon.com>
 <1323108498-2398-3-git-send-email-will_wagner@carallon.com>
 <201112052233.51317.yann.morin.1998@anciens.enib.fr>
 <5b4fbca78f7b4e45fa487a81d96270a5@zacarias.com.ar>
Message-ID: <4EDE0850.10502@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/2011 00:44, Gustavo Zacarias wrote:
> On 05.12.2011 18:33, Yann E. MORIN wrote:
>
>> Will and Gustavo, please coordinate with each other:
>>
>> - Will wants to reference that file to commonalise the uClibc
>> configuration
>> files between the internal backend and the crosstool-NG backend, see:
>> http://lists.busybox.net/pipermail/buildroot/2011-December/048123.html
>>
>> - Gustavo wants to remove the file because the internal toolchain backend
>> is dropping support for uClibc-0.9.30; see:
>> http://lists.busybox.net/pipermail/buildroot/2011-December/048099.html
>>
>> I am not sure what the proper resolution could be. Surely enough, I think
>> what Will wants to do is the correct way: use a single (set of) files for
>> both backends. Also, the internal backend should not be impacted by some
>> requirements of the ct-ng backend.
>>
>> Anyway, in the meantime, because Gustavo's patch is not yet applied...
>> Will, you can add my:
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
>>
>> Regards,
>> Yann E. MORIN.
>
> It's quite simple actually, if we support any form of uClibc 0.9.30.x
> there are packages which won't build unless functionality backporting is
> done.
> For example udev needs needs 99c1547124d7f410a3e3db66aa5816e53a96c156
> for 0.9.31 (and would so for 0.9.30.x)
> Any takers for undeprecating and testing a ton of packages against
> 0.9.30.x?
> Maybe the backporting is there for ct-ng toolchains?
> Regards.
>

I had not noticed that 0.9.30 was marked as deprecated, added that to ct-ng.

Not sure we need to rush to remove 0.9.30 as it is already marked 
deprecated, but when we do remove it I guess we should remove from ct-ng 
toolchains as well.

Will


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
