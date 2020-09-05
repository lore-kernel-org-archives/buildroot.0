From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:25:59 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-stegano : new package
In-Reply-To: <20200901143731.2916-4-jugurtha.belkalem@smile.fr>
References: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
 <20200901143731.2916-4-jugurtha.belkalem@smile.fr>
Message-ID: <20200905232559.53e7b9a9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jugurtha,

On Tue,  1 Sep 2020 16:37:31 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Steganography is the art and science of writing hidden
> messages in such a way that no one , apart from the sender
> and intended recipient , suspects the existence of the message,
> a form of security through obscurity.
> Steganography is often used with cryptography.
> 
> More about python-stegano is available at :
> https://pypi.org/project/stegano/.
> 
> Stegano can be tested :
> $ python3
> >>> from stegano import lsb
> >>> secret = lsb.hide("./image.png", "Hello World")
> >>> secret.save("./image-with-steganography.png")  
> To get back text :
> >>> clear_message = lsb.reveal("./image-with-steganography")  

Not a strict requirement, but since you have a simple test case, what
about adding a runtime test in support/testing/ ?

> diff --git a/package/python-stegano/Config.in b/package/python-stegano/Config.in
> new file mode 100644
> index 0000000000..b0b209c5f8
> --- /dev/null
> +++ b/package/python-stegano/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_PYTHON_STEGANO
> +	bool "python-stegano"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_JPEG #runtime
> +	select BR2_PACKAGE_LIBXML2 #runtime
> +	select BR2_PACKAGE_OPENJPEG #runtime

Could you give more details about the dependency on those 3 libraries?
Is it because python-pillow must be built with openjpeg support and
jpeg support? Or is it just because in your situation, you were using
jpg pictures?

What about the libxml2 dependency?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
