From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 22 Mar 2018 00:11:09 -0300
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
References: <20180321215824.45a5b5bc@windsurf>
Message-ID: <5ab31ecd94bbd_65552b0d8140b8fc5231a@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Mar 21, 2018 at 05:58 PM, Thomas Petazzoni wrote:

> I looked more closely into this, and unfortunately, it doesn't work.
> Indeed, the data returned by the URL:
> 
>   RELEASE_MONITORING_API/projects/?distro=Buildroot
> 
> does not take into account the mapping between Buildroot package names
> and release-monitoring.org package names, it only contains the
> release-monitoring.org package names.

Indeed. I missed it was missing.

> 
> For example, we have a mapping samba4 -> samba, that allows
> https://release-monitoring.org/api/project/Buildroot/samba4 to return
> the expected result. But you won't find anything named "samba4" in
> https://release-monitoring.org/api/projects/?distro=Buildroot. This
> makes the entire concept of distro mapping useless.
> 
> Therefore, your proposal cannot work with the data that we can
> currently download from release-monitoring.org. I have asked on the
> #fedora-apps IRC channel about this.
> 
> Perhaps we could go with my v2 version on this aspect (i.e make HTTP
> requests for each package), and change that later on if a better
> solution is found ?

I dislike the fact we make 2000+ HTTP requests, but as you explained it is a
limitation from the current api exposed by the upstream. I even looked at the
code hoping the mapping could be easily introduced in api v1... but no, it is
not trivial.

So, yes. Let's do this incrementally, first let's make it work using one request
per package, then later we improve the script when the api v2 is deployed.

In the meanwhile, we will be able to start creating the mappings based on the
daily generated html.

Regards,
Ricardo
