From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 11:25:25 +0200
Subject: [Buildroot] [PATCH 2/3] package/bash: add option to keep or
 remove loadable examples
In-Reply-To: <20210424074731.GO298901@scaer>
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
 <20210423202356.37681-2-thomas.petazzoni@bootlin.com>
 <20210424074731.GO298901@scaer>
Message-ID: <20210424112525.4676ae95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Apr 2021 09:47:31 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > whoami is /usr/bin/whoami
> > root
> > whoami is a shell builtin
> > root  
> 
> I was not sure what you meant with those examples, so I've rewritten
> that part with a capture of a session enabling and disabling whoami
> as a shell builtin.

Gah, the commands went away, as they were prefix with my "#" shell
prompt :-/

This whole thing should have been:

# type whoami
whoami is /usr/bin/whoami
# whoami
root
# enable -f /usr/lib/bash/whoami whoami
# type whoami
whoami is a shell builtin
# whoami
root

Except that all lines starting with a # got eaten by Git :-/

Sorry about that, and thanks for applying the patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
