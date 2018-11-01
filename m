From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Nov 2018 17:19:19 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <7ba255c0-e72e-7e02-d972-f8f082ce5214@mind.be>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
 <20181101062448.GC8261@x230>
 <20181101105513.GB4937@smart-ThinkPad-T410>
 <7ba255c0-e72e-7e02-d972-f8f082ce5214@mind.be>
Message-ID: <20181101161918.GA30470@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> > Removing unset will cause the following make command work wrong. Note
> > that the value of this environment variable is checked [1] and used. The
> > result of removing the unset line is that we will have double BR2_
> > prefixes in the final .config file as well as lots of warnings when
> > checking if all specified config values have been taken.

>  We have no prefix, the BR2_ is mere convention. So when calling merge_config,
> we should set CONFIG_ to empty, not to BR2_.

>  So indeed, the unset should be removed.

+1. I overlooked that regexp works with empty $CONFIG_ as well.
Thanks for explanation.

Kind regards,
Petr
