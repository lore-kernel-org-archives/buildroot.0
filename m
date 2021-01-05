From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2021 23:05:14 +0100
Subject: [Buildroot] [PATCH 03/10 v3] support/download: add helper to
 generate a reproducible archive
In-Reply-To: <bcb281853f0da8cd970446f4afed093b317dcc82.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <bcb281853f0da8cd970446f4afed093b317dcc82.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <b055acb2-8ccd-b293-e5fc-56c33c7281ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/12/2020 12:01, Yann E. MORIN wrote:
> We currently need to generate reproducible archives in at least two
> locations: the git and svn download backends. We also know of some
> future potential use (e.g. the other download backends, like cvs, or
> in the upcoming download post-processors for vendoring, like cargo
> and go).
> 
> However, we are currently limited to a narrow range of tar versions
> that we support, to create reproducible archives, because the gnu
> format we use has changed with tar 1.30.
> 
> As a consequence, and as time advances, more and more distros are,
> or will eventually start, shipping with tar 1.30 or later, and thus
> we need to always build our on host-tar.
> 
> Now, thanks to some grunt work by Vincent, we have a set of options
> that we can pass tar, to generate reproducible archives back from
> tar-1.27 and up through tar-1.32, the latest released version.
> 
> However, those options are non-trivial, so we do not want to have
> to repeat those (and maintain them) in multiple locations.
> 
> Introduce a helper that can generate a reproducible archive from
> an input directory.
> 
> The --pax-option, to set specific PAX headers, does not accept
> RFC2822 timestamps which value are too away from some fixed point
> (set atcompile-time?):
>     tar: Time stamp is out of allowed range
> 
> However, the same timestamps passed as strict compliant ISO 8601 are
> accepted, so that's what we expect as a date format.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
