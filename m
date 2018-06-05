From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 15:06:41 +0200
Subject: [Buildroot] [PATCH 1/1] Use one call to mkdir to create needed
 directories.
In-Reply-To: <20180605123611.21759-1-F.LaRoche@pilz.de>
References: <20180605123611.21759-1-F.LaRoche@pilz.de>
Message-ID: <20180605150641.439f4352@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 14:36:11 +0200, Florian La Roche wrote:
> Reduce this to only call mkdir once to create the needed directories.
> 
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>

Thanks for all your patches. Generally they look good to me in terms of
contents, but there are a few minor formatting issues that would make
them better:

 - The commit title should include a prefix of the package being
   impacted.

 - The commit title should often be a bit shorter.

 - The commit log should contain only one empty line before the SoB
   line, not two empty lines.

 - A non empty commit log would be better, to give additional
   explanations when necessary.

For this patch, a better commit log would for example be:

busybox: reduce number of mkdir calls in inittab

The default Busybox inittab does two separate mkdir calls to
create /dev/pts and /dev/shm, which is not necessary. Let's refactor
those two calls into a single one.

Signed-off-by: ...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
