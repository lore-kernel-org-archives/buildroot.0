From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Jan 2019 10:00:49 +0200
Subject: [Buildroot] [PATCH] support/scripts/apply-patches: use "git
 apply" as a fallback when applying patches
In-Reply-To: <20190111091552.72fba6ad@windsurf>
References: <20190110203004.9812-1-thomas.petazzoni@bootlin.com>
 <87wonbhnny.fsf@tarshish> <20190111091552.72fba6ad@windsurf>
Message-ID: <875zutvvf2.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, Jan 11 2019, Thomas Petazzoni wrote:
> On Fri, 11 Jan 2019 05:35:13 +0200, Baruch Siach wrote:
>
>> > Switching everybody to unconditionally use "git apply" seems a bit
>> > risky, so instead we take a different route: if applying the patch
>> > with "patch" fails, then we try with "git apply".  
>> 
>> This makes git a host dependency. Should we add host-git, or list git
>> with host requirements?
>
> It does not really make git a mandatory dependency. Indeed, "git apply"
> is only tried if "patch" fails.
>
> So, before my patch, if a patch failed to apply because "patch" failed,
> then it aborted the build.
>
> With my patch, if a patch fails to apply because "patch" failed, then
> we will try "git apply". If "git apply" is not available, it will fail,
> just like it used to be.
>
> So my proposal doesn't *require* git, it only tries harder to apply
> patches by using "git apply" if available.
>
> Setups that used to work today without "git" installed will continue to
> work with no change.

With this patch a package selection change that works on the developer's
machine where git is installed, would fail on the production build
machine that is missing git. Is there a clear error message in case of
patch failure?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
