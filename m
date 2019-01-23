From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 21:34:00 +0100
Subject: [Buildroot] [PATCH] support/scripts/apply-patches: use "git
 apply" as a fallback when applying patches
In-Reply-To: <55a5605d-5773-16d5-ef79-a37dac3c009a@mind.be> (Arnout
 Vandecappelle's message of "Wed, 23 Jan 2019 15:17:55 +0100")
References: <20190110203004.9812-1-thomas.petazzoni@bootlin.com>
 <87wonbhnny.fsf@tarshish> <20190111091552.72fba6ad@windsurf>
 <875zutvvf2.fsf@tarshish>
 <55a5605d-5773-16d5-ef79-a37dac3c009a@mind.be>
Message-ID: <87o987jepz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> With this patch a package selection change that works on the developer's
 >> machine where git is installed, would fail on the production build
 >> machine that is missing git. Is there a clear error message in case of
 >> patch failure?

 >  I'm with Baruch here. The reason to have this feature is exactly to have the
 > possibility to have patches that modify binaries or that modify symlinks. Thus,
 > it becomes likely that someone will submit such a patch. It will work for the
 > developer, and it will also work in the autobuilders since all of them have git
 > installed (otherwise they wouldn't be able to clone the Buildroot repo). Thus,
 > any such patch will go unnoticed.

I agree, that is not good.


 >  I don't think it hurts to force git as a dependency.

If we do that, should we then always use git apply instead of patch?
(and drop the patch dependency)

-- 
Bye, Peter Korsgaard
