From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Mar 2015 00:02:29 +0100
Subject: [Buildroot] [PATCH v5 2/3] python-cheetah: add host-package
	support
In-Reply-To: <20150310234726.1b583693@free-electrons.com>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>	<1426011874-11011-2-git-send-email-gwenj@trabucayre.com>	<54FF72A3.4040701@mind.be>
 <20150310234726.1b583693@free-electrons.com>
Message-ID: <54FF7805.4070701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Note to Gwenhael (removed from Cc): the discussion below is no longer relevant
for your patch.

On 10/03/15 23:47, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 10 Mar 2015 23:39:31 +0100, Arnout Vandecappelle wrote:

[snip]

>>  BTW, Thomas, when you committed python-cheetah you removed the runtime
>> dependency on markdown because there are some examples you can run without
>> markdown. Is that the way we work? The cheetah package itself declares a
>> dependency on markdown because one of its classes (Filters.Markdown) uses it. Of
>> course, as long as you don't use that particular filter, there won't be a
>> problem. But it feels weird to me that we remove a dependency that is claimed by
>> a package, unless there is a good reason for it (and I don't count saving 260K
>> of .pyc files as a good enough reason).
> 
> "Way we work" is fairly loosely defined when it comes to interpreted
> languages and more-or-less optional dependencies :-)
> 
> Should python-cheetah select all the possible dependencies it may use
> for all its filters, or should it leave this responsibility to the
> Buildroot user ? Not easy to decide.

 For me, the acid test is what the package declares itself.
Cheetah.egg-info/requires.txt says Markdown >= 2.0.1
For perl packages, we trust whatever dependencies the package declares. If we
would have a scancpan-like script for pypi, the dependency would be there.

> 
> Since the dependency was apparently not strictly needed, and there was
> (as far as I remember) no comment justifying the dependency, it seemed
> natural to me to remove this dependency. That being said, I wouldn't be
> offended at all if we decide to re-introduce the dependency, provided a
> comment indicating why we're adding this not-really mandatory
> dependency.

 On the other hand, as long as the lack of dependency is not bothering anyone,
we can leave it as it is :-) The purpose of discussion is what should be the
guiding principle for future python packages. My proposal is: follow the egg info.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
