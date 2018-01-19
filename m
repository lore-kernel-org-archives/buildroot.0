From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 19 Jan 2018 16:00:41 +0100
Subject: [Buildroot] [PATCH v2] package/bash-completion: new package
In-Reply-To: <20180118224138.17cdb72b@windsurf.lan>
References: <1515675000-13355-1-git-send-email-romain.naour@smile.fr>
 <20180118224138.17cdb72b@windsurf.lan>
Message-ID: <63d76b2d-7ad4-62db-243c-d42b3070032f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 18/01/2018 ? 22:41, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 11 Jan 2018 13:50:00 +0100, Romain Naour wrote:
> 
>> +define BASH_COMPLETION_INSTALL_FILE
>> +	echo ". /usr/share/bash-completion/bash_completion" > $(TARGET_DIR)/etc/bash_completion
>> +endef
> 
> Who/what is reading this /etc/bash_completion file? Is bash itself
> automatically loading this file? I'm asking because on my distro, I
> have /etc/bash_completion.d/ and no /etc/bash_completion.

I'm using different Linux distribution and the bash_completion install is not
the same everywhere.

The bash-completion package install bash_completion script in
/usr/share/bash-completion/bash_completion and all completion script to
/usr/share/bash-completion/completion.

So, I guess that files located un /etc/bash_completion.h is distribution specific.

On my Fedora 27 I noticed that /etc/bash_completion is a symlink to
/usr/share/bash-completion/bash_completion.

On my Ubuntu 16.04 I have /etc/bash_completion.d/ and /etc/bash_completion script.

> 
> It seems like my bashrc here is automatically
> including /usr/share/bash-completion/bash_completion, and otherwise
> falls back to /etc/bash_completion:
> 
>   if [ -f /usr/share/bash-completion/bash_completion ]; then
>     . /usr/share/bash-completion/bash_completion
>   elif [ -f /etc/bash_completion ]; then
>     . /etc/bash_completion
>   fi

Same here with my Ubuntu 16.04.

> 
> Basically, my concerns are:
> 
>  - You are using ">" for the redirection. Are we going to be the only
>    package writing to this file?

I'll check this indeed.
The Buildroot Makefile take care to remove /etc/bash_completion when bash is not
selected. This means that some packages install some stuff here.

> 
>  - Do we support having other packages contribute additional bash
>    completion logic?

I'm wondering if we should let the user decide how to their
bash_completion/bashrc settings.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
