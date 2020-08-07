From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 11:54:12 +0200
Subject: [Buildroot] Root password and ssh issues
In-Reply-To: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
References: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
Message-ID: <20200807115412.3b93cbc4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 7 Aug 2020 11:51:02 +0200
Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> Manuel and I have observed a strange phenomenon at least with Buildroot
> 2020.02.4...
> 
> When we generate a root filesystem with Dropbear for ssh, and set the
> root password through BR2_TARGET_GENERIC_ROOT_PASSWD, we cannot manage
> to login through ssh.
> 
> However, we can login as root on the console with this password, proving
> that the password was valid. If we then use the "passwd" command from
> the command line on the target to set the same password again, ssh
> access starts to work!
> 
> Would you have an explanation for this behavior?

What is the state of /etc/shadow with the non-working SSH login, and
then the state of /etc/shadow after resetting the password with passwd
? I think I remember some issues with the expiration date/time of the
password, or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
