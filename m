From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 22:09:39 +0000
Subject: [Buildroot] [PATCH v2 0/3] Upgrade ARC port to new toolchain
In-Reply-To: <20130718235253.3600712d@skate>
References: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
 <20130718235253.3600712d@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D633A09F1D@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> While you're at it, have you followed the recent changes on floating point
> support for ARM?

I saw the mails, but I haven't studied them in detail. 

> How does floating point support works on ARC?
> Completely soft-float? Hard float is possible? Always the same FPU?

For the current generation of cores (ARC700 series for Linux) we do not really have an 'FPU'. The ARC cores have the possibility of adding various extensions, and for floating point we happen to have 4 different kinds of extensions: spfp-compact, dpfp-compact, spfp-fast, dpfp-fast. In reality, these are just ADD, SUB and MUL instructions, the rest still needs to happen in software. The single and double precision extensions can be combined so both are supported in the same core. The fast and compact variants relate to the speed and the number of gates/area; I think they share the same opcode space.

I think right now it is more important to focus on getting most packages to build; after that I will look into the best way to make a toolchain + libraries tailored to the exact core configuration: the FPU is not the only thing that is configurable; you can have a variable set of registers, different types of multipliers, etc, etc.

If I were to add this configurability somewhere, do you think that CTNG would be the right place, or Buildroot?

Thanks,

Mischa
