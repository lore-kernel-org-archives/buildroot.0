From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 03 Oct 2011 19:30:52 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: fix build by
 disabling testchannels example
In-Reply-To: <20111002191515.2B1DE8E04A@busybox.osuosl.org>
References: <20111002191515.2B1DE8E04A@busybox.osuosl.org>
Message-ID: <1317663052.8140.1.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-10-02 at 21:13 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=1c20b39cf31bff85a8cf35e3bb2d8a9bbf436b16
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Testchannels doesn't build because it forgets to link with libgstinterfaces.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  ...base-0.10.35-disable-testchannels-example.patch |   26 ++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)

You can revert the following change now. It should not any longer be
needed:

commit 6089579460ff9717e7b96e71b949fdbd67be62da
Author: Sven Neumann <s.neumann@raumfeld.com>
Date:   Fri Sep 30 15:58:38 2011 +0200

    gst-plugins-base: disable parallel build
    
    Parallel builds sometimes break when audio/testchannels is
    compiled before the gstinterfaces library.
    
    Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>


Regards,
Sven
