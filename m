From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Mar 2018 07:49:42 -0500
Subject: [Buildroot] [PATCH] busybox: disable PAM in the config if
 linux-pam is not selected
In-Reply-To: <20180326120006.24104-1-arnout@mind.be>
References: <20180326120006.24104-1-arnout@mind.be>
Message-ID: <CANQCQpbrCtCuXDDxtd07i=+-YE6AbVqVG69EA5j-rf9iC438Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Mar 26, 2018 at 7:00 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> Currently there is only logic to enable PAM when linux-pam is selected.
> However, busybox will fail to build with PAM enabled if the linux-pam
> package has not been built before. So we should forcibly disable PAM in
> busybox in that case.
>
> Normally this is not an issue since our default busybox config doesn't
> have PAM enabled. However, if you enable linux-pam, then save the
> busybox config to a custom configuration file, then disable linux-pam
> again, and then do a "make clean; make", the build will fail. A more
> practical situation where this can occur is when the same custom
> busybox config is used in a Buildroot config with and without
> linux-pam.

I've observed that fun behaviour when we've gone between basic builds
and configurations with STIG/SELinux requirements.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
