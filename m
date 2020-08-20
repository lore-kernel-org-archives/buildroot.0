From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Thu, 20 Aug 2020 11:22:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <6947931.SzVexJgdEg@wintermute>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sunday, 16 August 2020 00:09:14 CEST Thomas Petazzoni wrote:
> >     i686     |       host-elixir-1.9.4        | NOK |
> >     http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d
> >     07afa80315 |
> make[1]: Entering directory
> '/tmp/instance-1/output-1/build/host-elixir-1.9.4' make[1]: erlc: Command
> not found
> 
> We have this once in a while, on different machines:
> http://autobuild.buildroot.net/?reason=host-elixir%
> 
> Weird that it doesn't appear more often. Is there some kind of race
> condition?
> 
> Frank: you added the host-elixir package, could you have a look ?

I found some time to take a look at this. It seems that the root cause for the 
problem is that all of these configs have BR2_PER_PACKAGE_DIRECTORIES set.

It seems that ELIXIR_DEPENDENCIES should be changed to 
HOST_ELIXIR_DEPENDENCIES in elixir.mk to ensure that it's picked up correctly 
in the per-package build.

I've got a patch ready to submit, I'll do that asap.

Br,
Frank
