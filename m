From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Jul 2021 16:28:23 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210707144915.2db26f79@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
 <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
 <20210707144915.2db26f79@bootlin.com>
Message-ID: <cf35d388-e5c5-d253-37f9-0a6fe3866c0b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/07/2021 14:49, Herve Codina wrote:
> Hi,
> 
> On Wed, 7 Jul 2021 14:21:16 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:

[snip]

>>> (2) $(HOST_DIR)/usr will always be a symlink to $(HOST_DIR)/.  
>>
>>  Although for now you can assume this, ideally we would like to have the
>> possibility to get rid of the usr->. symlink. So if you can avoid relying on it
>> it would be better.
> 
> Right.
> Assuming, the symlink not present, can we be sure that host python stuff will be
> installed only in $(HOST_DIR)/lib/python* ?

 Yes - the usr symlink will only be removed if we're absolutely sure that
nothing installs in $(HOST_DIR)/usr (which means probably never...)

 Regards,
 Arnout
