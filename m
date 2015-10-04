From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:07:58 +0100
Subject: [Buildroot] [PATCH v2 0/4] legal-info: save the
 external-toolchain source archive
In-Reply-To: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
References: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20151004170758.41802f96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat,  3 Oct 2015 23:18:17 +0200, Luca Ceresoli wrote:

> Luca Ceresoli (4):
>   legal-info: allow to declare the actual sources for binary packages
>   toolchain-external: mass-define actual source tarball for known
>     patterns
>   toolchain-external: define actual sources for arago toolchains
>   docs/manual: document new actual source package variables

All four patches applied, with only the removal of unneeded warning in
the first patch.

We noted several things during the review:

 * The ifneq ($$($(2)_SITE_METHOD),override) test will always be false
   because SITE_METHOD is never set to "override". This part of the
   code should be reworked to simply test $(2)_OVERRIDE_SRCDIR instead:
   when empty, it indicates that the packages is neither a "local"
   site-method package nor a package that has its source directory
   overridden.

 * Maybe the fetching of the "actual source" could be deferred to a
   separate $(1)-legal-info-source target, to refactor with the
   existing dependency of $(1)-legal-info on $(1)-source.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
