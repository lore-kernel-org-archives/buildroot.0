From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 08:36:54 -0600
Subject: [Buildroot] [PATCH v2 1/2] dependencies.mk: check for valid
 host-tar before other host dependencies
In-Reply-To: <20180227085541.11318-1-peter@korsgaard.com>
References: <20180227085541.11318-1-peter@korsgaard.com>
Message-ID: <CANQCQpZJ2iaq6ovQF8wb6dcAASFmHCye9mcYjyG6XVDwDt0SYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Feb 27, 2018 at 2:55 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> host-{cmake,lzip,xz} needs host-tar to extract their source code tarball, so
> we need to ensure that host-tar gets added to DEPENDENCIES_HOST_PREREQ
> before these in case they are both needed, otherwise the tools will fail to
> extract.
>
> With the upcoming change to blacklist modern tar versions this situation is
> likely to trigger more often.
>
> The real solution to this issue is the <foo>_EXTRACT_DEPENDENCIES rework,
> but that series is a bit too intrusive to add this close to 2018.02, so
> therefore this hack.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
