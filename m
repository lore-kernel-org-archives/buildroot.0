From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Sep 2016 10:52:31 +0200
Subject: [Buildroot] [PATCH] i2c-tools: install devt headers to staging
	dir
In-Reply-To: <fea13e44-54db-9e53-3bef-3c28caea623b@free.fr> (Julien
 Boibessot's message of "Wed, 28 Sep 2016 10:24:09 +0200")
References: <1474639604-23866-1-git-send-email-julien.boibessot@free.fr>
 <20160924161810.09ee4fa5@free-electrons.com>
 <3aa07d73-d34f-0070-3020-a3786e5a82ae@free.fr>
 <6fa984a3-83e4-3ea5-8841-88b2db197ebc@mind.be>
 <87r3862z69.fsf@dell.be.48ers.dk>
 <20160927035747.b2t7jkxpdptn65fs@tarshish>
 <fea13e44-54db-9e53-3bef-3c28caea623b@free.fr>
Message-ID: <87lgyc1k4w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 >>> Does the i2c-tools version of this file add anything important on top of
 >>> the Linux headers? The i2c /dev interface afaik hasn't changed in MANY
 >>> years.
 >> The i2c-tools version of i2c-dev.h adds a number of convenient i2c_smbus_*() 
 >> routines, that wrap around the I2C_SMBUS ioctl.

 > These i2c_smbus_*() routines are used by some userspace I2C drivers (not
 > yet in BR), that's why I sent the patch to re-install i2c-dev.h

It is quite painful to have multiple incompatible versions of the same
header file, and i2c-tools imho shouldn't overwrite kernel headers.

Have this issue been discussed with upstream?

-- 
Venlig hilsen,
Peter Korsgaard 
