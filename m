From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 22:56:29 +0100
Subject: [Buildroot] [PATCH v3 1/5] testing/infra/builder: build with
 target and environment
In-Reply-To: <20190128232209.17485-2-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
 <20190128232209.17485-2-aduskett@gmail.com>
Message-ID: <20190129225629.7d2b4400@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jan 2019 18:22:05 -0500
aduskett at gmail.com wrote:

> -    def configure(self):
> +    def configure(self, make_extra_opts=[], make_extra_env={}):

I was initially a bit skeptical about make_extra_opts being a list and
make_extra_env being a dict. But it in fact makes sense: the opts are
part of the command, which is a list, while the environment is expected
to be a dict in subprocess.call.

So: patch applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
