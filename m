From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:41:38 +0100
Subject: [Buildroot] [PATCH v2] package/bash-completion: new package
In-Reply-To: <1515675000-13355-1-git-send-email-romain.naour@smile.fr>
References: <1515675000-13355-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180118224138.17cdb72b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 13:50:00 +0100, Romain Naour wrote:

> +define BASH_COMPLETION_INSTALL_FILE
> +	echo ". /usr/share/bash-completion/bash_completion" > $(TARGET_DIR)/etc/bash_completion
> +endef

Who/what is reading this /etc/bash_completion file? Is bash itself
automatically loading this file? I'm asking because on my distro, I
have /etc/bash_completion.d/ and no /etc/bash_completion.

It seems like my bashrc here is automatically
including /usr/share/bash-completion/bash_completion, and otherwise
falls back to /etc/bash_completion:

  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

Basically, my concerns are:

 - You are using ">" for the redirection. Are we going to be the only
   package writing to this file?

 - Do we support having other packages contribute additional bash
   completion logic?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
