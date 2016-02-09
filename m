From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 9 Feb 2016 20:19:14 -0300
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
 timeconst.pl
In-Reply-To: <56BA718A.5060500@mind.be>
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56BA718A.5060500@mind.be>
Message-ID: <56BA73F2.7080009@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/16 20:08, Arnout Vandecappelle wrote:

>   and debian testing (stretch) and unstable (sid).
>
>   As Thomas said, it's dirty, but we really need this.

Hi Arnout.
Yes, i couldn't figure out a cleaner way to do this, continues below...

>   The only reason to use APPLY_PATCHES is that it updates .applied_patches_list,
> right? In that case, perhaps it's better to do that directly here. So instead of
> a dry-run, just apply the patch right away, and if it succeeds add it to
> .applied_patches_list.

I could have probed the timeconst.pl file presence and relevancy (if it 
contains defined(@array)...), but then a dry-run patch does that for me 
just fine with the proper parameters.
Yes, that's the reason for APPLY_PATCHES, however since it's already 
there why bother duplicating code?
Also thought of extending apply-patches.sh to add an option for 
try-do/discard, but i believe it's a double-edged sword and not worth it 
quite yet.

>   This is a patch that we probably _do_ want to apply even in case of
> OVERRIDE_SRCDIR. So maybe add it to LINUX_PRE_CONFIGURE_HOOKS instead. Even
> though that's even more of a hack (and conflicts with the out-of-tree build
> support).

Possibly, let's hear other people thoughts on this.
Regards.
