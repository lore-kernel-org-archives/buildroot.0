From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:21:08 +0100
Subject: [Buildroot] [PATCH 1/1] python-pip: select
 BR2_PACKAGE_PYTHON_SETUPTOOLS
In-Reply-To: <20181024162215.6758-1-asafka7@gmail.com>
References: <20181024162215.6758-1-asafka7@gmail.com>
Message-ID: <20181101222108.67ee664c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Oct 2018 19:22:15 +0300, Asaf Kahlon wrote:
> pip needs pkg_resources, which is installed with setuptools.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pip/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. However, it is worth mentioning that even
with this, pip doesn't work here, because it needs SSL:

# pip install pyserial
pip is configured with locations that require TLS/SSL, however the ssl module in Python is not available.
Collecting pyserial
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pyserial/
  Retrying (Retry(total=3, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pyserial/
  Retrying (Retry(total=2, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pyserial/
  Retrying (Retry(total=1, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pyserial/
  Retrying (Retry(total=0, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError("Can't connect to HTTPS URL because the SSL module is not available.")': /simple/pyserial/
  Could not fetch URL https://pypi.org/simple/pyserial/: There was a problem confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded with url: /simple/pyserial/ (Caused by SSLError("Can't connect to HTTPS URL because the SSL module is not available.")) - skipping

However, this is only with the default pip configuration. I don't know
if we want to enforce the need for SSL.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
