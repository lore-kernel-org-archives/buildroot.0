From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 4 Aug 2020 12:23:16 +0200
Subject: [Buildroot] [PATCH 0/2] Add utils/source-check
In-Reply-To: <20200504111551.15920-1-patrickdepinguin@gmail.com>
References: <20200504111551.15920-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LW5rpRPjjfsPorqV_8WaQ2sY58WSsZ5PkhV5iNeR+kw1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 4 may. 2020 a las 13:14, Thomas De Schampheleire (<
patrickdepinguin@gmail.com>) escribi?:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Hello,
>
> Buildroot used to have a 'make source-check' command, which was later
> removed.
> Nevertheless, for organizations that use a download mirror and want to
> efficiently check that all needed files are present without actually
> downloading, an equivalent is still useful.
>
> After the addition of the 'show-info' target, this is now possible without
> polluting the core Buildroot infrastructure.
>
> The script is a 'utility', it is not used automatically, just present for
> the
> benefit of users.
>
> Note: as mentioned in the commit msg, the current script only covers scp
> and hg
> downloads, my needs. It could be extended to cover git etc., but it may
> not be
> possible to check remotely if a git revision exists on a repository. So for
> these additional download methods, it may be needed to perform an actual
> clone?
>
>
> Patch 1 adds BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS and is useful
> independently
> from source-check. It addresses the problem where BR2_PRIMARY_SITE_ONLY
> cannot
> be used if you also have packages under version control.
>
> Patch 2 adds the source-check script.
>
>
>
> Best regards,
> Thomas
>
> Thomas De Schampheleire (2):
>   core: add BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
>   utils/source-check: new script
>
>  Config.in               |  11 +++
>  package/pkg-download.mk |   8 +-
>  utils/source-check      | 170 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 188 insertions(+), 1 deletion(-)
>  create mode 100755 utils/source-check
>
> --
> 2.26.2
>
>
I would like to ping this series for feedback:

http://patchwork.ozlabs.org/project/buildroot/patch/20200504111551.15920-2-patrickdepinguin at gmail.com/
http://patchwork.ozlabs.org/project/buildroot/patch/20200504111551.15920-3-patrickdepinguin at gmail.com/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200804/04c9525c/attachment.html>
