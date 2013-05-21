From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 May 2013 23:24:48 +0200
Subject: [Buildroot] Startup files numbering policy
In-Reply-To: <537887127.1024616.1369170640439.JavaMail.root@advansee.com>
References: <1882993282.1023650.1369164262752.JavaMail.root@advansee.com>
 <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
 <20130521221707.64d0815d@skate>
 <537887127.1024616.1369170640439.JavaMail.root@advansee.com>
Message-ID: <20130521232448.27502768@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Tue, 21 May 2013 23:10:40 +0200 (CEST), Beno?t Th?baudeau wrote:

> I don't have the exact use case in mind, but I have encountered this issue at
> least once on a project with many startup scripts. The board needed many custom
> startup scripts in its target skeleton, and in the end there was a collision
> with BuildRoot's predefined startup script numbers that broke the expected
> startup order. It was also unclear how to number the board-specific startup
> scripts before launching the 1st build, and without a list there is always the
> risk of a collision when enabling a new package.

Ok.

> I don't think that changing the current script numbering would be a solution,
> because that could cause an issue for someone else. There could perhaps be a
> document listing the numbering of the startup scripts installed by all BuildRoot
> packages. That would make it clear how to assign a new startup script number,
> what to expect from BuildRoot, and how to perform custom adjustments (i.e.
> post-build script).

Isn't:

$ find package/ -name 'S[0-9][0-9]*'

a good enough documentation for this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
