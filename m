From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Mar 2021 08:17:13 +0100
Subject: [Buildroot] [git commit] package/efivar: add upstream post-37
 patches fixing efibootmgr -v
In-Reply-To: <20210320205517.551BE862BC@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 20 Mar 2021 22:19:23 +0100")
References: <20210320205517.551BE862BC@busybox.osuosl.org>
Message-ID: <87eeg3ln2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=82f65e2c5f60b25101a5300085c2d80b6366bc23
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Without this patch, efibootmgr -v errors out:

 > efibootmgr -v
 > BootCurrent: 0001
 > Timeout: 1 seconds
 > BootOrder: 0001,0002,0000
 > Boot0000* Diagnostic ProgramCould not parse device path: Invalid argument

 > vs:

 > efibootmgr -v
 > BootCurrent: 0001
 > Timeout: 1 seconds
 > BootOrder: 0001,0002,0000
 > Boot0000* Diagnostic Program    FvVol(5c60f367-a505-419a-859e-2a4ff6ca6fe5)/FvFile(085e8cc2-8ec9-4666-bd2a-49d481e95fa7)
 > Boot0001* containeros-a HD(1,GPT,1491d519-d9d7-7c4e-9110-4ab21271ac64,0x800,0x20000)/File(\efi\container\boot.efi)

 > For more details, see:

 > https://github.com/rhboot/efibootmgr/issues/133
 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=963475

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
