From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 19:14:38 +0000
Subject: [Buildroot] RFC: package patching
In-Reply-To: <87k471n59k.fsf@macbook.be.48ers.dk>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <87k471n59k.fsf@macbook.be.48ers.dk>
Message-ID: <201111151914.38517.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 15 November 2011 08:45:11 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas De Schampheleire 
<patrickdepinguin+buildroot@gmail.com> writes:
> Hi,
> 
>  Thomas> I think we should try and improve this.
> 
>  Thomas> A first approach could be to simply remove support for
>  Thomas> foo-1.2.3-something.patch, and require version-specific patches to
> be Thomas> in a versioned subdirectory, package/foo/foo-1.2.3. For this,
> we Thomas> should remove line 02-04. In this case, common patches are
> applied Thomas> first, followed by versioned patches in subdirectories.
> 
> Yes, I know - We hit this with E.G. busybox in the past. I would go for
> the versioned-patches-in-subdir, as we (luckily) only support multiple
> versions for a limited number of packages.

 While we're at it, I would also make it policy to not include the version 
number in the patch, except for packages with multiple active versions.  Now, 
when you're upgrading a package, you also have to do a lot of renames of 
patches.

 Note that this fix will require renames of rougly 300 files... 

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
