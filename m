From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Apr 2019 09:30:46 +0200
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <20190420205404.GC21166@scaer>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be> <20190418145344.GA21166@scaer>
 <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
 <bc9c8aa1-9c56-7c86-9b3f-2cd66a91f796@mind.be> <20190420205404.GC21166@scaer>
Message-ID: <cacfd25b-8a0e-dfe0-185b-2cff5b0d473c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 20/04/2019 22:54, Yann E. MORIN wrote:
> Vadim, Arnout, All,
> 
> Here's my take on the topic (still WIP, but mostly there, needs commit
> log):
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/br2-ext-toolchain
> 
> I'll be off until Monday, when I'll write proper commit log before
> submitting it.

 A few comments:

- The rule for internal variables being prefixed by BR_ instead of BR2_ is
written down, in some BR developer days report.

- Bikeshed: call the "dir" variable "outputdir" or something that makes it clear
it's the output.

- For the removal of prepare-kconfig, maybe mention that it reverts
9429e7b698638399ecfd73aa37545594f253a074

- I think it's worth adding a flag that checks if there is any external
toolchain at all, and to put a comment in br2-external.toolchains.in why it is
empty.

 Regards,
 Arnout
