From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Apr 2012 08:08:36 -0300
Subject: [Buildroot] util-linux builds and installs lots of unwanted
 binaries
In-Reply-To: <1334651710.2527.5.camel@sven>
References: <1334589472.13607.15.camel@sven>
 <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
 <1334651710.2527.5.camel@sven>
Message-ID: <e75db664abe7bb6fc8133d5f41c18f63@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-17 05:35, Sven Neumann wrote:

>> 
>> http://lists.busybox.net/pipermail/buildroot/2011-October/046854.html
>
> Thanks. This works for us. But I would like to see such a change to 
> go
> into buildroot and I understand why this patch has not been accepted 
> in
> this form. The general idea of overriding the install command is 
> nice,
> however the newly introduced option BR2_PACKAGE_UTIL_LINUX_BASIC is
> somewhat misleading. It gives the impression that it would select the
> basic utilities and instead no utility will be installed unless it is
> selected. It should probably be renamed and other options like
> BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS would have to depend on it or 
> select
> it.
>
> Nevertheless, thanks a lot for your help with this patch.
>
>
> Regards,
> Sven

Cool, feedback at last ;)
Yes, i should make the other options depend on UTIL_LINUX_BASIC.
However there's a choice in front regarding UTIL_LINUX_BASIC - with all 
the util-linux options disabled and this one enabled you still get 
binary stuff installed because they're, well, basic utilities always 
built by util-linux.
So the option would be to keep the basic option as is or add more 
granular options for all those other tiny utilities described in the 
help and remove/keep them in a post hook.
I'd rather go for the second option since not many people will want 
mkfs.bfs, mkfs.minix and those utilities most of the time, even when 
installing others.
Regards.

Ideas?
