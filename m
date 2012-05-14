From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 May 2012 22:47:10 +0200
Subject: [Buildroot] [PATCH] python-id3: new package
In-Reply-To: <4FB0C35D.2020007@was.ch> (Dominik Faessler's message of "Mon, 14
 May 2012 10:33:33 +0200")
References: <4FB0C35D.2020007@was.ch>
Message-ID: <87d366xzg1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dominik" == Dominik Faessler <faessler@was.ch> writes:

 Dominik> ---

 Dominik> +PYTHON_ID3_VERSION = 1.2
 Dominik> +PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
 Dominik> +PYTHON_ID3_SITE =
 Dominik> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/id3-py
 Dominik> +
 Dominik> +PYTHON_ID3_DEPENDENCIES = python
 Dominik> +
 Dominik> +define PYTHON_ID3_BUILD_CMDS
 Dominik> +    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
 Dominik> +endef
 Dominik> +
 Dominik> +define PYTHON_ID3_INSTALL_TARGET_CMDS
 Dominik> +    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
 Dominik> --prefix=$(TARGET_DIR)/usr)

Do notice that your mailer has wordwrapped the patch, so I had to fix it
up manually. Consider using 'git send-email' in the future.

-- 
Bye, Peter Korsgaard
