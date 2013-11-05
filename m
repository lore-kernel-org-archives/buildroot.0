From: Andi Shyti <andi@etezian.org>
Date: Tue, 5 Nov 2013 21:17:53 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no
 patch is found for a package
In-Reply-To: <52793E3A.5060802@mind.be>
References: <1383656430-29160-1-git-send-email-andi@etezian.org>
 <52793E3A.5060802@mind.be>
Message-ID: <20131105201752.GC17791@jack.whiskey>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> >If no patch is available for a specific package it doesn't mean
> >that is necessarily an error, perhaps there is no need to apply
> >any patches. Therefore, don't stop the build by returning '1',
> >but go ahead.
> 
>  This is in fact intentional, because it indicates that there is
> something wrong with the configuration. When you specify in your
> configuration that some specific patch directory should be used, but
> that directory doesn't exist, then it probably means you made a
> mistake in your configuration.
> 
>  Can you give an example of a specific situation where you had a
> problem with this check?

this happens when for example you want to get as cross compiler
the daily snapshot instead of a specific version.

The build stops with an error because of that 'exit 1' since it
doesn't find any gcc-20131105 patch directory (i think the
snapshot is called so).

Andi
