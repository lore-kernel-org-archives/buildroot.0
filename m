From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 4 Jan 2014 09:24:03 +0100
Subject: [Buildroot] [PATCH 1 of 5 v3] deprecated handling: introduce
	BR2_DEPRECATED_SINCE_xxxx_xx
In-Reply-To: <14cfc9f6c9b34dc82c58.1388764970@argentina>
References: <patchbomb.1388764969@argentina>
 <14cfc9f6c9b34dc82c58.1388764970@argentina>
Message-ID: <CAAXf6LWCRDOwnpS9dtZo=GaTfsGXKSfN3xr4iepx-yUH03Vxdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 3, 2014 at 5:02 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> In order to keep better track of when a feature got deprecated, and hence
> when it can be removed, a new set of symbols BR2_DEPRECATED_SINCE_xxxx_xx is
> introduced. These symbols are automatically selected when BR2_DEPRECATED is
> selected, and thus are transparent to the user.
> A deprecated feature will no longer depend on BR2_DEPRECATED directly, but
> rather on the appropriate BR2_DEPRECATED_SINCE_xxxx_xx. If that symbol does
> not yet exist, it has to be created in Config.in.
> When removing a deprecated feature, one should also check whether this was
> the last feature using the BR2_DEPRECATED_SINCE_xxxx_xx symbol, in which
> case the latter can be removed from Config.in.
>
> A followup patch will make sure the overview is added to the list of
> deprecated features in the manual, so that a buildroot core developer can
> easily determine which features to remove in a given development cycle.

Just a small note: this patch series does not yet really add this
overview to the manual, I now realize. The manual looks as before,
except that the name of the symbol itself got added. I will try to
make a followup patch that changes that, but I think it can be
independent of this series.
