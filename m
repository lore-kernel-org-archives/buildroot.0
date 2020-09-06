From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 16:33:00 +0200
Subject: [Buildroot] [PATCH next 1/1] package/janus-gateway: add an
 option to remove the HTML demos
In-Reply-To: <20200831153241.8960-1-nicolas.cavallari@green-communications.fr>
References: <20200831153241.8960-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20200906163300.18009559@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 31 Aug 2020 17:32:41 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> janus-gateway comes with an example website to test its features.
> Since the bump to 0.10.3, this website takes 1.8MiB uncompressed on the
> target, among which is a 1MiB video sample which does not compress
> well.
> 
> This adds an default-y option to keep the website after installation.
> If unset, the website is manually deleted from the target as there is
> no configure option to not install it.

I understand that you used a "default y" to keep backward
compatibility. However, in this case, I believe backward compatibility
does not win over "good out of the box experience". Indeed, by default,
we try to be minimal, and having an example/demo website with a 1MB
video sample installed by default is not really "minimal". So I've
dropped the "default y" and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
