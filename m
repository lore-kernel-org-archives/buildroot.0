From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:27:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: Fix
 show-build-order stdout pollution
In-Reply-To: <20181115154542.29277-1-serj.kalichev@gmail.com>
References: <20181115154542.29277-1-serj.kalichev@gmail.com>
Message-ID: <20181119222713.4c71351d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 18:45:42 +0300, Serj Kalichev wrote:
> The commands like  "make show-build-order" or "make <package>-show-build-order" show
> the build order and then print "make[1]: Nothing to be done for 'show-build-order'" to
> stdout. It pollutes output. Technically this message is true but it's not true for user
> because he gets an information.
> 
> The <package>-show-build-order targets use $(info) for package name printing.
> The make utility doesn't consider the internal directive as a command so it
> think that it's "Nothing to be done". The patch adds the empty command to
> <package>-show-build-order to inform make utility that taget makes some real
> actions.
> 
> Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after inverting the $(info) call and the @:, as
suggested by Yann E. Morin. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
