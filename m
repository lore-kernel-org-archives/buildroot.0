From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:54:27 +0200
Subject: [Buildroot] [[PATCH v2 07/14] package/mender: select
 BR2_PACKAGE_CA_CERTIFICATES
In-Reply-To: <20180820130914.22377-8-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-8-mirza.krak@northern.tech>
Message-ID: <20180820165427.7f25b056@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:07 +0200, Mirza Krak wrote:
> Mender uses TLS to community with the management server,
> and if CA signed certificates are used we must have
> the ca-certificates package installed to be able to
> verify these.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

I am not sure we want to make this a mandatory dependency. If people
are using a management server that provides a CA signed certificate,
then they should add the ca-certificates package to their build.

Perhaps this belongs more to a note in the Config.in help text. Or
maybe even Mender deserves a package/mender/readme.txt, which a bit like
boot/grub2/readme.txt, would give more details about Mender's
integration in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
