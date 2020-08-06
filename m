From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 21:43:35 +0200
Subject: [Buildroot] Fix OpTee PyCryptodomex Python 2 vs 3 issue
In-Reply-To: <a5494fd8-e371-84a5-b952-ebd6ab04a41b@brainlab.com>
References: <a5494fd8-e371-84a5-b952-ebd6ab04a41b@brainlab.com>
Message-ID: <20200806214335.2a8ccd2f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonatan,

On Thu, 6 Aug 2020 09:30:00 +0000
Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com> wrote:

> These leads to
> 
> Traceback (most recent call last):
> File "scripts/pem_to_pub_c.py", line 61, in <module>
> main()
> File "scripts/pem_to_pub_c.py", line 24, in main
> from Cryptodome.PublicKey import RSA
> ModuleNotFoundError: No module named 'Cryptodome'
> 
> during build of optee-os. The script scripts/pem_to_pub_c.py is run with Python3, while optee-os has Python2 dependencies:
> 
> OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycryptodomex host-python-pyelftools.
> 
> Thus, the Cryptodome module is not found.
> 
> What fixed that for me is to add a python3-pycryptodomex package and change `optee-os` dependencies to Python3 ones. The patches are attached.

I haven't reviewed your patch, nor the patch series I will point, but I
believe the patch series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=191437

should address this issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
