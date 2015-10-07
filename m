From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Wed, 7 Oct 2015 10:56:41 -0600
Subject: [Buildroot] Add [user@host dir] back to skeleton /etc/profile
In-Reply-To: <5614D653.7030005@lucaceresoli.net>
References: <5614523A.2090204@cmlab.biz> <5614D653.7030005@lucaceresoli.net>
Message-ID: <56154EC9.4090107@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2015 02:22 AM, Luca Ceresoli wrote:
> Dear David,
>
> thanks for your report.
>
> [Cc-ing the author and the other reviewer of the mentioned commit]
>
> David Van Arnem wrote:
>> Hi all,
>>
>> I noticed there was a commit pushed Saturday (f93c692c) which removed
>> some bash-specific stuff from the skeleton shell profile in
>> /etc/profile.  The default behavior for the shell prompt now is to only
>> display "$" or "#", without the [user at host dir] prefix.  I just
>> subscribed to the list today so I missed out on any discussion on this;
>> was there a reason the [user at host dir] prefix was not left in the
>> changes ("export PS1="[\u@\h \W]\\$ "")?  I have not encountered a Linux
>> distribution that does not display this or a similar prompt, and I think
>> it would be beneficial to add it back in.  I agree that the aliases,
>> colors, etc should stay removed.
>
> This is because bash is rather unusual on embedded Linux systems. At
> least on small devices, bash has a farily targe foot print, so in most
> cases a simpler shell is used. For example, the default in Buildroot is
> to use the 'ash' shell implemented by Busybox.
>
> Comparing with a desktop distribution, if that's what you did, is
> misleading. Desktops distributions run on machines with large of disks
> and RAMs, and
>
> However it is perfectly fine if you want to use bash on your embedded
> system, and that's why Buildroot has a 'bash' package.
>
> Mmh, I realize now it's probably wise if we add back the bash-specific
> lines, but in package/bash/bash_profile, and of course install that
> file. This would give back bash features to bash users, out of the box,
> and without cluttering the rootfs for other users.
>
> Why don't you try to do it yourself, and make your first code
> contribution to Buildroot?
>
> Regards,

Hi Luca, all,

I'd be happy to work on putting the changes back in 
package/bash/bash_profile.  I've only used default 
packages/configurations in Buildroot so I'm not very familiar with 
modifying them, and I could use some guidance.  Should I place 
bash_profile in package/bash and then have the bash package Makefile 
copy it to system/skeleton/etc/profile?  Or is there another way I 
should install it?

David
