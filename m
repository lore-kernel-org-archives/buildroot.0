From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 16:43:55 +0100
Subject: [Buildroot] [PATCH v2] bash: add default bash settings
In-Reply-To: <20151220152739.2236b56e@free-electrons.com>
References: <1444674610-8022-1-git-send-email-dvanarnem@cmlab.biz>
 <20151220152739.2236b56e@free-electrons.com>
Message-ID: <20151220154355.GG3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, Thomas, All,

On 2015-12-20 15:27 +0100, Thomas Petazzoni spake thusly:
> On Mon, 12 Oct 2015 12:30:10 -0600, David Van Arnem wrote:
> > Settings that were bash-specific were previously removed from
> > system/skeleton/etc/profile.  This measn that users using bash no longer
> > get the "normal" bash prompt with [user at host dir]#/$, and only get #/$.
> > This commit adds back the bash-specific settings, but adds them to the
> > bash package so they are only used when bash is installed on the target
> > system.
> > 
> > bash_profile.sh contains the variables, aliases, and color profile that
> > were previously in system/skeleton/etc/profile.  The changes to bash.mk
> > use a post-install hook to install bash_profile.sh to the target
> > filesystem, where it will later be sourced by /etc/profile when a bash
> > shell is started.
> > ---
> > Changes v1 -> v2
> >     - only export PS1 variable for bash_profile.sh
> > 
> > Signed-off-by: David Van Arnem <dvanarnem@cmlab.biz>
> 
> Having this or that shell prompt is really a user-specific
> choice/configuration. You can already customize that very easily by
> keeping this bash_profile.sh file in your rootfs overlay.
> 
> Therefore, I don't think it's really useful to have such customization
> by default in Buildroot, and I prefer to not take this patch.

I side with Thomas: this really is a user customisation, so belongs to a
rootfs overlay (or a post-build script).

I'll mark this patch as rejected in Patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
