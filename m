From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 16:56:05 +0100
Subject: [Buildroot] [PATCH next 1/2] package/apr-util: fix build with
 per-package folders
In-Reply-To: <20181115201355.GN10271@scaer>
References: <20181115152107.5834-1-thomas.petazzoni@bootlin.com>
 <20181115152107.5834-2-thomas.petazzoni@bootlin.com>
 <20181115201355.GN10271@scaer>
Message-ID: <20181120165605.4f1d0982@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 21:13:55 +0100, Yann E. MORIN wrote:

> I don't know what sed version you are using, but mine breaks the
> hardlink when doing in-place replacement:
> 
>     $ echo OK >foo
>     $ ln foo bar
>     $ sed -i -e 's/OK/in-bar/' bar
>     $ cat foo
>     OK
>     $ cat bar
>     in-bar

I tested again, and you're right, I'll simplify the logic accordingly.
Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
