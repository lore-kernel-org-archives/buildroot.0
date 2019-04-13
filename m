From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 20:31:05 +0200
Subject: [Buildroot] [RFC] package/python-mako: build host-python-mako
 as python3 module for mesa3d build.
In-Reply-To: <20190413185407.7b474503@windsurf>
References: <20190413164606.25700-1-romain.naour@smile.fr>
 <20190413185407.7b474503@windsurf>
Message-ID: <7d87341a-9664-346b-6fb6-6805bdd07904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 18:54, Thomas Petazzoni wrote:
> Alternatively, perhaps for host Python modules we should always install
> them for both host-python and host-python3 (if both are enabled, of
> course). The gotcha is that since we don't have any Config.in options
> for host packages, how can we know if host-python and/or host-python3
> are enabled ?

 We decided in February that having Config.in.host for all packages would add
too much complexity and confusion. We could, however, still do it for python/3
(just like we already have a few blind host package configs). By my count, 52
packages would have to be updated to select BR2_PACKAGE_HOST_PYTHON{,3}. That is
borderline doable, I think.

 The tricky part is detecting when we fail to do the select.

 Regards,
 Arnout
