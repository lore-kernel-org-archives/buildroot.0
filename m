From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Oct 2011 20:56:05 +0200
Subject: [Buildroot] [PATCH 1/1] package: fix bootloader building
In-Reply-To: <7c448d52bb6e84eef5ac068b6e02b5607f6f2f9d.1317408294.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 30 Sep 2011 20:45:56 +0200")
References: <cover.1317408294.git.thomas.petazzoni@free-electrons.com>
 <cover.1317408294.git.thomas.petazzoni@free-electrons.com>
 <7c448d52bb6e84eef5ac068b6e02b5607f6f2f9d.1317408294.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hb3rmddm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The changes in e055aea216cff4d12cf55eab2e35ca1459edaa91 and
 Thomas> 0849e8193ef429f29945b8c2a54eafc8635e0969 have broken the bootloader
 Thomas> support.

 Thomas> This is because the 'pkgparentdir' macro returns the string 'boot/'
 Thomas> for bootloaders, while the GENTARGETS_INNER macro was testing this
 Thomas> against 'boot' to know if the configuration option to check for this
 Thomas> package is BR2_PACKAGE_* or BR2_TARGET_*.

 Thomas> So, instead of testing against 'boot', we test against 'boot/'.

Committed, thanks.

-- 
Bye, Peter Korsgaard
