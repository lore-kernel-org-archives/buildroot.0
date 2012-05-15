From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 May 2012 11:54:37 +0200
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <1337059661-4008-1-git-send-email-faessler@was.ch> ("Dominik
 =?utf-8?Q?F=C3=A4ssler=22's?= message of "Tue, 15 May 2012 07:27:41 +0200")
References: <1337059661-4008-1-git-send-email-faessler@was.ch>
Message-ID: <87sjf1vkf6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dominik" == Dominik F?ssler <faessler@was.ch> writes:

Hi,

 Dominik> +++ b/package/autossh/Config.in
 Dominik> @@ -0,0 +1,8 @@
 Dominik> +config BR2_PACKAGE_AUTOSSH
 Dominik> +	bool "autossh"
 Dominik> +	select BR2_PACKAGE_OPENSSH

Doesn't this work with dropbear? Autossh afaik just creates a port
forward loop and monitors that the connection is alive, which should
work for dropbear as well.

 Dominik> diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
 Dominik> new file mode 100644
 Dominik> index 0000000..d81731a
 Dominik> --- /dev/null
 Dominik> +++ b/package/autossh/autossh.mk
 Dominik> @@ -0,0 +1,16 @@
 Dominik> +#############################################################
 Dominik> +#
 Dominik> +# autossh
 Dominik> +#
 Dominik> +#############################################################
 Dominik> +
 Dominik> +AUTOSSH_VERSION = 1.4c
 Dominik> +AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 Dominik> +AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 Dominik> +AUTOSSH_DEPENDENCIES = openssh
 Dominik> +
 Dominik> +define AUTOSSH_INSTALL_TARGET_CMDS
 Dominik> +	$(INSTALL) -D -m 0755 $(@D)/autossh $(TARGET_DIR)/bin

On my Debian machine autossh is in /usr/bin, and is just a shell wrapper
around the real binary in /usr/lib/autossh. Is there any specific reason
why you don't just use make install?

-- 
Bye, Peter Korsgaard
