From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:44:08 -0300
Subject: [Buildroot] [PATCH v7 5/8] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <1429740521-31943-6-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
 <1429740521-31943-6-git-send-email-arnout@mind.be>
Message-ID: <553886A8.9020304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2015 07:08 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> In very constrained cases, it might be needed to not fail if a hash is
> missing. This is notably the case for custom external toolchains to be
> downloaded, because we do have a .hash file for external toolchains,
> but we obviously can not have hashes for all existing custom toolchains
> (he, "custom"!).
> 
> So, add a way to avoid failing in that case.
> 
> From the Makefile, we export the list of files for which not to check
> the hash. Then, from the check-hash script, if no check was done, and
> the file we were trying to match in in this exclusion list, we just exit
> without error.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
