From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 14:59:44 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Support merged defconfigs
In-Reply-To: <b44b67ae-4aa1-5740-cdf4-22f3296fc58f@mind.be>
References: <90639972664ebd51802b3c2b94b8c01e235bd956.1462771329.git.sam.bobroff@au1.ibm.com>
 <20160512160226.62bb28bd@free-electrons.com>
 <b44b67ae-4aa1-5740-cdf4-22f3296fc58f@mind.be>
Message-ID: <20160513145944.4246bbdd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 23:58:55 +0200, Arnout Vandecappelle wrote:

>   I tend to agree with Thomas's reasoning. However, I think it would be good if 
> there was a clearer canonical way of using buildroot. Gustavoz' genconfig script 
> could be part of that. I, for example, have a local.mk fragment that autodetects 
> packages you have checked out in $(BR2_EXTERNAL)/src and adds OVERRIDE_SRCDIR 
> for them. I remember there was this template br2-external github repo at some 
> point that you could use as a basis to start your own br2-external project (but 
> I can't find it back).

You're probably referring to
https://github.com/Openwide-Ingenierie/buildroot-submodule.

>   I do think it is good if such supporting functionality is carried in the core 
> buildroot repo. But it's better if it's a bit out of the way, not in the main 
> Makefile, and probably called through some helper script.
> 
>   I have a similar feeling about the genimage template script BTW.

Should we create a section in the manual with some kind of "best
practices" or "going further" ideas?

Regarding Gustavo's 'genconfig' script, I am not sure it makes a lot of
sense to have something like that in the tree. All what it does is very
project-specific, and down the road, it simply calls the
merge_config.sh script, which is already in our tree.

So, for the specific situation of creating a defconfig by combining
fragments, isn't the problem more a documentation problem than anything
else?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
