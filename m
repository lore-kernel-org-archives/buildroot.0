From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:27:39 +0100
Subject: [Buildroot] [PATCH v2] bash: add default bash settings
In-Reply-To: <1444674610-8022-1-git-send-email-dvanarnem@cmlab.biz>
References: <1444674610-8022-1-git-send-email-dvanarnem@cmlab.biz>
Message-ID: <20151220152739.2236b56e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

On Mon, 12 Oct 2015 12:30:10 -0600, David Van Arnem wrote:
> Settings that were bash-specific were previously removed from
> system/skeleton/etc/profile.  This measn that users using bash no longer
> get the "normal" bash prompt with [user at host dir]#/$, and only get #/$.
> This commit adds back the bash-specific settings, but adds them to the
> bash package so they are only used when bash is installed on the target
> system.
> 
> bash_profile.sh contains the variables, aliases, and color profile that
> were previously in system/skeleton/etc/profile.  The changes to bash.mk
> use a post-install hook to install bash_profile.sh to the target
> filesystem, where it will later be sourced by /etc/profile when a bash
> shell is started.
> ---
> Changes v1 -> v2
>     - only export PS1 variable for bash_profile.sh
> 
> Signed-off-by: David Van Arnem <dvanarnem@cmlab.biz>

Having this or that shell prompt is really a user-specific
choice/configuration. You can already customize that very easily by
keeping this bash_profile.sh file in your rootfs overlay.

Therefore, I don't think it's really useful to have such customization
by default in Buildroot, and I prefer to not take this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
