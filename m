From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 18:21:45 +0100
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <56116029.7000204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-06-15 20:42, Fabio Porcedda wrote:
> Hi all,
> this patch set aims to improve build reproducibility by using a
> per-package staging directory.
> Also this feature aims to enable the top-level parallel make.
> 
> This patch set is available at:
> https://github.com/fabio-porcedda/buildroot/tree/pps-v4
> 
> 
> Every package instead of installing the files in the shared staging
> directory (STAGING_DIR) install all files in a subdirectory of the
> STAGINGPKG_DIR.

[snip]

> TODO:
>  - use the toolchaing wrapper even for the internal toolchain
>  - rebase over master (this patch set is based on 2015.05-161-gca5f11e).
>  - more testing (tested only for arm target).

[snip]

 Hi Fabio,

 Now that we have a toolchain wrapper for the internal toolchain, would you care
to rebase this series and use the toolchain wrapper for pps support?

 Thomas commented that there should also be a per-package host directory, but
after some discussion here at the BR developer meeting we decided that we could
start with just a per-package staging and see how far we get. We anyway don't
have complete reproducibility at the moment, since the build of host packages
depends on what is installed on the system.

 Note that we are really excited about the possibilities of per-package staging
and top-level parallel build, so we hope you'll continue working on it.

 I've marked this series as Changes Requested in patchwork.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
