From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Feb 2019 14:05:27 +0100
Subject: [Buildroot] [git commit] packages: update sysv S* scripts to 644
In-Reply-To: <CAAXf6LUte5x22eChjKBKoPoupntP8LnC-OHR7VgMrqc1ajUTrg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 8 Feb 2019 13:39:29
 +0100")
References: <20190208103753.7D6468149C@busybox.osuosl.org>
 <CAAXf6LUte5x22eChjKBKoPoupntP8LnC-OHR7VgMrqc1ajUTrg@mail.gmail.com>
Message-ID: <87h8dezazs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Hello,
 > On Fri, Feb 8, 2019, 11:39 Peter Korsgaard <peter@korsgaard.com wrote:

 >> commit:
 >> https://git.buildroot.net/buildroot/commit/?id=590e9e05b683ee521d4984b5cb77a590ebb3fd17
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> 


 > I was not really paying attention when this was discussed. Why does it not
 > matter what the permission in the repo is?

It doesn't really, but consistency is nice. We had a big mix of
executable/not executable.

> Where is the executable permission set, if not already in the repo?

During the installation step, E.G.:

define DROPBEAR_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 755 package/dropbear/S50dropbear \
                $(TARGET_DIR)/etc/init.d/S50dropbear
endef

-- 
Bye, Peter Korsgaard
