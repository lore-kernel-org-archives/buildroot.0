From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:53:50 +0200
Subject: [Buildroot] [PATCH 3/6] php: enable opcache extension in
 php.ini if selected
In-Reply-To: <555A501B.8030606@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
 <20150518223609.6e103d96@free-electrons.com>
 <555A501B.8030606@je-eigen-domein.nl>
Message-ID: <20150518225350.7127a664@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris,

On Mon, 18 May 2015 22:48:27 +0200, Floris Bos wrote:

> >> +	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
> >> +		$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \
> > Why are you replacing the extension=php_xsl.dll line specifically?
> 
> I am not.
> 
> "/a" means Append line after the range specified.
> Replacing would be done with the "s" from Substitute instead.

Ah, indeed, my bad. For some reason, I had in my mind that if you're
using sed, you must be replacing an existing line.

So, I'm fine with your proposal.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
