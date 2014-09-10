From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 22:19:21 +0200
Subject: [Buildroot] [PATCH 02/12] binutils/2.24: add patch to warn
 about unsafe library paths
In-Reply-To: <20140910195204.GA23947@free.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140910195204.GA23947@free.fr>
Message-ID: <20140910221921.489fb1b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 10 Sep 2014 21:52:04 +0200, Yann E. MORIN wrote:

> > ++  char *temp;
> 
> Well, let's give it a better name, please:  char *BR_paranoid_env;

[...]

> > ++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> > ++  if (temp && strlen(temp) > 0)
> 
>     if (BR_paranoid_env && BR_paranoid_env[0])

Ok, makes sense.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
