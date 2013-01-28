From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jan 2013 09:13:47 +0100
Subject: [Buildroot] [RFC v1 05/14] autotools infrastructure: do the
 autoreconf as a post patch step
In-Reply-To: <5105A7BF.4080701@mind.be>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <510452A9.4050805@mind.be> <20130127172748.29a8d6cf@skate>
 <5105A7BF.4080701@mind.be>
Message-ID: <20130128091347.4f2288ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 27 Jan 2013 23:18:39 +0100, Arnout Vandecappelle wrote:

> > So maybe the
> > autotools infrastructure needs a special hook in the generic
> > infrastructure (rather than a normal post patch hook), to ensure
> > that the autoreconf step gets executed after all post patch hooks?
> 
>   Or maybe (just thinking out loud here) there could be the
> possibility for the package infrastructure to add additional steps in
> the dependency chain. Something like
> 
> ifeq ($$($(2)_AUTORECONF),YES)
> $(2)_TARGET_AUTORECONFIGURE = $$($(3)_SRCDIR)/.stamp_autoreconfigured
> $(1)-autoreconfigure: $(1)-patch $$($(2)_TARGET_AUTORECONFIGURE)
> $(1)-configure: $(1)-autoreconfigure
> endif

Sounds interesting. I'll try to experiment around this idea.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
