From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 7 Jun 2012 16:16:35 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
In-Reply-To: <1336857045-10679-1-git-send-email-arnout@mind.be>
References: <1336857045-10679-1-git-send-email-arnout@mind.be>
Message-ID: <CAAXf6LUC83XoHCMjG8r6kwCQ1kLhcBdwZ5M7e0oWr5biPwrTkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[trim message to get it accepted on the list]

On Sat, May 12, 2012 at 11:10 PM, Arnout Vandecappelle
(Essensium/Mind) <arnout@mind.be> wrote:
> Replace $(call XXXTARGETS,host) with $(XXXTARGETS_HOST) and
> $(call XXXTARGETS) with $(XXXTARGETS).
>
> Also includes documentation update, but not for buildroot.html.
>
> This brings the time for 'make -qp' (which is used by bash-completion)
> down from 1.85s to 1.35s on my laptop.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Although this is a huge patch, not much has changed.
>
> pkg-gentargets, pkg-maketargets and pkg-cmaketargets have manual changes.
>
> Documentation is updated.
>
> pkg-stats script is updated (brokennes from the pkg-*.mk files remains).
>
> All the rest is done with
> find package linux toolchain boot -name \*.mk | \
> ?xargs sed -i 's/$(eval $(call GENTARGETS,host))/$(eval $(GENTARGETS_HOST))/;
> ? ? ? ? ? ? ? ?s/$(eval $(call GENTARGETS))/$(eval $(GENTARGETS))/'
>
> I could have split it up into separate patches but I didn't see much point.
> It wouldn't make the review or integration easier if you ask me. ?And if
> we ever want to revert, we want to revert all of it.

Note that I think it would be nice to split it in two: one patch for
the infrastructure changes, and one for the changes in all packages.
