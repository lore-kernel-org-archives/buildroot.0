From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:05:58 +0100
Subject: [Buildroot] [PATCH 3/6] php-zmq: new package
In-Reply-To: <1390944391-3892-3-git-send-email-gustavo@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
 <1390944391-3892-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140128230558.157ee3eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Jan 2014 18:26:28 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in          | 10 ++++++++++
>  package/php-zmq/Config.in  | 17 +++++++++++++++++
>  package/php-zmq/php-zmq.mk | 25 +++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 package/php-zmq/Config.in
>  create mode 100644 package/php-zmq/php-zmq.mk

Just curious, how many potential PHP packages could we add? The build
logic for the four packages you submitted looks highly similar, maybe
it calls a php-package infrastructure?

The only "difficulty" is that it would have to inherit from
autotools-package, which itself already inherits from generic-package.
So it would be the first package infrastructure to inherit from a
package infra that already inherits from generic-package. I'm sure it
can work, but it might raise issues with some missing quoting.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
