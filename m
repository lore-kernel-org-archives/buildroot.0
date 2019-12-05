From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:15:21 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add python-django test
In-Reply-To: <20191204200629.686191-2-aduskett@gmail.com>
References: <20191204200629.686191-1-aduskett@gmail.com>
 <20191204200629.686191-2-aduskett@gmail.com>
Message-ID: <20191205231521.07355101@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 12:06:29 -0800
aduskett at gmail.com wrote:

> +    def run_sample_scripts(self):
> +        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
> +        _, exit_code = self.emulator.run(cmd, timeout=30)
> +        self.assertEqual(exit_code, 0)

These last two lines can be simplified to:

	self.assertRunOk(cmd, timeout=30)

so I used that in the 3 places where it was possible, and I've applied
to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
