From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 09:59:38 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <20180111171357.GA3559@scaer>
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
 <20180111171357.GA3559@scaer>
Message-ID: <20180112095938.621ff1bc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 18:13:57 +0100, Yann E. MORIN wrote:

> I would do:
> 
>     grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \

grep -q ?

>     || echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
> 
> That way, we only install it if not already present.

Otherwise, yes, agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
