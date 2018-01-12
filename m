From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 12 Jan 2018 10:06:45 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <20180112095938.621ff1bc@windsurf.lan>
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
 <20180111171357.GA3559@scaer> <20180112095938.621ff1bc@windsurf.lan>
Message-ID: <d7a33501-8fb4-4524-685f-8c3c16fd73e4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

Le 12/01/2018 ? 09:59, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 11 Jan 2018 18:13:57 +0100, Yann E. MORIN wrote:
> 
>> I would do:
>>
>>     grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \
> 
> grep -q ?
> 
>>     || echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
>>
>> That way, we only install it if not already present.
> 
> Otherwise, yes, agreed.

Ok, I'll fix this.
But the same issue should happen with other shell (not tested though).

For example, it ash (busybox) is not the default shell and a user use it to
login, it will be rejected.
So busybox should also add /bin/ash in /etc/shells.

Thoughts?

Best regards,
Romain

> 
> Thomas
> 
