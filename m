From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:59:35 +0100
Subject: [Buildroot] [PATCH 1/4] configs/qemu_arm_vexpress_tz_defconfig:
 optee needs host-python3 w/ modules
In-Reply-To: <20200308183535.1206604-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 8 Mar 2020 19:35:32 +0100")
References: <20200308183535.1206604-1-romain.naour@smile.fr>
Message-ID: <87eettkhns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > optee-os needs host-python-pycrypto build for python3. The only way we can
 > force building host-python modules for python3 is to select python3 package
 > for the target.

 > Since we want to avoid adding more host-python3-<modules>
 > (host-python-pycrypto host-python-pyelftools), select python3 package
 > even if it's not used.

 > This problem will be fixed as soon as python2 is removed.

 > Fixes:
 > File "scripts/pem_to_pub_c.py", line 24, in main
 > from Crypto.PublicKey import RSA
 > ImportError: No module named 'Crypto'

 > https://gitlab.com/buildroot.org/buildroot/-/jobs/456818689

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Etienne Carriere <etienne.carriere@linaro.org>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
