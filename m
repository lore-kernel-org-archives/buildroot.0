From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:31:02 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 03/11] linux-pam:
 selinux system auth
In-Reply-To: <1455603506-26138-3-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-3-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223223102.2e02dbe6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 11:48:18 +0530, Niranjan Reddy wrote:

> diff --git a/package/linux-pam/system-auth.pamd b/package/linux-pam/system-auth.pamd
> new file mode 100644
> index 0000000..2fa116a
> --- /dev/null
> +++ b/package/linux-pam/system-auth.pamd
> @@ -0,0 +1,15 @@
> +#%PAM-1.0
> +auth        required      pam_env.so
> +auth        sufficient    pam_unix.so
> +auth        required      pam_deny.so
> +
> +account     required      pam_unix.so
> +
> +#password    required      pam_cracklib.so try_first_pass retry=3
> +password    sufficient    pam_unix.so md5 shadow try_first_pass
> +password    required      pam_deny.so
> +
> +session     optional      pam_keyinit.so revoke
> +session     required      pam_limits.so
> +session     [success=1 default=ignore] pam_succeed_if.so service in crond quiet use_uid
> +session     required      pam_unix.so

This patch is just adding one file, which doesn't get used anywhere.
Yes, I know, it will be used in PATCH 4, but either it should be
squashed in PATCH 4 itself (which is reasonable since PATCH 4 isn't
that large), or if you want to keep it separate, indicate how it will
be used in the commit log, and explains what it is doing.

Remember: the people reviewing your code need to *understand* what's
going on, and are not necessarily selinux/pam experts. So you have to
give a sufficient amount of details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
