From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 19:59:16 +0200
Subject: [Buildroot] [PATCH v3 2/9] testing/infra/builder: split
 configure() from build()
In-Reply-To: <20171029140608.26200-3-ricardo.martincoski@datacom.ind.br>
References: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
 <20171029140608.26200-3-ricardo.martincoski@datacom.ind.br>
Message-ID: <20180401195916.29aac7e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 12:06:01 -0200, Ricardo Martincoski wrote:
> Some test cases don't use a full build as setup, so split the build()
> method into configure() and build().
> It allows a test case to perform configuration at the setup stage and
> the build inside the test itself.
> 
> Call this new method just before build in the BRTest base class, to keep
> the current behavior for existing test cases.
> 
> This change will be needed when adding a common class to test the git
> download infra.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I've applied, but I have a comment, see below.


> +    def build(self):
> +        env = {"PATH": os.environ["PATH"]}

So now, we have the same local "env" variable in configure() and
build(). Would it make sense to do:

	self.env = ...

in the constructor, and then use it in configure() and build() ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
